local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u7 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "Anonymous"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p11, ...)
end
function u8.onKill(_, _, p12, p13) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u6
        [4] = u2
        [5] = u5
    --]]
    local v14 = u3.new()
    local v15 = u4.Assets.Effects.BatExplosion:Clone()
    v15.Parent = p12
    v15.Position = p12:GetPivot().Position
    u6:playEffects({ v15.Explosion })
    v14:GiveTask(v15)
    v14:GiveTask(u2:playSound(u5.BAT_EXPLOSION, {
        ["position"] = p13.Position
    }))
    return v14
end
return u8