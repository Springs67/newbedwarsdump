local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").getClanWarMedalMetadata
return {
    ["ClanWarMedalsDisplay"] = v7.new(u6)(function(u9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u6
            [4] = u3
            [5] = u4
        --]]
        local v10 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v11 = u9.FrameProps
        if v11 then
            for v12, v13 in v11 do
                v10[v12] = v13
            end
        end
        local v14 = u5.entries(u9.Medals)
        local function v17(p15, p16) --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            return u8(p15[1]).points > u8(p16[1]).points
        end
        table.sort(v14, v17)
        local function v28(p18, p19) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u9
                [3] = u6
                [4] = u3
            --]]
            local v20 = p18[1]
            local v21 = p18[2]
            local v22 = u8(v20)
            local v23 = {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.85),
                ["Image"] = v22.icon,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["LayoutOrder"] = 3 + p19
            }
            local v24 = u9.FrameProps
            if v24 ~= nil then
                v24 = v24.ZIndex
            end
            v23.ZIndex = (v24 == nil and 0 or v24) + 1
            local v25 = {}
            local _ = #v25
            local v26 = {
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Bottom",
                ["TextSize"] = 10,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(1, 1),
                ["Text"] = "x" .. tostring(v21),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }
            local v27 = u9.FrameProps
            if v27 ~= nil then
                v27 = v27.ZIndex
            end
            v26.ZIndex = (v27 == nil and 0 or v27) + 1
            v25.Score = u6.createElement("TextLabel", v26, { u6.createElement("UIStroke", {
                    ["Color"] = u3.BLACK
                }) })
            return u6.createFragment({
                ["MedalIcon"] = u6.createElement("ImageLabel", v23, v25)
            })
        end
        local v29 = table.create(#v14)
        for v30, v31 in v14 do
            v29[v30] = v28(v31, v30 - 1, v14)
        end
        local v32 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Right",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 3)
            }) }
        local v33 = #v32
        for v34, v35 in v29 do
            v32[v33 + v34] = v35
        end
        return u6.createFragment({
            ["ClanWarMedalsDisplay"] = u6.createElement(u4, v10, v32)
        })
    end)
}