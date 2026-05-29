local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.SoundManager
local u7 = v3.WatchPlayerCharacter
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.ReplicatedStorage
local u15 = v12.RunService
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").SpiritGardenerEnergyAttr
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "SpiritGardenerController"
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
        [2] = u24
        [3] = u28
        [4] = u26
        [5] = u19
    --]]
    u32.constructor(p36, u24.SPIRIT_GARDENER, {
        ["sounds"] = {
            u28.SPIRIT_GARDENER_CHANNELING_LOOP,
            u28.SPIRIT_GARDENER_SPIRIT_ORB_COLLECTED,
            u28.SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT,
            u28.SPIRIT_GARDENER_BUFF_APPLIED
        },
        ["imageIds"] = {
            u26.SPIRIT_GARDENER_WATER_ICON,
            u26.SPIRIT_GARDENER_WATER_CANCEL_ICON,
            u26.CRYSTALHEART_SEED,
            u26.SOULVINE_SEED,
            u26.TEARBLOOM_SEED,
            u26.SOULVINE_FLOWER,
            u26.TEARBLOOM_FLOWER
        },
        ["animations"] = { u19.SPIRIT_GARDENER_WATER }
    })
    p36.Name = "SpiritGardenerController"
    p36.chargeMaid = {}
end
function u33.KnitStart(p37) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    u32.KnitStart(p37)
end
function u33.onKitLocalActivated(_, p38) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u13
        [4] = u29
        [5] = u24
    --]]
    local u39 = u10.Controllers.SpiritGardenerSeedController:listenToPickup()
    if u39 then
        p38:GiveTask(function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            return u39.Destroy()
        end)
    end
    p38:GiveTask(u7(u13.LocalPlayer, function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u13
            [3] = u24
            [4] = u10
        --]]
        if u29(u13.LocalPlayer, u24.SPIRIT_GARDENER) then
            u10.Controllers.SpiritGardenerEnergyUiController:mountSpiritEnergyUi()
        else
            u10.Controllers.SpiritGardenerEnergyUiController:unmountSpiritEnergyUi()
        end
    end))
    u10.Controllers.SpiritGardenerEnergyUiController:mountSpiritEnergyUi()
end
function u33.onKitLocalDeactivated(_) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.Controllers.SpiritGardenerEnergyUiController:unmountSpiritEnergyUi()
end
function u33.onKitReplicationActivated(u40, _) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u13
        [3] = u2
        [4] = u17
        [5] = u18
        [6] = u21
        [7] = u30
        [8] = u25
        [9] = u22
    --]]
    u27.Client:Get("SpiritGardenerStopChanneling"):Connect(function(p41) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u13
            [3] = u2
            [4] = u17
            [5] = u18
        --]]
        if u40.chargeMaid[p41.entityInstance] ~= nil then
            u40.chargeMaid[p41.entityInstance]:DoCleaning()
            if p41.entityInstance == u13.LocalPlayer.Character then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u17.SPIRIT_GARDENER_WATER_CANCEL)
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u17.SPIRIT_GARDENER_WATER, u18[u17.SPIRIT_GARDENER_WATER].triggerConfig)
            end
        end
    end)
    u13.LocalPlayer:GetAttributeChangedSignal(u21.Name):Connect(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u13
            [3] = u21
            [4] = u25
            [5] = u40
            [6] = u22
            [7] = u2
            [8] = u17
            [9] = u18
            [10] = u27
        --]]
        local v42 = u30(u13.LocalPlayer, u21)
        local v43 = v42 == nil and 0 or v42
        if v43 < u25.WATER_ENERGY_COST_PER_FLOWER_PER_SECOND then
            u40:disableWaterAbility(u13.LocalPlayer)
        else
            u40:enableWaterAbility(u13.LocalPlayer)
        end
        if v43 < u25.WATER_ENERGY_COST_PER_FLOWER_PER_SECOND then
            local v44 = u22:getEntity(u13.LocalPlayer)
            if v44 ~= nil then
                v44 = v44:getInstance()
            end
            if v44 and u40.chargeMaid[v44] ~= nil then
                u40.chargeMaid[v44]:DoCleaning()
                u40.chargeMaid[v44] = nil
                if v44 == u13.LocalPlayer.Character then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u17.SPIRIT_GARDENER_WATER_CANCEL)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u17.SPIRIT_GARDENER_WATER, u18[u17.SPIRIT_GARDENER_WATER].triggerConfig)
                    u40:disableWaterAbility(u13.LocalPlayer)
                    u27.Client:Get("ClientSpiritGardenerStopChanneling"):SendToServer({
                        ["entityInstance"] = v44
                    })
                end
            end
        end
    end)
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 126 ]] end
function u33.onInnateAbilityEnabled(p45, _, _) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    p45:disableWaterAbility(u13.LocalPlayer)
end
function u33.onAbilityUsed(p46, p47, p48) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
    --]]
    if p48.ability == u17.SPIRIT_GARDENER_WATER then
        if p46.chargeMaid[p47] == nil then
            p46.chargeMaid[p47] = u11.new()
        end
        p46:disableActionsOnCharge(p46.chargeMaid[p47], p47)
        p46:playChannelEffects(p47)
    end
    if p48.ability == u17.SPIRIT_GARDENER_WATER_CANCEL and p46.chargeMaid[p47] ~= nil then
        p46.chargeMaid[p47]:DoCleaning()
        p46.chargeMaid[p47] = nil
    end
end
function u33.disableActionsOnCharge(_, p49, p50) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u16
    --]]
    if p50 == u13.LocalPlayer.Character then
        local u51 = u9.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["jumpHeightMultiplier"] = 0
        })
        u9.Controllers.SwordController:toggleSwordSwing(true)
        u9.Controllers.BlockPlacementController:disableBlockPlacer()
        local u53 = u16.BeginProjectileTargeting:connect(function(p52) --[[ Line: 167 ]]
            p52:setCancelled(true)
            return nil
        end)
        p49:GiveTask(function() --[[ Line: 171 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u53
                [3] = u51
            --]]
            u9.Controllers.SwordController:toggleSwordSwing(false)
            u9.Controllers.BlockPlacementController:enableBlockPlacer()
            u53:Destroy()
            u51.Destroy()
        end)
    end
end
function u33.playChannelEffects(p54, u55) --[[ Line: 179 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u9
        [3] = u23
        [4] = u14
        [5] = u31
        [6] = u5
        [7] = u20
        [8] = u19
        [9] = u13
        [10] = u6
        [11] = u15
        [12] = u27
    --]]
    local v56 = u28.SPIRIT_GARDENER_CHANNELING_LOOP
    local v57 = u23[u9.Controllers.KitSkinController:getKitSkin(u55)].grove
    local u58
    if v57 then
        u58 = v57.channelEffect:Clone()
        v56 = v57.channelLoopSound
    else
        u58 = u14.Assets.Effects.SpiritGardenerChannelEffect:Clone()
    end
    if not u55 then
        return nil
    end
    u58.Parent = u55
    u58.Massless = true
    u58.CFrame = u55.HumanoidRootPart.CFrame
    local u59 = u31:weldParts(u55.HumanoidRootPart, u58)
    local v60 = u58:GetDescendants()
    local function v62(p61) --[[ Line: 199 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u31
        --]]
        if p61:IsA("ParticleEmitter") then
            p61.Enabled = true
            p61:Emit(1)
        end
        if u58 and p61:IsA("Part") then
            p61.CFrame = u58.CFrame - Vector3.new(0, 3, 0)
            u31:weldParts(u58, p61)
        end
    end
    for v63, v64 in v60 do
        v62(v64, v63 - 1, v60)
    end
    local u65 = u5:playAnimation(u55, u20:getAssetId(u19.SPIRIT_GARDENER_WATER), {
        ["looped"] = true
    })
    if u13.LocalPlayer.Character == u55 then
        local u66 = u6:playSound(v56, {
            ["volumeMultiplier"] = 0.5,
            ["looped"] = true
        })
        p54.chargeMaid[u55]:GiveTask(function() --[[ Line: 224 ]]
            --[[
            Upvalues:
                [1] = u66
            --]]
            u66:Stop()
        end)
    end
    u65.Priority = Enum.AnimationPriority.Action4
    p54.chargeMaid[u55]:GiveTask(function() --[[ Line: 231 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u65
            [3] = u58
        --]]
        local v67 = u59
        if v67 ~= nil then
            v67:Destroy()
        end
        local v68 = u65
        if v68 ~= nil then
            v68:Stop()
        end
        local v69 = u58
        if v69 ~= nil then
            v69:Destroy()
        end
    end)
    local u70 = u55.PrimaryPart
    if not u70 then
        return nil
    end
    local u71 = u70.Position
    p54.chargeMaid[u55]:GiveTask(u15.Heartbeat:Connect(function() --[[ Line: 252 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u70
            [3] = u27
            [4] = u55
        --]]
        if not u71 or (u70.Position - u71).Magnitude > 0.6 then
            local v72 = {
                ["entityInstance"] = u55
            }
            u27.Client:Get("ClientSpiritGardenerStopChanneling"):SendToServer(v72)
        end
    end))
end
function u33.disableWaterAbility(p73, p74) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u17
        [4] = u4
    --]]
    if p74 ~= u13.LocalPlayer then
        return nil
    end
    p73.waterAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u17.SPIRIT_GARDENER_WATER)
    if not p73.waterAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p73.waterAbility, u4.DISABLED)
end
function u33.enableWaterAbility(p75, p76) --[[ Line: 270 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u4
    --]]
    if p76 ~= u13.LocalPlayer then
        return nil
    end
    if not p75.waterAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p75.waterAbility, u4.READY)
end
u9.CreateController(u33.new())
return nil