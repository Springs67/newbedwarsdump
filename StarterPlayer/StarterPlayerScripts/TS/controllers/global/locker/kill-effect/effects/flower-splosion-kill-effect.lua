local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "FlowerSplosionKillEffect"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, ...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16, ...)
    p16.springColors = {
        Color3.fromRGB(249, 150, 174),
        Color3.fromRGB(159, 244, 223),
        Color3.fromRGB(246, 240, 163),
        Color3.fromRGB(107, 206, 238),
        Color3.fromRGB(217, 182, 253),
        Color3.fromRGB(135, 221, 89),
        Color3.fromRGB(4, 118, 7)
    }
end
function u13.onKill(p17, _, _, p18) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u3
        [4] = u9
        [5] = u4
        [6] = u5
        [7] = u10
        [8] = u11
        [9] = u1
    --]]
    local u19 = u6.new()
    local v20 = u8.Assets.Effects.FlowerSplosionEffect:Clone()
    u3:setQueryIgnored(v20, true)
    v20.Transparency = 1
    v20.CFrame = p18
    v20.Parent = u9
    u19:GiveTask(v20)
    local v21 = v20.Attachment
    for v22, v23 in {
        v21.Flower,
        v21.Flower1,
        v21.Flower2,
        v21.Flower3
    } do
        local _ = v22 - 1
        local v24 = u4.fromList(p17.springColors)[1]
        v23.Color = ColorSequence.new(v24)
    end
    u19:GiveTask(u5:playSound(u10.STAR_KILL_EFFECT, {
        ["position"] = p18.Position
    }))
    u11:playInstanceEffects({ v20 })
    u1.Promise.delay(4):andThen(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:DoCleaning()
    end)
    return u19
end
return u13