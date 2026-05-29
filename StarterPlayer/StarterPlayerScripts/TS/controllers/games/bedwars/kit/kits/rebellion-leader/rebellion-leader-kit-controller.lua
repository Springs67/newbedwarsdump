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
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "rebellion-leader", "rebellion-leader-util").AuraType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "RebellionLeaderKitController"
    end,
    ["__index"] = u32
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
        [1] = u32
        [2] = u23
        [3] = u8
    --]]
    u32.constructor(p36, u23.REBELLION_LEADER)
    p36.Name = "RebellionLeaderKitController"
    p36.abilityMounted = false
    p36.auraMap = {}
    p36.halloweenRadiusStackMap = {}
    p36.abilityMaid = u8.new()
end
function u33.onKitLocalActivated(p37, _) --[[ Line: 56 ]]
    if p37.abilityMounted then
        return nil
    end
    p37.abilityMounted = true
    p37:mountABilityButton()
end
function u33.onKitLocalDeactivated(p38) --[[ Line: 63 ]]
    p38.abilityMaid:DoCleaning()
    p38.abilityMounted = false
end
function u33.onKitReplicationActivated(u39, p40) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u6
        [3] = u21
        [4] = u10
        [5] = u11
        [6] = u19
        [7] = u18
        [8] = u31
        [9] = u24
        [10] = u29
        [11] = u3
        [12] = u15
        [13] = u30
        [14] = u20
        [15] = u25
        [16] = u26
        [17] = u27
    --]]
    p40:GiveTask(u28.Client:Get("UpdateRebellionAura"):Connect(function(p41) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u10
            [4] = u11
            [5] = u19
            [6] = u18
            [7] = u31
            [8] = u39
            [9] = u24
            [10] = u29
            [11] = u3
        --]]
        local v42
        if p41.player.Character then
            v42 = u6.Controllers.KitController:getKitSkin(p41.player.Character) == u21.GREAT_WOLF_SILAS
        else
            v42 = false
        end
        if p41.player == u10.LocalPlayer and (p41.player.Character and p41.newAura) then
            local u43
            if v42 then
                u43 = u11.Assets.Effects.GreatWolfRebellionFlag:Clone()
            else
                u43 = u11.Assets.Effects.RebellionFlag:Clone()
            end
            u19:playAnimation(u10.LocalPlayer, u18.REBELLION_WAVE_FLAG)
            u43.Parent = p41.player.Character
            u31:weldAccessory(p41.player.Character, u43)
            task.delay(1, function() --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                u43:Destroy()
            end)
        end
        if p41.player.Team == u10.LocalPlayer.Team then
            u39:mountAuraEffect(p41.player)
            local v44 = u10.LocalPlayer.Character
            if v44 ~= nil then
                v44 = v44.PrimaryPart
                if v44 ~= nil then
                    v44 = v44.Position
                end
            end
            if v44 and p41.newAura == u24.HEALING then
                local v45
                if v42 then
                    v45 = u29.WOLF_REBELLION_HEAL
                else
                    v45 = u29.REBELLION_HEAL
                end
                u3:playSound(v45, {
                    ["rollOffMaxDistance"] = 220,
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = v44
                })
            elseif v44 and p41.newAura == u24.DAMAGE then
                local v46
                if v42 then
                    v46 = u29.WOLF_REBELLION_ATTACK
                else
                    v46 = u29.REBELLION_ATTACK
                end
                u3:playSound(v46, {
                    ["rollOffMaxDistance"] = 220,
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = v44
                })
            end
        else
            return nil
        end
    end))
    p40:GiveTask(u15.StatusEffectAdded:connect(function(p47) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u20
            [3] = u6
            [4] = u21
            [5] = u29
            [6] = u3
        --]]
        if p47.statusEffect ~= u30.TRIUMPH then
            return nil
        end
        local v48 = u20:getPlayerFromEntityInstance(p47.entityInstance)
        local v49
        if v48 == nil then
            v49 = v48
        else
            v49 = v48.Character
        end
        if not v49 then
            return nil
        end
        local v50
        if u6.Controllers.KitController:getKitSkin(v48.Character) == u21.GREAT_WOLF_SILAS then
            v50 = u29.WOLF_REBELLION_GAIN_STACK
        else
            v50 = u29.REBELLION_GAIN_STACK
        end
        u3:playSound(v50, {
            ["volumeMultiplier"] = 0.5,
            ["parent"] = v48.Character.PrimaryPart
        })
    end))
    p40:GiveTask(u28.Client:Get("RebellionBuffAllyEffect"):Connect(function(p51) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
        --]]
        local u52
        if p51.auraType == u24.HEALING then
            u52 = Color3.new(0.22, 0.91, 0.05)
        else
            u52 = Color3.new(0.82, 0.91, 0.05)
        end
        local v53 = p51.players
        local function v58(p54) --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u52
            --]]
            local u55 = u11.Assets.Effects.AuraParticle:Clone()
            local u56 = u55:WaitForChild("Specs", 1)
            local v57 = p54.Character
            if v57 ~= nil then
                v57 = v57.PrimaryPart
            end
            if not (v57 and u56) then
                return nil
            end
            u56.Color = ColorSequence.new(u52)
            u56.Parent = v57
            u56:Emit(3)
            task.delay(1, function() --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u56
                    [2] = u55
                --]]
                u56:Destroy()
                u55:Destroy()
            end)
        end
        for v59, v60 in v53 do
            v58(v60, v59 - 1, v53)
        end
    end))
    p40:GiveTask(u28.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(p61) --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u20
            [3] = u26
            [4] = u39
            [5] = u27
        --]]
        if p61.halloweenAbilityType == u25.SILAS_AURA_RADIUS then
            local v62 = u20:getEntity(p61.player)
            if not v62 then
                return nil
            end
            local v63 = v62:getPlayer()
            if not v63 then
                return nil
            end
            local v64 = u26:getAbilityStacks(v63, p61.halloweenAbilityType)
            u39.halloweenRadiusStackMap[p61.player] = v64
            local v65 = 1 + v64 * u27.SILAS_AURA_RADIUS_PERCENT / 100
            if u39.currentEffect then
                local v66 = u39.currentEffect
                local v67 = v65 * u39.currentEffect.Size.X
                local v68 = u39.currentEffect.Size.Y
                local v69 = v65 * u39.currentEffect.Size.Z
                v66.Size = Vector3.new(v67, v68, v69)
            end
        end
    end))
    p40:GiveTask(u28.Client:GetNamespace("Halloween2024Remotes"):Get("SilasHexActivate"):Connect(function(p70) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u20
            [3] = u3
            [4] = u29
        --]]
        local v71 = u10.LocalPlayer == p70.player
        local v72 = u20:getEntity(p70.player)
        if v72 ~= nil then
            v72 = v72:getInstance()
        end
        local v73 = u3
        local v74 = u29.SILAS_HALLOWEEN_HEX
        local v75 = {}
        if v71 then
            v72 = nil
        elseif v72 ~= nil then
            v72 = v72.PrimaryPart
            if v72 ~= nil then
                v72 = v72.Position
            end
        end
        v75.position = v72
        v73:playSound(v74, v75)
    end))
    p40:GiveTask(u28.Client:GetNamespace("Halloween2024Remotes"):Get("SilasBuffActivate"):Connect(function(p76) --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u20
            [3] = u3
            [4] = u29
        --]]
        local v77 = u10.LocalPlayer == p76.player
        local v78 = u20:getEntity(p76.player)
        if v78 ~= nil then
            v78 = v78:getInstance()
        end
        local v79 = u3
        local v80 = u29.SILAS_HALLOWEEN_BUFF
        local v81 = {}
        if v77 then
            v78 = nil
        elseif v78 ~= nil then
            v78 = v78.PrimaryPart
            if v78 ~= nil then
                v78 = v78.Position
            end
        end
        v81.position = v78
        v79:playSound(v80, v81)
    end))
    p40:GiveTask(u28.Client:GetNamespace("Halloween2024Remotes"):Get("SilasEnemyHexed"):Connect(function(u82) --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        task.delay(0.2, function() --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u82
            --]]
            u39:mountSilasHexedEffect(u82.entityInstance)
        end)
    end))
    p40:GiveTask(u28.Client:GetNamespace("Halloween2024Remotes"):Get("SilasAllyBuffed"):Connect(function(u83) --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        task.delay(0.2, function() --[[ Line: 233 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u83
            --]]
            u39:mountSilasAllyBuffEffect(u83.entityInstance, u83.auraType)
        end)
    end))
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 238 ]] end
function u33.onInnateAbilityEnabled(_, _, _) --[[ Line: 240 ]] end
function u33.onAbilityUsed(p84, _, p85) --[[ Line: 242 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u6
        [4] = u21
        [5] = u29
        [6] = u3
        [7] = u19
        [8] = u18
    --]]
    if p85.ability == u16.REBELLION_SHIELD then
        local v86 = u10:GetPlayerFromCharacter(p85.userCharacter)
        local v87 = p85.userCharacter.PrimaryPart
        if v87 ~= nil then
            v87 = v87.Position
        end
        local v88 = u6.Controllers.KitController:getKitSkin(p85.userCharacter) == u21.GREAT_WOLF_SILAS
        if v87 then
            local v89
            if v88 then
                v89 = u29.WOLF_REBELLION_SHIELD
            else
                v89 = u29.REBELLION_SHIELD
            end
            u3:playSound(v89, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = v87
            })
        end
        if v86 then
            p84:releasePulse(v86)
            if v86 == u10.LocalPlayer then
                u19:playAnimation(u10.LocalPlayer, u18.REBELLION_POINT_SWORD)
            end
        end
    end
end
function u33.mountABilityButton(p90) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
        [3] = u17
    --]]
    local v91 = p90.abilityMaid
    local v92 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v93 = u16.REBELLION_AURA_SWAP
    local v94 = {}
    for v95, v96 in u17[u16.REBELLION_AURA_SWAP].triggerConfig do
        v94[v95] = v96
    end
    v91:GiveTask(v92:enableAbility(v93, v94):expect())
    local v97 = p90.abilityMaid
    local v98 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v99 = u16.REBELLION_SHIELD
    local v100 = {}
    for v101, v102 in u17[u16.REBELLION_SHIELD].triggerConfig do
        v100[v101] = v102
    end
    v97:GiveTask(v98:enableAbility(v99, v100):expect())
end
function u33.mountSilasAllyBuffEffect(_, p103, p104) --[[ Line: 284 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u11
        [3] = u13
        [4] = u31
    --]]
    if not p103 then
        return nil
    end
    local u105
    if p104 == u24.HEALING then
        u105 = u11.Assets.Effects.SilasHealBuffEffect:Clone()
    else
        u105 = nil
    end
    if p104 == u24.DAMAGE then
        u105 = u11.Assets.Effects.SilasDamageBuffEffect:Clone()
    end
    if not u105 then
        return nil
    end
    u105.Parent = u13
    u105.Massless = true
    u105.CFrame = p103.HumanoidRootPart.CFrame
    u31:weldParts(p103.HumanoidRootPart, u105)
    task.delay(2, function() --[[ Line: 304 ]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        if u105 then
            u105:Destroy()
        end
    end)
end
function u33.mountSilasHexedEffect(_, p106) --[[ Line: 310 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u31
    --]]
    if not p106 then
        return nil
    end
    local u107 = u11.Assets.Effects.SilasHexedEffect:Clone()
    u107.Parent = u13
    u107.Massless = true
    u107.CFrame = p106.HumanoidRootPart.CFrame
    u31:weldParts(p106.HumanoidRootPart, u107)
    task.delay(2, function() --[[ Line: 321 ]]
        --[[
        Upvalues:
            [1] = u107
        --]]
        u107:Destroy()
    end)
end
function u33.mountAuraEffect(u108, u109) --[[ Line: 325 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u24
        [3] = u11
        [4] = u22
        [5] = u8
        [6] = u13
        [7] = u10
        [8] = u12
    --]]
    local v110 = u108.auraMap[u109]
    if v110 ~= nil then
        v110.maid:DoCleaning()
    end
    local v111 = u109:GetAttribute("LeaderAuraType")
    local u112 = u109.Character
    if u112 ~= nil then
        u112 = u112.PrimaryPart
        if u112 ~= nil then
            u112 = u112.CFrame
        end
    end
    if not u112 then
        return nil
    end
    local v113
    if u108.halloweenRadiusStackMap[u109] == nil then
        v113 = 0
    else
        local v114 = u108.halloweenRadiusStackMap[u109]
        if v114 == 0 or (v114 ~= v114 or not v114) then
            return nil
        end
        v113 = 1 + v114 * u27.SILAS_AURA_RADIUS_PERCENT / 100
    end
    local u115
    if v111 == u24.HEALING then
        local v116 = u11.Assets.Effects.RebellionHealingAura
        local v117 = u108:getSkin(u109)
        if v117 then
            local v118 = u22[v117]
            local v119 = v118.rebellion_leader
            if v119 ~= nil then
                v119 = v119.auraEffect
                if v119 ~= nil then
                    v119 = v119.healingAura
                end
            end
            if v119 then
                v116 = v118.rebellion_leader.auraEffect.healingAura
            end
        end
        u115 = v116:Clone()
    else
        if v111 ~= u24.DAMAGE then
            return nil
        end
        local v120 = u11.Assets.Effects.RebellionDamageAura
        local v121 = u108:getSkin(u109)
        if v121 then
            local v122 = u22[v121]
            local v123 = v122.rebellion_leader
            if v123 ~= nil then
                v123 = v123.auraEffect
                if v123 ~= nil then
                    v123 = v123.damageAura
                end
            end
            if v123 then
                v120 = v122.rebellion_leader.auraEffect.damageAura
            end
        end
        u115 = v120:Clone()
    end
    if v113 > 0 then
        local v124 = v113 * u115.Size.X
        local v125 = u115.Size.Y
        local v126 = v113 * u115.Size.Z
        u115.Size = Vector3.new(v124, v125, v126)
    end
    local u127 = u8.new()
    u115.Parent = u13
    u115:PivotTo(u112)
    u127:GiveTask(u115)
    u127:GiveTask(function() --[[ Line: 401 ]]
        --[[
        Upvalues:
            [1] = u108
        --]]
        u108.currentEffect = nil
    end)
    local u128 = 0
    u108.auraMap[u109] = {
        ["maid"] = u127,
        ["effect"] = u115
    }
    if u109 == u10.LocalPlayer then
        local v129 = u115:WaitForChild("UI", 1)
        if v129 ~= nil then
            v129 = v129:WaitForChild("Logo", 1)
        end
        if v129 then
            v129.ImageTransparency = 0.5
        end
    end
    u127:GiveTask(u12.Heartbeat:Connect(function(p130) --[[ Line: 422 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u112
            [3] = u115
            [4] = u127
            [5] = u108
            [6] = u128
        --]]
        local v131 = u109.Character
        if v131 ~= nil then
            v131 = v131.PrimaryPart
            if v131 ~= nil then
                v131 = v131.CFrame
            end
        end
        u112 = v131
        if not (u112 and u115) then
            u127:DoCleaning()
            u108.auraMap[u109] = nil
            return nil
        end
        u128 = u128 + p130
        u115.Position = u112.Position - Vector3.new(0, 3, 0)
        u115.CFrame = u115.CFrame * CFrame.Angles(0, 0.006135923151542565, 0)
    end))
end
function u33.releasePulse(p132, p133) --[[ Line: 447 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u25
    --]]
    p132:SwordCrossEffect(p133)
    local v134 = p132.auraMap[p133]
    if v134 ~= nil then
        v134 = v134.effect
    end
    if v134 then
        local v135
        if v134 == nil then
            v135 = v134
        else
            v135 = v134:WaitForChild("1", 1)
        end
        if v135 then
            for v136, v137 in v135:GetChildren() do
                local _ = v136 - 1
                if v137.Name == "pulsing" and v137:IsA("ParticleEmitter") then
                    v137:Emit(1)
                end
            end
        end
        if u26:isActive(p133, u25.SILAS_AURA_DEBUFF) then
            local u138
            if v134 == nil then
                u138 = v134
            else
                u138 = v134:WaitForChild("1", 1)
                if u138 ~= nil then
                    u138 = u138:WaitForChild("hexPulse")
                end
            end
            task.delay(0.2, function() --[[ Line: 482 ]]
                --[[
                Upvalues:
                    [1] = u138
                --]]
                if u138 then
                    u138:Emit(1)
                end
            end)
        end
        for v139, u140 in v134:GetChildren() do
            local _ = v139 - 1
            if u140:IsA("ParticleEmitter") then
                u140.Enabled = true
                task.delay(6.5, function() --[[ Line: 492 ]]
                    --[[
                    Upvalues:
                        [1] = u140
                    --]]
                    u140.Enabled = false
                end)
            end
        end
    end
end
function u33.SwordCrossEffect(_, u141) --[[ Line: 502 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u12
        [4] = u14
        [5] = u7
    --]]
    local u142 = u11.Assets.Effects.SwordCross:Clone()
    local u143 = u141.Character
    if u143 ~= nil then
        u143 = u143.PrimaryPart
        if u143 ~= nil then
            u143 = u143.Position + Vector3.new(0, 9, 0)
        end
    end
    local u144 = u13.CurrentCamera
    local u145 = u142:WaitForChild("Left", 1)
    local u146 = u142:WaitForChild("Right", 1)
    if not (u145 and (u146 and (u144 and u143))) then
        return nil
    end
    local v147 = u144.CFrame.Position
    local v148 = u143.Y
    local v149 = Vector3.new(0, v148, 0)
    u142:PivotTo(CFrame.new(u143, v147 * Vector3.new(1, 0, 1) + v149) * CFrame.Angles(0, 0, 0))
    u142.Parent = u13
    local u156 = u12.Heartbeat:Connect(function(_) --[[ Line: 529 ]]
        --[[
        Upvalues:
            [1] = u141
            [2] = u143
            [3] = u142
            [4] = u144
        --]]
        local v150 = u141.Character
        if v150 ~= nil then
            v150 = v150.PrimaryPart
            if v150 ~= nil then
                v150 = v150.Position + Vector3.new(0, 9, 0)
            end
        end
        u143 = v150
        if not u143 then
            return nil
        end
        local v151 = u142
        local v152 = u143
        local v153 = u144.CFrame.Position
        local v154 = u143.Y
        local v155 = Vector3.new(0, v154, 0)
        v151:PivotTo(CFrame.new(v152, v153 * Vector3.new(1, 0, 1) + v155) * CFrame.Angles(0, 0, 0))
    end)
    task.delay(0.2, function() --[[ Line: 552 ]]
        --[[
        Upvalues:
            [1] = u142
        --]]
        local v157 = u142.PrimaryPart
        if v157 ~= nil then
            for v158, v159 in v157:GetChildren() do
                local _ = v158 - 1
                if v159:IsA("ParticleEmitter") then
                    v159:Emit(15)
                end
            end
        end
    end)
    task.delay(0.8, function() --[[ Line: 566 ]]
        --[[
        Upvalues:
            [1] = u142
            [2] = u156
        --]]
        u142:Destroy()
        u156:Disconnect()
    end)
    u14(0.2, u7, function(p160) --[[ Line: 570 ]]
        --[[
        Upvalues:
            [1] = u145
        --]]
        u145.Position = p160
    end, u145.CFrame.Position, u142.PrimaryPart.CFrame.Position)
    u14(0.2, u7, function(p161) --[[ Line: 573 ]]
        --[[
        Upvalues:
            [1] = u146
        --]]
        u146.Position = p161
    end, u146.CFrame.Position, u142.PrimaryPart.CFrame.Position)
end
function u33.getSkin(_, p162) --[[ Line: 577 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v163
    if p162.Character then
        v163 = u5.Controllers.KitSkinController:getKitSkin(p162.Character)
    else
        v163 = nil
    end
    return v163
end
u5.CreateController(u33.new())
return nil