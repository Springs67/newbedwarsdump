local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.SoundManager
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-meta").HalloweenAbilityMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["HalloweenAbilityTreeChoices"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u9
            [4] = u4
            [5] = u5
            [6] = u12
            [7] = u11
            [8] = u3
            [9] = u6
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17 = u10[u13.halloweenAbilityType]
        local u18 = u7.createRef()
        local u19, u20 = v15(nil)
        local u21, u22 = v15(nil)
        v16(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u9
                [3] = u20
                [4] = u22
            --]]
            local v23 = u18:getValue()
            if not v23 then
                return nil
            end
            local v24 = u9:Create(v23, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["BackgroundTransparency"] = 0
            })
            local v25 = u9:Create(v23, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["BackgroundTransparency"] = 0.5
            })
            u20(v24)
            u22(v25)
        end, {})
        local v26 = {
            [u7.Ref] = u18,
            ["AnchorPoint"] = u13.AnchorPoint,
            ["Size"] = u13.Size,
            ["Position"] = u13.Position,
            ["BackgroundTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u4.WHITE,
            ["AutoButtonColor"] = false,
            [u7.Event.Activated] = function(_) --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u12
                    [3] = u11
                    [4] = u13
                --]]
                u5:playSound(u12.UI_CLICK_2)
                u11.Client:GetNamespace("Halloween2024Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                    ["halloweenAbilityType"] = u13.halloweenAbilityType,
                    ["level"] = u13.level
                })
                u13.onSelected()
            end,
            [u7.Event.MouseEnter] = function(_) --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                if u19 then
                    u19:Play()
                end
            end,
            [u7.Event.MouseLeave] = function(_) --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                if u21 then
                    u21:Play()
                end
            end
        }
        local v27 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }) }
        local v28 = #v27
        local v29 = {
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#999a6a")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#7a4d3c")), ColorSequenceKeypoint.new(1, Color3.fromHex("#3c3130")) })
        }
        local v30 = u13.Rotation
        v29.Rotation = v30 == nil and 0 or v30
        v27[v28 + 1] = u7.createElement("UIGradient", v29)
        v27[v28 + 2] = u7.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 12,
            ["ZIndex"] = 3,
            ["TextScaled"] = true,
            ["Text"] = v17.hudDescription,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextColor3"] = Color3.fromHex("#F2F3F2")
        })
        local v31 = {}
        local v32 = #v31
        local v33 = {}
        local v34 = v17.description
        v33.Text = v34 == nil and "" or v34
        v33.Font = Enum.Font.SourceSansBold
        v33.TextSize = 16
        v33.Limits = Vector2.new(300, 60)
        v31[v32 + 1] = u7.createElement(u3, v33)
        v27[v28 + 3] = u7.createElement(u6, {}, v31)
        return u7.createFragment({
            ["HalloweenChoices"] = u7.createElement("ImageButton", v26, v27)
        })
    end)
}