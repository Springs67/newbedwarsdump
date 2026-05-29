local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "scissor-sword-balance").ScissorSwordBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent, "scissor-sword-combo-handler").ScissorSwordComboHandler
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "ScissorSwordController"
    end,
    ["__index"] = u10
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u16
        [4] = u11
        [5] = u7
        [6] = u19
    --]]
    u10.constructor(p23)
    p23.Name = "ScissorSwordController"
    p23.scissorSwordMeta = {
        [u17.HERO_SCISSOR_SWORD] = u16(u17.HERO_SCISSOR_SWORD),
        [u17.VILLAIN_SCISSOR_SWORD] = u16(u17.VILLAIN_SCISSOR_SWORD)
    }
    p23.swordSwingAnimations = { u11.SCISSOR_SWORD_SWING_1, u11.SCISSOR_SWORD_SWING_2 }
    p23.animationSequenceBufferSec = 0.5
    p23.connectionMaid = u7.new()
    p23.lastSwingHadTarget = false
    p23.sequenceIndex = 0
    p23.comboHandler = u19.new()
end
function u20.KnitStart(p24) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u17
        [4] = u18
        [5] = u11
    --]]
    u10.KnitStart(p24)
    local v25 = u6.Controllers.PreloadController
    local v26 = u17.HERO_SCISSOR_SWORD
    local v27 = {
        ["sounds"] = {
            u18.SCISSOR_SWORD_SLASH_FAST_HERO,
            u18.SCISSOR_SWORD_SLASH_SLOW_HERO,
            u18.SCISSOR_SWORD_SLASH_FAST_VILLAIN,
            u18.SCISSOR_SWORD_SLASH_SLOW_VILLAIN
        }
    }
    local v28 = {}
    local v29 = #v28
    local v30 = p24.swordSwingAnimations
    local v31 = #v30
    table.move(v30, 1, v31, v29 + 1, v28)
    v28[v29 + v31 + 1] = u11.FP_SWING_SWORD
    v27.animations = v28
    v25:preloadForItemType(v26, v27)
    local v32 = u6.Controllers.PreloadController
    local v33 = u17.VILLAIN_SCISSOR_SWORD
    local v34 = {
        ["sounds"] = {
            u18.SCISSOR_SWORD_SLASH_FAST_HERO,
            u18.SCISSOR_SWORD_SLASH_SLOW_HERO,
            u18.SCISSOR_SWORD_SLASH_FAST_VILLAIN,
            u18.SCISSOR_SWORD_SLASH_SLOW_VILLAIN
        }
    }
    local v35 = {}
    local v36 = #v35
    local v37 = p24.swordSwingAnimations
    local v38 = #v37
    table.move(v37, 1, v38, v36 + 1, v35)
    v35[v36 + v38 + 1] = u11.FP_SWING_SWORD
    v34.animations = v35
    v32:preloadForItemType(v33, v34)
end
function u20.isRelevantItem(p39, p40) --[[ Line: 82 ]]
    return p39.scissorSwordMeta[p40.itemType] ~= nil
end
function u20.onEnable(u41, u42, _) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u14
        [4] = u4
        [5] = u8
        [6] = u12
        [7] = u11
        [8] = u6
        [9] = u17
        [10] = u2
        [11] = u15
        [12] = u13
        [13] = u18
    --]]
    local _ = u41.scissorSwordMeta[u42.itemType]
    u41.comboHandler:enable()
    u41.connectionMaid:GiveTask(function() --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        return u41.comboHandler:disable()
    end)
    u41.connectionMaid:GiveTask(u9.SwordSwing:connect(function(p43) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u5
            [3] = u42
        --]]
        if u41.animationRunning and u41.lastSwingHadTarget then
            p43:setCancelled(true)
        end
        if u41.animationRunning then
            return nil
        end
        if not u41.animationRunning then
            if p43.targetEntity then
                local v44 = u41.soundPlaying
                if v44 ~= nil then
                    v44:Stop()
                end
                u41.soundPlaying = u5:playSound(u41:getHitSound(u42.itemType, p43.attackSpeed))
            end
            u41.animationRunning = u41:playSwingAnimation(p43.swordType, u41.sequenceIndex)
            local v45 = u41
            v45.sequenceIndex = v45.sequenceIndex + 1
            u41.lastSwingHadTarget = p43.targetEntity and true or false
            if not u41.lastSwingHadTarget then
                u41.animationRunning = nil
                return nil
            end
            if u41.animationRunning then
                local v46 = u41.animationRunning.Length / p43.attackSpeed
                u41.animationRunning:AdjustSpeed(v46)
                u41.connectionMaid:GiveTask(u41.animationRunning.Stopped:Once(function() --[[ Line: 124 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                    --]]
                    u41.animationRunning = nil
                end))
            end
        end
    end))
    u41.connectionMaid:GiveTask(u9.SwordCharge:connect(function(p47) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u14
            [3] = u4
            [4] = u8
            [5] = u12
            [6] = u11
            [7] = u6
            [8] = u17
            [9] = u2
            [10] = u15
            [11] = u13
            [12] = u5
            [13] = u18
        --]]
        local v48 = u41.scissorSwordMeta[p47.itemType] ~= nil
        if v48 then
            v48 = p47.chargeState == u14.Charged
        end
        if v48 then
            if p47.chargeState == u14.Charged then
                u41.animationRunning = u4:playAnimation(u8.LocalPlayer, u12:getAssetId(u11.SCISSOR_SWORD_COMBO_STRIKE))
                u6.Controllers.ViewmodelController:playAnimation(u11.BEAR_CLAWS_FLURRY)
                if u41.animationRunning then
                    u41.connectionMaid:GiveTask(u41.animationRunning.Stopped:Once(function() --[[ Line: 142 ]]
                        --[[
                        Upvalues:
                            [1] = u41
                        --]]
                        u41.animationRunning = nil
                    end))
                end
                local v49
                if p47.itemType == u17.HERO_SCISSOR_SWORD then
                    v49 = Color3.fromRGB(255, 224, 112)
                else
                    v49 = Color3.fromRGB(88, 46, 158)
                end
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u15.SCISSOR_SWORD_CHARGED_SWING, u13.COMBO_STRIKE_COOLDOWN_SEC, {
                    ["cooldownBar"] = {
                        ["color"] = v49
                    }
                })
                return
            end
            if p47.chargeState == u14.Charging then
                local v50 = u41.soundPlaying
                if v50 ~= nil then
                    v50:Stop()
                end
                u41.soundPlaying = u5:playSound(u18.SCISSOR_SWORD_CHARGE_UP)
            end
        end
    end))
end
function u20.onDisable(p51) --[[ Line: 162 ]]
    p51.connectionMaid:DoCleaning()
end
function u20.getSwingAnimations(p52) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    local v53 = { u11.FP_SWING_SWORD }
    if u6.Controllers.ViewmodelController:isVisible() then
        return v53
    else
        return p52.swordSwingAnimations
    end
end
function u20.getHitSound(_, p54, p55) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
    --]]
    if p54 == u17.HERO_SCISSOR_SWORD then
        if p55 <= 0.4 then
            return u18.SCISSOR_SWORD_SLASH_FAST_HERO
        else
            return u18.SCISSOR_SWORD_SLASH_SLOW_HERO
        end
    elseif p55 <= 0.4 then
        return u18.SCISSOR_SWORD_SLASH_FAST_VILLAIN
    else
        return u18.SCISSOR_SWORD_SLASH_SLOW_VILLAIN
    end
end
function u20.playSwingAnimation(p56, _, p57) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u8
    --]]
    local v58 = p56:getSwingAnimations()
    local v59 = v58[p57 % #v58 + 1]
    if u6.Controllers.ViewmodelController:isVisible() then
        return u6.Controllers.ViewmodelController:playAnimation(v59)
    else
        return u12:playAnimation(u8.LocalPlayer, v59)
    end
end
u6.CreateController(u20.new())
return nil