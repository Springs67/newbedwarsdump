local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kit-meta").getHalloweenKitMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["HalloweenAbilityCharacterPanel"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u4
            [4] = u7
            [5] = u3
            [6] = u9
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14 = u8(u10.HalloweenKit)
        local u15 = u5.createRef()
        local u16 = u5.createRef()
        local u17, u18 = v12(nil)
        local u19, u20 = v12(nil)
        local u21, u22 = v12(nil)
        local u23, u24 = v12(nil)
        if not u10.Selected then
            if u19 then
                u19:Play()
            end
            if u23 then
                u23:Play()
            end
        end
        v13(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u16
                [3] = u4
                [4] = u7
                [5] = u18
                [6] = u20
                [7] = u22
                [8] = u24
            --]]
            local u25 = u15:getValue()
            local v26 = u16:getValue()
            if not (u25 and v26) then
                return nil
            end
            task.delay(0.4, function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u4
                --]]
                u4:playSound("rbxassetid://10969529817", {})
            end)
            local v27 = u7:Create(u25, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 0.1
            })
            v27:Play()
            v27.Completed:Connect(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u25
                --]]
                u7:Create(u25, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["ImageTransparency"] = 0.5
                }):Play()
            end)
            u7:Create(v26, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["BackgroundTransparency"] = 0.3
            }):Play()
            local v28 = u7:Create(u25, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 0
            })
            local v29 = u7:Create(u25, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["ImageTransparency"] = 0.5
            })
            local v30 = u7:Create(v26, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Size"] = UDim2.fromScale(0.27, 1.08)
            })
            local v31 = u7:Create(v26, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.fromScale(0.25, 1)
            })
            u18(v28)
            u20(v29)
            u22(v30)
            u24(v31)
        end, {})
        return u5.createFragment({
            [u10.HalloweenKit .. "CharacterPanel"] = u5.createElement("ImageButton", {
                [u5.Ref] = u16,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = u10.Position,
                ["Size"] = UDim2.fromScale(0.15, 1),
                ["BackgroundColor3"] = u3.BLACK,
                ["BackgroundTransparency"] = 1,
                [u5.Event.Activated] = function() --[[ Line: 81 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    u10.OnClick()
                end,
                [u5.Event.MouseEnter] = function() --[[ Line: 84 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u17
                        [3] = u21
                    --]]
                    if u10.Selected then
                        return nil
                    end
                    if u17 then
                        u17:Play()
                    end
                    if u21 then
                        u21:Play()
                    end
                end,
                [u5.Event.MouseLeave] = function() --[[ Line: 95 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u19
                        [3] = u23
                    --]]
                    if u10.Selected then
                        return nil
                    end
                    if u19 then
                        u19:Play()
                    end
                    if u23 then
                        u23:Play()
                    end
                end,
                ["ClipsDescendants"] = true,
                ["BorderSizePixel"] = 0
            }, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                }), u5.createElement("ImageLabel", {
                    [u5.Ref] = u15,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1.5, 1.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["BackgroundColor3"] = u9.backgroundPrimary,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = v14.renderImage,
                    ["BackgroundTransparency"] = 1,
                    ["ScaleType"] = Enum.ScaleType.Crop,
                    ["ImageTransparency"] = 1
                }) })
        })
    end)
}