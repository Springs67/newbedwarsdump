local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util")
local u10 = v9.MAGE_ELEMENT_CYCLE_INDEX
local u11 = v9.MageKitUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "MageSpellbookController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p16, ...)
    p16.Name = "MageSpellbookController"
    p16.Client = {}
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p17)
end
function u13.isRelevantItem(_, p18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u3
        [4] = u8
    --]]
    local v19
    if p18.itemType == u12.MAGE_SPELLBOOK then
        v19 = u2.Controllers.KitController:isUsingKit(u3.LocalPlayer, u8.MAGE)
    else
        v19 = false
    end
    return v19
end
function u13.onEnable(p20, p21, p22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
        [4] = u5
    --]]
    u4.onEnable(p20, p21, p22)
    p20:setupYield(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
        --]]
        local u23 = u6:playAnimation(u3.LocalPlayer, u5.WIZARD_BALL_CAST, {})
        return function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            local v24 = u23
            if v24 ~= nil then
                v24:Stop()
            end
        end
    end)
end
function u13.onDisable(p25) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.onDisable(p25)
end
function u13.getProjectileSource(p26, _) --[[ Line: 54 ]]
    return p26:getNextElementProjectile()
end
function u13.getNextElementProjectile(_) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u7
        [4] = u11
    --]]
    local v27 = u3.LocalPlayer:GetAttribute(u10)
    local v28 = u7.MAGE_ELEMENT_CYCLE[v27 + 1]
    local v29 = u11.getUnlockedMageElements(u3.LocalPlayer)
    if table.find(v29, v28) == nil then
        return u11.MageElementMeta.BASE.projectileSource
    else
        return u11.MageElementMeta[v28].projectileSource
    end
end
function u13.onStartCharging(_) --[[ Line: 67 ]] end
function u13.onStopCharging(_) --[[ Line: 69 ]] end
function u13.onLaunch(_, _) --[[ Line: 71 ]] end
function u13.onStartReload(_, _) --[[ Line: 73 ]] end
u2.CreateController(u13.new())
return nil