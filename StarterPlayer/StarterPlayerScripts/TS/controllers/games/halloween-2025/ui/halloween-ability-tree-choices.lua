local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.SoundManager
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ContextActionService
local u11 = v9.TweenService
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-meta").HalloweenUpgradeMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["HalloweenAbilityTreeChoices"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u11
            [4] = u10
            [5] = u5
            [6] = u14
            [7] = u13
            [8] = u4
            [9] = u3
            [10] = u6
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local v19 = u12[u15.halloweenAbilityType]
        local u20 = u7.createRef()
        local u21, u22 = v17(nil)
        local u23, u24 = v17(nil)
        v18(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u11
                [3] = u22
                [4] = u24
            --]]
            local v25 = u20:getValue()
            if not v25 then
                return nil
            end
            local v26 = u11:Create(v25, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["BackgroundTransparency"] = 0
            })
            local v27 = u11:Create(v25, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["BackgroundTransparency"] = 0.5
            })
            u22(v26)
            u24(v27)
        end, {})
        v18(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u10
                [3] = u5
                [4] = u14
                [5] = u13
            --]]
            local u28 = "halloween-event-tree-choice" .. u15.Hotkeys.Display
            u10:BindAction(u28, function(_, p29, _) --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u14
                    [3] = u13
                    [4] = u15
                --]]
                if p29 == Enum.UserInputState.End then
                    u5:playSound(u14.UI_CLICK_2)
                    u13.Client:GetNamespace("Halloween2025Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                        ["halloweenUpgradeType"] = u15.halloweenAbilityType,
                        ["level"] = u15.level
                    })
                    u15.onSelected()
                end
            end, false, u15.Hotkeys.PC)
            return function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u28
                --]]
                u10:UnbindAction(u28)
            end
        end, {})
        local v30 = {
            [u7.Ref] = u20,
            ["AnchorPoint"] = u15.AnchorPoint,
            ["Size"] = u15.Size,
            ["Position"] = u15.Position,
            ["BackgroundTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u4.WHITE,
            ["AutoButtonColor"] = false,
            [u7.Event.Activated] = function(_) --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u14
                    [3] = u13
                    [4] = u15
                --]]
                u5:playSound(u14.UI_CLICK_2)
                u13.Client:GetNamespace("Halloween2025Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                    ["halloweenUpgradeType"] = u15.halloweenAbilityType,
                    ["level"] = u15.level
                })
                u15.onSelected()
            end,
            [u7.Event.MouseEnter] = function(_) --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                if u21 then
                    u21:Play()
                end
            end,
            [u7.Event.MouseLeave] = function(_) --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                if u23 then
                    u23:Play()
                end
            end
        }
        local v31 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }) }
        local v32 = #v31
        local v33 = {
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#999a6a")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#7a4d3c")), ColorSequenceKeypoint.new(1, Color3.fromHex("#3c3130")) })
        }
        local v34 = u15.Rotation
        v33.Rotation = v34 == nil and 0 or v34
        v31[v32 + 1] = u7.createElement("UIGradient", v33)
        v31[v32 + 2] = u7.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 12,
            ["ZIndex"] = 3,
            ["TextScaled"] = true,
            ["Text"] = v19.hudDescription,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextColor3"] = Color3.fromHex("#F2F3F2")
        })
        local v35
        if u15.Hotkeys.PC == nil then
            v35 = false
        else
            local v36 = u7.createElement
            local v37 = "TextLabel"
            local v38 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 3,
                ["TextScaled"] = true,
                ["Text"] = "(" .. u15.Hotkeys.PC.Name .. ")"
            }
            local v39
            if u15.Hotkeys.Display == "LEFT" then
                v39 = Vector2.new(0.5, 0.5)
            else
                v39 = Vector2.new(0.5, 0.5)
            end
            v38.AnchorPoint = v39
            v38.Position = UDim2.fromScale(u15.Hotkeys.Display == "LEFT" and -0.05 or 1.05, 0.5)
            v38.Size = UDim2.fromScale(0.5, 0.75)
            v38.Font = Enum.Font.ArialBold
            v38.TextXAlignment = Enum.TextXAlignment.Center
            v38.TextColor3 = Color3.fromHex("#F2F3F2")
            v35 = v36(v37, v38, { u7.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = u4.BLACK
                }) })
        end
        if v35 then
            v31[v32 + 3] = v35
        end
        local v40 = #v31
        local v41 = {}
        local v42 = #v41
        local v43 = {}
        local v44 = v19.description
        v43.Text = v44 == nil and "" or v44
        v43.Font = Enum.Font.SourceSansBold
        v43.TextSize = 16
        v43.Limits = Vector2.new(300, 60)
        v41[v42 + 1] = u7.createElement(u3, v43)
        v31[v40 + 1] = u7.createElement(u6, {}, v41)
        return u7.createFragment({
            ["HalloweenChoices"] = u7.createElement("ImageButton", v30, v31)
        })
    end)
}