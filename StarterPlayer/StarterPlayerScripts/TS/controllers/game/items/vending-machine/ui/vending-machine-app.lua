local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState
local u5 = v1.import(script, script.Parent, "idle", "vending-machine-idle").VendingMachineIdle
local u6 = v1.import(script, script.Parent, "roll", "vending-machine-roll").VendingMachineRoll
return {
    ["VendingMachineApp"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u5
            [4] = u6
        --]]
        local _ = p8.useState
        local v9 = p8.useEffect
        local u10 = u2.createRef()
        v9(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            local u11 = true
            task.spawn(function() --[[ Line: 14 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u10
                --]]
                while u11 do
                    local u12 = u10:getValue()
                    if not u12 then
                        return nil
                    end
                    u12.Position = UDim2.fromScale(0.5 + math.random() * 0.05, 0.5 + math.random() * 0.05)
                    task.delay(0.01, function() --[[ Line: 21 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u12
                        --]]
                        if u11 then
                            u12.Position = UDim2.fromScale(0.5, 0.5)
                        end
                    end)
                    task.wait(math.random(20, 150) / 100)
                end
            end)
            return function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11 = false
            end
        end, {})
        local v13 = {
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v14 = { u2.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(Color3.fromHex("D730F2"), Color3.fromHex("C167E3"))
            }), u2.createElement("ImageLabel", {
                [u2.Ref] = u10,
                ["Image"] = "rbxassetid://9111090691",
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["ImageTransparency"] = 0.7,
                ["BackgroundTransparency"] = 1
            }) }
        local v15 = #v14
        local v16
        if p7.vendingMachineState == u4.IDLE then
            v16 = u2.createElement(u5)
        else
            v16 = false
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        local v17 = #v14
        local v18
        if p7.vendingMachineState == u4.ROLLING then
            v18 = u2.createElement(u6, {
                ["choosenReward"] = p7.choosenReward,
                ["soundPosition"] = p7.soundPosition,
                ["dispenseTime"] = p7.dispenseTime
            })
        else
            v18 = false
        end
        if v18 then
            v14[v17 + 1] = v18
        end
        return u2.createElement("Frame", v13, v14)
    end)
}