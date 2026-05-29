local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-projectiles").SpiritSummonerProjectile
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpiritStaffProjectileController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p15, ...)
    p15.Name = "SpiritStaffProjectileController"
    p15.Client = {}
end
function u12.KnitStart(p16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p16)
end
function u12.isRelevantItem(_, p17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p17.itemType == u11.SPIRIT_STAFF
end
function u12.getProjectileSource(_, _) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u10
        [4] = u3
        [5] = u8
    --]]
    local v18 = u6.LocalPlayer:GetAttribute("SpiritSummonerAffinity")
    local v19 = u6.LocalPlayer:GetAttribute("ReadySummonedAttackSpirits")
    local v20 = u6.LocalPlayer:GetAttribute("ReadySummonedHealSpirits")
    local v21 = u9[u10.ATTACK]
    if v18 == u10.ATTACK and v19 > 0 then
        v21 = u9[u10.ATTACK]
    elseif v18 == u10.HEAL and v20 > 0 then
        v21 = u9[u10.HEAL]
    elseif v19 > 0 then
        v21 = u9[u10.ATTACK]
    elseif v20 > 0 then
        v21 = u9[u10.HEAL]
    end
    local v22 = u8[u3.Controllers.KitSkinController:getKitSkin(u6.LocalPlayer)].uma
    if v22 then
        local v23 = v21.projectileType(nil)
        if v23 == "heal_spirit" then
            v21.launchSound = { v22.healSpiritThrowSound }
            return v21
        end
        if v23 == "attack_spirit" then
            v21.launchSound = { v22.attackSpiritThrowSound }
        end
    end
    return v21
end
function u12.onLaunch(p24, u25) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u1
        [4] = u4
    --]]
    local u26 = p24:getHandItem()
    local u27 = p24.projectileHandler
    local u28 = p24:getProjectileSource(u26)
    local u29 = u5.new()
    u29:GiveTask(u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["moveSpeedMultiplier"] = u28.walkSpeedMultiplier
    }))
    u1.Promise.defer(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u4
            [3] = u26
            [4] = u27
            [5] = u28
            [6] = u29
        --]]
        if u25() then
            u4.Controllers.ProjectileController:launchProjectile(u26.itemType, nil, u27, u26.tool, u28)
        end
        u29:DoCleaning()
    end)
end
function u12.onStartCharging(_) --[[ Line: 80 ]] end
function u12.onStopCharging(_) --[[ Line: 82 ]] end
function u12.onStartReload(_, _) --[[ Line: 84 ]] end
u3.CreateController(u12.new())
return nil