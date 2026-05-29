local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "rebellion-leader", "rebellion-leader-util").AuraType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "HalloweenSilasController"
    end,
    ["__index"] = u16
})
u33.__index = u33
function u33.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u21
    --]]
    u16.constructor(p36, { u21.HALLOWEEN_2025_EVENT_PVE })
    p36.Name = "HalloweenSilasController"
    p36.abilityMounted = false
    p36.auraMap = {}
    p36.halloweenRadiusStackMap = {}
    p36.inited = false
end
function u33.KnitStart(p37) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p37)
end
function u33.onGameInit(u38) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u26
        [3] = u6
        [4] = u22
        [5] = u10
        [6] = u11
        [7] = u19
        [8] = u18
        [9] = u32
        [10] = u24
        [11] = u30
        [12] = u3
        [13] = u15
        [14] = u17
        [15] = u31
        [16] = u20
        [17] = u27
        [18] = u28
        [19] = u25
    --]]
    u29.Client:Get("HalloweenSetKit"):Connect(function(p39) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u26
        --]]
        if not u38.inited then
            if p39.kit == u26.REBELLION_LEADER then
                u38:mountABilityButton()
            end
            u38.inited = true
        end
    end)
    u29.Client:Get("UpdateRebellionAura"):Connect(function(p40) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u22
            [3] = u10
            [4] = u11
            [5] = u19
            [6] = u18
            [7] = u32
            [8] = u38
            [9] = u24
            [10] = u30
            [11] = u3
        --]]
        local v41
        if p40.player.Character then
            v41 = u6.Controllers.KitController:getKitSkin(p40.player.Character) == u22.GREAT_WOLF_SILAS
        else
            v41 = false
        end
        if p40.player == u10.LocalPlayer and (p40.player.Character and p40.newAura) then
            local u42
            if v41 then
                u42 = u11.Assets.Effects.GreatWolfRebellionFlag:Clone()
            else
                u42 = u11.Assets.Effects.RebellionFlag:Clone()
            end
            u19:playAnimation(u10.LocalPlayer, u18.REBELLION_WAVE_FLAG)
            u42.Parent = p40.player.Character
            u32:weldAccessory(p40.player.Character, u42)
            task.delay(1, function() --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:Destroy()
            end)
        end
        if p40.player.Team == u10.LocalPlayer.Team then
            u38:mountAuraEffect(p40.player)
            local v43 = u10.LocalPlayer.Character
            if v43 ~= nil then
                v43 = v43.PrimaryPart
                if v43 ~= nil then
                    v43 = v43.Position
                end
            end
            if v43 and p40.newAura == u24.HEALING then
                local v44
                if v41 then
                    v44 = u30.WOLF_REBELLION_HEAL
                else
                    v44 = u30.REBELLION_HEAL
                end
                u3:playSound(v44, {
                    ["rollOffMaxDistance"] = 220,
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = v43
                })
            elseif v43 and p40.newAura == u24.DAMAGE then
                local v45
                if v41 then
                    v45 = u30.WOLF_REBELLION_ATTACK
                else
                    v45 = u30.REBELLION_ATTACK
                end
                u3:playSound(v45, {
                    ["rollOffMaxDistance"] = 220,
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = v43
                })
            end
        else
            return nil
        end
    end)
    u15.AbilityUsed:connect(function(p46) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u10
            [3] = u6
            [4] = u22
            [5] = u30
            [6] = u3
            [7] = u38
            [8] = u19
            [9] = u18
        --]]
        if p46.ability == u17.REBELLION_SHIELD then
            local v47 = u10:GetPlayerFromCharacter(p46.userCharacter)
            local v48 = p46.userCharacter.PrimaryPart
            if v48 ~= nil then
                v48 = v48.Position
            end
            local v49 = u6.Controllers.KitController:getKitSkin(p46.userCharacter) == u22.GREAT_WOLF_SILAS
            if v48 then
                local v50
                if v49 then
                    v50 = u30.WOLF_REBELLION_SHIELD
                else
                    v50 = u30.REBELLION_SHIELD
                end
                u3:playSound(v50, {
                    ["rollOffMaxDistance"] = 220,
                    ["position"] = v48
                })
            end
            if v47 then
                u38:releasePulse(v47)
                if v47 == u10.LocalPlayer then
                    u19:playAnimation(u10.LocalPlayer, u18.REBELLION_POINT_SWORD)
                end
            end
        end
    end)
    u15.StatusEffectAdded:connect(function(p51) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u20
            [3] = u6
            [4] = u22
            [5] = u30
            [6] = u3
        --]]
        if p51.statusEffect ~= u31.TRIUMPH then
            return nil
        end
        local v52 = u20:getPlayerFromEntityInstance(p51.entityInstance)
        local v53
        if v52 == nil then
            v53 = v52
        else
            v53 = v52.Character
        end
        if not v53 then
            return nil
        end
        local v54
        if u6.Controllers.KitController:getKitSkin(v52.Character) == u22.GREAT_WOLF_SILAS then
            v54 = u30.WOLF_REBELLION_GAIN_STACK
        else
            v54 = u30.REBELLION_GAIN_STACK
        end
        u3:playSound(v54, {
            ["volumeMultiplier"] = 0.5
        })
    end)
    u29.Client:Get("RebellionBuffAllyEffect"):Connect(function(p55) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
        --]]
        local u56
        if p55.auraType == u24.HEALING then
            u56 = Color3.new(0.22, 0.91, 0.05)
        else
            u56 = Color3.new(0.82, 0.91, 0.05)
        end
        local v57 = p55.players
        local function v62(p58) --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u56
            --]]
            local u59 = u11.Assets.Effects.AuraParticle:Clone()
            local u60 = u59:WaitForChild("Specs", 1)
            local v61 = p58.Character
            if v61 ~= nil then
                v61 = v61.PrimaryPart
            end
            if not (v61 and u60) then
                return nil
            end
            u60.Color = ColorSequence.new(u56)
            u60.Parent = v61
            u60:Emit(3)
            task.delay(1, function() --[[ Line: 167 ]]
                --[[
                Upvalues:
                    [1] = u60
                    [2] = u59
                --]]
                u60:Destroy()
                u59:Destroy()
            end)
        end
        for v63, v64 in v57 do
            v62(v64, v63 - 1, v57)
        end
    end)
    u29.Client:GetNamespace("Halloween2025Remotes"):Get("GiveSkillUpgrade"):Connect(function(p65) --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u20
            [3] = u28
            [4] = u38
            [5] = u25
        --]]
        if p65.halloweenUpgradeType == u27.SILAS_AURA_RADIUS then
            local v66 = u20:getEntity(p65.player)
            if not v66 then
                return nil
            end
            local v67 = v66:getPlayer()
            if not v67 then
                return nil
            end
            local v68 = u28:getAbilityStacks(v67, p65.halloweenUpgradeType)
            u38.halloweenRadiusStackMap[p65.player] = v68
            local v69 = 1 + v68 * u25.SILAS_AURA_RADIUS_PERCENT / 100
            if u38.currentEffect then
                local v70 = u38.currentEffect
                local v71 = v69 * u38.currentEffect.Size.X
                local v72 = u38.currentEffect.Size.Y
                local v73 = v69 * u38.currentEffect.Size.Z
                v70.Size = Vector3.new(v71, v72, v73)
            end
        end
    end)
    u29.Client:GetNamespace("Halloween2025Remotes"):Get("SilasHexActivate"):Connect(function(p74) --[[ Line: 198 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u20
            [3] = u3
            [4] = u30
        --]]
        local v75 = u10.LocalPlayer == p74.player
        local v76 = u20:getEntity(p74.player)
        if v76 ~= nil then
            v76 = v76:getInstance()
        end
        local v77 = u3
        local v78 = u30.SILAS_HALLOWEEN_HEX
        local v79 = {}
        if v75 then
            v76 = nil
        elseif v76 ~= nil then
            v76 = v76.PrimaryPart
            if v76 ~= nil then
                v76 = v76.Position
            end
        end
        v79.position = v76
        v77:playSound(v78, v79)
    end)
    u29.Client:GetNamespace("Halloween2025Remotes"):Get("SilasBuffActivate"):Connect(function(p80) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u20
            [3] = u3
            [4] = u30
        --]]
        local v81 = u10.LocalPlayer == p80.player
        local v82 = u20:getEntity(p80.player)
        if v82 ~= nil then
            v82 = v82:getInstance()
        end
        local v83 = u3
        local v84 = u30.SILAS_HALLOWEEN_BUFF
        local v85 = {}
        if v81 then
            v82 = nil
        elseif v82 ~= nil then
            v82 = v82.PrimaryPart
            if v82 ~= nil then
                v82 = v82.Position
            end
        end
        v85.position = v82
        v83:playSound(v84, v85)
    end)
    u29.Client:GetNamespace("Halloween2025Remotes"):Get("SilasEnemyHexed"):Connect(function(u86) --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        task.delay(0.2, function() --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u86
            --]]
            u38:mountSilasHexedEffect(u86.entityInstance)
        end)
    end)
    u29.Client:GetNamespace("Halloween2025Remotes"):Get("SilasAllyBuffed"):Connect(function(u87) --[[ Line: 258 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        task.delay(0.2, function() --[[ Line: 259 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u87
            --]]
            u38:mountSilasAllyBuffEffect(u87.entityInstance, u87.auraType)
        end)
    end)
end
function u33.mountABilityButton(_) --[[ Line: 264 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u17.REBELLION_AURA_SWAP, {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://94018856518848"
        }
    }):expect()
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u17.REBELLION_SHIELD, {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://133802871831157"
        }
    }):expect()
end
function u33.mountSilasAllyBuffEffect(_, p88, p89) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u11
        [3] = u13
        [4] = u32
    --]]
    if not p88 then
        return nil
    end
    local u90
    if p89 == u24.HEALING then
        u90 = u11.Assets.Effects.SilasHealBuffEffect:Clone()
    else
        u90 = nil
    end
    if p89 == u24.DAMAGE then
        u90 = u11.Assets.Effects.SilasDamageBuffEffect:Clone()
    end
    if not u90 then
        return nil
    end
    u90.Parent = u13
    u90.Massless = true
    u90.CFrame = p88.HumanoidRootPart.CFrame
    u32:weldParts(p88.HumanoidRootPart, u90)
    task.delay(2, function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u90
        --]]
        if u90 then
            u90:Destroy()
        end
    end)
end
function u33.mountSilasHexedEffect(_, p91) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u32
    --]]
    if not p91 then
        return nil
    end
    local u92 = u11.Assets.Effects.SilasHexedEffect:Clone()
    u92.Parent = u13
    u92.Massless = true
    u92.CFrame = p91.HumanoidRootPart.CFrame
    u32:weldParts(p91.HumanoidRootPart, u92)
    task.delay(2, function() --[[ Line: 315 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        u92:Destroy()
    end)
end
function u33.mountAuraEffect(u93, u94) --[[ Line: 319 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u24
        [3] = u11
        [4] = u23
        [5] = u8
        [6] = u13
        [7] = u10
        [8] = u12
    --]]
    local v95 = u93.auraMap[u94]
    if v95 ~= nil then
        v95.maid:DoCleaning()
    end
    local v96 = u94:GetAttribute("LeaderAuraType")
    local u97 = u94.Character
    if u97 ~= nil then
        u97 = u97.PrimaryPart
        if u97 ~= nil then
            u97 = u97.CFrame
        end
    end
    if not u97 then
        return nil
    end
    local v98
    if u93.halloweenRadiusStackMap[u94] == nil then
        v98 = 0
    else
        local v99 = u93.halloweenRadiusStackMap[u94]
        if v99 == 0 or (v99 ~= v99 or not v99) then
            return nil
        end
        v98 = 1 + v99 * u25.SILAS_AURA_RADIUS_PERCENT / 100
    end
    local u100
    if v96 == u24.HEALING then
        local v101 = u11.Assets.Effects.RebellionHealingAura
        local v102 = u93:getSkin(u94)
        if v102 then
            local v103 = u23[v102]
            local v104 = v103.rebellion_leader
            if v104 ~= nil then
                v104 = v104.auraEffect
                if v104 ~= nil then
                    v104 = v104.healingAura
                end
            end
            if v104 then
                v101 = v103.rebellion_leader.auraEffect.healingAura
            end
        end
        u100 = v101:Clone()
    else
        if v96 ~= u24.DAMAGE then
            return nil
        end
        local v105 = u11.Assets.Effects.RebellionDamageAura
        local v106 = u93:getSkin(u94)
        if v106 then
            local v107 = u23[v106]
            local v108 = v107.rebellion_leader
            if v108 ~= nil then
                v108 = v108.auraEffect
                if v108 ~= nil then
                    v108 = v108.damageAura
                end
            end
            if v108 then
                v105 = v107.rebellion_leader.auraEffect.damageAura
            end
        end
        u100 = v105:Clone()
    end
    if v98 > 0 then
        local v109 = v98 * u100.Size.X
        local v110 = u100.Size.Y
        local v111 = v98 * u100.Size.Z
        u100.Size = Vector3.new(v109, v110, v111)
    end
    local u112 = u8.new()
    u100.Parent = u13
    u100:PivotTo(u97)
    u112:GiveTask(u100)
    u112:GiveTask(function() --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        u93.currentEffect = nil
    end)
    local u113 = 0
    u93.auraMap[u94] = {
        ["maid"] = u112,
        ["effect"] = u100
    }
    if u94 == u10.LocalPlayer then
        local v114 = u100:WaitForChild("UI", 1)
        if v114 ~= nil then
            v114 = v114:WaitForChild("Logo", 1)
        end
        if v114 then
            v114.ImageTransparency = 0.5
        end
    end
    u112:GiveTask(u12.Heartbeat:Connect(function(p115) --[[ Line: 416 ]]
        --[[
        Upvalues:
            [1] = u94
            [2] = u97
            [3] = u100
            [4] = u112
            [5] = u93
            [6] = u113
        --]]
        local v116 = u94.Character
        if v116 ~= nil then
            v116 = v116.PrimaryPart
            if v116 ~= nil then
                v116 = v116.CFrame
            end
        end
        u97 = v116
        if not (u97 and u100) then
            u112:DoCleaning()
            u93.auraMap[u94] = nil
            return nil
        end
        u113 = u113 + p115
        u100.Position = u97.Position - Vector3.new(0, 3, 0)
        u100.CFrame = u100.CFrame * CFrame.Angles(0, 0.006135923151542565, 0)
    end))
end
function u33.releasePulse(p117, p118) --[[ Line: 441 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u27
    --]]
    p117:SwordCrossEffect(p118)
    local v119 = p117.auraMap[p118]
    if v119 ~= nil then
        v119 = v119.effect
    end
    if v119 then
        local v120
        if v119 == nil then
            v120 = v119
        else
            v120 = v119:WaitForChild("1", 1)
        end
        if v120 then
            for v121, v122 in v120:GetChildren() do
                local _ = v121 - 1
                if v122.Name == "pulsing" and v122:IsA("ParticleEmitter") then
                    v122:Emit(1)
                end
            end
        end
        if u28:isActive(p118, u27.SILAS_AURA_DEBUFF) then
            local u123
            if v119 == nil then
                u123 = v119
            else
                u123 = v119:WaitForChild("1", 1)
                if u123 ~= nil then
                    u123 = u123:WaitForChild("hexPulse")
                end
            end
            task.delay(0.2, function() --[[ Line: 476 ]]
                --[[
                Upvalues:
                    [1] = u123
                --]]
                if u123 then
                    u123:Emit(1)
                end
            end)
        end
        for v124, u125 in v119:GetChildren() do
            local _ = v124 - 1
            if u125:IsA("ParticleEmitter") then
                u125.Enabled = true
                task.delay(6.5, function() --[[ Line: 486 ]]
                    --[[
                    Upvalues:
                        [1] = u125
                    --]]
                    u125.Enabled = false
                end)
            end
        end
    end
end
function u33.SwordCrossEffect(_, u126) --[[ Line: 496 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u12
        [4] = u14
        [5] = u7
    --]]
    local u127 = u11.Assets.Effects.SwordCross:Clone()
    local u128 = u126.Character
    if u128 ~= nil then
        u128 = u128.PrimaryPart
        if u128 ~= nil then
            u128 = u128.Position + Vector3.new(0, 9, 0)
        end
    end
    local u129 = u13.CurrentCamera
    local u130 = u127:WaitForChild("Left", 1)
    local u131 = u127:WaitForChild("Right", 1)
    if not (u130 and (u131 and (u129 and u128))) then
        return nil
    end
    local v132 = u129.CFrame.Position
    local v133 = u128.Y
    local v134 = Vector3.new(0, v133, 0)
    u127:PivotTo(CFrame.new(u128, v132 * Vector3.new(1, 0, 1) + v134) * CFrame.Angles(0, 0, 0))
    u127.Parent = u13
    local u141 = u12.Heartbeat:Connect(function(_) --[[ Line: 523 ]]
        --[[
        Upvalues:
            [1] = u126
            [2] = u128
            [3] = u127
            [4] = u129
        --]]
        local v135 = u126.Character
        if v135 ~= nil then
            v135 = v135.PrimaryPart
            if v135 ~= nil then
                v135 = v135.Position + Vector3.new(0, 9, 0)
            end
        end
        u128 = v135
        if not u128 then
            return nil
        end
        local v136 = u127
        local v137 = u128
        local v138 = u129.CFrame.Position
        local v139 = u128.Y
        local v140 = Vector3.new(0, v139, 0)
        v136:PivotTo(CFrame.new(v137, v138 * Vector3.new(1, 0, 1) + v140) * CFrame.Angles(0, 0, 0))
    end)
    task.delay(0.2, function() --[[ Line: 546 ]]
        --[[
        Upvalues:
            [1] = u127
        --]]
        local v142 = u127.PrimaryPart
        if v142 ~= nil then
            for v143, v144 in v142:GetChildren() do
                local _ = v143 - 1
                if v144:IsA("ParticleEmitter") then
                    v144:Emit(15)
                end
            end
        end
    end)
    task.delay(0.8, function() --[[ Line: 560 ]]
        --[[
        Upvalues:
            [1] = u127
            [2] = u141
        --]]
        u127:Destroy()
        u141:Disconnect()
    end)
    u14(0.2, u7, function(p145) --[[ Line: 564 ]]
        --[[
        Upvalues:
            [1] = u130
        --]]
        u130.Position = p145
    end, u130.CFrame.Position, u127.PrimaryPart.CFrame.Position)
    u14(0.2, u7, function(p146) --[[ Line: 567 ]]
        --[[
        Upvalues:
            [1] = u131
        --]]
        u131.Position = p146
    end, u131.CFrame.Position, u127.PrimaryPart.CFrame.Position)
end
function u33.getSkin(_, p147) --[[ Line: 571 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v148
    if p147.Character then
        v148 = u5.Controllers.KitSkinController:getKitSkin(p147.Character)
    else
        v148 = nil
    end
    return v148
end
u5.CreateController(u33.new())
return nil