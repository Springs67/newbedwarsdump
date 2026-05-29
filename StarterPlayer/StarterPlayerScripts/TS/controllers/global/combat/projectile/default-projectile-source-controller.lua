local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "triple-shot", "triple-shot-util").TripleShotUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, script.Parent, "projectile-source-controller").ProjectileSourceController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "DefaultProjectileSourceController"
    end,
    ["__index"] = u8
})
u9.__index = u9
function u9.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, ...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p12, ...)
    p12.Name = "DefaultProjectileSourceController"
end
function u9.isRelevantItem(_, p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u4
        [4] = u3
        [5] = u6
    --]]
    if p13.itemType == u7.LASSO then
        return false
    elseif p13.itemType == u7.BLUNDERBUSS then
        return false
    elseif u5:isWizardStaff(p13.itemType) then
        return false
    elseif p13.itemType == u7.FISHING_ROD then
        return false
    elseif p13.itemType == u7.VACUUM then
        return false
    elseif p13.itemType == u7.FEATHER_BOW then
        return false
    elseif u4.isTripleShot(p13.itemType, u3.LocalPlayer) then
        return false
    elseif p13.itemType == u7.SPEAR or (p13.itemType == u7.SAND_SPEAR or p13.itemType == u7.HARPOON) then
        return false
    else
        local v14 = u6(p13.itemType)
        if v14.projectileSource == nil then
            return false
        else
            return not v14.projectileSource.multiShot
        end
    end
end
function u9.onStartCharging(_) --[[ Line: 74 ]] end
function u9.onStopCharging(_) --[[ Line: 76 ]] end
function u9.onMaxCharge(_) --[[ Line: 78 ]] end
function u9.onLaunch(_) --[[ Line: 80 ]] end
function u9.onStartReload(_) --[[ Line: 82 ]] end
return {
    ["DefaultProjectileSourceController"] = v2.CreateController(u9.new())
}