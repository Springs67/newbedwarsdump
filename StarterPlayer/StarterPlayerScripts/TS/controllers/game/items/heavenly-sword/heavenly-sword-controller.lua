local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "lumen", "lumen-balance").LumenBalance
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "overpowered", "overpowered-game-balance").OverpoweredGameBalance
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "HeavenlySwordController"
    end,
    ["__index"] = u15
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
    --]]
    u15.constructor(p31)
    p31.Name = "HeavenlySwordController"
    p31.animationMaid = u8.new()
    p31.multiShotMaid = u8.new()
end
function u28.KnitStart(u32) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u6
        [3] = u25
        [4] = u16
        [5] = u27
        [6] = u26
        [7] = u13
        [8] = u7
        [9] = u20
        [10] = u23
        [11] = u22
        [12] = u18
        [13] = u10
        [14] = u24
        [15] = u17
    --]]
    u15.KnitStart(u32)
    u6.Controllers.PreloadController:preloadForItemType(u25.HEAVENLY_SWORD, {
        ["animations"] = { u16.HEAVENLY_SWORD_CHARGE, u16.HEAVENLY_SWORD_SWING },
        ["sounds"] = { u27.LIGHT_SWORD_CHARGE }
    })
    u26.Client:Get("PlayerLightSwordSwing"):Connect(function(p33) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:playEffect(p33.cFrame, p33.shooter)
    end)
    u13.SwordChargedSwing:connect(function(p34) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u32
            [3] = u7
            [4] = u20
            [5] = u23
            [6] = u22
            [7] = u16
            [8] = u6
        --]]
        if p34.weapon.Name ~= u25.HEAVENLY_SWORD then
            return nil
        end
        local v35 = p34.chargedAttack
        if v35 ~= nil then
            v35 = v35.chargeTime
        end
        if v35 == 0 or (v35 ~= v35 or not v35) then
            return nil
        end
        local v36 = 1
        if not u32.queueType then
            u32.queueType = u7.Controllers.MatchController:getQueueType()
        end
        if u32.queueType == u20.OVERPOWERED then
            v36 = u23.SwordChargeTimeMultiplier
        end
        if p34.chargedAttack.chargeTime < u22.MIN_CHARGE_TIME * v36 then
            u7.Controllers.DefaultProjectileSourceController:clearProjectileHandler()
            return nil
        end
        local v37 = p34.fromPlayer:GetAttribute("LumenUpgraded")
        if p34.chargedAttack.chargeTime <= u22.MAX_CHARGE_TIME * v36 or (v37 == 0 or (v37 ~= v37 or (v37 == "" or not v37))) then
            u32:fire(p34.fromPlayer, p34.weapon, p34.chargedAttack.chargeTime)
        end
        if p34.chargedAttack.chargeTime < u22.MAX_CHARGE_TIME * v36 then
            v37 = false
        end
        if v37 ~= 0 and (v37 == v37 and (v37 ~= "" and v37)) then
            u32:playAnimation(u16.BEAR_CLAWS_FLURRY)
            u6.Controllers.ViewmodelController:playAnimation(u16.BEAR_CLAWS_FLURRY)
            u32:fireMultiple(p34.fromPlayer, p34.weapon, p34.chargedAttack.chargeTime)
        end
    end)
    local u38 = nil
    local u39 = nil
    u13.SwordCharge:connect(function(u40) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u18
            [3] = u10
            [4] = u24
            [5] = u32
            [6] = u38
            [7] = u17
            [8] = u16
            [9] = u39
            [10] = u6
        --]]
        if u40.itemType ~= u25.HEAVENLY_SWORD then
            return nil
        end
        task.spawn(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u18
                [3] = u10
                [4] = u24
                [5] = u32
                [6] = u38
                [7] = u17
                [8] = u16
                [9] = u39
                [10] = u6
            --]]
            if u40.chargeState == u18.Charging then
                u10.LocalPlayer:SetAttribute("IsCharging", true)
                local v41 = u10.LocalPlayer.Character
                if v41 ~= nil then
                    v41 = v41:FindFirstChild("Humanoid")
                    if v41 ~= nil then
                        v41 = v41:FindFirstChild("Animator")
                    end
                end
                if not v41 then
                    return nil
                end
                local v42 = u24(u40.itemType)
                local v43 = v42.sword
                if v43 ~= nil then
                    v43 = v43.chargedAttack
                end
                if not v43 then
                    return nil
                end
                u32:playSound()
                local v44 = v42.sword
                if v44 ~= nil then
                    v44 = v44.chargedAttack.walkSpeedModifier
                    if v44 ~= nil then
                        v44 = v44.delay
                    end
                end
                local v45 = v44 == nil and 0 or v44
                task.wait(v45)
                local v46 = u10.LocalPlayer:GetAttribute("IsCharging")
                if v46 == 0 or (v46 ~= v46 or (v46 == "" or not v46)) then
                    return nil
                end
                u38 = v41:LoadAnimation(u17:getAnimation(u16.HEAVENLY_SWORD_CHARGE))
                u38:Play()
                u38:AdjustSpeed(0.683)
                u38:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 142 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    local v47 = u38
                    if v47 ~= nil then
                        v47:AdjustSpeed(0)
                    end
                end)
                u39 = u6.Controllers.ViewmodelController:playAnimation(u16.FP_HEAVENLY_SWORD_CHARGE)
                if u39 then
                    u39:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 151 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        local v48 = u39
                        if v48 ~= nil then
                            v48:AdjustSpeed(0)
                        end
                    end)
                end
                u32.animationMaid:GiveTask(function() --[[ Line: 158 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                        [2] = u39
                    --]]
                    local v49 = u38
                    if v49 ~= nil then
                        v49:Stop()
                    end
                    local v50 = u38
                    if v50 ~= nil then
                        v50:Destroy()
                    end
                    local v51 = u39
                    if v51 ~= nil then
                        v51:Stop()
                    end
                    local v52 = u39
                    if v52 ~= nil then
                        v52:Destroy()
                    end
                end)
            else
                local _ = u40.chargeState == u18.Charged
            end
            if u40.chargeState == u18.Idle then
                u10.LocalPlayer:SetAttribute("IsCharging", false)
                local v53 = u38
                if v53 ~= nil then
                    v53:Stop()
                end
                local v54 = u38
                if v54 ~= nil then
                    v54:Destroy()
                end
                local v55 = u39
                if v55 ~= nil then
                    v55:Stop()
                end
                local v56 = u39
                if v56 ~= nil then
                    v56:Destroy()
                end
                u32.animationMaid:DoCleaning()
            end
        end)
    end)
end
function u28.fire(p57, p58, p59, p60) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u25
        [3] = u7
        [4] = u14
        [5] = u27
        [6] = u19
        [7] = u6
        [8] = u21
        [9] = u20
        [10] = u23
        [11] = u22
        [12] = u4
    --]]
    local v61 = u24(u25.HEAVENLY_SWORD)
    if not v61 then
        return nil
    end
    local v62 = u7.Controllers.DefaultProjectileSourceController:getProjectileHandler() or u14.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 2, 0), 0, nil)
    u7.Controllers.DefaultProjectileSourceController:clearProjectileHandler()
    local v63 = nil
    local v64 = u27.LIGHT_SWORD_ATTACK
    local v65 = u19:getEntity(p58)
    if v65 ~= nil then
        v65 = v65:getInstance()
    end
    if v65 then
        local v66 = u21[u6.Controllers.KitSkinController:getKitSkin(v65)]
        if v66.lumen then
            v64 = v66.lumen.swordAttackSound
            v63 = v66.lumen.heavenlySwordWave
        end
        local v67 = p57.queueType ~= u20.OVERPOWERED and 1 or u23.SwordChargeTimeMultiplier
        if u22.MAX_CHARGE_TIME * v67 - (u22.MAX_CHARGE_TIME * v67 - u22.MIN_CHARGE_TIME * v67) / 2.5 <= p60 then
            v63 = u25.HEAVENLY_SWORD
            if v66.lumen then
                v63 = v66.lumen.heavenlySwordWave1
            end
        end
    end
    u4:playSound(v64)
    u7.Controllers.ProjectileController:launchProjectile(u25.HEAVENLY_SWORD, v63, v62, p59, v61.projectileSource)
end
function u28.fireMultiple(u68, u69, u70, _) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u25
        [3] = u19
        [4] = u7
        [5] = u14
        [6] = u6
        [7] = u21
        [8] = u12
        [9] = u1
        [10] = u27
        [11] = u4
    --]]
    local u71 = u24(u25.HEAVENLY_SWORD)
    local u72 = 0.3
    local u73 = nil
    local u74 = u19:getEntity(u69)
    if not u71 then
        return nil
    end
    local u75 = u7.Controllers.DefaultProjectileSourceController:getProjectileHandler() or u14.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0))
    local v76 = u19:getEntity(u69)
    if v76 ~= nil then
        v76 = v76:getInstance()
    end
    if v76 then
        local v77 = u21[u6.Controllers.KitSkinController:getKitSkin(v76)]
        if v77.lumen then
            u73 = v77.lumen.heavenlySwordWave
        end
    end
    u69:SetAttribute("IsCasting", u12:GetServerTimeNow() + 1.2)
    u68.multiShotMaid:GiveTask(function() --[[ Line: 265 ]]
        --[[
        Upvalues:
            [1] = u69
        --]]
        u69:SetAttribute("IsCasting", false)
    end)
    u7.Controllers.DefaultProjectileSourceController:clearProjectileHandler()
    u1.Promise.defer(function() --[[ Line: 270 ]]
        --[[
        Upvalues:
            [1] = u74
            [2] = u25
            [3] = u68
            [4] = u72
            [5] = u73
            [6] = u19
            [7] = u69
            [8] = u6
            [9] = u21
            [10] = u27
            [11] = u4
            [12] = u7
            [13] = u75
            [14] = u70
            [15] = u71
        --]]
        local v78 = false
        local v79 = 0
        while true do
            if v78 then
                v79 = v79 + 1
            else
                v78 = true
            end
            if v79 >= 4 then
                u68.multiShotMaid:DoCleaning()
                return
            end
            local v80 = u74
            if v80 ~= nil then
                v80 = v80:getItemInHand()
                if v80 ~= nil then
                    v80 = v80.Name
                end
            end
            if v80 ~= u25.HEAVENLY_SWORD then
                u68.multiShotMaid:DoCleaning()
                return nil
            end
            if v79 == 3 then
                u72 = u72 + 0.1
                u73 = u25.HEAVENLY_SWORD
                local v81 = u19:getEntity(u69)
                if v81 ~= nil then
                    v81 = v81:getInstance()
                end
                if v81 then
                    local v82 = u21[u6.Controllers.KitSkinController:getKitSkin(v81)]
                    if v82.lumen then
                        u73 = v82.lumen.heavenlySwordWave1
                    end
                end
            end
            local v83 = u27.LIGHT_SWORD_ATTACK
            local v84 = u19:getEntity(u69)
            if v84 ~= nil then
                v84 = v84:getInstance()
            end
            if v84 then
                local v85 = u21[u6.Controllers.KitSkinController:getKitSkin(v84)]
                if v85.lumen then
                    v83 = v85.lumen.swordAttackSound
                end
            end
            u4:playSound(v83)
            u7.Controllers.ProjectileController:launchProjectile(u25.HEAVENLY_SWORD, u73, u75, u70, u71.projectileSource)
            task.wait(u72)
        end
    end)
end
function u28.playAnimation(_, p86) --[[ Line: 331 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u17
    --]]
    local v87 = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(p86))
    if v87 ~= nil then
        v87:AdjustSpeed(1)
    end
end
function u28.playSound(p88) --[[ Line: 338 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u19
        [3] = u10
        [4] = u6
        [5] = u21
        [6] = u4
    --]]
    local v89 = u27.LIGHT_SWORD_CHARGE
    local v90 = u19:getEntity(u10.LocalPlayer)
    if v90 ~= nil then
        v90 = v90:getInstance()
    end
    if v90 then
        local v91 = u21[u6.Controllers.KitSkinController:getKitSkin(v90)]
        if v91.lumen then
            v89 = v91.lumen.swordChargeSound
        end
    end
    local u92 = u4:playSound(v89)
    if u92 then
        p88.animationMaid:GiveTask(function() --[[ Line: 354 ]]
            --[[
            Upvalues:
                [1] = u92
            --]]
            u92:Stop()
        end)
    end
end
function u28.playEffect(_, p93, p94) --[[ Line: 359 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u21
        [4] = u12
    --]]
    if not p93 then
        return nil
    end
    local v95 = u11.Assets.Effects.HeavenlySwordEffect
    local v96 = u21[u6.Controllers.KitSkinController:getKitSkin(p94)]
    if v96.lumen then
        v95 = v96.lumen.heavenlySwordEffect
    end
    local u97 = v95:Clone()
    u97:PivotTo(p93)
    u97.Parent = u12
    u97:PivotTo(p93 * CFrame.new(0, 0, -6))
    task.delay(0.15, function() --[[ Line: 376 ]]
        --[[
        Upvalues:
            [1] = u97
        --]]
        u97:Destroy()
    end)
end
u6.CreateController(u28.new())
return nil