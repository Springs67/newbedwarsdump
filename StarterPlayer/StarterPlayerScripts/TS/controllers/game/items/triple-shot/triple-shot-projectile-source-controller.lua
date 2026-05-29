local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "triple-shot", "triple-shot-util").TripleShotUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = u1.import(script, script.Parent, "triple-shot-progress-bar").TripleShotProgressBar
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "TripleShotProjectileController"
    end,
    ["__index"] = u12
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, ...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
    --]]
    u12.constructor(p22, ...)
    p22.Name = "TripleShotProjectileController"
    p22.Client = {}
    p22.chargeMaid = u6.new()
    p22.overchargeStartTime = 0
end
function u19.KnitStart(p23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p23)
end
function u19.isRelevantItem(_, p24) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u10
    --]]
    return u13.isTripleShot(p24.itemType, u10.LocalPlayer)
end
function u19.onStartCharging(p25) --[[ Line: 47 ]]
    p25.overchargeStartTime = 0
end
function u19.onStopCharging(p26) --[[ Line: 50 ]]
    p26.chargeMaid:DoCleaning()
end
function u19.onLaunch(p27, u28) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u10
        [4] = u6
        [5] = u4
        [6] = u1
        [7] = u5
    --]]
    local v29 = p27:getChargeTime()
    local v30
    if v29 == 0 then
        v30 = true
    elseif p27.overchargeStartTime == 0 then
        v30 = false
    else
        v30 = v29 <= tick() - p27.overchargeStartTime
    end
    if v30 then
        local u31 = p27:getHandItem()
        local u32 = u16(u31.itemType)
        local u33 = p27:getAmmoType(u31.itemType)
        local u34
        if u33 then
            local v35 = u15.getToolFromInventory(u10.LocalPlayer, u33)
            if v35 ~= nil then
                v35 = v35.amount
            end
            u34 = (v35 == nil and 0 or v35) - 1
        else
            u34 = 0
        end
        local u36 = p27.projectileHandler
        local u37 = p27:getProjectileSource(u31)
        local u38 = u6.new()
        u38:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["blockSprint"] = true,
            ["moveSpeedMultiplier"] = u37.walkSpeedMultiplier
        }))
        u1.Promise.defer(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u28
                [3] = u33
                [4] = u34
                [5] = u5
                [6] = u31
                [7] = u36
                [8] = u37
                [9] = u38
            --]]
            local v39 = u32.projectileSource
            if v39 ~= nil then
                v39 = v39.multiShotCount
            end
            local v40 = (v39 == 0 or (v39 ~= v39 or not v39)) and 3 or v39
            local v41 = u32.projectileSource
            if v41 ~= nil then
                v41 = v41.multiShotDelay
            end
            local v42 = (v41 == 0 or (v41 ~= v41 or not v41)) and 0.1 or v41
            local v43 = false
            local v44 = 0
            while true do
                if v43 then
                    v44 = v44 + 1
                else
                    v43 = true
                end
                if v44 >= v40 - 1 then
                    break
                end
                task.wait(v42)
                if u28() then
                    if u33 and u34 <= 0 then
                        break
                    end
                    u34 = u34 - 1
                    u5.Controllers.ProjectileController:launchProjectile(u31.itemType, u33, u36, u31.tool, u37)
                end
            end
            u38:DoCleaning()
        end)
    end
end
function u19.onStartReload(_) --[[ Line: 130 ]] end
function u19.getChargeTime(p45) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u11
    --]]
    local v46 = p45:getHandItem()
    if v46 ~= nil then
        v46 = v46.itemType
    end
    if not v46 then
        return 0
    end
    local v47 = u16(v46)
    if v47 ~= nil then
        v47 = v47.projectileSource
        if v47 ~= nil then
            v47 = v47.multiShotChargeTime
        end
    end
    return (v47 == 0 or (v47 ~= v47 or not v47)) and 0 or u11.ProjectileMaxChargeTimeModifierCheck:fire(v47).maxChargeTime
end
function u19.onMaxCharge(p48) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u9
        [4] = u10
        [5] = u5
        [6] = u14
        [7] = u7
        [8] = u18
    --]]
    local v49 = p48:getChargeTime()
    if v49 == 0 then
        return nil
    end
    p48.overchargeStartTime = tick()
    u2:playSound(u17.CHARGE_TRIPLE_SHOT)
    local u50 = true
    p48.chargeMaid:GiveTask(function() --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50 = false
    end)
    task.delay(v49, function() --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u9
        --]]
        if u50 then
            for v51, v52 in u9:GetTagged("projectile-preview-beam") do
                local _ = v51 - 1
                v52.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255))
            end
        end
    end)
    local v53 = u10.LocalPlayer.Character
    local v54
    if v53 then
        v54 = u14[u5.Controllers.KitSkinController:getKitSkin(v53)].multishot
        if v54 ~= nil then
            v54 = v54.progressBarColor
        end
    else
        v54 = nil
    end
    local u55 = u7.mount(u7.createElement("ScreenGui", {}, { u7.createElement(u18, {
            ["title"] = "Triple Shot",
            ["progressColor"] = v54,
            ["chargeTime"] = v49
        }) }), u10.LocalPlayer:WaitForChild("PlayerGui"), "ChargeMultiShot")
    p48.chargeMaid:GiveTask(function() --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u55
        --]]
        u7.unmount(u55)
    end)
end
u4.CreateController(u19.new())
return nil