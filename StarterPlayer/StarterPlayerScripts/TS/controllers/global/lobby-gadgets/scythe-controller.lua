local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "random-util").RandomUtil
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.StarterPlayer
local u14 = v11.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "scythe-util").ScytheUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "ScytheController"
    end,
    ["__index"] = u16
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
    --]]
    u16.constructor(p34)
    p34.Name = "ScytheController"
    p34.transparencyModifier = {
        ["transparency"] = 0.75
    }
    p34.readyTime = -1
    p34.animationMaid = u10.new()
end
function u31.KnitStart(u35) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u18
        [4] = u28
        [5] = u15
        [6] = u14
        [7] = u23
        [8] = u24
        [9] = u12
        [10] = u22
        [11] = u30
        [12] = u29
        [13] = u27
        [14] = u4
        [15] = u19
        [16] = u5
        [17] = u6
        [18] = u20
        [19] = u9
        [20] = u13
        [21] = u25
        [22] = u21
    --]]
    u16.KnitStart(u35)
    u8.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u18.SCYTHE_SLASH_1,
            u18.SCYTHE_SLASH_2,
            u18.SCYTHE_SLASH_1_FP,
            u18.SCYTHE_SLASH_2_FP,
            u18.SCYTHE_SPIN_FP,
            u18.SCYTHE_SPIN,
            u18.SCYTHE_PULL_1,
            u18.SCYTHE_PULL_1_FP
        },
        ["sounds"] = {
            u28.SCYTHE_PULL_1,
            u28.SCYTHE_PULL_2,
            u28.SCYTHE_SWING_1,
            u28.SCYTHE_SWING_2,
            u28.SCYTHE_SPIN_1,
            u28.SCYTHE_SPIN_2,
            u28.SCYTHE_SPIN_3
        }
    })
    u15.SwordSwing:connect(function(p36) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u14
            [3] = u23
            [4] = u24
            [5] = u12
            [6] = u22
            [7] = u30
            [8] = u29
        --]]
        if u35.readyTime > u14:GetServerTimeNow() then
            return nil
        end
        if p36:isCancelled() then
            return nil
        end
        local v37 = u23
        local v38 = u24.getInventory(u12.LocalPlayer).hand
        if v38 ~= nil then
            v38 = v38.itemType
        end
        if not v37:isScythe(v38) then
            return nil
        end
        if not u23:isScythe(p36.swordType) then
            return nil
        end
        local v39 = u22:getLocalPlayerEntity()
        if not v39 then
            return nil
        end
        if p36.chargedAttack and (p36.chargedAttack.chargeRatio >= 1 and not (u30:isActive(v39:getInstance(), u29.GROUNDED) and u30:isActive(v39:getInstance(), u29.FROSTED))) then
            p36:setCancelled(true)
            return nil
        end
        local v40 = u12.LocalPlayer:GetAttribute("IsCasting")
        if v40 ~= 0 and (v40 == v40 and (v40 ~= "" and v40)) then
            return nil
        end
        u35.readyTime = u14:GetServerTimeNow() + 0.4
        u35:playLocalAnimation()
        local v41 = u12.LocalPlayer.Character
        if v41 ~= nil then
            v41 = v41.PrimaryPart
        end
        local v42 = p36.targetEntity
        if v42 ~= nil then
            v42 = v42:getInstance().PrimaryPart
            if v42 ~= nil then
                v42 = v42.Position
            end
        end
        if v41 and v42 then
            v41.CFrame = CFrame.new(v41.Position, v42)
        end
    end)
    u27.Client:Get("ScytheAttacks"):Connect(function(p43) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u22
        --]]
        u35:playSound(p43.player, p43.count)
        if not u22:getEntity(p43.player) then
            return nil
        end
    end)
    u27.Client:Get("ScytheApplyState"):Connect(function(p44) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u4
            [3] = u19
            [4] = u18
            [5] = u28
            [6] = u5
            [7] = u6
            [8] = u35
        --]]
        if p44.player ~= u12.LocalPlayer then
            local v45 = u4:playAnimation(p44.player, u19:getAssetId(u18.SCYTHE_SPIN))
            if v45 ~= nil then
                v45:AdjustSpeed(1.5)
            end
            local v46 = { u28.SCYTHE_SPIN_1, u28.SCYTHE_SPIN_2, u28.SCYTHE_SPIN_3 }
            local v47 = p44.player.Character
            if v47 ~= nil then
                v47 = v47.PrimaryPart
                if v47 ~= nil then
                    v47 = v47.Position
                end
            end
            if v47 then
                u5:playSound(u6.fromList(unpack(v46)), {
                    ["rollOffMaxDistance"] = 25,
                    ["volumeMultiplier"] = 0.7,
                    ["position"] = v47
                })
            end
        end
        u35:applyStateEffect(p44.player, 0.7)
    end)
    u15.SwordChargedSwing:connect(function(p48) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u20
            [3] = u12
            [4] = u27
            [5] = u22
            [6] = u30
            [7] = u29
            [8] = u9
            [9] = u13
            [10] = u8
            [11] = u18
            [12] = u4
            [13] = u19
            [14] = u28
            [15] = u5
            [16] = u6
        --]]
        if not u23:isScythe(p48.weapon.Name) then
            return nil
        end
        if p48.chargedAttack.chargeTime >= u20.SCYTHE_MAX_CHARGE_DURATION then
            local v49 = u12.LocalPlayer.Character
            if v49 ~= nil then
                v49 = v49.PrimaryPart
                if v49 ~= nil then
                    v49 = v49.AssemblyMass
                end
            end
            local v50 = u12.LocalPlayer.Character
            if v50 ~= nil then
                v50 = v50.PrimaryPart
                if v50 ~= nil then
                    v50 = v50.CFrame.LookVector.Unit
                end
            end
            local v51 = u12.LocalPlayer.Character
            if v49 == 0 or (v49 ~= v49 or not (v49 and (v50 and v51))) then
                return nil
            end
            local v52 = v50.Unit * (30 * v49)
            u27.Client:Get("ScytheDash"):SendToServer({
                ["direction"] = v50
            })
            local v53 = u22:getLocalPlayerEntity()
            if v53 and not (u30:isActive(v53:getInstance(), u29.GROUNDED) or u30:isActive(v53:getInstance(), u29.FROSTED)) then
                v51.Humanoid.JumpHeight = 0.1
                v51.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                v51.HumanoidRootPart:ApplyImpulse(v52)
                u9.Controllers.JumpHeightController:setJumpHeight(u13.CharacterJumpHeight)
            end
            u8.Controllers.ViewmodelController:playAnimation(u18.SCYTHE_SPIN_FP)
            local v54 = u4:playAnimation(u12.LocalPlayer, u19:getAssetId(u18.SCYTHE_SPIN))
            if v54 ~= nil then
                v54:AdjustSpeed(1.5)
            end
            task.delay(0.15, function() --[[ Line: 190 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u27
                    [3] = u28
                    [4] = u5
                    [5] = u6
                --]]
                local v55 = u12.LocalPlayer.Character
                if v55 ~= nil then
                    v55 = v55.PrimaryPart
                    if v55 ~= nil then
                        v55 = v55.Position
                    end
                end
                if v55 then
                    u27.Client:Get("ScytheSpin"):SendToServer({
                        ["position"] = v55
                    })
                end
                local v56 = { u28.SCYTHE_SPIN_1, u28.SCYTHE_SPIN_2, u28.SCYTHE_SPIN_3 }
                u5:playSound(u6.fromList(unpack(v56)), {
                    ["rollOffMaxDistance"] = 25,
                    ["volumeMultiplier"] = 0.7
                })
            end)
        end
    end)
    u15.SwordCharge:connect(function(u57) --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u25
            [3] = u21
            [4] = u12
            [5] = u14
            [6] = u35
            [7] = u5
            [8] = u28
            [9] = u19
            [10] = u18
            [11] = u8
        --]]
        if not u23:isScythe(u57.itemType) then
            return nil
        end
        if u57:isCancelled() then
            return nil
        end
        u25(u57.itemType)
        local u58 = nil
        local u59 = nil
        local v60 = u57.chargeState
        if v60 == u21.Charged then
            local _ = u12.LocalPlayer.Character
        elseif v60 == u21.Charging then
            local u61 = u14:GetServerTimeNow()
            u35.chargingStartTime = u61
            task.delay(1, function() --[[ Line: 237 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u35
                    [3] = u5
                    [4] = u28
                --]]
                if u61 == u35.chargingStartTime then
                    u5:playSound(u28.SWORD_CHARGE_READY)
                end
            end)
            task.delay(0.2, function() --[[ Line: 242 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u35
                    [3] = u12
                    [4] = u25
                    [5] = u57
                    [6] = u58
                    [7] = u19
                    [8] = u18
                    [9] = u59
                    [10] = u8
                --]]
                if u61 ~= u35.chargingStartTime then
                    return nil
                end
                local v62 = u12.LocalPlayer.Character
                if v62 ~= nil then
                    v62 = v62:FindFirstChild("Humanoid")
                    if v62 ~= nil then
                        v62 = v62:FindFirstChild("Animator")
                    end
                end
                if not v62 then
                    return nil
                end
                local v63 = u25(u57.itemType).sword
                if v63 ~= nil then
                    v63 = v63.chargedAttack
                end
                if not v63 then
                    return nil
                end
                u58 = v62:LoadAnimation(u19:getAnimation(u18.HEAVENLY_SWORD_CHARGE))
                u58:Play()
                u58:AdjustSpeed(1)
                u58:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 270 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                    --]]
                    local v64 = u58
                    if v64 ~= nil then
                        v64:AdjustSpeed(0)
                    end
                end)
                u59 = u8.Controllers.ViewmodelController:playAnimation(u18.FP_HEAVENLY_SWORD_CHARGE)
                if u59 then
                    u59:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 279 ]]
                        --[[
                        Upvalues:
                            [1] = u59
                        --]]
                        local v65 = u59
                        if v65 ~= nil then
                            v65:AdjustSpeed(0)
                        end
                    end)
                end
            end)
            u35.animationMaid:GiveTask(function() --[[ Line: 287 ]]
                --[[
                Upvalues:
                    [1] = u58
                    [2] = u59
                --]]
                local v66 = u58
                if v66 ~= nil then
                    v66:Stop()
                end
                local v67 = u58
                if v67 ~= nil then
                    v67:Destroy()
                end
                local v68 = u59
                if v68 ~= nil then
                    v68:Stop()
                end
                local v69 = u59
                if v69 ~= nil then
                    v69:Destroy()
                end
            end)
        elseif v60 == u21.Idle then
            u35.chargingStartTime = nil
            local v70 = u58
            if v70 ~= nil then
                v70:Stop()
            end
            local v71 = u58
            if v71 ~= nil then
                v71:Destroy()
            end
            local v72 = u59
            if v72 ~= nil then
                v72:Stop()
            end
            local v73 = u59
            if v73 ~= nil then
                v73:Destroy()
            end
            u35.animationMaid:DoCleaning()
        end
    end)
end
function u31.playSound(_, p74, p75) --[[ Line: 331 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u6
        [3] = u12
        [4] = u5
    --]]
    local v76 = p74.Character
    if v76 ~= nil then
        v76 = v76.PrimaryPart
        if v76 ~= nil then
            v76 = v76.Position
        end
    end
    if v76 then
        local v77 = u23:getAnimation(p75)
        if v77 ~= nil then
            v77 = v77.sound
        end
        if v77 and #v77 ~= 0 then
            local v78 = u6.fromList(unpack(v77))
            if v78 == "" or not v78 then
                return nil
            elseif p74 == u12.LocalPlayer then
                u5:playSound(v78, {
                    ["volumeMultiplier"] = 0.7
                })
            else
                u5:playSound(v78, {
                    ["rollOffMaxDistance"] = 25,
                    ["volumeMultiplier"] = 0.7,
                    ["position"] = v76
                })
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u31.playLocalAnimation(_) --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u23
        [3] = u8
        [4] = u4
        [5] = u19
        [6] = u25
        [7] = u26
    --]]
    local v79 = u12.LocalPlayer:GetAttribute("ScytheCount")
    local v80 = u23:getAnimation((v79 == nil and 0 or v79) % #u23:getScytheAttackSequence())
    if not v80 then
        return nil
    end
    local v81 = v80.fpAnimation
    if v81 ~= 0 and (v81 == v81 and v81) then
        u8.Controllers.ViewmodelController:playAnimation(v80.fpAnimation)
    end
    local v82 = u4:playAnimation(u12.LocalPlayer, u19:getAssetId(v80.animation))
    local v83 = u25(u26.STONE_SCYTHE).sword
    if v83 ~= nil then
        v83 = v83.attackSpeed
    end
    local v84
    if v82 == nil then
        v84 = v82
    else
        v84 = v82.Length
    end
    local v85
    if v84 == 0 or v84 ~= v84 then
        v85 = v84
    elseif v84 then
        v85 = v83
    else
        v85 = v84
    end
    if v85 ~= 0 and (v85 == v85 and (v85 and v82 ~= nil)) then
        v82:AdjustSpeed(v84 / v83)
    end
end
function u31.applyStateEffect(u86, u87, p88) --[[ Line: 404 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if u87.Character then
        u8.Controllers.CharacterTransparencyController:getTransparencyModifier(u87.Character):addModifier(u86.transparencyModifier)
        task.delay(p88, function() --[[ Line: 407 ]]
            --[[
            Upvalues:
                [1] = u86
                [2] = u87
            --]]
            u86:removeState(u87)
        end)
    end
end
function u31.removeState(p89, p90) --[[ Line: 412 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.Controllers.CharacterTransparencyController:getTransparencyModifier(p90.Character):removeModifier(p89.transparencyModifier)
end
function u31.isRelevantItem(_, p91) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23:isScythe(p91.itemType)
end
function u31.onEnable(p92, _, _) --[[ Line: 418 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
    --]]
    p92:setupDestroyableYield(function() --[[ Line: 419 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u17.SCYTHE_DASH_AND_SPIN, nil):expect()
    end)
end
function u31.onDisable(_) --[[ Line: 423 ]] end
u8.CreateController(u31.new())
return nil