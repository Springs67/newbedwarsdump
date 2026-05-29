local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["VehicleClient"] = {
        ["constructor"] = function(p5, p6) --[[ Name: constructor, Line 9 ]]
            p5.vehicleModel = p6
            p5.enginePowerRatio = 0
        end,
        ["onEnable"] = function(_) --[[ Name: onEnable, Line 13 ]] end,
        ["enable"] = function(u7, u8) --[[ Name: enable, Line 15 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
                [3] = u4
            --]]
            local u9 = u3.LocalPlayer.Character
            if u9 ~= nil then
                u9 = u9:FindFirstChild("Humanoid")
            end
            if not u9 then
                return nil
            end
            local u10 = u2.new()
            u10:GiveTask(function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u7
                --]]
                u7:onDisable()
            end)
            u10:GiveTask(u8:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u9
                    [3] = u10
                --]]
                if u8.Occupant == nil or u8.Occupant ~= u9 then
                    u10:DoCleaning()
                end
            end))
            local u11 = true
            u10:GiveTask(function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11 = false
            end)
            task.spawn(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u11
                    [3] = u7
                --]]
                local u12 = u4.Client:GetNamespace("Vehicle"):Get("SetEnginePower")
                local u13 = -1
                while true do
                    local v14 = task.wait(0.1)
                    if v14 ~= 0 and (v14 == v14 and v14) then
                        v14 = u11
                    end
                    if v14 == 0 or (v14 ~= v14 or not v14) then
                        return
                    end
                    task.spawn(function() --[[ Line: 49 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u7
                            [3] = u12
                        --]]
                        if u13 ~= u7.enginePowerRatio then
                            u13 = u7.enginePowerRatio
                            u12:SendToServer(u7.vehicleModel, u7.enginePowerRatio)
                        end
                    end)
                end
            end)
        end,
        ["onDisable"] = function(_) --[[ Name: onDisable, Line 58 ]] end,
        ["setEnginePowerRatio"] = function(p15, p16) --[[ Name: setEnginePowerRatio, Line 60 ]]
            p15.enginePowerRatio = p16
        end
    }
}