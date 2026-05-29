local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.ReplicatedStorage
local u4 = v2.RunService
local u5 = v2.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u7 = v1.import(script, script.Parent.Parent, "pirate-scene", "modules", "setup-ship-anim").setupShipAnim
return {
    ["CreateShipsBehavior"] = {
        ["name"] = "Create ships",
        ["priority"] = 200,
        ["event"] = "Heartbeat",
        ["func"] = function(p8, p9, _) --[[ Name: func, Line 13 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u3
                [3] = u5
                [4] = u7
                [5] = u6
            --]]
            if p9:get("shipsMayShow") == nil or u4:IsStudio() then
                local v10 = p8.elapsedEventTime / 3600
                local v11 = p8.totalLength / 3600
                local v12 = math.noise(v10 * 0.5) * 0.05
                p9:set("shipsMayShow", v10 % (-3 * (v10 / v11) ^ 2 + 3 + 1 + v12) < 1)
            end
            local v13
            if p8.chainInfo == nil then
                v13 = false
            else
                v13 = p8.chainInfo.stageInChain > 0
            end
            local v14 = v13 == true and true or p9:get("shipsMayShow") == true
            local u15 = p9:get("ships")
            if u15 ~= nil then
                if v14 then
                    if u15.ship1 == nil then
                        local v16 = u3.Assets.Misc.PirateShip:Clone()
                        v16.Parent = u5
                        u15.ship1 = {
                            ["timeOffset"] = 0,
                            ["seed"] = -837992,
                            ["heightOffset"] = 70,
                            ["radiusX"] = 1700,
                            ["radiusY"] = 2000,
                            ["instance"] = v16,
                            ["cframe"] = CFrame.new()
                        }
                        u7(v16):andThen(function(p17) --[[ Line: 41 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                            --]]
                            local v18 = u15
                            if v18 ~= nil then
                                v18 = v18.ship1
                            end
                            if v18 then
                                v18.animationTrack = p17
                                local v19 = u15
                                if v19 ~= nil then
                                    v19.ship1 = v18
                                end
                            end
                        end)
                    end
                else
                    u15.ship1 = nil
                end
                local v20
                if v13 == true then
                    v20 = p8.elapsedEventTime < u6.ShipsDisappear
                elseif p8.elapsedEventTime > p8.totalLength * 0.3333333333333333 then
                    v20 = v14
                else
                    v20 = false
                end
                if v20 then
                    if u15.ship2 == nil then
                        local v21 = u3.Assets.Misc.PirateShip:Clone()
                        v21.Parent = u5
                        u15.ship2 = {
                            ["timeOffset"] = 900,
                            ["seed"] = -713427,
                            ["heightOffset"] = 40,
                            ["radiusX"] = 1300,
                            ["radiusY"] = 1500,
                            ["instance"] = v21,
                            ["cframe"] = CFrame.new()
                        }
                        u7(v21):andThen(function(p22) --[[ Line: 74 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                            --]]
                            local v23 = u15
                            if v23 ~= nil then
                                v23 = v23.ship2
                            end
                            if v23 then
                                v23.animationTrack = p22
                                local v24 = u15
                                if v24 ~= nil then
                                    v24.ship2 = v23
                                end
                            end
                        end)
                    end
                else
                    u15.ship2 = nil
                end
                if v13 == true then
                    v14 = p8.elapsedEventTime < u6.ShipsDisappear
                elseif p8.elapsedEventTime <= p8.totalLength * 0.7 then
                    v14 = false
                end
                if v14 then
                    if u15.ship3 == nil then
                        local v25 = u3.Assets.Misc.PirateShip:Clone()
                        v25.Parent = u5
                        u15.ship3 = {
                            ["timeOffset"] = 980,
                            ["seed"] = 948074,
                            ["heightOffset"] = 0,
                            ["radiusX"] = 900,
                            ["radiusY"] = 900,
                            ["instance"] = v25,
                            ["cframe"] = CFrame.new()
                        }
                        u7(v25):andThen(function(p26) --[[ Line: 107 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                            --]]
                            local v27 = u15
                            if v27 ~= nil then
                                v27 = v27.ship3
                            end
                            if v27 then
                                v27.animationTrack = p26
                                local v28 = u15
                                if v28 ~= nil then
                                    v28.ship3 = v27
                                end
                            end
                        end)
                    end
                else
                    u15.ship3 = nil
                end
                p9:set("ships", u15)
            end
        end
    }
}