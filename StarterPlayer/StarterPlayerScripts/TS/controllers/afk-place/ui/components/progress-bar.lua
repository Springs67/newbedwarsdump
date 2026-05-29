local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["ProgressBar"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local v9 = p7.useMemo
        local u10 = u3.createRef()
        local u11 = u3.createRef()
        local v12 = v9(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            return u6.Size
        end, {})
        v8(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
                [3] = u6
            --]]
            local v13 = u5
            local v14 = u11:getValue()
            local v15 = u6.BarTweenSpeed
            local v16 = v15 == nil and 0.12 or v15
            v13:Create(v14, TweenInfo.new(v16, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.fromScale(u6.FillRatio, 1)
            }):Play()
        end, { u6.FillRatio })
        v8(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
                [3] = u6
            --]]
            local v17 = u5
            local v18 = u10:getValue()
            local v19 = u6.BarTweenSpeed
            local v20 = v19 == nil and 0.012 or v19
            v17:Create(v18, TweenInfo.new(v20, Enum.EasingStyle.Linear), {
                ["Size"] = u6.Size
            }):Play()
        end, { u6.Size })
        local v21 = {
            [u3.Ref] = u10,
            ["Size"] = v12,
            ["BackgroundColor3"] = u2.WHITE
        }
        local v22 = u6.BackgroundBarTransparency
        v21.BackgroundTransparency = v22 == nil and 0 or v22
        v21.BorderSizePixel = 0
        v21.ZIndex = u6.ZIndex
        local v23 = { u3.createElement("UIGradient", {
                ["Color"] = u6.BackgroundColor
            }) }
        local _ = #v23
        local v24 = {
            [u3.Ref] = u11,
            ["Size"] = UDim2.fromScale(u6.FillRatio, 1),
            ["BackgroundColor3"] = u2.WHITE,
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = u6.ZIndex
        }
        local v25 = { u3.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = u6.FillColor
            }) }
        local v26 = #v25
        local v27 = u6[u3.Children]
        if v27 then
            for v28, v29 in v27 do
                if type(v28) == "number" then
                    v25[v26 + v28] = v29
                else
                    v25[v28] = v29
                end
            end
        end
        v23.BarFill = u3.createElement("Frame", v24, v25)
        return u3.createFragment({
            ["BarBackground"] = u3.createElement("Frame", v21, v23)
        })
    end)
}