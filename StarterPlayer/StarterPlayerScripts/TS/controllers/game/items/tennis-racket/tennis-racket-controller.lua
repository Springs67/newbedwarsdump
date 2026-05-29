local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
Color3.fromRGB(237, 74, 74)
Color3.fromRGB(0, 0, 0)
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "TennisRacketController"
    end,
    ["__index"] = u10
})
u18.__index = u18
function u18.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p21)
    p21.Name = "TennisRacketController"
end
function u18.isRelevantItem(_, p22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p22.itemType == u14.TENNIS_RACKET
end
function u18.onEnable(p23, _, _) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u12
    --]]
    p23:setupYield(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u12
        --]]
        local u24 = u5.new()
        u24:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u12.TENNIS_RACKET))
        return function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:DoCleaning()
        end
    end)
end
function u18.onDisable(_) --[[ Line: 51 ]] end
function u18.KnitStart(u25) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u14
        [4] = u11
        [5] = u16
        [6] = u9
        [7] = u2
        [8] = u12
        [9] = u13
        [10] = u8
        [11] = u15
    --]]
    u10.KnitStart(u25)
    u4.Controllers.PreloadController:preloadForItemType(u14.TENNIS_RACKET, {
        ["animations"] = { u11.TENNIS_RACKET_IDLE, u11.TENNIS_RACKET_HIT },
        ["sounds"] = { u16.TENNIS_BALL_HIT_1, u16.TENNIS_BALL_HIT_2 }
    })
    u9.ProjectileLaunched:connect(function(p26) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u13
            [4] = u14
            [5] = u8
        --]]
        if p26:isLocalShooter() and p26.projectileType == "tennis_ball" then
            local v27 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
            local v28 = u12.TENNIS_RACKET
            local v29 = u13(u14.TENNIS_RACKET).projectileSource.fireDelaySec
            local v30 = {
                ["cooldownBar"] = {
                    ["color"] = Color3.fromRGB(156, 222, 84)
                }
            }
            v27:setOnCooldown(v28, v29, v30)
            local u31 = p26.projectile:FindFirstChild("Handle"):FindFirstChild("Trail")
            if u31 then
                u31.Parent = u8
            end
            task.spawn(function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                task.wait(3)
                if u31 then
                    u31:Destroy()
                end
            end)
        end
    end)
    u15.Client:Get("TennisBallExplode"):Connect(function(p32) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:playExplosion(p32.position)
    end)
end
function u18.playExplosion(_, p33) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u17
        [4] = u3
        [5] = u16
    --]]
    local u34 = u7.Assets.Effects.Explosion:Clone()
    u34.Parent = u8
    u17:playEffects({ u34 }, nil, {
        ["sizeMultiplier"] = 0.75
    })
    u3:playSound(u16.TNT_EXPLODE_1, {
        ["volumeMultiplier"] = 1.1,
        ["rollOffMinDistance"] = 50,
        ["rollOffMaxDistance"] = 400,
        ["position"] = p33
    })
    u34.CFrame = CFrame.new(p33)
    task.delay(1, function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:Destroy()
    end)
end
u4.CreateController(u18.new())
return nil