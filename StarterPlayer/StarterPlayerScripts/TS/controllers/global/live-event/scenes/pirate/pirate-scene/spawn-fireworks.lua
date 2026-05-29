local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u6 = Random.new()
return {
    ["SpawnFireworks"] = {
        ["name"] = "Spawn fireworks",
        ["event"] = "Heartbeat",
        ["func"] = function(p7, p8, _) --[[ Name: func, Line 11 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u6
                [3] = u2
                [4] = u4
                [5] = u3
            --]]
            if p7.elapsedEventTime > u5.CelebrationStarts and p7.elapsedEventTime < u5.CelebrationEnds then
                local v9 = p8:get("nextFireworkLaunch")
                if v9 == nil then
                    p8:set("nextFireworkLaunch", os.clock() + 0.1)
                    return nil
                end
                if v9 < os.clock() then
                    p8:set("nextFireworkLaunch", os.clock() + 0.15)
                    local v10 = u6:NextNumber(-200, 200)
                    local v11 = 30 + u6:NextNumber(-10, 10)
                    local v12 = u6
                    local v13 = Vector3.new(38, 293.05, 302) + Vector3.new(v10, v11, v12:NextNumber(-200, 200))
                    local v14 = u2.fromList(u4.HEART, u4.NORMAL, u4.SPARKS)
                    u3.Controllers.FireworkController:playFireworkEffect(v13, v14)
                end
            end
        end
    }
}