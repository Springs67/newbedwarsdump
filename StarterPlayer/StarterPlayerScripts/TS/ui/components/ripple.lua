local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["Ripple"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local u9 = u3.createRef()
        local u10 = u3.createRef()
        local v11 = p6.Speed
        local u12 = v11 == nil and 0.8 or v11
        local v13 = p6.Transparency
        local u14 = v13 == nil and 0.3 or v13
        local v15 = p6.IntervalDuration
        local u16 = v15 == nil and 2.5 or v15
        local v17 = p6.Size
        local u18 = v17 == nil and 1.04 or v17
        v8(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
                [3] = u14
                [4] = u5
                [5] = u12
                [6] = u18
                [7] = u16
            --]]
            local u19 = u9:getValue()
            local u20 = u10:getValue()
            local u21 = true
            if u19 and u20 then
                local function u24() --[[ Line: 37 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u20
                        [3] = u14
                        [4] = u5
                        [5] = u12
                        [6] = u18
                    --]]
                    u19.Size = UDim2.fromScale(1, 1)
                    u20.Transparency = u14
                    local v22 = u5:Create(u19, TweenInfo.new(u12, Enum.EasingStyle.Cubic), {
                        ["Size"] = UDim2.fromScale(u18, u18)
                    })
                    local v23 = u5:Create(u20, TweenInfo.new(u12, Enum.EasingStyle.Cubic), {
                        ["Transparency"] = 1
                    })
                    v22:Play()
                    v23:Play()
                end
                task.spawn(function() --[[ Line: 49 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u16
                        [3] = u21
                    --]]
                    while true do
                        u24()
                        local v25 = task.wait(u16)
                        if v25 ~= 0 and (v25 == v25 and v25) then
                            v25 = u21
                        end
                        if v25 == 0 or (v25 ~= v25 or not v25) then
                            return
                        end
                    end
                end)
            end
            return function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21 = false
            end
        end, {})
        local v26 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u3.Ref] = u9
        }
        local v27 = {}
        local v28 = #v27
        local v29 = {
            ["Color"] = p6.Color or Color3.fromRGB(255, 255, 255)
        }
        local v30 = p6.Thickness
        v29.Thickness = v30 == nil and 2 or v30
        v29.Transparency = u14
        v29[u3.Ref] = u10
        v27[v28 + 1] = u3.createElement("UIStroke", v29)
        local v31 = p6[u3.Children]
        if v31 then
            for v32, v33 in v31 do
                if type(v32) == "number" then
                    v27[v28 + 1 + v32] = v33
                else
                    v27[v32] = v33
                end
            end
        end
        return u3.createElement(u2, v26, v27)
    end)
}