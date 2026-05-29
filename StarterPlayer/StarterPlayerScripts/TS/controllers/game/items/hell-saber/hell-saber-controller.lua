local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "HellSaberController"
    end,
    ["__index"] = u16
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
    --]]
    u16.constructor(p30)
    p30.Name = "HellSaberController"
    p30.animationMaid = u8.new()
end
function u27.KnitStart(u31) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
        [3] = u23
        [4] = u17
        [5] = u25
        [6] = u24
        [7] = u15
        [8] = u14
        [9] = u11
        [10] = u1
        [11] = u20
        [12] = u19
        [13] = u22
        [14] = u18
    --]]
    u16.KnitStart(u31)
    u5.Controllers.PreloadController:preloadForItemType(u23.INFERNAL_SABER, {
        ["animations"] = { u17.INFERNO_SWORD_CHARGE },
        ["sounds"] = { u25.INFERNAL_SWORD_CHARGE }
    })
    u24.Client:Get("HellBladeSpinEffect"):Connect(function(p32) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:playEffects(p32.player)
    end)
    u15.SwordChargedSwing:connect(function(u33) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u14
            [3] = u11
            [4] = u24
            [5] = u5
            [6] = u17
            [7] = u1
            [8] = u20
        --]]
        if u33.weapon.Name ~= u23.INFERNAL_SABER then
            return nil
        end
        if u33.chargedAttack.chargeTime >= 0.5 then
            local u34 = u14:GetServerTimeNow() + 0.25
            u11.LocalPlayer:SetAttribute("IsCasting", u34)
            task.delay(0.25, function() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u34
                --]]
                if u11.LocalPlayer:GetAttribute("IsCasting") == u34 then
                    return u11.LocalPlayer:SetAttribute("IsCasting", false)
                end
            end)
            u24.Client:Get("HellBladeRelease"):SendToServer({
                ["chargeTime"] = u33.chargedAttack.chargeTime,
                ["player"] = u33.fromPlayer,
                ["weapon"] = u33.weapon
            })
            u5.Controllers.ViewmodelController:playAnimation(u17.FP_INFERNO_SWORD_SPIN)
            local v35
            if u33.chargedAttack.chargeTime >= 1.5 then
                v35 = u33.fromPlayer:GetAttribute("EmberUpgraded")
            else
                v35 = false
            end
            if v35 ~= 0 and (v35 == v35 and (v35 ~= "" and v35)) then
                task.wait(0.2)
                u1.Promise.defer(function() --[[ Line: 77 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u33
                        [3] = u23
                        [4] = u5
                        [5] = u17
                    --]]
                    local v36 = false
                    local v37 = 0
                    while true do
                        if v36 then
                            v37 = v37 + 1
                        else
                            v36 = true
                        end
                        if v37 >= 3 then
                            return
                        end
                        local v38 = u20:getEntity(u33.fromPlayer)
                        if v38 ~= nil then
                            v38 = v38:getItemInHand()
                            if v38 ~= nil then
                                v38 = v38.Name
                            end
                        end
                        if v38 ~= u23.INFERNAL_SABER then
                            return nil
                        end
                        task.wait(0.3)
                        u5.Controllers.ViewmodelController:playAnimation(u17.FP_INFERNO_SWORD_SPIN)
                    end
                end)
            end
        end
    end)
    local u39 = nil
    local u40 = nil
    u15.SwordCharge:connect(function(p41) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u31
            [3] = u19
            [4] = u11
            [5] = u22
            [6] = u39
            [7] = u18
            [8] = u17
            [9] = u40
            [10] = u5
        --]]
        if p41.itemType ~= u23.INFERNAL_SABER then
            return nil
        end
        local v42 = u31.chargingSound
        if v42 ~= nil then
            v42:Stop()
        end
        if p41.chargeState == u19.Charging then
            local v43 = u11.LocalPlayer.Character
            if v43 ~= nil then
                v43 = v43:FindFirstChild("Humanoid")
                if v43 ~= nil then
                    v43 = v43:FindFirstChild("Animator")
                end
            end
            if not v43 then
                return nil
            end
            local v44 = u22(p41.itemType).sword
            if v44 ~= nil then
                v44 = v44.chargedAttack
            end
            if not v44 then
                return nil
            end
            u31:playChargeSound(u11.LocalPlayer.Character)
            u39 = v43:LoadAnimation(u18:getAnimation(u17.INFERNO_SWORD_CHARGE))
            u39:Play()
            u39:AdjustSpeed(1.83)
            u39:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                local v45 = u39
                if v45 ~= nil then
                    v45:AdjustSpeed(0)
                end
            end)
            u40 = u5.Controllers.ViewmodelController:playAnimation(u17.FP_INFERNO_SWORD_CHARGE)
            if u40 then
                u40:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 153 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                    --]]
                    local v46 = u40
                    if v46 ~= nil then
                        v46:AdjustSpeed(0)
                    end
                end)
            end
            u31.animationMaid:GiveTask(function() --[[ Line: 160 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u40
                --]]
                local v47 = u39
                if v47 ~= nil then
                    v47:Stop()
                end
                local v48 = u39
                if v48 ~= nil then
                    v48:Destroy()
                end
                local v49 = u40
                if v49 ~= nil then
                    v49:Stop()
                end
                local v50 = u40
                if v50 ~= nil then
                    v50:Destroy()
                end
            end)
        elseif p41.chargeState == u19.Charged then
            local v51 = u31.chargingSound
            if v51 ~= nil then
                v51:Stop()
            end
        end
        if p41.chargeState == u19.Idle then
            local v52 = u39
            if v52 ~= nil then
                v52:Stop()
            end
            local v53 = u39
            if v53 ~= nil then
                v53:Destroy()
            end
            local v54 = u40
            if v54 ~= nil then
                v54:Stop()
            end
            local v55 = u40
            if v55 ~= nil then
                v55:Destroy()
            end
            u31.animationMaid:DoCleaning()
        end
    end)
end
function u27.isRelevantItem(_, p56) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p56.itemType == u23.INFERNAL_SABER
end
function u27.onEnable(_, _) --[[ Line: 208 ]] end
function u27.onDisable(_) --[[ Line: 210 ]] end
function u27.playChargeSound(u57, p58) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u5
        [3] = u21
        [4] = u4
    --]]
    local v59 = u25.INFERNAL_SWORD_CHARGE
    local v60 = u21[u5.Controllers.KitSkinController:getKitSkin(p58)]
    if v60.ember then
        v59 = v60.ember.swordChargeSound
    end
    u57.chargingSound = u4:playSound(v59)
    if u57.chargingSound then
        u57.animationMaid:GiveTask(function() --[[ Line: 221 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            local v61 = u57.chargingSound
            if v61 ~= nil then
                v61:Stop()
            end
        end)
    end
end
function u27.playEffects(u62, p63) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u8
        [3] = u12
        [4] = u9
        [5] = u5
        [6] = u21
        [7] = u14
        [8] = u3
        [9] = u26
        [10] = u6
        [11] = u13
        [12] = u7
    --]]
    local u64 = u20:getEntity(p63)
    if u64 == nil then
        return nil
    end
    local u65 = u8.new()
    local u66 = u12.Assets.Effects.InfernalSwordSpin:Clone()
    u66:PivotTo(u64:getInstance():GetPrimaryPartCFrame())
    u9(u66, 0.04)
    local v67 = u21[u5.Controllers.KitSkinController:getKitSkin(u64:getInstance())]
    local v68 = v67.ember
    if v68 ~= nil then
        v68 = v68.spinEffectColors
    end
    if v68 then
        local v69 = v67.ember
        if v69 ~= nil then
            v69 = v69.spinEffectColors.ring1
        end
        if v69 then
            local v70 = v67.ember
            if v70 ~= nil then
                v70 = v70.spinEffectColors.ring1
            end
            u66["ring.001"].Color = v70
        end
        local v71 = v67.ember
        if v71 ~= nil then
            v71 = v71.spinEffectColors.ring2
        end
        if v71 then
            local v72 = v67.ember
            if v72 ~= nil then
                v72 = v72.spinEffectColors.ring2
            end
            u66["ring.002"].Color = v72
        end
        local v73 = v67.ember
        if v73 ~= nil then
            v73 = v73.spinEffectColors.ring3
        end
        if v73 then
            local v74 = v67.ember
            if v74 ~= nil then
                v74 = v74.spinEffectColors.ring3
            end
            u66["ring.003"].Color = v74
        end
    end
    u66.Parent = u14
    for _, v75 in u66:GetChildren() do
        if v75:IsA("BasePart") then
            u3:setQueryIgnored(v75, true)
        end
    end
    u26.tweenModelSize(u66, 0, u6, 10)
    local u76 = 0
    local u78 = u13.Heartbeat:Connect(function(p77) --[[ Line: 287 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u62
            [3] = u65
            [4] = u76
            [5] = u66
            [6] = u7
        --]]
        u64:getInstance():GetPrimaryPartCFrame()
        if not u62:validPlayerConditions(u64) then
            u65:DoCleaning()
            return nil
        end
        u76 = u76 + p77
        if u66.PrimaryPart == nil then
            u7.Error("Shield effect has no primary part")
            return nil
        end
    end)
    task.delay(0.1, function() --[[ Line: 299 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u78
            [3] = u66
        --]]
        u65:DoCleaning()
        u78:Disconnect()
        u66:Destroy()
        return nil
    end)
end
function u27.validPlayerConditions(_, p79) --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    if p79:isAlive() then
        local v80 = p79:getItemInHand()
        if v80 ~= nil then
            v80 = v80.Name
        end
        if v80 == u23.INFERNAL_SABER then
            return p79:getInstance().PrimaryPart ~= nil
        else
            return false
        end
    else
        return false
    end
end
u5.CreateController(u27.new())
return nil