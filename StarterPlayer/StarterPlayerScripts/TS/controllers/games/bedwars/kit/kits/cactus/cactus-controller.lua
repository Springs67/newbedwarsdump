local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local v5 = v3.ConstantManager
local u6 = v3.DeviceUtil
local u7 = v3.GameQueryUtil
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out", "sync-event-priority").SyncEventPriority
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u12 = v11.InQuad
local u13 = v11.Linear
local u14 = v11.OutQuad
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.CollectionService
local u19 = v17.Players
local u20 = v17.ReplicatedStorage
local u21 = v17.RunService
local u22 = v17.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cactus-balance").CactusBalance
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u36 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u37 = v5.registerConstants(script, {
    ["offset"] = 0.58
})
local u38 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 2),
    NumberSequenceKeypoint.new(0.1, 3),
    NumberSequenceKeypoint.new(0.2, 5),
    NumberSequenceKeypoint.new(0.3, 10),
    NumberSequenceKeypoint.new(0.4, 15),
    NumberSequenceKeypoint.new(0.5, 20),
    NumberSequenceKeypoint.new(0.6, 25),
    NumberSequenceKeypoint.new(0.7, 30),
    NumberSequenceKeypoint.new(0.8, 30),
    NumberSequenceKeypoint.new(0.9, 30),
    NumberSequenceKeypoint.new(1, 30)
})
local u39 = {
    3,
    6,
    8,
    10
}
local u40 = {
    u35.CACTUS_ABSORB_1,
    u35.CACTUS_ABSORB_2,
    u35.CACTUS_ABSORB_3,
    u35.CACTUS_ABSORB_4
}
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "CactusController"
    end,
    ["__index"] = u36
})
u41.__index = u41
function u41.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u27
        [3] = u35
        [4] = u40
        [5] = u36
        [6] = u15
    --]]
    local v45 = u32.CACTUS
    local v46 = {
        ["animations"] = { u27.CACTUS_CAST }
    }
    local v47 = { u35.CACTUS_ATTACH, u35.CACTUS_LOOP }
    local v48 = #v47
    table.move(u40, 1, #u40, v48 + 1, v47)
    v46.sounds = v47
    u36.constructor(p44, v45, v46)
    p44.Name = "CactusController"
    p44.chargeMaid = u15.new()
    p44.buttonMaid = u15.new()
    p44.linkMap = {}
    p44.linkCount = {}
    p44.loopSoundMap = {}
end
function u41.KnitStart(p49) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    u36.KnitStart(p49)
end
function u41.onKitLocalActivated(u50, p51) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u26
        [4] = u24
        [5] = u10
        [6] = u29
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u25.CACTUS_FIRE, u26[u25.CACTUS_FIRE].triggerConfig):andThen(function(p52) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50.buttonMaid:GiveTask(p52)
        u50.abilityRef = p52
    end)
    u50.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u25.CACTUS_FIRE)
    p51:GiveTask(u24.SwordSwing:setPriority(u10.HIGHEST):connect(function(p53) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        p53.attackSpeed = p53.attackSpeed + u29.ATTACK_SPEED_MODIFY
        p53.config = {
            ["respectAttackSpeedOverride"] = true
        }
    end))
    p51:GiveTask(u24.SwordSwing:setPriority(u10.HIGHEST):connect(function(p54) --[[ Line: 93 ]]
        p54.config = {
            ["respectAttackSpeedOverride"] = true
        }
    end))
end
function u41.onKitLocalDeactivated(_) --[[ Line: 99 ]] end
function u41.onKitReplicationActivated(u55, p56) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u30
    --]]
    p56:GiveTask(u34.Client:Get("CactusLinkStart"):Connect(function(p57) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u55
        --]]
        local v58 = p57.victim
        if not v58 then
            return nil
        end
        local v59 = u30:getEntity(v58)
        if v59 then
            u55:createLink(p57.user, v59, true, p57.id)
        end
    end))
    p56:GiveTask(u34.Client:Get("CactusLinkBreak"):Connect(function(p60) --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55:removeLink(p60.id, p60.user)
    end))
    p56:GiveTask(u34.Client:Get("CactusGainMaxHealth"):Connect(function(p61) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55:createSiphonEffect(p61.user, p61.victim, p61.effectSize)
    end))
end
function u41.onKitReplicationDeactivated(_) --[[ Line: 119 ]] end
function u41.onInnateAbilityEnabled(_, _, _) --[[ Line: 121 ]] end
function u41.onAbilityUsed(p62, p63, p64) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u20
        [3] = u35
        [4] = u8
        [5] = u22
        [6] = u38
        [7] = u4
        [8] = u28
        [9] = u27
    --]]
    if p64.ability == u25.CACTUS_FIRE then
        local v65 = p63.PrimaryPart
        if not v65 then
            return nil
        end
        p62:cactusEffect(p63)
        local u66 = u20.Assets.Effects.CactusPulse:Clone()
        local v67 = p62:getKitSkinData(p63)
        if v67 ~= nil then
            v67 = v67.cactusAttachSound
        end
        if v67 == nil then
            v67 = u35.CACTUS_ATTACH
        end
        u8:playSound(v67, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = v65.Position
        })
        if v65 ~= nil then
            v65 = v65.CFrame
        end
        u66:PivotTo(v65)
        u66.Parent = u22
        for v68, v69 in u66:WaitForChild("1", 1):GetChildren() do
            local _ = v68 - 1
            if v69:IsA("ParticleEmitter") then
                v69.Size = u38
                v69:Emit(1)
            end
        end
        task.delay(0.65, function() --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u66
            --]]
            return u66:Destroy()
        end)
        u4:playAnimation(p63, u28:getAssetId(u27.CACTUS_CAST))
    end
end
function u41.createAimLine(u70) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u22
        [3] = u16
        [4] = u20
        [5] = u7
        [6] = u6
        [7] = u18
        [8] = u21
        [9] = u33
    --]]
    local v71 = u19.LocalPlayer.Character
    if v71 ~= nil then
        v71 = v71.PrimaryPart
    end
    if not v71 then
        return nil
    end
    u70.aimLineOrigin = u16("Part", {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = false,
        ["Parent"] = u22
    })
    local u72 = u20.Assets.Effects.SorcererHitIndicator:Clone()
    u72.Parent = u22
    u70.aimLineEnd = u72
    u70.aimLineOrigin:PivotTo(u19.LocalPlayer.Character:GetPivot())
    local v73 = u16("WeldConstraint", {
        ["Part0"] = u70.aimLineOrigin,
        ["Part1"] = u19.LocalPlayer.Character.PrimaryPart,
        ["Parent"] = u19.LocalPlayer.Character
    })
    u70.chargeMaid:GiveTask(v73)
    u7:setQueryIgnored(u70.aimLineOrigin, true)
    u7:setQueryIgnored(u70.aimLineEnd, true)
    local v74 = u16("Attachment", {
        ["Parent"] = u70.aimLineOrigin
    })
    local v75 = u16("Attachment", {
        ["Parent"] = u70.aimLineEnd
    })
    local u76 = u6.isMobileControls() and 3 or 1
    local u77 = u16("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Brightness"] = 1,
        ["Attachment0"] = v74,
        ["Attachment1"] = v75,
        ["Color"] = ColorSequence.new(Color3.fromRGB(0, 82, 5)),
        ["Transparency"] = NumberSequence.new(0),
        ["Width0"] = u76 * 0.08,
        ["Width1"] = u76 * 0.08,
        ["Parent"] = u22
    })
    u18:AddTag(u77, "projectile-preview-beam")
    u70.chargeMaid:GiveTask(u77)
    local u78 = 0
    local v95 = u21.Heartbeat:Connect(function() --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u78
            [3] = u22
            [4] = u70
            [5] = u19
            [6] = u18
            [7] = u77
            [8] = u76
            [9] = u72
        --]]
        local v79 = u33.cactus
        local v80 = v79.launchVelocity
        local v81 = v80 == nil and 120 or v80
        local v82 = v79.lifetimeSec
        u78 = v81 * (v82 == nil and 2.8 or v82)
        local v83 = u22.CurrentCamera
        if v83 ~= nil then
            v83 = v83.CFrame
        end
        if v83 then
            local v84 = u70.aimLineOrigin
            if v84 ~= nil then
                v84 = v84.Position
            end
            if v84 then
                if u70.aimLineEnd then
                    local v85 = u19.LocalPlayer.Character
                    if v85 ~= nil then
                        v85 = v85:GetPivot().Position
                    end
                    if v85 then
                        local v86 = u70:getProjectileDirection()
                        local v87 = RaycastParams.new()
                        local v88 = {}
                        local v89 = #v88
                        local v90 = u18:GetTagged("DontBlockAbilityRaycast")
                        table.move(v90, 1, #v90, v89 + 1, v88)
                        v87.FilterDescendantsInstances = v88
                        v87.FilterType = Enum.RaycastFilterType.Exclude
                        local v91 = u22:Raycast(v85 + v86 * 5, v86 * u78, v87)
                        if v91 then
                            local v92 = u70.aimLineEnd
                            if v92 ~= nil then
                                v92:PivotTo(CFrame.new(v91.Position))
                            end
                            u77.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247))
                            u77.Width0 = u76 * 0.1
                            u77.Width1 = u76 * 0.1
                            u77.Transparency = NumberSequence.new(0)
                            u70.aimLineEnd.Color = Color3.new(1, 0.03, 0.9)
                            u70.aimLineEnd.Transparency = 0
                            u72.Attachment.ParticleEmitter.Enabled = true
                        else
                            local v93 = u70.aimLineOrigin.Position + v86 * u78
                            local v94 = u70.aimLineEnd
                            if v94 ~= nil then
                                v94:PivotTo(CFrame.new(v93))
                            end
                            u77.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255))
                            u77.Transparency = NumberSequence.new(0.3)
                            u77.Width0 = u76 * 0.08
                            u77.Width1 = u76 * 0.08
                            u70.aimLineEnd.Color = Color3.new(1, 0.95, 1)
                            u70.aimLineEnd.Transparency = 0.8
                            u72.Attachment.ParticleEmitter.Enabled = false
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
        else
            return nil
        end
    end)
    u70.chargeMaid:GiveTask(v95)
end
function u41.getProjectileDirection(_) --[[ Line: 300 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u9
    --]]
    local v96 = u22.CurrentCamera.CFrame.LookVector
    if u9.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        local v97 = v96.X
        local v98 = v96.Y + 0.3
        local v99 = v96.Z
        v96 = Vector3.new(v97, v98, v99)
    end
    return v96
end
function u41.createLink(u100, p101, p102, _, u103) --[[ Line: 308 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u35
        [3] = u16
        [4] = u22
        [5] = u20
        [6] = u21
        [7] = u29
    --]]
    local v104 = u100:spikeEffect(p101, p102:getInstance())
    local v105 = p101.Character
    local u106 = p102:getInstance()
    local v107 = ColorSequence.new(Color3.fromRGB(0, 69, 10))
    if p101.Team ~= u19.LocalPlayer.Team then
        v107 = ColorSequence.new(Color3.fromRGB(250, 0, 0))
    end
    if not (v105 and u106) then
        return nil
    end
    if u100.loopSoundMap[p101] == nil then
        local v108 = u100:getKitSkinData(p101.Character)
        if v108 ~= nil then
            v108 = v108.cactusLoopSound
        end
        if v108 == nil then
            v108 = u35.CACTUS_LOOP
        end
        local v109 = u16("Sound", {
            ["RollOffMinDistance"] = 20,
            ["RollOffMaxDistance"] = 40,
            ["Volume"] = 1,
            ["Playing"] = true,
            ["Looped"] = true,
            ["SoundId"] = v108,
            ["Parent"] = v105.PrimaryPart
        })
        u100.loopSoundMap[p101] = v109
    end
    local u110 = v105:FindFirstChild("UpperTorso")
    if u110 ~= nil then
        u110 = u110:FindFirstChild("BodyBackAttachment")
    end
    local u111 = u16("Model", {
        ["Parent"] = u22
    })
    if v104 then
        v104.Parent = u111
    end
    if u106 ~= nil then
        u106 = u106:WaitForChild("UpperTorso", 1)
        if u106 ~= nil then
            u106 = u106:WaitForChild("BodyFrontAttachment", 1)
        end
    end
    local u112 = {}
    if u110 and u106 then
        local v113 = u20.Assets.Effects.CactusLine:Clone()
        v113.Parent = u111
        for v114, v115 in v113:GetChildren() do
            local _ = v114 - 1
            if v115:IsA("Beam") then
                table.insert(u112, v115)
                v115.Attachment0 = u106
                v115.Attachment1 = u110
                v115.Color = v107
            end
        end
        local v116 = (u110.WorldPosition - u106.WorldPosition).Magnitude / 5 * 0.1 + 0.1
        task.delay(v116, function() --[[ Line: 387 ]]
            --[[
            Upvalues:
                [1] = u112
            --]]
            for v117, v118 in u112 do
                local _ = v117 - 1
                v118.Enabled = true
            end
        end)
        local u119 = nil
        u119 = u21.Heartbeat:Connect(function(_) --[[ Line: 396 ]]
            --[[
            Upvalues:
                [1] = u100
                [2] = u103
                [3] = u119
                [4] = u111
                [5] = u22
                [6] = u110
                [7] = u106
                [8] = u29
                [9] = u112
            --]]
            if u100.linkMap[u103] == nil then
                u119:Disconnect()
                return nil
            elseif u111.Parent == u22 then
                if u110 and u106 then
                    local v120 = (u110.WorldPosition - u106.WorldPosition).Magnitude
                    if u29.LINK_DISTANCE < v120 then
                        for v121, v122 in u112 do
                            local _ = v121 - 1
                            v122.Width0 = 0
                            v122.Width1 = 0
                        end
                    else
                        local v123 = (1.05 - v120 / u29.LINK_DISTANCE) * 10
                        local v124 = math.min(5, v123)
                        for v125, v126 in u112 do
                            local _ = v125 - 1
                            v126.Width0 = v124
                            v126.Width1 = v124
                        end
                    end
                else
                    u119:Disconnect()
                    return nil
                end
            else
                u119:Disconnect()
                return nil
            end
        end)
        u100.linkMap[u103] = u111
        local v127 = u100.linkCount[p101]
        local v128 = v127 == nil and 0 or v127
        u100.linkCount[p101] = v128 + 1
    end
end
function u41.removeLink(p129, p130, p131) --[[ Line: 449 ]]
    local v132 = p129.linkMap[p130]
    if v132 then
        v132:Destroy()
    end
    p129.linkMap[p130] = nil
    local v133 = p129.linkCount[p131]
    local v134 = (v133 == nil and 1 or v133) - 1
    p129.linkCount[p131] = v134
    local v135 = v134 <= 0
    if v135 then
        v135 = p129.loopSoundMap[p131] ~= nil
    end
    if v135 then
        local v136 = p129.loopSoundMap[p131]
        if v136 ~= nil then
            v136:Destroy()
        end
        p129.loopSoundMap[p131] = nil
    end
end
function u41.createSiphonEffect(p137, u138, u139, p140) --[[ Line: 488 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u22
        [3] = u37
        [4] = u15
        [5] = u39
        [6] = u40
        [7] = u8
        [8] = u21
    --]]
    local u141 = u20.Assets.Effects.CactusSiphon:Clone()
    u141.Parent = u22
    for v142, v143 in u141:GetDescendants() do
        local _ = v142 - 1
        if v143:IsA("Beam") then
            v143:SetTextureOffset(u37.offset)
            v143.TextureSpeed = 1.1
        end
    end
    local u144 = u15.new()
    local v145 = u138.Character
    if v145 ~= nil then
        v145 = v145.PrimaryPart
        if v145 ~= nil then
            v145 = v145.Position
        end
    end
    local v146 = (table.find(u39, p140) or 0) - 1
    local v147 = u141.destination:GetChildren()
    local v148 = false
    local v149 = 0
    while true do
        if v148 then
            v149 = v149 + 1
        else
            v148 = true
        end
        if v149 > v146 then
            if v145 and v146 >= 0 then
                local v150 = p137:getKitSkinData(u138.Character)
                if v150 ~= nil then
                    v150 = v150.orderedCactusAbsorbSounds
                end
                if v150 == nil then
                    v150 = u40
                end
                u8:playSound(v150[v146 + 1], {
                    ["rollOffMaxDistance"] = 220,
                    ["position"] = v145
                })
            end
            u144:GiveTask(u141)
            u144:GiveTask(u21.Heartbeat:Connect(function() --[[ Line: 548 ]]
                --[[
                Upvalues:
                    [1] = u139
                    [2] = u138
                    [3] = u144
                    [4] = u141
                --]]
                local v151 = u139.Character
                if v151 ~= nil then
                    v151 = v151.PrimaryPart
                end
                local v152 = not v151
                if not v152 then
                    local v153 = u138.Character
                    if v153 ~= nil then
                        v153 = v153.PrimaryPart
                    end
                    v152 = not v153
                end
                if v152 then
                    u144:DoCleaning()
                    return nil
                end
                u141.Position = u138.Character.PrimaryPart.Position
                for _, v154 in u141:GetChildren() do
                    if v154:IsA("Attachment") then
                        local v155 = u139.Character
                        if v155 ~= nil then
                            v155 = v155.PrimaryPart.Position
                        end
                        if v154.Name == "destination" then
                            v155 = u138.Character.PrimaryPart.Position
                        end
                        v154.WorldPosition = v155
                    end
                end
            end))
            task.delay(0.7, function() --[[ Line: 581 ]]
                --[[
                Upvalues:
                    [1] = u144
                --]]
                u144:DoCleaning()
            end)
            return
        end
        if v147[v149 + 1]:IsA("Beam") then
            v147[v149 + 1].CurveSize0 = math.random(-20, 20)
            v147[v149 + 1].CurveSize1 = math.random(-10, 10)
            v147[v149 + 1].Enabled = true
        end
    end
end
function u41.spikeEffect(p156, p157, u158) --[[ Line: 585 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u18
        [3] = u22
        [4] = u23
        [5] = u12
        [6] = u16
    --]]
    local u159 = u158.PrimaryPart
    if u159 ~= nil then
        u159 = u159.Position
    end
    if not u159 then
        return nil
    end
    local u160 = p156:getKitSkinData(p157.Character)
    if u160 ~= nil then
        u160 = u160.spikeMesh
        if u160 ~= nil then
            u160 = u160:Clone()
        end
    end
    if u160 == nil then
        u160 = u20.Assets.Effects.CactusSpike:Clone()
    end
    u160:SetAttribute("FirstPersonVisible", false)
    u18:AddTag(u160, "FirstPersonHidden")
    u160.Parent = u22
    local v161 = p157.Character
    if v161 ~= nil then
        v161 = v161.PrimaryPart
        if v161 ~= nil then
            v161 = v161.Position
        end
    end
    if not v161 then
        return nil
    end
    local u162 = (u159 - v161).Unit
    u160:PivotTo(CFrame.new(v161, u159))
    local v163 = (u159 - v161).Magnitude / 80
    u23(v163, u12, function(p164) --[[ Line: 626 ]]
        --[[
        Upvalues:
            [1] = u160
        --]]
        u160:PivotTo(p164)
    end, u160.CFrame, CFrame.new(u159, u159 + u162))
    local u165 = u160:Clone()
    task.delay(v163, function() --[[ Line: 630 ]]
        --[[
        Upvalues:
            [1] = u158
            [2] = u159
            [3] = u165
            [4] = u162
            [5] = u160
            [6] = u16
        --]]
        local v166 = u158.PrimaryPart
        if v166 ~= nil then
            v166 = v166.Position
        end
        u159 = v166
        if not u159 then
            return nil
        end
        u165.Anchored = false
        local v167 = u165
        local v168 = u159
        local v169 = u162 * 2
        local v170 = math.random()
        local v171 = math.random()
        local v172 = math.random
        local v173 = Vector3.new(v170, v171, v172())
        v167:PivotTo(CFrame.new(v168 - v169 + v173, u159 + u162))
        u160:Destroy()
        u16("WeldConstraint", {
            ["Part0"] = u165,
            ["Part1"] = u158.PrimaryPart,
            ["Parent"] = u165
        })
    end)
    return u165
end
function u41.cactusEffect(p174, u175) --[[ Line: 656 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u18
        [3] = u22
        [4] = u21
        [5] = u23
        [6] = u14
        [7] = u13
    --]]
    local u176 = p174:getKitSkinData(u175)
    if u176 ~= nil then
        u176 = u176.ballMesh
        if u176 ~= nil then
            u176 = u176:Clone()
        end
    end
    if u176 == nil then
        u176 = u20.Assets.Effects.CactusBall:Clone()
    end
    u176:SetAttribute("FirstPersonVisible", false)
    u176:SetAttribute("InitialTransparency", 0.55)
    u18:AddTag(u176, "FirstPersonHidden")
    u176.Transparency = 0.55
    local u177 = u175.PrimaryPart
    if u177 ~= nil then
        u177 = u177.Position
    end
    if not u177 then
        return nil
    end
    u176:PivotTo(CFrame.new(u177))
    u176.Parent = u22
    local u178 = nil
    u178 = u21.Heartbeat:Connect(function(_) --[[ Line: 685 ]]
        --[[
        Upvalues:
            [1] = u175
            [2] = u177
            [3] = u178
            [4] = u176
        --]]
        local v179 = u175.PrimaryPart
        if v179 ~= nil then
            v179 = v179.Position
        end
        u177 = v179
        if not u177 then
            u178:Disconnect()
            return nil
        end
        u176.Position = u177
    end)
    if u176.Transparency ~= 1 then
        u176.Transparency = 0.55
    end
    u176.Size = u176.Size * 2.5
    local u180 = u176.Size * 1.3
    local v181 = u176.Size * 0.8
    task.delay(0.4, function() --[[ Line: 703 ]]
        --[[
        Upvalues:
            [1] = u178
            [2] = u176
        --]]
        u178:Disconnect()
        u176:Destroy()
    end)
    u23(0.2, u14, function(p182) --[[ Line: 707 ]]
        --[[
        Upvalues:
            [1] = u176
        --]]
        u176.Size = p182
    end, u176.Size, v181)
    task.delay(0.2, function() --[[ Line: 710 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u13
            [3] = u176
            [4] = u180
        --]]
        u23(0.3, u13, function(p183) --[[ Line: 711 ]]
            --[[
            Upvalues:
                [1] = u176
            --]]
            u176.Size = p183
        end, u176.Size, u180)
    end)
end
function u41.getKitSkinData(_, p184) --[[ Line: 716 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u31
    --]]
    if not p184 then
        return nil
    end
    local v185 = u31[u9.Controllers.KitSkinController:getKitSkin(p184)]
    if v185.cactus then
        return v185.cactus
    end
end
u9.CreateController(u41.new())
return nil