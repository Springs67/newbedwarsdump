local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.RunService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "DecayController"
    end,
    ["__index"] = u10
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
    --]]
    u10.constructor(p17)
    p17.Name = "DecayController"
    p17.maid = u4.new()
    p17.expireTime = 0
    p17.isPlaying = false
end
function u14.KnitStart(u18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u7
        [4] = u13
        [5] = u6
        [6] = u3
        [7] = u9
        [8] = u2
        [9] = u12
        [10] = u8
    --]]
    u10.KnitStart(u18)
    u11.Client:Get("PlayerDecayed"):Connect(function(p19) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u7
            [3] = u13
            [4] = u6
            [5] = u3
            [6] = u9
            [7] = u2
            [8] = u12
        --]]
        if not p19.player then
            return nil
        end
        u18.expireTime = tick() + p19.duration
        u13:playEffects({ (u7.Assets.Effects.DecayVignette:Clone()) }, p19.player.Character, {
            ["destroyAfterSec"] = 3
        })
        local v20 = p19.player == u6.LocalPlayer
        if v20 then
            v20 = tick()
            if v20 ~= 0 and (v20 == v20 and v20) then
                v20 = u18.isPlaying == false
            end
        end
        if v20 ~= 0 and (v20 == v20 and v20) then
            u3.Controllers.VignetteController:createVignette(u9.DECAY)
            u18.maid:GiveTask(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u9
                --]]
                u3.Controllers.VignetteController:destroyVignette(u9.DECAY)
            end)
            u18.isPlaying = true
            u2:playSound(u12.VOID_HEALTH_DECAY)
            task.delay(3, function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:cleanUpEffect()
            end)
        end
    end)
    u8.Heartbeat:Connect(function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        if tick() > u18.expireTime then
            u18.isPlaying = false
        end
    end)
    u11.Client:Get("EntityDeathEvent"):Connect(function(p21) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u18
        --]]
        if u6:GetPlayerFromCharacter(p21.entityInstance) == u6.LocalPlayer then
            u18:cleanUpEffect()
        end
    end)
end
function u14.cleanUpEffect(p22) --[[ Line: 81 ]]
    p22.maid:DoCleaning()
end
u3.CreateController(u14.new())
return nil