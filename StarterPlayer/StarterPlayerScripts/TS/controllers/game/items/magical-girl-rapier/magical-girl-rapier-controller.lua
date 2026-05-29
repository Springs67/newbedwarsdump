local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "magical-girl-rapier-balance").MagicalGirlRapierBalance
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v20 = {}
local u21 = setmetatable({}, {
    ["__index"] = v20
})
u21.HERO_BASIC = 0
v20[0] = "HERO_BASIC"
u21.HERO_ENHANCED = 1
v20[1] = "HERO_ENHANCED"
u21.VILLAIN_BASIC = 2
v20[2] = "VILLAIN_BASIC"
u21.VILLAIN_ENHANCED = 3
v20[3] = "VILLAIN_ENHANCED"
local u22 = {
    [u21.HERO_BASIC] = {
        ["fpAnimation"] = { v12.GREAT_HAMMER_SWING_1_FP, v12.GREAT_HAMMER_SWING_2_FP },
        ["animation"] = { v12.GREAT_HAMMER_SWING_1, v12.GREAT_HAMMER_SWING_2 },
        ["impactSound"] = {
            u19.RAPIER_HIT_1,
            u19.RAPIER_HIT_2,
            u19.RAPIER_HIT_3,
            u19.RAPIER_HIT_4
        },
        ["swingSound"] = {
            u19.HERO_RAPIER_SWING_1,
            u19.HERO_RAPIER_SWING_2,
            u19.HERO_RAPIER_SWING_3,
            u19.HERO_RAPIER_SWING_4
        }
    },
    [u21.HERO_ENHANCED] = {
        ["fpAnimation"] = { v12.FP_TWIRLBLADE_ATTACK_1, v12.FP_TWIRLBLADE_ATTACK_2 },
        ["animation"] = { v12.RAPIER_THRUST_1, v12.RAPIER_THRUST_2 },
        ["impactSound"] = {
            u19.RAPIER_HIT_1,
            u19.RAPIER_HIT_2,
            u19.RAPIER_HIT_3,
            u19.RAPIER_HIT_4
        },
        ["swingSound"] = { u19.HERO_RAPIER_THRUST_1, u19.HERO_RAPIER_THRUST_2 }
    },
    [u21.VILLAIN_BASIC] = {
        ["fpAnimation"] = { v12.GREAT_HAMMER_SWING_1_FP, v12.GREAT_HAMMER_SWING_2_FP },
        ["animation"] = { v12.GREAT_HAMMER_SWING_1, v12.GREAT_HAMMER_SWING_2 },
        ["impactSound"] = {
            u19.RAPIER_HIT_1,
            u19.RAPIER_HIT_2,
            u19.RAPIER_HIT_3,
            u19.RAPIER_HIT_4
        },
        ["swingSound"] = {
            u19.VILLAIN_RAPIER_SWING_1,
            u19.VILLAIN_RAPIER_SWING_2,
            u19.VILLAIN_RAPIER_SWING_3,
            u19.VILLAIN_RAPIER_SWING_4
        }
    },
    [u21.VILLAIN_ENHANCED] = {
        ["fpAnimation"] = { v12.FP_TWIRLBLADE_ATTACK_1, v12.FP_TWIRLBLADE_ATTACK_2 },
        ["animation"] = { v12.RAPIER_THRUST_1, v12.RAPIER_THRUST_2 },
        ["impactSound"] = {
            u19.RAPIER_HIT_1,
            u19.RAPIER_HIT_2,
            u19.RAPIER_HIT_3,
            u19.RAPIER_HIT_4
        },
        ["swingSound"] = { u19.VILLAIN_RAPIER_THRUST_1, u19.VILLAIN_RAPIER_THRUST_2 }
    }
}
local u23 = {
    v12.GREAT_HAMMER_SWING_1_FP,
    v12.GREAT_HAMMER_SWING_2_FP,
    v12.FP_TWIRLBLADE_ATTACK_1,
    v12.FP_TWIRLBLADE_ATTACK_2,
    v12.GREAT_HAMMER_SWING_1,
    v12.GREAT_HAMMER_SWING_2,
    v12.RAPIER_THRUST_1,
    v12.RAPIER_THRUST_2
}
local u24 = {
    u19.RAPIER_HIT_1,
    u19.RAPIER_HIT_2,
    u19.RAPIER_HIT_3,
    u19.RAPIER_HIT_4,
    u19.RAPIER_PROJECTILE_HIT,
    u19.HERO_RAPIER_SWING_1,
    u19.HERO_RAPIER_SWING_2,
    u19.HERO_RAPIER_SWING_3,
    u19.HERO_RAPIER_SWING_4,
    u19.HERO_RAPIER_THRUST_1,
    u19.HERO_RAPIER_THRUST_2,
    u19.VILLAIN_RAPIER_SWING_1,
    u19.VILLAIN_RAPIER_SWING_2,
    u19.VILLAIN_RAPIER_SWING_3,
    u19.VILLAIN_RAPIER_SWING_4,
    u19.VILLAIN_RAPIER_THRUST_1,
    u19.VILLAIN_RAPIER_THRUST_2
}
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 68 ]]
        return "MagicalGirlRapierController"
    end,
    ["__index"] = u11
})
u25.__index = u25
function u25.new(...) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p28)
    p28.Name = "MagicalGirlRapierController"
    p28.readyTime = -1
end
function u25.KnitStart(u29) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u17
        [4] = u23
        [5] = u24
        [6] = u10
        [7] = u9
        [8] = u15
        [9] = u7
        [10] = u14
        [11] = u4
        [12] = u19
        [13] = u8
        [14] = u18
    --]]
    u11.KnitStart(u29)
    local v30 = {
        ["animations"] = u23,
        ["sounds"] = u24
    }
    u5.Controllers.PreloadController:preloadForItemType(u17.HERO_MAGICAL_GIRL_RAPIER, v30)
    local v31 = {
        ["animations"] = u23,
        ["sounds"] = u24
    }
    u5.Controllers.PreloadController:preloadForItemType(u17.VILLAIN_MAGICAL_GIRL_RAPIER, v31)
    u10.SwordSwing:connect(function(p32) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u9
            [3] = u15
            [4] = u7
            [5] = u17
            [6] = u14
        --]]
        if p32:isCancelled() then
            return nil
        end
        if u29.readyTime > u9:GetServerTimeNow() then
            return nil
        end
        local v33 = u15:getEntity(u7.LocalPlayer)
        if not v33 then
            return nil
        end
        local v34 = v33:getItemInHand()
        if not v34 then
            return nil
        end
        if v34.Name ~= u17.HERO_MAGICAL_GIRL_RAPIER and v34.Name ~= u17.VILLAIN_MAGICAL_GIRL_RAPIER then
            return nil
        end
        local v35 = u29:isHero(v34.Name)
        u29.readyTime = u9:GetServerTimeNow() + u14.RAPIER_ATTACK_COOLDOWN
        local v36 = u7.LocalPlayer:GetAttribute("RapierAttackIndex")
        local v37 = (v36 == nil and 0 or v36) % 3
        u29:playAttackSequenceLocalAnimation(v37, v35)
        u29:playLocalSwingSound(v37, v35)
    end)
    u10.ProjectileHit:connect(function(p38) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u19
            [3] = u8
            [4] = u9
        --]]
        if p38:isCancelled() then
            return nil
        elseif p38.projectileType == "hero_magical_girl_rapier_projectile" or p38.projectileType == "villain_magical_girl_rapier_projectile" then
            if p38.shooter then
                local v39 = {
                    ["volumeMultiplier"] = 0.6,
                    ["position"] = p38.hitData.hitCFrame.Position
                }
                u4:playSound(u19.RAPIER_PROJECTILE_HIT, v39)
                if p38.projectileType == "hero_magical_girl_rapier_projectile" then
                    local u40 = u8.Assets.Effects.HeroRapierProjectileHit:Clone()
                    u40.CFrame = p38.hitData.hitCFrame
                    u40.Parent = u9
                    for _, v41 in u40:GetDescendants() do
                        if v41:IsA("ParticleEmitter") then
                            v41:Emit(15)
                        end
                    end
                    task.delay(4, function() --[[ Line: 147 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                        --]]
                        u40:Destroy()
                    end)
                else
                    local u42 = u8.Assets.Effects.VillainRapierProjectileHit:Clone()
                    u42.CFrame = p38.hitData.hitCFrame
                    u42.Parent = u9
                    u42.Outline1:Emit(1)
                    u42.DotsRotating:Emit(20)
                    task.delay(4, function() --[[ Line: 156 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                        --]]
                        u42:Destroy()
                    end)
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
    u18.Client:OnEvent("RapierSwordHit", function(p43) --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u7
            [3] = u17
            [4] = u29
        --]]
        local v44 = u15:getEntity(u7.LocalPlayer)
        if not v44 then
            return nil
        end
        local v45 = v44:getItemInHand()
        if not v45 then
            return nil
        end
        if v45.Name ~= u17.HERO_MAGICAL_GIRL_RAPIER and v45.Name ~= u17.VILLAIN_MAGICAL_GIRL_RAPIER then
            return nil
        end
        local v46 = u29:isHero(v45.Name)
        u29:playImpactSound(p43.player, p43.attackNumber, v46)
    end)
end
function u25.isRelevantItem(_, p47) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return p47.itemType == u17.HERO_MAGICAL_GIRL_RAPIER and true or p47.itemType == u17.VILLAIN_MAGICAL_GIRL_RAPIER
end
function u25.onEnable(_, _, _) --[[ Line: 181 ]] end
function u25.onDisable(_) --[[ Line: 183 ]] end
function u25.isHero(_, p48) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return p48 == u17.HERO_MAGICAL_GIRL_RAPIER
end
function u25.playAttackSequenceLocalAnimation(p49, p50, p51) --[[ Line: 188 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u13
        [4] = u7
        [5] = u16
        [6] = u17
    --]]
    local v52 = p49:getEffects(p50, p51)
    if not v52 then
        return nil
    end
    if v52.fpAnimation then
        local v53 = u3.fromList
        local v54 = v52.fpAnimation
        local v55 = v53(unpack(v54))
        u5.Controllers.ViewmodelController:playAnimation(v55)
    end
    local v56 = u3.fromList
    local v57 = v52.animation
    local v58 = v56(unpack(v57))
    local v59 = u13:playAnimation(u7.LocalPlayer, v58)
    if not v59 then
        return nil
    end
    v59.Priority = Enum.AnimationPriority.Action4
    local v60 = u16(u17.HERO_MAGICAL_GIRL_RAPIER).sword
    if v60 ~= nil then
        v60 = v60.attackSpeed
    end
    local v61
    if v59 == nil then
        v61 = v59
    else
        v61 = v59.Length
    end
    local v62
    if v61 == 0 or v61 ~= v61 then
        v62 = v61
    elseif v61 then
        v62 = v60
    else
        v62 = v61
    end
    if v62 ~= 0 and (v62 == v62 and (v62 and v59 ~= nil)) then
        v59:AdjustSpeed(v61 / v60)
    end
end
function u25.getEffects(_, p63, p64) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u22
    --]]
    local v65 = (p63 < 0 or p63 >= 3) and 0 or p63
    local v66 = v65 == 0
    if v66 or v65 == 1 then
        if p64 then
            return u22[u21.HERO_BASIC]
        else
            return u22[u21.VILLAIN_BASIC]
        end
    elseif v66 or v65 == 2 then
        if p64 then
            return u22[u21.HERO_ENHANCED]
        else
            return u22[u21.VILLAIN_ENHANCED]
        end
    else
        return
    end
end
function u25.playLocalSwingSound(p67, p68, p69) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v70 = p67:getEffects(p68, p69)
    if not v70 then
        return nil
    end
    local v71 = v70.swingSound
    if not v71 or #v71 == 0 then
        return nil
    end
    u4:playSound(u3.fromList(unpack(v71)), {
        ["volumeMultiplier"] = 1
    })
end
function u25.playImpactSound(p72, p73, p74, p75) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u4
    --]]
    local v76 = p73.Character
    if v76 ~= nil then
        v76 = v76.PrimaryPart
        if v76 ~= nil then
            v76 = v76.Position
        end
    end
    if v76 then
        local v77 = p72:getEffects(p74, p75)
        if v77 then
            local v78 = v77.impactSound
            if v78 and #v78 ~= 0 then
                local v79 = u3.fromList(unpack(v78))
                if v79 == "" or not v79 then
                    return nil
                elseif p73 == u7.LocalPlayer then
                    u4:playSound(v79, {
                        ["volumeMultiplier"] = 0.85
                    })
                else
                    u4:playSound(v79, {
                        ["rollOffMaxDistance"] = 25,
                        ["volumeMultiplier"] = 0.85,
                        ["position"] = v76
                    })
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u5.CreateController(u25.new())
return {
    ["RapierAttackMeta"] = u22
}