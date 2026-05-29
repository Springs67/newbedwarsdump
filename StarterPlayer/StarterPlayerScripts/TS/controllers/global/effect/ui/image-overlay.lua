local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["ImageOverlay"] = v3.new(u2)(function(u5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local _ = p6.useState
        local v7 = p6.useEffect
        local u8 = u2.createRef()
        v7(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
                [3] = u5
            --]]
            local v9 = u8:getValue()
            if not v9 then
                return nil
            end
            local v10 = u4
            local v11 = u5.FadeInDuration
            local v12 = v11 == nil and 1 or v11
            local v13 = TweenInfo.new(v12, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
            local v14 = {}
            local v15 = u5.FrameTransparency
            v14.ImageTransparency = v15 == nil and 0 or v15
            v10:Create(v9, v13, v14):Play()
            local v16 = u5.FadeOutDelay
            if v16 ~= 0 and (v16 == v16 and v16) then
                local v17 = u4
                local v18 = u5.FadeOutDuration
                local v19 = v18 == nil and 1 or v18
                local u20 = v17:Create(v9, TweenInfo.new(v19, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    ["ImageTransparency"] = 1
                })
                task.delay(u5.FadeOutDelay, function() --[[ Line: 40 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    u20:Play()
                end)
            end
            return function() --[[ Line: 44 ]] end
        end, {})
        local v21 = {}
        for v22, v23 in u5 do
            v21[v22] = v23
        end
        v21.Image = nil
        v21.FadeOutDelay = nil
        v21.FadeInDuration = nil
        v21.FadeOutDuration = nil
        v21.FrameTransparency = nil
        local v24 = {}
        local v25 = #v24
        local v26 = {
            [u2.Ref] = u8,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u5.Image,
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }
        local v27 = {
            ["IgnoreGuiInset"] = true
        }
        for v28, v29 in v21 do
            v26[v28] = v29
        end
        v24[v25 + 1] = u2.createElement("ImageLabel", v26)
        return u2.createElement("ScreenGui", v27, v24)
    end)
}