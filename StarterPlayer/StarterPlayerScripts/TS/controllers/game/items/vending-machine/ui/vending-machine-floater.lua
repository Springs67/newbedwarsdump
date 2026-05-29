local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
return {
    ["VendingMachineFloater"] = v3.new(u2)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u5
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local v9 = p7.useMemo
        local u10 = u2.createRef()
        local u11 = u2.createRef()
        local u12 = u2.createRef()
        local u13 = UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100)
        local u14 = math.random(-40, 40)
        v8(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u4
                [3] = u12
                [4] = u13
            --]]
            local u15 = true
            task.spawn(function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u10
                    [3] = u4
                    [4] = u12
                    [5] = u13
                --]]
                while u15 do
                    local u16 = u10:getValue()
                    if not u16 then
                        return nil
                    end
                    local v17 = UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100)
                    local v18 = math.random(-40, 40)
                    local u19 = math.random(800, 1600) / 100
                    local v20 = {
                        ["Position"] = v17,
                        ["Rotation"] = v18
                    }
                    local v21 = u4:Create(u16, TweenInfo.new(u19, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v20)
                    v21:Play()
                    local u22 = u12:getValue()
                    if u22 then
                        local v23 = u4:Create(u22, TweenInfo.new(u19 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            ["TextTransparency"] = 0
                        })
                        v23:Play()
                        v23.Completed:Connect(function() --[[ Line: 41 ]]
                            --[[
                            Upvalues:
                                [1] = u16
                                [2] = u15
                                [3] = u4
                                [4] = u22
                                [5] = u19
                            --]]
                            if not (u16 and u15) then
                                return nil
                            end
                            u4:Create(u22, TweenInfo.new(u19 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                ["TextTransparency"] = 1
                            }):Play()
                        end)
                    end
                    v21.Completed:Wait()
                    u13 = v17
                end
            end)
            return function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15 = false
            end
        end, {})
        return v9(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u10
                [3] = u13
                [4] = u14
                [5] = u6
                [6] = u5
                [7] = u11
                [8] = u12
            --]]
            local v24 = {
                [u2.Ref] = u10,
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = u13,
                ["Rotation"] = u14,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["SizeConstraint"] = "RelativeXX",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 1
            }
            local v25 = {}
            local v26 = #v25
            local v27
            if u6.item == nil then
                v27 = false
            else
                v27 = u2.createElement(u5, {
                    ["ImageTransparency"] = 0.1,
                    ["ItemType"] = u6.item
                })
            end
            if v27 then
                v25[v26 + 1] = v27
            end
            local v28 = #v25
            local v29
            if u6.image == nil then
                v29 = false
            else
                v29 = u2.createElement("ImageLabel", {
                    [u2.Ref] = u11,
                    ["Image"] = u6.image,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.2
                })
            end
            if v29 then
                v25[v28 + 1] = v29
            end
            local v30 = #v25
            local v31
            if u6.item == nil and u6.image == nil then
                v31 = u2.createElement("TextLabel", {
                    [u2.Ref] = u12,
                    ["Text"] = "?",
                    ["Font"] = "LuckiestGuy",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextScaled"] = true,
                    ["TextTransparency"] = math.random(),
                    ["BorderSizePixel"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1.5, 1.5),
                    ["BackgroundTransparency"] = 1
                })
            else
                v31 = false
            end
            if v31 then
                v25[v30 + 1] = v31
            end
            return u2.createElement("Frame", v24, v25)
        end, {})
    end)
}