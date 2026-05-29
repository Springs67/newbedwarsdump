local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.RunService
local u17 = v12.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-types").CustomKitTypes
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, script.Parent, "ui", "custom-kit-game-kit-selection-gui").CustomKitGame_KitSelectionGUI
local u30 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "CustomKitGameController"
    end,
    ["__index"] = u18
})
u30.__index = u30
function u30.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v31 = u30
    local v32 = setmetatable({}, v31)
    return v32:constructor(...) or v32
end
function u30.constructor(p33) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u21
        [3] = u9
    --]]
    u18.constructor(p33, { u21.CUSTOM_KIT, u21.CUSTOM_KIT_CREATOR })
    p33.Name = "CustomKitGameController"
    p33.localPlayer_kits = {}
    p33.localPlayer_selectedKit = nil
    p33.allPlayers_selectedKits = {}
    p33.allPlayers_customAbilities = {}
    p33.abilityMaid = u9.new()
    p33.kitSelectGUIMaid = u9.new()
end
function u30.KnitStart(p34) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.KnitStart(p34)
end
function u30.onGameInit(u35) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u7
        [3] = u22
        [4] = u8
        [5] = u26
        [6] = u23
        [7] = u24
        [8] = u17
        [9] = u10
        [10] = u4
        [11] = u20
        [12] = u19
        [13] = u15
        [14] = u16
    --]]
    u27.Client:Get("CustomKitCreation_SendProfileDataToClient"):Connect(function(p36) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u7
            [3] = u22
            [4] = u8
            [5] = u26
        --]]
        u35.localPlayer_kits = p36.customKits
        if u7.Controllers.MatchController:getQueueType() == u22.CUSTOM_KIT and (u8.Controllers.MatchController:getMatchState() ~= u26.RUNNING and u8.Controllers.MatchController:getMatchState() ~= u26.POST) then
            u35:mountKitSelectionUI()
        end
    end)
    u27.Client:Get("CustomKitGame_SendAllPlayerCustomAbilitiesToClient"):Connect(function(p37) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        for v38, v39 in p37.kits do
            u35:setupFinalizedCustomKit(v38, v39)
        end
    end)
    u27.Client:Get("CustomKitGame_SelectCustomKit"):Connect(function(p40) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:setupFinalizedCustomKit(p40.playerId, p40.customKit)
    end)
    u27.Client:Get("CustomKitGame_AbilityProjectileHit"):Connect(function(p41) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u23
            [3] = u24
        --]]
        local v42 = u35.allPlayers_customAbilities[p41.abilityId]
        if v42 then
            if v42.targetType == u23.TargetType.PROJECTILE then
                local v43 = u24.getAbilityPropertyValue(v42, u23.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS)
                if v43 == nil then
                    return nil
                else
                    local v44 = v42.statusEffect
                    if v44 == u23.StatusEffectType.DECAY then
                        u35:decayProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.SILENCE then
                        u35:silenceProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.ZAPPED then
                        u35:zapProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.POISON then
                        u35:poisonProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.DIZZY then
                        u35:dizzyProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.GROUNDED then
                        u35:groundedProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.REGEN then
                        u35:regenProjectileOnhit(p41.position, v43)
                        return
                    elseif v44 == u23.StatusEffectType.SHIELD then
                        u35:shieldProjectileOnhit(p41.position, v43)
                    end
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
    u27.Client:Get("CustomKitGame_ProjectileAbilityUsed"):Connect(function(_) --[[ Line: 151 ]] end)
    u27.Client:Get("CustomKitGame_AoeAbilityUsed"):Connect(function(p45) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u24
            [3] = u23
            [4] = u17
            [5] = u10
            [6] = u4
            [7] = u20
            [8] = u19
        --]]
        local v46 = u35.allPlayers_customAbilities[p45.abilityId]
        if not v46 then
            print("[CustomKitGameController] No ability found for id: " .. p45.abilityId)
            return nil
        end
        local v47 = u24.getAbilityPropertyValue(v46, u23.AbilityPropertyKey.AOE_RADIUS)
        if v47 == nil then
            print("[CustomKitGameController] No radius found for AOE ability: " .. v46.name)
            return nil
        end
        local v48 = p45.player.Character
        if v48 ~= nil then
            v48 = v48.PrimaryPart
            if v48 ~= nil then
                v48 = v48.Position
            end
        end
        if not v48 then
            print("[CustomKitGameController] No position found for AOE ability: " .. v46.name)
            return nil
        end
        local v49 = {}
        local v50 = v47 * 2
        local v51 = v47 * 2
        v49.Size = Vector3.new(1, v50, v51)
        v49.CFrame = CFrame.new(v48) * CFrame.Angles(0, 0, 1.5707963267948966)
        v49.Anchored = true
        v49.CanCollide = false
        v49.CanQuery = false
        v49.CanTouch = false
        v49.Transparency = 0.8
        v49.Shape = Enum.PartType.Cylinder
        v49.Parent = u17
        v49.Color = u24.getAbilityColor(v46)
        local u52 = u10("Part", v49)
        task.delay(1, function() --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52:Destroy()
        end)
        local v53 = v46.statusEffect
        if v53 == u23.StatusEffectType.DECAY then
            u35:decayProjectileOnhit(v48, v47)
            local v54 = u4:playAnimation(p45.player, u20:getAssetId(u19.VOID_DRAGON_TRANSFORM))
            if v54 ~= nil then
                v54:AdjustSpeed(2)
                return
            end
        else
            if v53 == u23.StatusEffectType.SILENCE then
                u35:silenceProjectileOnhit(v48, v47)
                u4:playAnimation(p45.player, u20:getAssetId(u19.KICKER_STOMP))
                return
            end
            if v53 == u23.StatusEffectType.ZAPPED then
                u4:playAnimation(p45.player, u20:getAssetId(u19.WIZARD_LIGHTNING_CAST))
                u35:zapProjectileOnhit(v48, v47)
                return
            end
            if v53 == u23.StatusEffectType.POISON then
                u4:playAnimation(p45.player, u20:getAssetId(u19.CACTUS_CAST))
                u35:poisonProjectileOnhit(v48, v47)
                return
            end
            if v53 == u23.StatusEffectType.DIZZY then
                u4:playAnimation(p45.player, u20:getAssetId(u19.AIRBENDER_CAST))
                u35:dizzyProjectileOnhit(v48, v47)
                return
            end
            if v53 == u23.StatusEffectType.GROUNDED then
                local v55 = u4:playAnimation(p45.player, u20:getAssetId(u19.DRAGON_SWORD_ULT))
                if v55 ~= nil then
                    v55:AdjustSpeed(3)
                end
                u35:groundedProjectileOnhit(v48, v47)
                return
            end
            if v53 == u23.StatusEffectType.SHIELD then
                u4:playAnimation(p45.player, u20:getAssetId(u19.INFERNAL_SHIELD_SLAM))
                u35:shieldProjectileOnhit(v48, v47)
                return
            end
            if v53 == u23.StatusEffectType.REGEN then
                u4:playAnimation(p45.player, u20:getAssetId(u19.WAND_CAST))
                u35:regenProjectileOnhit(v48, v47)
                return
            end
        end
    end)
    u27.Client:Get("CustomKitGame_AuraAbilityUsed"):Connect(function(u56) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u23
            [3] = u24
            [4] = u17
            [5] = u10
            [6] = u15
            [7] = u16
        --]]
        local v57 = u35.allPlayers_customAbilities[u56.abilityId]
        if not v57 then
            print("[CustomKitGameController] No ability found for id: " .. u56.abilityId)
            return nil
        end
        if v57.targetType ~= u23.TargetType.AURA then
            print("[CustomKitGameController] Ability " .. v57.name .. " is not an aura ability.")
            return nil
        end
        local v58 = u24.getAbilityPropertyValue(v57, u23.AbilityPropertyKey.AURA_RADIUS)
        if v58 == nil then
            print("[CustomKitGameController] No radius found for aura level: " .. tostring(v58))
            return nil
        end
        local v59 = u56.player.Character
        if v59 ~= nil then
            v59 = v59.PrimaryPart
            if v59 ~= nil then
                v59 = v59.Position
            end
        end
        if not v59 then
            print("[CustomKitGameController] No position found for aura ability: " .. v57.name)
            return nil
        end
        local v60 = {
            ["Name"] = "AURAPART"
        }
        local v61 = v58 * 2
        local v62 = v58 * 2
        v60.Size = Vector3.new(0.25, v61, v62)
        v60.CFrame = CFrame.new(v59) * CFrame.Angles(0, 0, 1.5707963267948966)
        v60.Anchored = true
        v60.CanCollide = false
        v60.CanQuery = false
        v60.CanTouch = false
        v60.Transparency = 0.5
        v60.Shape = Enum.PartType.Cylinder
        v60.Parent = u17
        v60.Color = u24.getAbilityColor(v57)
        local u63 = u10("Part", v60)
        local v64 = v57.statusEffect
        if v64 then
            local v65 = u15.Assets.Effects.CustomEffects
            local v66 = nil
            if v64 == u23.StatusEffectType.DECAY then
                v66 = v65:WaitForChild("Decay", 3)
            elseif v64 == u23.StatusEffectType.POISON then
                v66 = v65:WaitForChild("Poison", 3)
            elseif v64 == u23.StatusEffectType.REGEN then
                v66 = v65:WaitForChild("Healing", 3)
            elseif v64 == u23.StatusEffectType.ZAPPED then
                v66 = v65:WaitForChild("Zap", 3)
            elseif v64 == u23.StatusEffectType.DIZZY then
                v66 = v65:WaitForChild("Dizzy", 3)
            elseif v64 == u23.StatusEffectType.GROUNDED then
                v66 = v65:WaitForChild("Grounded", 3)
            elseif v64 == u23.StatusEffectType.SILENCE then
                v66 = v65:WaitForChild("Silence", 3)
            elseif v64 == u23.StatusEffectType.SHIELD then
                v66 = v65:WaitForChild("Shield", 3)
            end
            if v66 then
                local v67 = v66:Clone()
                v67.Parent = u63
                v67.Enabled = true
            end
        end
        local u68 = u56.endTime
        local u69 = nil
        u69 = u16.Heartbeat:Connect(function() --[[ Line: 326 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u68
                [3] = u69
                [4] = u63
                [5] = u56
            --]]
            if u68 <= u17:GetServerTimeNow() then
                u69:Disconnect()
                u63:Destroy()
                return nil
            end
            local v70 = u56.player.Character
            if v70 ~= nil then
                v70 = v70.PrimaryPart
                if v70 ~= nil then
                    v70 = v70.Position
                end
            end
            if v70 then
                u63.CFrame = CFrame.new(v70) * CFrame.Angles(0, 0, 1.5707963267948966)
            end
        end)
    end)
    u27.Client:Get("CustomKitGame_SelfAbilityUsed"):Connect(function(u71) --[[ Line: 347 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u10
            [3] = u17
            [4] = u24
            [5] = u15
            [6] = u23
            [7] = u16
        --]]
        local v72 = u35.allPlayers_customAbilities[u71.abilityId]
        if not v72 then
            print("[CustomKitGameController] No ability found for id: " .. u71.abilityId)
            return nil
        end
        local v73 = u71.player.Character
        if v73 ~= nil then
            v73 = v73.PrimaryPart
            if v73 ~= nil then
                v73 = v73.Position
            end
        end
        if not v73 then
            print("[CustomKitGameController] No position found for self ability: " .. v72.name)
            return nil
        end
        local u74 = u10("Part", {
            ["Size"] = Vector3.new(4, 6, 4),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Transparency"] = 1,
            ["CFrame"] = CFrame.new(v73),
            ["Shape"] = Enum.PartType.Ball,
            ["Parent"] = u17,
            ["Color"] = u24.getAbilityColor(v72)
        })
        local v75 = v72.statusEffect and v72.statusEffect
        if v75 then
            local v76 = u15.Assets.Effects.CustomEffects
            local v77 = nil
            if v75 == u23.StatusEffectType.DECAY then
                v77 = v76:WaitForChild("Decay", 3)
            elseif v75 == u23.StatusEffectType.POISON then
                v77 = v76:WaitForChild("Poison", 3)
            elseif v75 == u23.StatusEffectType.REGEN then
                v77 = v76:WaitForChild("Healing", 3)
            elseif v75 == u23.StatusEffectType.ZAPPED then
                v77 = v76:WaitForChild("Zap", 3)
            end
            if v77 then
                local v78 = v77:Clone()
                v78.Parent = u74
                v78.Enabled = true
            end
        end
        local u79 = nil
        u79 = u16.Heartbeat:Connect(function() --[[ Line: 403 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u79
                [3] = u74
            --]]
            local v80 = u71.player.Character
            if v80 ~= nil then
                v80 = v80.PrimaryPart
            end
            if not v80 then
                u79:Disconnect()
                u74:Destroy()
                return nil
            end
            u74.CFrame = CFrame.new(u71.player.Character.PrimaryPart.Position)
        end)
        task.delay(1, function() --[[ Line: 415 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u74
            --]]
            u79:Disconnect()
            u74:Destroy()
        end)
    end)
    u27.Client:Get("CustomKit_ClientGameInitialized"):SendToServer({})
end
function u30.setupFinalizedCustomKit(p81, p82, p83) --[[ Line: 422 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u24
        [3] = u2
    --]]
    p81.allPlayers_selectedKits[p82] = p83
    for v84, v85 in p83.abilities do
        local _ = v84 - 1
        p81.allPlayers_customAbilities[v85.id] = v85
    end
    if p82 == u14.LocalPlayer.UserId then
        p81.kitSelectGUIMaid:DoCleaning()
        p81.abilityMaid:DoCleaning()
        p81.localPlayer_selectedKit = p83
        for v86, v87 in p83.abilities do
            local _ = v86 - 1
            local v88 = u24.createAbilityMetaFromCustomAbility(v87)
            local v89 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(v87.id, nil, v88):expect()
            p81.abilityMaid:GiveTask(v89)
        end
    end
end
function u30.trySelectKit(p90, p91) --[[ Line: 456 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    p90.kitSelectGUIMaid:DoCleaning()
    local v92 = p90.localPlayer_kits
    local v93 = (table.find(v92, p91) or 0) - 1
    if v93 == -1 then
        print("[CustomKitGameController] Kit not found in localPlayerKits: " .. p91.name)
        return false
    elseif u27.Client:Get("CustomKitGame_SelectKit"):CallServer({
        ["kitIndex"] = v93
    }) then
        p90.localPlayer_selectedKit = p91
        return true
    else
        print("[CustomKitGameController] Failed to select kit: " .. p91.name)
        return false
    end
end
function u30.mountKitSelectionUI(u94) --[[ Line: 476 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u29
        [3] = u14
    --]]
    local u96 = u11.mount(u11.createElement(u29, {
        ["CustomKits"] = u94.localPlayer_kits,
        ["OnKitClicked"] = function(p95) --[[ Name: OnKitClicked, Line 479 ]]
            --[[
            Upvalues:
                [1] = u94
            --]]
            return u94:trySelectKit(p95)
        end
    }), u14.LocalPlayer:WaitForChild("PlayerGui"), "CustomKitGame_KitSelectionGUI")
    u94.kitSelectGUIMaid:GiveTask(function() --[[ Line: 483 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u96
        --]]
        u11.unmount(u96)
    end)
end
function u30.poisonProjectileOnhit(_, p97, p98) --[[ Line: 487 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u9
        [4] = u10
        [5] = u17
        [6] = u25
        [7] = u13
    --]]
    u5:playSound(u28.WIND_HIT_SHOUD_1, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p97
    })
    local u99 = u9.new()
    local v100 = u10("Part", {
        ["Size"] = Vector3.new(4, 4, 4),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p97,
        ["Parent"] = u17
    })
    u99:GiveTask(v100)
    local v101 = u10("ParticleEmitter", {
        ["Enabled"] = false,
        ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        ["Texture"] = u25.SMOKE,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3, 0.5), NumberSequenceKeypoint.new(1, 5, 1) }),
        ["Lifetime"] = NumberRange.new(5, 5),
        ["SpreadAngle"] = Vector2.new(180, 180),
        ["Speed"] = NumberRange.new(p98 / 5, p98 / 5),
        ["Parent"] = v100
    })
    u13:AddTag(v101, "FirstPersonHidden")
    local v102 = u10("Attachment", {
        ["Position"] = Vector3.new(0, -1, 0),
        ["Orientation"] = Vector3.new(90, 0, 0),
        ["Parent"] = v100
    })
    local v103 = u10("ParticleEmitter", {
        ["Enabled"] = false,
        ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        ["Texture"] = u25.SMOKE,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 0.5), NumberSequenceKeypoint.new(1, 4, 1) }),
        ["Lifetime"] = NumberRange.new(3, 3),
        ["SpreadAngle"] = Vector2.new(10, 180),
        ["Speed"] = NumberRange.new(p98 / 3, p98 / 3),
        ["Parent"] = v102
    })
    v101:Emit(100)
    v103:Emit(100)
    task.delay(1, function() --[[ Line: 534 ]]
        --[[
        Upvalues:
            [1] = u99
        --]]
        u99:DoCleaning()
    end)
end
function u30.decayProjectileOnhit(_, p104, u105) --[[ Line: 538 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u5
        [3] = u28
        [4] = u17
        [5] = u13
    --]]
    local u106 = u15.Assets.Effects.VoidDragonTransform:Clone()
    u5:playSound(u28.VOID_HEALTH_DECAY, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p104
    })
    u106.Position = p104
    u106.Parent = u17
    u106.Anchored = true
    task.delay(1, function() --[[ Line: 547 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        u106:Destroy()
    end)
    local v107 = u106:GetDescendants()
    local function v109(p108) --[[ Line: 551 ]]
        --[[
        Upvalues:
            [1] = u105
            [2] = u13
        --]]
        if p108:IsA("ParticleEmitter") then
            p108.Speed = NumberRange.new(u105 / p108.Lifetime.Max, u105 / p108.Lifetime.Max)
            p108:Emit(15)
            u13:AddTag(p108, "FirstPersonHidden")
        end
    end
    for v110, v111 in v107 do
        v109(v111, v110 - 1, v107)
    end
end
function u30.dizzyProjectileOnhit(_, p112, p113) --[[ Line: 562 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u9
        [4] = u10
        [5] = u17
        [6] = u15
        [7] = u13
    --]]
    u5:playSound(u28.CRAB_BOSS_CLAW_ATTACK, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p112
    })
    local u114 = u9.new()
    local v115 = u10("Part", {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Size"] = Vector3.new(p113, p113, p113),
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p112,
        ["Parent"] = u17
    })
    u114:GiveTask(v115)
    local v116 = u15.Assets.Effects.CustomEffects:WaitForChild("Dizzy", 3)
    if v116 ~= nil then
        v116 = v116:Clone()
    end
    if v116 then
        u13:AddTag(v116, "FirstPersonHidden")
        v116.Parent = v115
        v116:Emit(10 + p113 * 3)
    end
    task.delay(1, function() --[[ Line: 593 ]]
        --[[
        Upvalues:
            [1] = u114
        --]]
        u114:DoCleaning()
    end)
end
function u30.zapProjectileOnhit(_, p117, p118) --[[ Line: 597 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u9
        [4] = u10
        [5] = u17
        [6] = u15
        [7] = u13
    --]]
    u5:playSound(u28.JELLYFISH_ZAP_1, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p117
    })
    local u119 = u9.new()
    local v120 = u10("Part", {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Size"] = Vector3.new(p118, p118, p118),
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p117,
        ["Parent"] = u17
    })
    u119:GiveTask(v120)
    local v121 = u15.Assets.Effects.CustomEffects:WaitForChild("Zap", 3)
    if v121 ~= nil then
        v121 = v121:Clone()
    end
    if v121 then
        u13:AddTag(v121, "FirstPersonHidden")
        v121.Parent = v120
        v121:Emit(10 + p118 * 3)
    end
    task.delay(1, function() --[[ Line: 628 ]]
        --[[
        Upvalues:
            [1] = u119
        --]]
        u119:DoCleaning()
    end)
end
function u30.groundedProjectileOnhit(_, p122, u123) --[[ Line: 632 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
        [3] = u5
        [4] = u28
    --]]
    local u124 = u15.Assets.Effects.EggExplosion:Clone()
    u124.Parent = u17
    u124.Position = p122
    u5:playSound(u28.GLUE_ENCHANT_01, {
        ["rollOffMaxDistance"] = 220,
        ["volumeMultiplier"] = 2,
        ["position"] = p122
    })
    local v125 = u124:GetDescendants()
    local function v127(p126) --[[ Line: 642 ]]
        --[[
        Upvalues:
            [1] = u123
        --]]
        if p126:IsA("ParticleEmitter") then
            p126:Emit(30)
            p126.Speed = NumberRange.new(u123 / p126.Lifetime.Max, u123 / p126.Lifetime.Max)
            p126:Emit(15)
        end
    end
    for v128, v129 in v125 do
        v127(v129, v128 - 1, v125)
    end
    task.delay(1, function() --[[ Line: 653 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        return u124:Destroy()
    end)
end
function u30.silenceProjectileOnhit(_, p130, p131) --[[ Line: 657 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u9
        [4] = u10
        [5] = u17
        [6] = u15
        [7] = u13
    --]]
    u5:playSound(u28.SPEAR_HIT, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p130
    })
    local u132 = u9.new()
    local v133 = u10("Part", {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Size"] = Vector3.new(p131, p131, p131),
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p130,
        ["Parent"] = u17
    })
    u132:GiveTask(v133)
    local v134 = u15.Assets.Effects.CustomEffects:WaitForChild("Silence", 3)
    if v134 ~= nil then
        v134 = v134:Clone()
    end
    if v134 then
        u13:AddTag(v134, "FirstPersonHidden")
        v134.Parent = v133
        v134:Emit(10 + p131 * 3)
    end
    task.delay(1, function() --[[ Line: 688 ]]
        --[[
        Upvalues:
            [1] = u132
        --]]
        u132:DoCleaning()
    end)
end
function u30.regenProjectileOnhit(_, p135, p136) --[[ Line: 692 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u9
        [4] = u10
        [5] = u17
        [6] = u15
        [7] = u13
    --]]
    u5:playSound(u28.HEALING_BACKPACK_USED, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p135
    })
    local u137 = u9.new()
    local v138 = u10("Part", {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Size"] = Vector3.new(p136, p136, p136),
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p135,
        ["Parent"] = u17
    })
    u137:GiveTask(v138)
    local v139 = u15.Assets.Effects.CustomEffects:WaitForChild("Healing", 3)
    if v139 ~= nil then
        v139 = v139:Clone()
    end
    if v139 then
        u13:AddTag(v139, "FirstPersonHidden")
        v139.EmissionDirection = Enum.NormalId.Top
        v139.Parent = v138
        v139:Emit(10 + p136 * 3)
    end
    task.delay(1, function() --[[ Line: 724 ]]
        --[[
        Upvalues:
            [1] = u137
        --]]
        u137:DoCleaning()
    end)
end
function u30.shieldProjectileOnhit(_, p140, p141) --[[ Line: 728 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u9
        [4] = u10
        [5] = u17
        [6] = u15
        [7] = u13
    --]]
    u5:playSound(u28.STONE_SHIELD_REACTIVE, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p140
    })
    local u142 = u9.new()
    local v143 = u10("Part", {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Size"] = Vector3.new(p141, p141, p141),
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p140,
        ["Parent"] = u17
    })
    u142:GiveTask(v143)
    local v144 = u15.Assets.Effects.CustomEffects:WaitForChild("Shield", 3)
    if v144 ~= nil then
        v144 = v144:Clone()
    end
    if v144 then
        v144.EmissionDirection = Enum.NormalId.Top
        u13:AddTag(v144, "FirstPersonHidden")
        v144.Parent = v143
        v144:Emit(10 + p141 * 3)
    end
    task.delay(1, function() --[[ Line: 760 ]]
        --[[
        Upvalues:
            [1] = u142
        --]]
        u142:DoCleaning()
    end)
end
u7.CreateController(u30.new())
return nil