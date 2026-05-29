local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.OfflinePlayerUtil
local u6 = v2.PlayerRender
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v39 = v9.new(u8)(function(p12, _) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u3
        [4] = u6
    --]]
    local v13 = {}
    local _ = #v13
    local v14 = p12.killLeaders
    local function v29(p15, p16) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u3
            [4] = u6
        --]]
        local v17 = u8.createFragment
        local v18 = {}
        local v19 = u8.createElement
        local v20 = u4
        local v21 = {
            ["Size"] = UDim2.fromScale(0.33, 1),
            ["LayoutOrder"] = p16
        }
        local v22 = { (u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v23 = u8.createElement
        local v24 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 50,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v25 = { (u8.createElement("UIGradient", {
                ["Rotation"] = -90,
                ["Color"] = ColorSequence.new(u3.BLACK),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.4, 1), NumberSequenceKeypoint.new(1, 1) })
            })) }
        local v26 = u8.createElement
        local v27 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextXAlignment"] = "Right",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 52,
            ["Position"] = UDim2.fromScale(0.95, 0.95),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Size"] = UDim2.fromScale(1, 0.4)
        }
        local v28 = p15.kills
        v27.Text = "<b>" .. tostring(v28) .. "</b>"
        v27.TextColor3 = u3.WHITE
        v27.Font = Enum.Font.Roboto
        v25.Kills = v26("TextLabel", v27)
        v22.GradientOverlay = v23("Frame", v24, v25)
        v22.PlayerRender = u8.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(54, 150, 255)
        }, { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }), u8.createElement(u6, {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["PlayerUserId"] = p15.player.userId
            }) })
        v18.KillLeaderCard = v19(v20, v21, v22)
        return v17(v18)
    end
    local v30 = table.create(#v14)
    local v31 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false
    }
    for v32, v33 in v14 do
        v30[v32] = v29(v33, v32 - 1, v14)
    end
    local v34 = {
        ["Size"] = UDim2.fromScale(0.5, 0.1),
        ["Position"] = UDim2.fromScale(0.5, 0.05),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v35 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 4)
        }) }
    local v36 = #v35
    for v37, v38 in v30 do
        v35[v36 + v37] = v38
    end
    v13.JuggHudContainer = u8.createElement(u4, v34, v35)
    return u8.createFragment({
        ["JuggHudGUI"] = u8.createElement("ScreenGui", v31, v13)
    })
end)
return {
    ["JuggHud"] = v10.connect(function(p40, p41) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u5
        --]]
        local v42 = u7.entries(p40.Bedwars.kills)
        table.sort(v42, function(p43, p44) --[[ Line: 113 ]]
            local _ = p43[1]
            local v45 = p43[2]
            local _ = p44[1]
            return p44[2] < v45
        end)
        local v46 = false
        local v47 = 0
        local v48 = {}
        while true do
            if v46 then
                v47 = v47 + 1
            else
                v46 = true
            end
            if v47 >= 3 then
                local v49 = {}
                for v50, v51 in p41 do
                    v49[v50] = v51
                end
                v49.killLeaders = v48
                return v49
            end
            if v42[v47 + 1] then
                local v52 = v42[v47 + 1]
                local v53 = v52[1]
                local v54 = v52[2]
                if v53 ~= nil and type(v53) ~= "string" then
                    local v55 = u11:GetPlayerByUserId(v53)
                    if v55 then
                        local v56 = {
                            ["player"] = u5.getOfflinePlayer(v55),
                            ["kills"] = v54
                        }
                        table.insert(v48, v56)
                    end
                end
            end
        end
    end)(v39)
}