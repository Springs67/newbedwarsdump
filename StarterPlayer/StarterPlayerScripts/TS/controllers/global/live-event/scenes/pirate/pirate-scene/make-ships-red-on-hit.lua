local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u5 = v4.SingleMotor
local u6 = v4.Spring
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "useEvent").useEvent
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
return {
    ["MakeShipsRedOnHit"] = {
        ["name"] = "make ships red on hit",
        ["event"] = "Heartbeat",
        ["func"] = function(_, p17, _) --[[ Name: func, Line 21 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u5
                [3] = u14
                [4] = u12
                [5] = u1
                [6] = u13
                [7] = u9
                [8] = u3
                [9] = u10
                [10] = u11
                [11] = u16
                [12] = u2
                [13] = u15
                [14] = u6
            --]]
            local v18 = p17:get("ships")
            if v18 == nil then
                return nil
            end
            local v19 = v18.ship1
            if v19 ~= nil then
                v19 = v19.instance
            end
            if v19 == nil then
                return nil
            end
            local u20 = u7.useState(u5.new(1))
            u7.useEffect(function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                return function() --[[ Line: 36 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    u20:destroy()
                end
            end)
            local v21 = u7.useState({})
            for v22, v23 in v21 do
                local v24 = v23.timestamp
                if os.clock() - v24 > 0.1 then
                    v21[v22] = nil
                end
            end
            for v25 in u14("projectile hit", u12.ProjectileHit) do
                local v26 = v25[1]
                local v27 = u1.instanceof(v26.shooter, u13)
                if v27 then
                    v27 = v26.shooter:getPlayer().UserId == u9.LocalPlayer.UserId
                end
                if v27 then
                    local v28 = v26.hitData.part
                    if v28 ~= nil then
                        v28 = v28.Parent
                    end
                    v27 = v28 == v19 and not v26:isCancelled()
                    if v27 then
                        local v29 = v21[v26.projectileRefId] ~= nil
                        v27 = not v29
                    end
                end
                if v27 then
                    local v30 = p17:get("shipHealth")
                    local v31 = (v30 == nil and 1000 or v30) - 6
                    p17:set("shipHealth", v31)
                    u3.Controllers.BossBarController:updateHealth(v31)
                    v21[v26.projectileRefId] = {
                        ["timestamp"] = os.clock()
                    }
                    local v32 = u10.Assets.Effects.PirateShipHit:Clone()
                    v32.Position = v26.hitData.hitCFrame.Position
                    v32.Parent = u11
                    u16:playEffects({ v32 }, nil, {
                        ["destroyAfterSec"] = 3
                    })
                    u2:playSound(u15.PIRATE_SHIP_HIT)
                    u20:setGoal(u6.new(0.5, {
                        ["dampingRatio"] = 0.75,
                        ["frequency"] = 6
                    }))
                    task.delay(0.15, function() --[[ Line: 89 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u6
                        --]]
                        u20:setGoal(u6.new(1, {
                            ["dampingRatio"] = 0.75,
                            ["frequency"] = 4
                        }))
                    end)
                end
            end
        end
    }
}