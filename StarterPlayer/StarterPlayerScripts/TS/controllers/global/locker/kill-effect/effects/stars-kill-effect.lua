local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "StarsKillEffect"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, ...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, ...)
end
function u12.onKill(_, _, _, p16) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u3
        [4] = u8
        [5] = u4
        [6] = u9
        [7] = u10
        [8] = u1
    --]]
    local u17 = u5.new()
    local v18 = u7.Assets.Effects.StarParticle:Clone()
    u3:setQueryIgnored(v18, true)
    v18.Transparency = 1
    v18.CFrame = p16
    v18.Parent = u8
    u17:GiveTask(v18)
    for v19, v20 in v18.Attachment:GetChildren() do
        local _ = v19 - 1
        if v20:IsA("ParticleEmitter") then
            v20.Enabled = false
        end
    end
    u17:GiveTask(u4:playSound(u9.STAR_KILL_EFFECT, {
        ["position"] = p16.Position
    }))
    u10:playInstanceEffects({ v18 })
    u1.Promise.delay(4):andThen(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:DoCleaning()
    end)
    return u17
end
return u12