local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta").isAtMaxTeamUpgradeTier
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-theme").TeamUpgradeTheme
return {
    ["TeamUpgradeButton"] = v6.new(u5)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u5
            [4] = u3
            [5] = u10
            [6] = u4
            [7] = u9
        --]]
        local _ = p12.useState
        local _ = p12.useEffect
        local v13 = false
        local v14 = u11.IsHomeBase
        local v15
        if u7(u11.CurrentTier, u11.TeamUpgrade) then
            v13 = true
            v15 = false
        else
            v15 = u8.hasEnoughForTeamUpgrade(u11.ObservedInventory, u11.TeamUpgrade, u11.CurrentTier + 1, v14)
        end
        local v16 = {
            ["ZIndex"] = 60
        }
        local v17 = u11.FrameProps
        if v17 then
            for v18, v19 in v17 do
                v16[v18] = v19
            end
        end
        local v20 = u5.createElement
        local v21 = "Frame"
        local v22 = {}
        local v23 = u5.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Center",
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v24
        if v13 then
            v24 = u5.createElement(u3, {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0.7,
                ["Text"] = "<b>MAX</b>",
                ["Selectable"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u10.disabled,
                ["TextLabel"] = {
                    ["ZIndex"] = 61,
                    ["TextTransparency"] = 0.7,
                    ["Size"] = UDim2.fromScale(0.8, 0.55)
                },
                ["OnClick"] = function() --[[ Name: OnClick, Line 90 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u9
                    --]]
                    u4:playSound(u9.UI_CLICK)
                end,
                ["CornerRadius"] = UDim.new(0.1, 0),
                ["GamepadShouldAutoSelect"] = u11.GamepadShouldAutoSelect
            })
        elseif v15 then
            v24 = u5.createElement(u3, {
                ["LayoutOrder"] = 1,
                ["Text"] = "<b>UPGRADE</b>",
                ["Selectable"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u10.success,
                ["OnClick"] = function() --[[ Name: OnClick, Line 48 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    u11.Purchased()
                end,
                ["TextLabel"] = {
                    ["ZIndex"] = 61,
                    ["Size"] = UDim2.fromScale(0.8, 0.55)
                },
                ["CornerRadius"] = UDim.new(0.1, 0),
                ["GamepadShouldAutoSelect"] = u11.GamepadShouldAutoSelect
            })
        else
            v24 = u5.createElement(u3, {
                ["LayoutOrder"] = 1,
                ["Text"] = "<b>NOT ENOUGH</b>",
                ["Selectable"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u10.error,
                ["OnClick"] = function() --[[ Name: OnClick, Line 66 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u9
                    --]]
                    u4:playSound(u9.UI_CLICK)
                end,
                ["TextLabel"] = {
                    ["ZIndex"] = 61,
                    ["Size"] = UDim2.fromScale(0.8, 0.55)
                },
                ["CornerRadius"] = UDim.new(0.1, 0),
                ["GamepadShouldAutoSelect"] = u11.GamepadShouldAutoSelect
            })
        end
        __set_list(v22, 1, {v23, v24})
        return v20(v21, v16, v22)
    end)
}