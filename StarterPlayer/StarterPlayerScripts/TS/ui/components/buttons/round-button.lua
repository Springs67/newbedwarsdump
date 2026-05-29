local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["RoundButton"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u9
            [4] = u3
            [5] = u5
            [6] = u10
            [7] = u4
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local u15, u16 = v13(false)
        local u17 = u7.createRef()
        local u18 = u7.createRef()
        v14(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u16
            --]]
            if u11.Hovered then
                u16(u11.Hovered)
            end
        end, { u11.Hovered })
        v14(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
                [3] = u6
                [4] = u9
                [5] = u15
            --]]
            local v19 = u17:getValue()
            local v20 = u18:getValue()
            if not (v19 and v20) then
                return nil
            end
            local u21 = u6.new()
            local u22 = u9:Create(v19, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                ["Size"] = UDim2.fromScale(u15 and 1.05 or 1, u15 and 1.05 or 1)
            })
            u22:Play()
            u21:GiveTask(function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:Cancel()
                u22:Destroy()
            end)
            local v23 = {
                ["Transparency"] = u15 and 0 or 0.5
            }
            local u24 = u9:Create(v20, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), v23)
            u24:Play()
            u21:GiveTask(function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:Cancel()
                u24:Destroy()
            end)
            return function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, { u15 })
        local v25 = {}
        for v26, v27 in u11 do
            v25[v26] = v27
        end
        v25.Image = nil
        v25.Hovered = nil
        v25.OnClick = nil
        v25.ImageButtonProps = nil
        v25[u7.Children] = nil
        local v28 = {}
        for v29, v30 in v25 do
            v28[v29] = v30
        end
        v28.SizeConstraint = "RelativeYY"
        local v31 = {}
        local v32 = #v31
        local v33 = u11[u7.Children]
        if v33 then
            for v34, v35 in v33 do
                if type(v34) == "number" then
                    v31[v32 + v34] = v35
                else
                    v31[v34] = v35
                end
            end
        end
        local v36 = #v31
        local v37 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u3.BLACK,
            ["ImageTransparency"] = 1,
            ["Transparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            [u7.Ref] = u17,
            [u7.Event.MouseButton1Click] = u11.OnClick,
            [u7.Event.MouseEnter] = function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u10
                    [3] = u16
                --]]
                u5:playSound(u10.UI_HOVER)
                u16(true)
            end,
            [u7.Event.MouseLeave] = function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16(false)
            end,
            ["ZIndex"] = v25.ZIndex
        }
        local v38 = u11.ImageButtonProps
        if v38 then
            for v39, v40 in v38 do
                v37[v39] = v40
            end
        end
        v31[v36 + 1] = u7.createElement("ImageButton", v37, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u7.createElement("UIStroke", {
                ["Transparency"] = 0,
                ["Color"] = u3.WHITE,
                ["Thickness"] = 2,
                [u7.Ref] = u18
            }, { u7.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1) })
                }) }), u7.createElement("ImageLabel", {
                ["Transparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.65, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u11.Image,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ZIndex"] = v25.ZIndex
            }) })
        return u7.createElement(u4, v28, v31)
    end)
}