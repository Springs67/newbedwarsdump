local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frosty-hammer-balance").FrostyHammerBalance
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-util").FrostyHammerUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "AdetundeController"
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
        [3] = u30
        [4] = u25
        [5] = u18
    --]]
    u32.constructor(p36, u24.FROSTY_HAMMER, {
        ["sounds"] = {
            u30.FROST_HAMMER_SLAM,
            u30.ICICLE_IMPACT_1,
            u30.ICICLE_IMPACT_2,
            u30.ICICLE_BREAK_1,
            u30.ICICLE_BREAK_2,
            u30.FROST_SHIELD_SUMMON
        },
        ["imageIds"] = { u25.SKATING_ON_ICE, u25.SKATING_MAX_SPEED, u25.SKATING_JUMP },
        ["animations"] = { u18.FROSTY_SHIELD_SUMMON, u18.FROSTY_HAMMER_SLAM, u18.FROSTY_HAMMER_UPGRADE }
    })
    p36.Name = "AdetundeController"
    p36.upgradeMap = {}
end
function u33.KnitStart(p37) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    u32.KnitStart(p37)
end
function u33.onKitLocalActivated(_, _) --[[ Line: 60 ]] end
function u33.onKitLocalDeactivated(_) --[[ Line: 62 ]] end
function u33.onKitReplicationActivated(u38, p39) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
        [3] = u27
        [4] = u21
        [5] = u26
        [6] = u12
        [7] = u23
        [8] = u22
        [9] = u28
        [10] = u3
        [11] = u19
        [12] = u18
        [13] = u8
        [14] = u4
        [15] = u7
        [16] = u30
        [17] = u5
    --]]
    p39:GiveTask(u17.SwordSwing:setPriority(u9.HIGHEST):connect(function(p40) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u21
            [3] = u26
            [4] = u12
            [5] = u23
            [6] = u22
        --]]
        if p40.swordType == u27.FROSTY_HAMMER then
            if not u21:getLocalPlayerEntity() then
                return nil
            end
            if not u26.getToolFromInventory(u12.LocalPlayer, u27.FROSTY_HAMMER) then
                return nil
            end
            local v41 = u23.getUpgradesFromHammer(u12.LocalPlayer)
            local v42 = u23
            local v43 = u22.SPEED
            p40.attackSpeed = v42.getAttackSpeed(v41[v43])
            if u12.LocalPlayer:GetAttribute("HammerHitCount") == 0 then
                p40.attackSpeed = 1
            end
        end
    end))
    p39:GiveTask(u17.SwordSwing:setPriority(u9.LOW):connect(function(p44) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if p44.swordType == u27.FROSTY_HAMMER then
            p44.bufferTime = nil
        end
    end))
    u28.Client:Get("FrostyHammerStrike"):Connect(function(p45) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
            [3] = u18
            [4] = u12
            [5] = u8
            [6] = u4
            [7] = u7
            [8] = u30
        --]]
        u3:playAnimation(p45.player, u19:getAssetId(u18.FROSTY_HAMMER_SLAM), {
            ["looped"] = false
        })
        if p45.player == u12.LocalPlayer then
            u8.Controllers.ViewmodelController:playAnimation(u18.JUGGERNAUT_ATTACK_3_FP)
        end
        local v46 = p45.player.Character
        if v46 ~= nil then
            v46 = v46.PrimaryPart
            if v46 ~= nil then
                v46 = v46.Position
            end
        end
        local v47 = u4
        local v48 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(p45.player)
        if v48 ~= nil then
            v48 = v48.adetunde
            if v48 ~= nil then
                v48 = v48.slamSound
            end
        end
        if v48 == nil then
            v48 = u30.FROST_HAMMER_SLAM
        end
        v47:playSound(v48, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = v46
        })
    end)
    u28.Client:Get("FrostyHammerStrikeEffect"):Connect(function(p49) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u4
            [3] = u30
        --]]
        local v50 = u38
        local v51 = p49.center
        local v52 = p49.count
        v50:playSlamEffect(v51, v52 == nil and 0 or v52, p49.player)
        if p49.count == 1 then
            u4:playSound(u30.ICICLE_IMPACT_1, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = p49.center.Position
            })
        elseif p49.count == 2 then
            u4:playSound(u30.ICICLE_IMPACT_2, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = p49.center.Position
            })
        end
    end)
    u28.Client:Get("FrostShieldAdded"):Connect(function(p53) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
            [3] = u18
            [4] = u4
            [5] = u7
            [6] = u30
            [7] = u38
        --]]
        local v54 = u3:playAnimation(p53.player, u19:getAssetId(u18.FROSTY_SHIELD_SUMMON))
        if v54 ~= nil then
            v54:AdjustSpeed(2)
        end
        local v55 = u4
        local v56 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(p53.player)
        if v56 ~= nil then
            v56 = v56.adetunde
            if v56 ~= nil then
                v56 = v56.shieldSound
            end
        end
        if v56 == nil then
            v56 = u30.FROST_SHIELD_SUMMON
        end
        local v57 = {}
        local v58 = p53.player.Character
        if v58 ~= nil then
            v58 = v58.PrimaryPart
            if v58 ~= nil then
                v58 = v58.Position
            end
        end
        v57.position = v58
        v57.rollOffMaxDistance = 220
        v55:playSound(v56, v57)
        u38:equipFrostArmor(p53.player)
    end)
    u5(function(_, u59) --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u59:GetAttributeChangedSignal("StormStack"):Connect(function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u38
            --]]
            local v60 = u59:GetAttribute("StormStack")
            u38:handleStormEffect(u59, v60 == nil and 0 or v60)
        end)
        u59:GetAttributeChangedSignal("StormStartTime"):Connect(function() --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u38
            --]]
            local v61 = u59:GetAttribute("StormStartTime")
            if v61 == 0 or (v61 ~= v61 or (v61 == "" or not v61)) then
                u38:removeStrom(u59)
            end
        end)
    end)
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 193 ]] end
function u33.onInnateAbilityEnabled(_, _, _) --[[ Line: 195 ]] end
function u33.onAbilityUsed(_, _, _) --[[ Line: 197 ]] end
function u33.equipFrostArmor(u62, u63) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u31
        [4] = u10
        [5] = u21
        [6] = u29
    --]]
    print("AdetundeController: equipFrostArmor ", u63.Name)
    local v64 = u63.Character
    if not v64 then
        return nil
    end
    local v65 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(u63)
    if v65 ~= nil then
        v65 = v65.adetunde
    end
    local v66
    if v65 == nil then
        v66 = v65
    else
        v66 = v65.frostArmorLeft:Clone()
    end
    if v66 == nil then
        v66 = u13.Assets.Effects.FrostArmorLeft:Clone()
    end
    local v67
    if v65 == nil then
        v67 = v65
    else
        v67 = v65.frostArmorRight:Clone()
    end
    if v67 == nil then
        v67 = u13.Assets.Effects.FrostArmorRight:Clone()
    end
    local v68
    if v65 == nil then
        v68 = v65
    else
        v68 = v65.frostVest:Clone()
    end
    if v68 == nil then
        v68 = u13.Assets.Effects.FrostVest:Clone()
    end
    local v69
    if v65 == nil then
        v69 = v65
    else
        v69 = v65.frostHelmet:Clone()
    end
    if v69 == nil then
        v69 = u13.Assets.Effects.FrostHelmet:Clone()
    end
    local u70 = {
        v66,
        v67,
        v68,
        v69
    }
    for v71, v72 in u70 do
        local _ = v71 - 1
        v72.Parent = v64
    end
    u31:weldCharacterAccessories(v64)
    local v73 = u70[3]:FindFirstChild("Handle")
    if v65 ~= nil then
        v65 = v65.frostShieldChargingEffect
        if v65 ~= nil then
            v65 = v65:Clone()
        end
    end
    if v65 == nil then
        v65 = u13.Assets.Effects.FrostShieldCharging:Clone()
    end
    v65.Position = v73.Position
    v65.Parent = v73
    u10("WeldConstraint", {
        ["Part0"] = v65,
        ["Part1"] = v73,
        ["Parent"] = v65
    })
    local v74 = u13.Assets.Effects.FrostShieldEffect:Clone()
    local v75 = v74:FindFirstChild("TrailLibrary")
    if not v75 then
        return nil
    end
    require(v75).InwardTrail:Init({
        ["EndPoint"] = v73
    }, {
        ["Duration"] = 0.3,
        ["Offset"] = 17,
        ["Radius"] = 13,
        ["Count"] = 9,
        ["Interval"] = 0.03,
        ["Easing"] = "Linear"
    })
    local v76 = u21:getEntity(u63)
    local u77 = nil
    if v76 ~= nil then
        v76 = v76:getInstance():GetAttributeChangedSignal("Shield_" .. u29.FROSTY_SHIELD):Connect(function() --[[ Line: 294 ]]
            --[[
            Upvalues:
                [1] = u70
                [2] = u77
                [3] = u62
                [4] = u63
            --]]
            for v78, v79 in u70 do
                local _ = v78 - 1
                v79:Destroy()
                local v80 = u77
                if v80 ~= nil then
                    v80:Disconnect()
                end
                u62:frostShieldBreakAnimation(u63)
            end
        end)
    end
    local v81 = false
    local v82 = 0
    while true do
        if v81 then
            v82 = v82 + 1
        else
            v81 = true
        end
        if v82 >= 7 then
            v65:Destroy()
            v74:Destroy()
            return
        end
        for v83, v84 in u70 do
            local _ = v83 - 1
            local v85 = v84:FindFirstChild("Handle")
            v85.Transparency = v85.Transparency - 0.1
        end
        task.wait(0.1)
    end
end
function u33.frostShieldBreakAnimation(_, p86) --[[ Line: 335 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u4
        [4] = u30
        [5] = u10
    --]]
    local u87 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(p86)
    if u87 ~= nil then
        u87 = u87.adetunde
    end
    if u87 ~= nil then
        u87 = u87.frostShieldBreakEffect
        if u87 ~= nil then
            u87 = u87:Clone()
        end
    end
    if u87 == nil then
        u87 = u13.Assets.Effects.FrostShieldBreak:Clone()
    end
    local v88 = p86.Character
    if v88 ~= nil then
        v88 = v88.PrimaryPart
    end
    if not v88 then
        return nil
    end
    u87.Position = v88.Position
    local v89 = u4
    local v90 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(p86)
    if v90 ~= nil then
        v90 = v90.adetunde
        if v90 ~= nil then
            v90 = v90.shieldBlastSound
        end
    end
    if v90 == nil then
        v90 = u30.FROST_SHIELD_EXPLOSION
    end
    v89:playSound(v90, {
        ["rollOffMaxDistance"] = 220,
        ["position"] = v88.Position
    })
    u10("WeldConstraint", {
        ["Part0"] = u87,
        ["Part1"] = v88,
        ["Parent"] = u87
    })
    u87.Parent = v88
    for v91, v92 in u87:GetDescendants() do
        local _ = v91 - 1
        if v92:IsA("ParticleEmitter") then
            v92:Emit(20)
        end
    end
    task.delay(1, function() --[[ Line: 393 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87:Destroy()
    end)
end
function u33.playSlamEffect(_, p93, p94, p95) --[[ Line: 397 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u15
    --]]
    local u96 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(p95)
    if u96 ~= nil then
        u96 = u96.adetunde
    end
    if u96 ~= nil then
        u96 = u96.frostHammerSlamEffect:Clone()
    end
    if u96 == nil then
        u96 = u13.Assets.Effects.FrostHammerSlamEffect:Clone()
    end
    u96.CFrame = p93 * CFrame.Angles(1.5707963267948966, 0, 0) - Vector3.new(0, 2, 0)
    u96.Anchored = true
    u96.Parent = u15
    local v97 = 30 - p94 * 10
    for v98, v99 in u96:GetDescendants() do
        local _ = v98 - 1
        if v99:IsA("ParticleEmitter") then
            v99:Emit(v97 * 2)
        end
    end
    task.delay(1, function() --[[ Line: 428 ]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96:Destroy()
    end)
end
function u33.handleStormEffect(_, u100, p101) --[[ Line: 432 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u13
        [4] = u10
        [5] = u20
        [6] = u4
        [7] = u30
        [8] = u14
    --]]
    local u102 = u7.Controllers.KitSkinController:getCharacterKitSkinMeta(u100)
    if u102 ~= nil then
        u102 = u102.adetunde
    end
    local u103 = nil
    for v104, v105 in u100:GetChildren() do
        local _ = v104 - 1
        local v106 = u16.includes(v105.Name, "FrostHammerStorm")
        if v106 then
            v106 = v105:IsA("Model")
        end
        if v106 == true then
            u103 = v105
            break
        end
    end
    if not u103 and p101 > 0 then
        if u102 == nil then
            u103 = u102
        else
            u103 = u102.frostHammerStormEffect:Clone()
        end
        if u103 == nil then
            u103 = u13.Assets.Effects.FrostHammerStorm:Clone()
        end
        u103:PivotTo(u100:GetPrimaryPartCFrame() - Vector3.new(0, 6, 0))
        u10("WeldConstraint", {
            ["Part0"] = u103.PrimaryPart,
            ["Part1"] = u100.PrimaryPart,
            ["Parent"] = u103.PrimaryPart
        })
        u103.Parent = u100
    end
    if p101 >= 1 then
        if u103 ~= nil then
            local v107 = u103.PrimaryPart
            if v107 ~= nil then
                v107 = v107:FindFirstChild("Aura")
                if v107 ~= nil then
                    v107 = v107:FindFirstChild("Level1")
                end
            end
        end
        if v107 then
            v107:Emit(30)
        end
    end
    if p101 >= 2 then
        if u103 ~= nil then
            local v108 = u103.PrimaryPart
            if v108 ~= nil then
                v108 = v108:FindFirstChild("Aura")
                if v108 ~= nil then
                    v108 = v108:FindFirstChild("Level2")
                end
            end
        end
        if v108 then
            v108:Emit(30)
        end
    end
    if u20.STORM_STACK_REQ <= p101 then
        if u103 ~= nil then
            for v109, v110 in u103:GetDescendants() do
                local _ = v109 - 1
                if v110:IsA("ParticleEmitter") then
                    v110.Enabled = true
                end
            end
        end
        local v111 = u4
        local v112 = u7.Controllers.KitSkinController:getCharacterKitSkinMeta(u100)
        if v112 ~= nil then
            v112 = v112.adetunde
            if v112 ~= nil then
                v112 = v112.stormStartSound
            end
        end
        if v112 == nil then
            v112 = u30.FROST_STORM_START
        end
        local v113 = {}
        if u103 ~= nil then
            local v114 = u103.PrimaryPart
            if v114 ~= nil then
                v114 = v114.Position
            end
        end
        v113.position = v114
        v113.rollOffMaxDistance = 220
        v111:playSound(v112, v113)
        local v115 = {}
        local v116 = u7.Controllers.KitSkinController:getCharacterKitSkinMeta(u100)
        if v116 ~= nil then
            v116 = v116.adetunde
            if v116 ~= nil then
                v116 = v116.stormLoopSound
            end
        end
        if v116 == nil then
            v116 = u30.FROST_STORM_LOOP
        end
        v115.SoundId = v116
        v115.RollOffMinDistance = 20
        v115.RollOffMaxDistance = 40
        v115.Volume = 0.7
        v115.Playing = true
        v115.PlaybackSpeed = 1
        if u103 ~= nil then
            local v117 = u103.PrimaryPart
        end
        v115.Parent = v117
        v115.Looped = true
        u10("Sound", v115):Play()
        if u102 ~= nil then
            u102 = u102.auraEffect:Clone()
        end
        if u102 == nil then
            u102 = u13.Assets.Effects.FrostHammerAura:Clone()
        end
        u102.Parent = u103
        local u118 = 0
        local u119 = nil
        u119 = u14.Heartbeat:Connect(function(p120) --[[ Line: 585 ]]
            --[[
            Upvalues:
                [1] = u118
                [2] = u100
                [3] = u102
                [4] = u103
                [5] = u119
            --]]
            u118 = u118 + p120
            local v121 = u100:GetPrimaryPartCFrame()
            if u102 and v121 then
                u102.CFrame = CFrame.new(v121.Position) * CFrame.Angles(0, u118 * 0.8, 0)
            end
            local v122 = u103
            if v122 ~= nil then
                v122.Destroying:Connect(function() --[[ Line: 596 ]]
                    --[[
                    Upvalues:
                        [1] = u102
                        [2] = u119
                    --]]
                    u102:Destroy()
                    u119:Disconnect()
                end)
            end
        end)
    end
end
function u33.removeStrom(_, p123) --[[ Line: 604 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u4
        [3] = u7
        [4] = u30
        [5] = u15
    --]]
    local u124 = nil
    for v125, v126 in p123:GetChildren() do
        local _ = v125 - 1
        local v127 = u16.includes(v126.Name, "FrostHammerStorm")
        if v127 then
            v127 = v126:IsA("Model")
        end
        if v127 == true then
            u124 = v126
            break
        end
    end
    if u124 ~= nil then
        for v128, v129 in u124:GetDescendants() do
            local _ = v128 - 1
            if v129:IsA("ParticleEmitter") then
                v129.Enabled = false
            end
        end
    end
    local v130 = u4
    local v131 = u7.Controllers.KitSkinController:getCharacterKitSkinMeta(p123)
    if v131 ~= nil then
        v131 = v131.adetunde
        if v131 ~= nil then
            v131 = v131.stormEndSound
        end
    end
    if v131 == nil then
        v131 = u30.FROST_STORM_END
    end
    local v132 = {}
    local v133
    if u124 == nil then
        v133 = u124
    else
        v133 = u124.PrimaryPart
        if v133 ~= nil then
            v133 = v133.Position
        end
    end
    v132.position = v133
    v132.rollOffMaxDistance = 220
    v132.volumeMultiplier = 3
    v130:playSound(v131, v132)
    if u124 then
        u124.Parent = u15
        task.delay(0.5, function() --[[ Line: 658 ]]
            --[[
            Upvalues:
                [1] = u124
            --]]
            local v134 = u124
            if v134 ~= nil then
                v134:Destroy()
            end
        end)
    end
end
u7.CreateController(u33.new())
return nil