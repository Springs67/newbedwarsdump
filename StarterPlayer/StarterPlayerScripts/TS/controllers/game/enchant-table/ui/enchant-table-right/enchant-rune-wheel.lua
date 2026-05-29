local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["EnchantRuneWheel"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local v8 = p7.useEffect
        local v9 = {}
        for v10, v11 in p6 do
            v9[v10] = v11
        end
        v9.Color = nil
        v9.RuneTransparency = nil
        v9.RuneSize = nil
        local v12 = p6.Color or Color3.fromRGB(242, 156, 48)
        local v13 = p6.RuneTransparency
        local v14 = v13 == nil and 0.6 or v13
        local v15 = p6.RuneSize or UDim2.fromScale(1, 1)
        local u16 = u3.createRef()
        local u17 = u3.createRef()
        local u18 = u3.createRef()
        local u19 = u3.createRef()
        local v20 = u3.createRef()
        v8(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u17
                [3] = u18
                [4] = u19
                [5] = u5
            --]]
            local v21 = u16:getValue()
            local v22 = u17:getValue()
            local v23 = u18:getValue()
            local v24 = u19:getValue()
            if v21 then
                u5:Create(v21, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    ["Rotation"] = 180
                }):Play()
            end
            if v22 then
                u5:Create(v22, TweenInfo.new(12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    ["Rotation"] = 180
                }):Play()
            end
            if v23 then
                u5:Create(v23, TweenInfo.new(16, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    ["Rotation"] = -180
                }):Play()
            end
            if v24 then
                u5:Create(v24, TweenInfo.new(18, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    ["Rotation"] = -180
                }):Play()
            end
        end, {})
        local v25 = {}
        for v26, v27 in v9 do
            v25[v26] = v27
        end
        return u3.createElement(u2, v25, {
            ["OuterRuneWheel"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://8247934954",
                ["Size"] = v15,
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ImageColor3"] = v12,
                ["ImageTransparency"] = v14,
                [u3.Ref] = u16
            }),
            ["Square"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://8247934767",
                ["Size"] = v15,
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ImageColor3"] = v12,
                ["ImageTransparency"] = v14,
                [u3.Ref] = u17
            }),
            ["SquareDiamond"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://8247934648",
                ["Size"] = v15,
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ImageColor3"] = v12,
                ["ImageTransparency"] = v14,
                [u3.Ref] = u18
            }),
            ["InnerRuneWheel"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://8247934516",
                ["Size"] = v15,
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ImageColor3"] = v12,
                ["ImageTransparency"] = v14,
                [u3.Ref] = u19
            }),
            ["CenterPiece"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://8247934380",
                ["Size"] = v15,
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ImageColor3"] = v12,
                ["ImageTransparency"] = v14,
                [u3.Ref] = v20
            })
        })
    end)
}