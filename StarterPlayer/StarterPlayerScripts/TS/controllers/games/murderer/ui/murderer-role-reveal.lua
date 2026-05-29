local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.TweenService
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["MurdererRoleReveal"] = v9.new(u8)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u16
            [4] = u12
            [5] = u13
            [6] = u5
            [7] = u15
            [8] = u14
            [9] = u4
            [10] = u3
            [11] = u6
            [12] = u11
        --]]
        local _ = p18.useState
        local v19 = p18.useEffect
        local u20 = u8.createRef()
        local u21 = u8.createRef()
        local u22 = u8.createRef()
        v19(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u21
                [3] = u22
                [4] = u7
                [5] = u16
                [6] = u12
                [7] = u17
                [8] = u13
                [9] = u5
                [10] = u15
                [11] = u14
            --]]
            local v23 = u20:getValue()
            local v24 = u21:getValue()
            local v25 = u22:getValue()
            if not (v23 and (v24 and v25)) then
                return nil
            end
            local v26 = u7
            local v27 = {
                ["GroupTransparency"] = 1,
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.2, 0.2),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.3),
                ["BackgroundColor3"] = u16.Gray,
                ["Parent"] = v25,
                ["Children"] = { v23, u7("UIPadding", {
                        ["PaddingBottom"] = UDim.new(0, 8),
                        ["PaddingTop"] = UDim.new(0, 8),
                        ["PaddingLeft"] = UDim.new(0, 8),
                        ["PaddingRight"] = UDim.new(0, 8)
                    }), u7("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }) }
            }
            local u28 = v26("CanvasGroup", v27)
            local v29 = u7
            local v30 = {
                ["GroupTransparency"] = 1,
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.2, 0.2),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u16.Gray,
                ["Parent"] = v25,
                ["Children"] = { v24, u7("UIPadding", {
                        ["PaddingBottom"] = UDim.new(0, 8),
                        ["PaddingTop"] = UDim.new(0, 8),
                        ["PaddingLeft"] = UDim.new(0, 8),
                        ["PaddingRight"] = UDim.new(0, 8)
                    }), u7("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }) }
            }
            local u31 = v29("CanvasGroup", v30)
            u12:Create(u28, TweenInfo.new(0.6), {
                ["GroupTransparency"] = 0,
                ["Position"] = UDim2.fromScale(0.5, 0.2)
            }):Play()
            if u17.Role == u13.CIVILIAN or u13.SHERIFF then
                u5:playSound(u15.INFECTED_INITIAL_SPREAD)
            else
                u5:playSound(u15.CLUE_DISCOVERED)
            end
            task.delay(1, function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u31
                --]]
                u12:Create(u31, TweenInfo.new(0.6), {
                    ["GroupTransparency"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.45)
                }):Play()
            end)
            task.delay(u14.ROLE_REVEAL_DISPLAY_DURATION - 0.5, function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u28
                    [3] = u31
                --]]
                u12:Create(u28, TweenInfo.new(0.4), {
                    ["GroupTransparency"] = 1
                }):Play()
                u12:Create(u31, TweenInfo.new(0.4), {
                    ["GroupTransparency"] = 1
                }):Play()
            end)
        end, {})
        local v32 = {
            ["DisplayOrder"] = 10,
            ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
            [u8.Ref] = u22
        }
        local v33 = { u8.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1),
                [u8.Ref] = u20
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                }), u8.createElement("TextLabel", {
                    ["Text"] = "<b>YOU ARE A</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.25),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["TextColor3"] = u3.WHITE
                }), u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.9, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Text"] = "<b>" .. string.upper(u17.Role) .. "</b>",
                    ["TextColor3"] = u14:getRoleColor(u17.Role)
                }) }) }
        local v34 = #v33
        local v35 = u6.values(u14.ROLE_INSTRUCTIONS[u17.Role])
        local function v37(p36) --[[ Line: 140 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u3
            --]]
            return u8.createElement("TextLabel", {
                ["TextXAlignment"] = "Center",
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.15),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = "<b>- " .. p36 .. "</b>",
                ["TextColor3"] = u3.WHITE
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
        end
        local v38 = table.create(#v35)
        for v39, v40 in v35 do
            v38[v39] = v37(v40, v39 - 1, v35)
        end
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 1),
            [u8.Ref] = u21
        }
        local v42 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }), u8.createElement("TextLabel", {
                ["Text"] = "<b>INSTRUCTIONS:</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.2),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["TextColor3"] = u3.WHITE
            }) }
        local v43 = #v42
        for v44, v45 in v38 do
            v42[v43 + v44] = v45
        end
        local v46 = #v42 + 1
        local v47 = u8.createElement
        local v48 = "TextLabel"
        local v49 = {
            ["TextXAlignment"] = "Center",
            ["TextTransparency"] = 0.2,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(0.9, 0.15),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v50 = "<b>- <font color=\""
        local v51 = u3.richTextColor(u16.mcRed)
        local v52 = "\">There "
        local v53
        if #u11:GetPlayers() >= 8 then
            v53 = "are " .. tostring(2) .. " murderers"
        else
            v53 = "is " .. tostring(1) .. " murderer"
        end
        v49.Text = v50 .. v51 .. v52 .. v53 .. "</font> \240\159\151\161\239\184\143</b>"
        v49.TextColor3 = u3.WHITE
        v42[v46] = v47(v48, v49, { u8.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        v33[v34 + 1] = u8.createElement(u4, v41, v42)
        return u8.createFragment({
            ["MurdererRoleReveal"] = u8.createElement("ScreenGui", v32, v33)
        })
    end)
}