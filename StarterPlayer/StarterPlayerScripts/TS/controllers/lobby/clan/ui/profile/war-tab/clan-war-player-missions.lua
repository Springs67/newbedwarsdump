local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u8 = v1.import(script, script.Parent, "clan-war-player-mission-description").ClanWarPlayerMissionDescription
return {
    ["ClanWarPlayerMissions"] = v6.new(u5)(function(p9, _) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u8
            [4] = u4
            [5] = u3
        --]]
        local v10 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["BackgroundColor3"] = u7.backgroundSecondary
        }
        local v11 = { u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 12)
            }) }
        local v12 = #v11
        local v13 = p9.store.Lobby.clanWarMissionsData
        local function v18(p14, p15) --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
            --]]
            local v16 = u5.createFragment
            local v17 = {
                ["mission" .. tostring(p15)] = u5.createElement(u8, {
                    ["mission"] = p14,
                    ["missionIndex"] = p15
                })
            }
            return v16(v17)
        end
        local v19 = table.create(#v13)
        for v20, v21 in v13 do
            v19[v20] = v18(v21, v20 - 1, v13)
        end
        local v22 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 8),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 5),
                ["PaddingLeft"] = UDim.new(0, 5)
            }) }
        local v23 = #v22
        for v24, v25 in v19 do
            v22[v23 + v24] = v25
        end
        local v26 = #v22
        local v27
        if #p9.store.Lobby.clanWarMissionsData == 0 then
            v27 = u5.createElement("TextLabel", {
                ["Text"] = "<b>No missions (you might be too new to the clan). Check back next week.</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["TextColor3"] = u4.WHITE,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            })
        else
            v27 = false
        end
        if v27 then
            v22[v26 + 1] = v27
        end
        v11[v12 + 1] = u5.createElement(u3, {}, v22)
        return u5.createFragment({
            ["Missions"] = u5.createElement("Frame", v10, v11)
        })
    end)
}