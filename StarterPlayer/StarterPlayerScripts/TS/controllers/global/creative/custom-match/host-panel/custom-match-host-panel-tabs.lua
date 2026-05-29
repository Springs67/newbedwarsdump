local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local u6 = v2.UIUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["CustomMatchHostPanelTab"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u4
            [4] = u6
            [5] = u3
            [6] = u5
            [7] = u11
            [8] = u10
        --]]
        local _ = p13.useState
        local v14 = p13.useEffect
        local u15 = u8.createRef()
        local u16 = u7.new()
        local u17 = u12.Tab == u12.ActiveTab
        v14(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u4
                [3] = u15
                [4] = u6
            --]]
            if u12.GamepadShouldAutoSelect and u4.isGamepadControls() then
                u6:selectGui((u15:getValue()))
            end
        end, {})
        return u8.createElement("TextButton", {
            ["Size"] = UDim2.new(0.8, 0, 0, 30),
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = u17 and 0.7 or 1,
            ["Font"] = "Roboto",
            ["Text"] = "<b>" .. u12.Name .. "</b>",
            ["TextColor3"] = u3.WHITE,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextTransparency"] = u17 and 0 or 0.3,
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            [u8.Event.Activated] = function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u5
                    [3] = u11
                --]]
                u12.SetTab(u12.Tab)
                u5:playSound(u11.UI_CLICK)
            end,
            [u8.Event.MouseEnter] = function(p18) --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u16
                    [3] = u10
                --]]
                if u17 then
                    return nil
                end
                u16:DoCleaning()
                local u19 = u10:Create(p18, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.8
                })
                u19:Play()
                u16:GiveTask(function() --[[ Line: 50 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    u19:Cancel()
                end)
            end,
            [u8.Event.MouseLeave] = function(p20) --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u16
                    [3] = u10
                --]]
                if u17 then
                    return nil
                end
                u16:DoCleaning()
                local v21 = {
                    ["BackgroundTransparency"] = u17 and 0.7 or 1
                }
                local u22 = u10:Create(p20, TweenInfo.new(0.12), v21)
                u22:Play()
                u16:GiveTask(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                    --]]
                    u22:Cancel()
                end)
            end,
            ["LayoutOrder"] = u12.LayoutOrder,
            [u8.Ref] = u15
        }, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.15, 0),
                ["PaddingRight"] = UDim.new(0.15, 0)
            }), u8.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
    end)
}