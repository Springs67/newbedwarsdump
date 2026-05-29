local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "random-util").RandomUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Lighting
local u15 = v12.Players
local u16 = v12.ReplicatedStorage
local u17 = v12.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "gauntlets-util")
local u28 = v27.GAUNTLETS_ATTACK_COOLDOWN
local u29 = v27.GAUNTLETS_ATTACK_INDEX
local u30 = v27.GAUNTLETS_CHARGE_TIME
local u31 = v27.GAUNTLETS_COMBO_TOTAL
local u32 = v27.GauntletsUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u40 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
        return "GauntletsController"
    end,
    ["__index"] = u22
})
u40.__index = u40
function u40.new(...) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    local v41 = u40
    local v42 = setmetatable({}, v41)
    return v42:constructor(...) or v42
end
function u40.constructor(p43) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u10
        [3] = u34
    --]]
    u22.constructor(p43)
    p43.Name = "GauntletsController"
    p43.readyTime = -1
    p43.animationMaid = u10.new()
    p43.leftHandMap = {}
    p43.handsMap = {}
    p43.nonPunchableBlocks = {
        [u34.BED] = true,
        [u34.FLAG] = true,
        [u34.PINATA] = true,
        [u34.DAMAGE_BANNER] = true,
        [u34.DEFENSE_BANNER] = true,
        [u34.HEAL_BANNER] = true,
        [u34.FORGE] = true,
        [u34.ENCHANT_TABLE] = true,
        [u34.VENDING_MACHINE] = true,
        [u34.MERCHANT_REGION] = true,
        [u34.BEEHIVE] = true,
        [u34.PUMPKIN] = true,
        [u34.CARROT] = true,
        [u34.MELON] = true,
        [u34.BREWING_CAULDRON] = true,
        [u34.ALTAR_BLOCK_ONE] = true,
        [u34.ALTAR_BLOCK_TWO] = true,
        [u34.ALTAR_BLOCK_THREE] = true
    }
end
function u40.KnitStart(u44) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u8
        [3] = u23
        [4] = u37
        [5] = u6
        [6] = u31
        [7] = u36
        [8] = u15
        [9] = u32
        [10] = u19
        [11] = u17
        [12] = u28
        [13] = u35
        [14] = u30
        [15] = u4
        [16] = u24
        [17] = u18
        [18] = u9
        [19] = u26
        [20] = u34
        [21] = u25
        [22] = u5
    --]]
    u22.KnitStart(u44)
    u8.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u23.GAUNTLETS_JAB,
            u23.GAUNTLETS_CROSS,
            u23.GAUNTLETS_HOOK,
            u23.GAUNTLETS_UPPERCUT,
            u23.GAUNTLETS_SUPER_PUNCH,
            u23.GAUNTLETS_CHARGE_SUPER_PUNCH,
            u23.GAUNTLETS_IDLE,
            u23.GAUNTLETS_JAB_1ST,
            u23.GAUNTLETS_CROSS_1ST,
            u23.GAUNTLETS_HOOK_1ST,
            u23.GAUNTLETS_UPPERCUT_1ST,
            u23.GAUNTLETS_SUPER_PUNCH_1ST,
            u23.GAUNTLETS_CHARGE_SUPER_PUNCH_1ST,
            u23.GAUNTLETS_IDLE_1ST
        },
        ["sounds"] = {
            u37.GAUNTLETS_JAB_IMPACT_1,
            u37.GAUNTLETS_JAB_IMPACT_2,
            u37.GAUNTLETS_JAB_IMPACT_3,
            u37.GAUNTLETS_JAB_IMPACT_4,
            u37.GAUNTLETS_CROSS_IMPACT_1,
            u37.GAUNTLETS_CROSS_IMPACT_2,
            u37.GAUNTLETS_CROSS_IMPACT_3,
            u37.GAUNTLETS_CROSS_IMPACT_4,
            u37.GAUNTLETS_HOOK_IMPACT_1,
            u37.GAUNTLETS_HOOK_IMPACT_2,
            u37.GAUNTLETS_HOOK_IMPACT_3,
            u37.GAUNTLETS_HOOK_IMPACT_4,
            u37.GAUNTLETS_UPPERCUT_IMPACT_1,
            u37.GAUNTLETS_UPPERCUT_IMPACT_2,
            u37.GAUNTLETS_UPPERCUT_IMPACT_3,
            u37.GAUNTLETS_UPPERCUT_IMPACT_4,
            u37.GAUNTLETS_JAB_SWING_1,
            u37.GAUNTLETS_JAB_SWING_2,
            u37.GAUNTLETS_JAB_SWING_3,
            u37.GAUNTLETS_JAB_SWING_4,
            u37.GAUNTLETS_CROSS_SWING_1,
            u37.GAUNTLETS_CROSS_SWING_2,
            u37.GAUNTLETS_CROSS_SWING_3,
            u37.GAUNTLETS_CROSS_SWING_4,
            u37.GAUNTLETS_HOOK_SWING_1,
            u37.GAUNTLETS_HOOK_SWING_2,
            u37.GAUNTLETS_HOOK_SWING_3,
            u37.GAUNTLETS_HOOK_SWING_4,
            u37.GAUNTLETS_UPPERCUT_SWING_1,
            u37.GAUNTLETS_UPPERCUT_SWING_2,
            u37.GAUNTLETS_UPPERCUT_SWING_3,
            u37.GAUNTLETS_UPPERCUT_SWING_4,
            u37.GAUNTLETS_CHARGE_PUNCH_IMPACT,
            u37.GAUNTLETS_CHARGE_PUNCH_SWING,
            u37.GAUNTLETS_CHARGE_PUNCH_CHARGE,
            u37.GAUNTLETS_CHARGING_LOOP,
            u37.GAUNTLETS_COMBO_ACTIVATE
        }
    })
    u6(function(u45, _, p46) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u44
        --]]
        local function u48() --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u45
                [2] = u31
                [3] = u44
            --]]
            local v47 = u45:GetAttribute(u31)
            if v47 ~= 0 and (v47 == v47 and v47) then
                v47 = v47 >= 10
            end
            if v47 == 0 or (v47 ~= v47 or not v47) then
                u44:enableComboParticles(u45, false)
            else
                u44:enableComboParticles(u45, true)
            end
        end
        p46:GiveTask(u45:GetAttributeChangedSignal(u31):Connect(function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            u48()
        end))
        p46:GiveTask(function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u45
            --]]
            return u44:enableComboParticles(u45, false)
        end)
        u48()
    end)
    u36.HandItemRendered:connect(function(p49) --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u32
            [3] = u44
        --]]
        local v50 = u15:GetPlayerFromCharacter(p49.entity)
        if not v50 or v50 == u15.LocalPlayer then
            return nil
        end
        if not u32:hasGauntletsEquipped(v50) then
            return nil
        end
        u44:equipLeftHand(v50)
    end)
    u19.SwordSwing:connect(function(p51) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u17
            [3] = u32
            [4] = u15
            [5] = u28
        --]]
        if p51:isCancelled() then
            return nil
        end
        if u44.readyTime > u17:GetServerTimeNow() then
            return nil
        end
        if not u32:hasGauntletsEquipped(u15.LocalPlayer) then
            return nil
        end
        if p51.chargedAttack and p51.chargedAttack.chargeRatio >= 1 then
            p51:setCancelled(true)
            return nil
        end
        u44.readyTime = u17:GetServerTimeNow() + u28
        u44:playAttackSequenceLocalAnimation()
        if p51.targetEntity == nil then
            u44:playLocalSwingSound()
        end
    end)
    u35.Client:OnEvent("GauntletsAttack", function(p52) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44:playImpactSound(p52.player, p52.index)
    end)
    u19.SwordChargedSwing:connect(function(u53) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u32
            [3] = u4
            [4] = u24
            [5] = u23
            [6] = u44
            [7] = u15
            [8] = u18
            [9] = u9
            [10] = u17
            [11] = u26
            [12] = u8
            [13] = u35
        --]]
        if not u53.chargedAttack then
            return nil
        end
        if u53.chargedAttack.chargeTime < u30 then
            return nil
        end
        local v54 = u53.fromPlayer.Character
        if v54 ~= nil then
            v54 = v54.PrimaryPart
        end
        if not v54 then
            return nil
        end
        if not u32:hasGauntletsEquipped(u53.fromPlayer, true) then
            return nil
        end
        local u55 = u4:playAnimation(u53.fromPlayer, u24:getAssetId(u23.GAUNTLETS_SUPER_PUNCH))
        u55:GetMarkerReachedSignal("impact"):Connect(function() --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u53
                [3] = u55
            --]]
            u44:playImpactEffect(u53.fromPlayer)
            local u56 = u55.Speed
            u55:AdjustSpeed(0.02)
            task.delay(0.08, function() --[[ Line: 176 ]]
                --[[
                Upvalues:
                    [1] = u55
                    [2] = u56
                --]]
                u55:AdjustSpeed(u56)
            end)
        end)
        if u53.fromPlayer == u15.LocalPlayer then
            u18(0.24, u9, function(p57) --[[ Line: 181 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u17
                --]]
                local v58 = u53.fromPlayer.Character
                if v58 ~= nil then
                    v58 = v58.PrimaryPart
                end
                if not v58 then
                    return nil
                end
                local v59 = u17.CurrentCamera
                if v59 ~= nil then
                    v59 = v59.CFrame.LookVector
                end
                if not v59 then
                    return nil
                end
                local v60 = CFrame.new(u53.fromPlayer.Character:GetPivot().Position) * CFrame.lookAt(Vector3.new(0, 0, 0), v59)
                u53.fromPlayer.Character:PivotTo(u53.fromPlayer.Character:GetPivot():Lerp(v60, p57))
            end)
        end
        task.delay(0, function() --[[ Line: 205 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u17
                [3] = u32
                [4] = u44
                [5] = u15
                [6] = u26
                [7] = u8
                [8] = u23
                [9] = u35
            --]]
            local v61 = u53.fromPlayer.Character
            if v61 ~= nil then
                v61 = v61.PrimaryPart
            end
            if not v61 then
                return nil
            end
            local v62 = u17.CurrentCamera
            if v62 ~= nil then
                v62 = v62.CFrame.LookVector
            end
            if not v62 then
                return nil
            end
            local v63 = u53.fromPlayer.Character.PrimaryPart:GetPivot()
            local v64 = u32:getRegionInFrontOfPlayer(u53.fromPlayer.Character, v63.Position, v62)
            if not v64 then
                return nil
            end
            for _, v65 in u44:predictDamagedBlocks(u53.fromPlayer, v64) do
                u44:addCrackToBlock(u44:calculateNormalId(v63.Position, v65.blockPosition), v65)
            end
            if u53.fromPlayer == u15.LocalPlayer then
                local v66 = u15.LocalPlayer.Character
                if v66 ~= nil then
                    v66 = v66.PrimaryPart
                end
                if not v66 then
                    return nil
                end
                if not u26:getEntity(u15.LocalPlayer) then
                    return nil
                end
                if not u32:hasGauntletsEquipped(u15.LocalPlayer, true) then
                    return nil
                end
                u8.Controllers.ViewmodelController:playAnimation(u23.GAUNTLETS_SUPER_PUNCH_1ST)
                u35.Client:Get("RequestGauntletsChargedAttack"):SendToServer({
                    ["blockDestroyTime"] = u17:GetServerTimeNow() + 0.5,
                    ["unitLookVector"] = v62
                })
            end
        end)
    end)
    u19.SwordCharge:connect(function(p67) --[[ Line: 256 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u26
            [3] = u15
            [4] = u8
            [5] = u25
            [6] = u17
            [7] = u44
            [8] = u30
            [9] = u5
            [10] = u37
            [11] = u24
            [12] = u23
        --]]
        if p67.itemType ~= u34.MYTHIC_GAUNTLETS then
            return nil
        end
        if p67:isCancelled() then
            return nil
        end
        local u68 = u26:getEntity(u15.LocalPlayer)
        if u68 ~= nil then
            u68 = u68:getHandItemInstanceFromCharacter()
        end
        if not u68 or u68.Name ~= u34.MYTHIC_GAUNTLETS then
            return nil
        end
        local v69 = u8.Controllers.ViewmodelController:getViewModel()
        if v69 ~= nil then
            v69 = v69:WaitForChild(u34.MYTHIC_GAUNTLETS, 1)
        end
        if not v69 then
            return nil
        end
        local u70 = nil
        local u71 = nil
        local v72 = p67.chargeState
        if v72 ~= u25.Charged then
            if v72 == u25.Charging then
                local u73 = u17:GetServerTimeNow()
                u44.chargingStartTime = u73
                task.delay(u30, function() --[[ Line: 290 ]]
                    --[[
                    Upvalues:
                        [1] = u73
                        [2] = u44
                        [3] = u68
                    --]]
                    if u73 == u44.chargingStartTime then
                        u68.Handle.Effect.Attachment.Pulse.Enabled = true
                    end
                end)
                task.delay(0.2, function() --[[ Line: 295 ]]
                    --[[
                    Upvalues:
                        [1] = u73
                        [2] = u44
                        [3] = u15
                        [4] = u5
                        [5] = u37
                        [6] = u68
                        [7] = u70
                        [8] = u24
                        [9] = u23
                        [10] = u71
                        [11] = u8
                    --]]
                    if u73 ~= u44.chargingStartTime then
                        return nil
                    end
                    local v74 = u15.LocalPlayer.Character
                    if v74 ~= nil then
                        v74 = v74:FindFirstChild("Humanoid")
                        if v74 ~= nil then
                            v74 = v74:FindFirstChild("Animator")
                        end
                    end
                    if not v74 then
                        return nil
                    end
                    u5:playSound(u37.GAUNTLETS_CHARGE_PUNCH_CHARGE, {
                        ["volumeMultiplier"] = 1.1,
                        ["playbackSpeedMultiplier"] = 1.25
                    })
                    u44:setEffectEnabled(u68, true)
                    u70 = v74:LoadAnimation(u24:getAnimation(u23.GAUNTLETS_CHARGE_SUPER_PUNCH))
                    u70:Play()
                    u70:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 318 ]]
                        --[[
                        Upvalues:
                            [1] = u70
                        --]]
                        local v75 = u70
                        if v75 ~= nil then
                            v75:AdjustSpeed(0)
                        end
                    end)
                    u71 = u8.Controllers.ViewmodelController:playAnimation(u23.GAUNTLETS_CHARGE_SUPER_PUNCH_1ST)
                    if u71 then
                        u71:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 327 ]]
                            --[[
                            Upvalues:
                                [1] = u71
                            --]]
                            local v76 = u71
                            if v76 ~= nil then
                                v76:AdjustSpeed(0)
                            end
                        end)
                    end
                end)
                u44.animationMaid:GiveTask(function() --[[ Line: 335 ]]
                    --[[
                    Upvalues:
                        [1] = u70
                        [2] = u71
                        [3] = u44
                        [4] = u68
                    --]]
                    local v77 = u70
                    if v77 ~= nil then
                        v77:Stop()
                    end
                    local v78 = u70
                    if v78 ~= nil then
                        v78:Destroy()
                    end
                    local v79 = u71
                    if v79 ~= nil then
                        v79:Stop()
                    end
                    local v80 = u71
                    if v80 ~= nil then
                        v80:Destroy()
                    end
                    u44:setEffectEnabled(u68, false)
                    u68.Handle.Effect.Attachment.Pulse.Enabled = false
                end)
            elseif v72 == u25.Idle then
                u44.chargingStartTime = nil
                u44.animationMaid:DoCleaning()
            end
        end
    end)
end
function u40.enableComboParticles(p81, p82, p83) --[[ Line: 365 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u26
        [3] = u8
        [4] = u32
        [5] = u13
    --]]
    local v84 = p82 == u15.LocalPlayer
    local v85 = u26:getEntity(p82)
    if not v85 then
        return nil
    end
    if u8.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and p83 then
        return nil
    end
    local v86 = v85:getHandItemInstanceFromCharacter()
    if not (v86 and u32:hasGauntletsEquipped(p82)) then
        return nil
    end
    local v87 = v86:WaitForChild("Handle"):WaitForChild("ComboAttachment"):WaitForChild("Fire")
    if not v87 then
        return nil
    end
    if v84 then
        u13:AddTag(v87, "FirstPersonHidden")
    end
    v87.Enabled = p83
    local v88 = p81.handsMap[v86]
    if not v88 then
        return nil
    end
    local v89 = v88:WaitForChild("Handle"):WaitForChild("ComboAttachment"):WaitForChild("Fire")
    if not v89 then
        return nil
    end
    if v84 then
        u13:AddTag(v89, "FirstPersonHidden")
    end
    v89.Enabled = p83
end
function u40.predictDamagedBlocks(u90, u91, p92) --[[ Line: 403 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u33
    --]]
    local v93 = u2:getStore():getBlocksInRegion3(p92)
    local u94 = {}
    local u95 = {}
    local function v111(p96) --[[ Line: 407 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u2
            [3] = u90
            [4] = u91
            [5] = u95
            [6] = u94
        --]]
        local v97 = p96.Name
        local v98 = u33(v97)
        local v99 = v98.block
        if v99 ~= nil then
            v99 = v99.unbreakable
        end
        if not v99 then
            v99 = v98.block
            if v99 ~= nil then
                v99 = v99.unbreakableByTeammates
            end
            if not v99 then
                v99 = v98.block
                if v99 ~= nil then
                    v99 = v99.breakableOnlyByOwner
                end
            end
        end
        if v99 then
            return nil
        else
            local v100 = p96:GetAttribute("Health")
            local v101 = p96:GetAttribute("Data")
            local v102 = v101 == nil and 0 or v101
            local v103 = {
                ["blockPosition"] = u2:getBlockPosition(p96.Position)
            }
            if u90.nonPunchableBlocks[v97] == nil and u2:isBlockBreakable(v103, u91) then
                local v104 = u95
                local v105 = {
                    ["blockPosition"] = v103.blockPosition,
                    ["blockType"] = v97,
                    ["blockData"] = v102
                }
                table.insert(v104, v105)
                if v100 <= 30 then
                    local v106 = u94
                    local v107 = {
                        ["blockPosition"] = v103.blockPosition,
                        ["blockType"] = v97,
                        ["blockData"] = v102
                    }
                    table.insert(v106, v107)
                    return
                else
                    local v108 = p96:GetAttribute("Health")
                    if v108 == nil then
                        return nil
                    elseif v108 - 29 <= 0 then
                        local v109 = u94
                        local v110 = {
                            ["blockPosition"] = v103.blockPosition,
                            ["blockType"] = v97,
                            ["blockData"] = v102
                        }
                        table.insert(v109, v110)
                    end
                end
            else
                return nil
            end
        end
    end
    for v112 in v93 do
        v111(v112, v112, v93)
    end
    return u95
end
function u40.playImpactEffect(_, p113) --[[ Line: 483 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u5
        [3] = u37
        [4] = u20
        [5] = u11
        [6] = u14
        [7] = u18
        [8] = u9
        [9] = u17
    --]]
    local v114 = p113 == u15.LocalPlayer
    local v115 = p113.Character
    if v115 ~= nil then
        v115 = v115:GetPivot()
    end
    if not v115 then
        return nil
    end
    local v116 = u5
    local v117 = u37.GAUNTLETS_CHARGE_PUNCH_IMPACT
    local v118 = {
        ["rollOffMaxDistance"] = 100,
        ["rollOffMinDistance"] = 40,
        ["volumeMultiplier"] = 1.25
    }
    local v119
    if v114 then
        v119 = nil
    else
        v119 = v115.Position
    end
    v118.position = v119
    v116:playSound(v117, v118)
    if v114 then
        u20.shakeScreenDirection(Vector2.new(-0.2, 1), {
            ["magnitude"] = 0.75,
            ["duration"] = 0.25,
            ["cycles"] = 2
        })
        local u120 = u11("DepthOfFieldEffect", {
            ["Name"] = "GauntletsDepthOfField",
            ["InFocusRadius"] = 20,
            ["FocusDistance"] = 0,
            ["FarIntensity"] = 0,
            ["Parent"] = u14
        })
        local u122 = u18(0.14, u9, function(p121) --[[ Line: 512 ]]
            --[[
            Upvalues:
                [1] = u120
            --]]
            u120.FarIntensity = (math.sqrt(p121) - p121) / 1.2 * 0.8
        end)
        task.spawn(function() --[[ Line: 516 ]]
            --[[
            Upvalues:
                [1] = u122
                [2] = u120
            --]]
            u122:Wait()
            u120:Destroy()
        end)
    end
    local u123 = u11("Part", {
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["CFrame"] = v115 + v115.LookVector.Unit * 5,
        ["Parent"] = u17
    })
    local u124 = u11("PointLight", {
        ["Name"] = "GauntletsPunchPointLight",
        ["Range"] = 12,
        ["Brightness"] = 0,
        ["Color"] = Color3.fromRGB(240, 26, 69),
        ["Parent"] = u123
    })
    local u126 = u18(0.24, u9, function(p125) --[[ Line: 539 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        u124.Brightness = (math.sqrt(p125) - p125) / 1.2 * 4 * 8
    end)
    task.spawn(function() --[[ Line: 543 ]]
        --[[
        Upvalues:
            [1] = u126
            [2] = u124
            [3] = u123
        --]]
        u126:Wait()
        u124.Brightness = 0
        u124.Enabled = false
        u123:Destroy()
    end)
end
function u40.playImpactSound(_, p127, p128) --[[ Line: 550 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u7
        [3] = u15
        [4] = u5
    --]]
    local v129 = p127.Character
    if v129 ~= nil then
        v129 = v129.PrimaryPart
        if v129 ~= nil then
            v129 = v129.Position
        end
    end
    if v129 then
        local v130 = u32:getAnimation(p128)
        if v130 ~= nil then
            v130 = v130.impactSound
        end
        if v130 and #v130 ~= 0 then
            local v131 = u7.fromList(unpack(v130))
            if v131 == "" or not v131 then
                return nil
            elseif p127 == u15.LocalPlayer then
                u5:playSound(v131, {
                    ["volumeMultiplier"] = 0.85
                })
            else
                u5:playSound(v131, {
                    ["rollOffMaxDistance"] = 25,
                    ["volumeMultiplier"] = 0.85,
                    ["position"] = v129
                })
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u40.playLocalSwingSound(_) --[[ Line: 586 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u29
        [3] = u32
        [4] = u7
        [5] = u5
    --]]
    local v132 = u15.LocalPlayer:GetAttribute(u29)
    local v133 = u32:getAnimation((v132 == nil and 0 or v132) % #u32:getGauntletsAttackSequence())
    if v133 ~= nil then
        v133 = v133.swingSound
    end
    if not v133 or #v133 == 0 then
        return nil
    end
    u5:playSound(u7.fromList(unpack(v133)), {
        ["volumeMultiplier"] = 1
    })
end
function u40.playAttackSequenceLocalAnimation(_) --[[ Line: 606 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u29
        [3] = u32
        [4] = u8
        [5] = u4
        [6] = u24
        [7] = u33
        [8] = u34
    --]]
    local v134 = u15.LocalPlayer:GetAttribute(u29)
    local v135 = u32:getAnimation((v134 == nil and 0 or v134) % #u32:getGauntletsAttackSequence())
    if not v135 then
        return nil
    end
    local v136 = v135.fpAnimation
    if v136 ~= 0 and (v136 == v136 and v136) then
        u8.Controllers.ViewmodelController:playAnimation(v135.fpAnimation)
    end
    local v137 = u4:playAnimation(u15.LocalPlayer, u24:getAssetId(v135.animation))
    local v138 = u33(u34.WOOD_GAUNTLETS).sword
    if v138 ~= nil then
        v138 = v138.attackSpeed
    end
    local v139
    if v137 == nil then
        v139 = v137
    else
        v139 = v137.Length
    end
    local v140
    if v139 == 0 or v139 ~= v139 then
        v140 = v139
    elseif v139 then
        v140 = v138
    else
        v140 = v139
    end
    if v140 ~= 0 and (v140 == v140 and (v140 and v137 ~= nil)) then
        v137:AdjustSpeed(v139 / v138)
    end
end
function u40.equipLeftHand(u141, p142) --[[ Line: 643 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u32
        [3] = u16
        [4] = u39
        [5] = u15
        [6] = u34
    --]]
    local v143 = u26:getEntity(p142)
    if not v143 then
        return nil
    end
    local u144 = v143:getHandItemInstanceFromCharacter()
    if not (u144 and u32:hasGauntletsEquipped(p142)) then
        return nil
    end
    local v145 = p142.Character
    if not v145 then
        return nil
    end
    local u146 = u16.Assets.GauntletsModels:FindFirstChild(u144.Name .. "_left")
    if u146 ~= nil then
        u146 = u146:Clone()
    end
    if not u146 then
        return nil
    end
    u146.Parent = v145
    u39:weldCharacterAccessories(v145)
    u141.leftHandMap[u15.LocalPlayer] = u146
    u141.handsMap[u144] = u146
    u141:enableComboParticles(p142, false)
    if u144.Name == u34.MYTHIC_GAUNTLETS then
        u141:setEffectEnabled(u144, false)
    end
    for v147, v148 in u146:GetDescendants() do
        local _ = v147 - 1
        v148:SetAttribute("VisibleInViewmodel", true)
    end
    u144.Destroying:Connect(function() --[[ Line: 681 ]]
        --[[
        Upvalues:
            [1] = u146
            [2] = u141
            [3] = u144
        --]]
        local v149 = u146
        if v149 ~= nil then
            v149:Destroy()
        end
        u141.handsMap[u144] = nil
    end)
end
function u40.calculateNormalId(_, p150, p151) --[[ Line: 689 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v152 = (p150 - u2:getWorldPosition(p151)).Unit
    local v153 = Enum.NormalId.Right
    local v154 = 1.1
    local v155 = 1.1
    for _, v156 in Enum.NormalId:GetEnumItems() do
        if v156 ~= Enum.NormalId.Top and v156 ~= Enum.NormalId.Bottom then
            local v157 = Vector3.FromNormalId(v156) - v152
            local v158 = v157.X
            if math.abs(v158) < v154 then
                local v159 = v157.Z
                if math.abs(v159) < v155 then
                    local v160 = v157.X
                    v154 = math.abs(v160)
                    local v161 = v157.Z
                    v155 = math.abs(v161)
                    v153 = v156
                end
            end
        end
    end
    return v153
end
function u40.addCrackToBlock(_, p162, p163) --[[ Line: 710 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u2
        [3] = u38
        [4] = u18
        [5] = u9
    --]]
    local u164 = u16.Assets.Effects.GauntletsPunchCrack:Clone()
    u164.Crack.SurfaceGui.Face = p162
    local v165 = u2:getWorldPosition(p163.blockPosition)
    local v166 = u2:getStore():getBlockAt(p163.blockPosition)
    if not v166 then
        return nil
    end
    u164:PivotTo(CFrame.new(v165))
    u164.Parent = v166
    u38:playEffects({ u164 }, nil)
    task.delay(0.1, function() --[[ Line: 721 ]]
        --[[
        Upvalues:
            [1] = u164
            [2] = u18
            [3] = u9
        --]]
        local u167 = u164.Crack.SurfaceGui.ImageLabel
        local u168 = u164.Crack.SurfaceGui.Brightness
        u18(0.2, u9, function(p169) --[[ Line: 724 ]]
            --[[
            Upvalues:
                [1] = u164
                [2] = u168
                [3] = u167
            --]]
            u164.Crack.SurfaceGui.Brightness = u168 * (1 - p169)
            u167.ImageTransparency = 0.4 + p169 * 0.6
        end):Wait()
        task.delay(0.5, function() --[[ Line: 729 ]]
            --[[
            Upvalues:
                [1] = u164
            --]]
            u164:Destroy()
        end)
    end)
end
function u40.setEffectEnabled(_, p170, p171) --[[ Line: 734 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if not p170.Handle then
        return nil
    end
    if u8.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and p171 then
        return nil
    end
    p170.Handle.Effect.Attachment.Ball.Enabled = p171
    p170.Handle.Effect.Attachment.Waves.Enabled = p171
    p170.Handle.Effect.Bits.Enabled = p171
    p170.Handle.Effect.Charge.Enabled = p171
    p170.Handle.Effect.SmallCharge.Enabled = p171
    p170.Handle.Effect.Trail.Enabled = p171
    if not p171 then
        p170.Handle.Effect.Attachment.Pulse.Enabled = p171
    end
end
function u40.isRelevantItem(_, p172) --[[ Line: 752 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    return u32:isGauntlets(p172.itemType)
end
function u40.onEnable(p173, _, _) --[[ Line: 755 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u21
    --]]
    p173:equipLeftHand(u15.LocalPlayer)
    u8.Controllers.ViewmodelController:setViewModelMode(u21.SHOW_ARMS)
end
function u40.onDisable(p174) --[[ Line: 759 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u21
    --]]
    local v175 = p174.leftHandMap[u15.LocalPlayer]
    if v175 ~= nil then
        v175:Destroy()
    end
    p174.leftHandMap[u15.LocalPlayer] = nil
    u8.Controllers.ViewmodelController:setViewModelMode(u21.DEFAULT)
end
u8.CreateController(u40.new())
return nil