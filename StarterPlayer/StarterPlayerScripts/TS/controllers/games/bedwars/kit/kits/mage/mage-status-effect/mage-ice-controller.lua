local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "MageIceController"
    end,
    ["__index"] = u6
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
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "MageIceController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u7
        [4] = u10
        [5] = u9
    --]]
    u6.KnitStart(u16)
    u5.ProjectileHit:connect(function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u9
            [4] = u16
        --]]
        if p17:isCancelled() then
            return nil
        end
        if p17.projectileType ~= "mage_spell_ice" then
            return nil
        end
        if p17.shooter == nil then
            return nil
        end
        local v18 = p17.shooter:getInstance()
        if not v18 then
            return nil
        end
        local v19 = u7:getPlayerFromEntityInstance(v18)
        if not v19 then
            return nil
        end
        local v20 = p17.hitEntity
        if v20 ~= nil then
            v20 = v20:getInstance()
        end
        if not v20 then
            return nil
        end
        if u10:isActive(v18, u9.MAGE_ICE_ELEMENT) then
            u16:playIceExplosionEffect(v19, p17.hitData.hitCFrame.Position)
        end
    end)
end
function u12.playIceExplosionEffect(_, _, p21) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u2
        [4] = u8
    --]]
    local u22 = u4.Assets.Effects.SnowBlast:Clone()
    u22.Transparency = 1
    u22:PivotTo(CFrame.new(p21))
    u11:playEffects(u22:GetChildren(), nil, {})
    task.delay(1.5, function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:Destroy()
    end)
    u2:playSound(u8.WINTER_BOSS_ICICLE_IMPACT, {
        ["position"] = p21
    })
end
v3.CreateController(u12.new())
return nil