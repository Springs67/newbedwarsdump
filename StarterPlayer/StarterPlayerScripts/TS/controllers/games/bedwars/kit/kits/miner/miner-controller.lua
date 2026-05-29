local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.ExpireList
local u6 = v3.GameQueryUtil
local u7 = v3.RandomUtil
local u8 = v3.SoundManager
local u9 = v3.WatchCharacterAnimation
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u11 = v10.KnitClient
local u12 = v10.KnitClient
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u14 = v13.InOutQuart
local u15 = v13.Linear
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u19 = v18.CollectionService
local u20 = v18.Players
local u21 = v18.ReplicatedStorage
local u22 = v18.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u25 = v24.InteractionCategory
local u26 = v24.InteractionPriority
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u38 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u39 = Color3.fromRGB(120, 120, 120)
local u40 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
        return "MinerController"
    end,
    ["__index"] = u38
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
        [1] = u38
        [2] = u32
        [3] = u5
    --]]
    u38.constructor(p43, u32.MINER)
    p43.Name = "MinerController"
    p43.mineCooldowns = u5.new(2)
end
function u40.onKitLocalActivated(p44, p45) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p44.minerPromptMaid then
        p44.minerPromptMaid = u17.new()
    end
    p44.minerPromptMaid:GiveTask(p44:setupMinerPrompts(2.5))
    p45:GiveTask(p44.minerPromptMaid)
end
function u40.onKitLocalDeactivated(_) --[[ Line: 67 ]] end
function u40.onKitReplicationActivated(u46, u47) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u20
        [3] = u16
        [4] = u12
        [5] = u30
        [6] = u22
        [7] = u19
        [8] = u6
        [9] = u8
        [10] = u35
        [11] = u39
        [12] = u11
        [13] = u31
        [14] = u33
        [15] = u23
        [16] = u14
        [17] = u15
        [18] = u9
        [19] = u29
        [20] = u28
        [21] = u17
        [22] = u21
        [23] = u37
        [24] = u36
    --]]
    u34.Client:OnEvent("PetrifiedPlayerDestroyed", function(p48) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u16
            [3] = u46
            [4] = u12
            [5] = u30
        --]]
        local v49 = p48.destroyer == u20.LocalPlayer
        u16.Debug("Petrified player was destroyed")
        local v50 = u46:getPetrifyModel(p48.petrifyId)
        local v51
        if v50 == nil then
            v51 = v50
        else
            v51 = v50.PrimaryPart
        end
        if v51 == nil then
            return nil
        end
        if p48.destroyer then
            local u52 = p48.destroyer
            u12.Controllers.ReceiveItemEffectController:playEffectForItems(p48.rewards, v50.PrimaryPart.Position, function() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u52
                --]]
                local v53 = u30:getEntity(u52)
                if v53 == nil then
                    return nil
                else
                    return v53:getInstance():GetPrimaryPartCFrame()
                end
            end, v49 and "PlayLocally" or "PlayGlobally", 1)
        end
        u46:destroyPetrifyModel(v50, p48.destroyer)
    end):andThen(function(p54) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:GiveTask(p54)
    end)
    u34.Client:OnEvent("Petrified", function(p55) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u30
            [3] = u19
            [4] = u6
            [5] = u8
            [6] = u35
            [7] = u39
            [8] = u11
            [9] = u31
            [10] = u33
            [11] = u23
            [12] = u14
            [13] = u15
        --]]
        p55.to.Archivable = true
        local v56 = p55.to:Clone()
        v56.Parent = u22
        v56.HumanoidRootPart.Anchored = true
        local v57 = p55.to:GetAttribute("Team")
        v56:SetAttribute("Team", v57)
        local v58 = v56.PrimaryPart
        if v58 ~= nil then
            v58:SetAttribute("Team", v57)
        end
        local v59 = u30:getEntity(p55.to)
        if v59 ~= nil then
            v59 = v59:getPlayer()
        end
        v56:SetAttribute("PetrifyId", p55.petrifyId)
        u19:AddTag(v56, "petrified-player")
        u19:AddTag(v56.PrimaryPart, "MinerInteraction")
        u19:AddTag(v56, "petrified-player:" .. p55.petrifyId)
        for _, v60 in p55.to:GetDescendants() do
            if v60:IsA("BasePart") then
                v60.Transparency = 1
            end
        end
        for _, v61 in v56:GetDescendants() do
            if v61:IsA("BasePart") then
                v61.CanCollide = false
                u6:setQueryIgnored(v61, true)
            elseif v61:IsA("BillboardGui") then
                v61:Destroy()
            elseif v61:IsA("Highlight") then
                v61:Destroy()
            elseif not v61:IsA("Accessory") then
                if v61:IsA("ParticleEmitter") then
                    v61:Destroy()
                elseif v61:IsA("Sound") then
                    v61:Destroy()
                elseif v61:IsA("ParticleEmitter") then
                    v61:Destroy()
                elseif v61:IsA("Beam") then
                    v61:Destroy()
                else
                    v61:IsA("Attachment")
                end
            end
        end
        u8:playSound(u35.TURN_TO_STONE, {
            ["position"] = v56:GetPrimaryPartCFrame().Position
        })
        local v62 = u39
        local v63 = u31[u11.Controllers.KitController:getKitSkin(p55.killer)]
        if v63.miner then
            if v63.miner.petrifyStatueColor then
                v62 = v63.miner.petrifyStatueColor
            end
            if v63.miner.petrifyStatueMaterial then
                for v64, v65 in v56:GetDescendants() do
                    local _ = v64 - 1
                    if v65:IsA("BasePart") then
                        v65.Material = v63.miner.petrifyStatueMaterial
                    end
                end
            end
        end
        local v66 = v56:FindFirstChildWhichIsA("Highlight")
        if v66 ~= nil then
            v66:Destroy()
        end
        local v71 = {
            ["transparency"] = 0,
            ["fadeInTime"] = 1,
            ["lastsForever"] = true,
            ["color"] = v62,
            ["shouldApplyToPart"] = function(p67) --[[ Name: shouldApplyToPart, Line 182 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                local v68 = p67:FindFirstAncestorWhichIsA("Accessory")
                if not v68 or v68:GetAttribute("ArmorSlot") ~= u33.HELMET then
                    return true
                end
                for v69, v70 in v68:GetDescendants() do
                    local _ = v69 - 1
                    if v70:IsA("Texture") then
                        v70.Transparency = 1
                    end
                end
                return false
            end
        }
        u11.Controllers.EntityHighlightController:highlight(v56, v71)
        local u72 = {}
        for _, v73 in p55.to.Humanoid.Animator:GetPlayingAnimationTracks() do
            if v73.Animation then
                local v74 = v56.Humanoid.Animator:LoadAnimation(v73.Animation)
                v74:AdjustWeight(v73.WeightTarget)
                v74:AdjustSpeed(v73.Speed)
                v74:Play()
                v74.TimePosition = v73.TimePosition
                local v75 = {
                    ["startingSpeed"] = v73.Speed,
                    ["animationTrack"] = v74
                }
                table.insert(u72, v75)
            end
        end
        u23(1, u14, function(p76) --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u15
            --]]
            for _, v77 in u72 do
                v77.animationTrack:AdjustSpeed(u15(1 - p76, v77.startingSpeed, -v77.startingSpeed, 1))
            end
        end, 1, 0)
    end):andThen(function(p78) --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:GiveTask(p78)
    end)
    u47:GiveTask(u9({ u29:getAssetId(u28.MINER_MINE_STONE) }, function(p79, p80) --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u20
            [3] = u30
            [4] = u17
            [5] = u21
            [6] = u11
            [7] = u31
            [8] = u37
            [9] = u22
            [10] = u6
            [11] = u35
            [12] = u12
            [13] = u36
            [14] = u8
        --]]
        local u81 = p79.Character
        if not u81 then
            return nil
        end
        if u46.mineCooldowns:has(p79.UserId) and p79.UserId ~= u20.LocalPlayer.UserId then
            return nil
        end
        u46.mineCooldowns:add(p79.UserId)
        local v82 = u30:getEntity(p79)
        local v83 = u81.PrimaryPart
        if v83 ~= nil then
            v83 = v83.Position
        end
        if not v83 then
            return nil
        end
        local u84 = u46:getClosestPetrifiedPlayer(v83)
        if not u84 then
            return nil
        end
        local u85 = u17.new()
        if v82 ~= nil then
            v82 = v82:getItemInHandClient()
        end
        if v82 then
            for _, u86 in v82:GetDescendants() do
                if u86:IsA("BasePart") then
                    local u87 = u86.Transparency
                    u86.Transparency = 1
                    u85:GiveTask(function() --[[ Line: 259 ]]
                        --[[
                        Upvalues:
                            [1] = u86
                            [2] = u87
                        --]]
                        u86.Transparency = u87
                    end)
                end
            end
        end
        local u88 = u81.PrimaryPart.Position
        local u89 = u81 == u20.LocalPlayer.Character
        local v90 = u21.Assets.Effects.MinerPickaxe
        local v91 = u31[u11.Controllers.KitController:getKitSkin(u81)]
        if v91.miner then
            v90 = u21.Assets.Effects:FindFirstChild(v91.miner.pickaxeSkinName) or v90
        end
        local u92 = v90:Clone()
        u92.Parent = u81
        u37:weldCharacterAccessories(u81)
        local u93 = u21.Assets.Effects.MinerStoneHit:Clone()
        local v94 = u84.PrimaryPart
        if v94 ~= nil then
            v94 = v94.CFrame
        end
        if v94 == nil then
            v94 = CFrame.new()
        end
        u93.CFrame = v94
        u93.Anchored = true
        u93.Parent = u22
        u6:setQueryIgnored(u93, true)
        u85:GiveTask(function() --[[ Line: 293 ]]
            --[[
            Upvalues:
                [1] = u93
            --]]
            task.delay(3, function() --[[ Line: 295 ]]
                --[[
                Upvalues:
                    [1] = u93
                --]]
                u93:Destroy()
            end)
        end)
        local u95 = { u35.MINER_STONE_HIT_1, u35.MINER_STONE_HIT_2, u35.MINER_STONE_HIT_3 }
        local u96 = u35.MINER_STONE_BREAK
        if v91.miner then
            if v91.miner.hitParticleColor then
                for v97, v98 in u93:GetDescendants() do
                    local _ = v97 - 1
                    if v98:IsA("ParticleEmitter") then
                        v98.Color = v91.miner.hitParticleColor
                    end
                end
            end
            if v91.miner.pickaxeHitSounds then
                u95 = v91.miner.pickaxeHitSounds
            end
            local v99 = v91.miner.statueBreakSound
            if v99 ~= "" and v99 then
                u96 = v91.miner.statueBreakSound
            end
        end
        local function u102(p100) --[[ Line: 323 ]]
            --[[
            Upvalues:
                [1] = u89
                [2] = u81
                [3] = u12
            --]]
            if u89 then
                local v101 = u81.PrimaryPart
                if v101 ~= nil then
                    v101 = v101.CFrame
                end
                if v101 then
                    u12.Controllers.ScreenShakeController:shake(v101.Position, v101 * Vector3.new(-0.25, -1, -1) - v101.Position, {
                        ["duration"] = 0.15,
                        ["cycles"] = 2,
                        ["magnitude"] = 0.07 * p100
                    })
                end
            end
        end
        local u103 = nil
        u103 = p80:GetMarkerReachedSignal("hammer_1"):Connect(function() --[[ Line: 345 ]]
            --[[
            Upvalues:
                [1] = u103
                [2] = u46
                [3] = u88
                [4] = u84
                [5] = u36
                [6] = u93
                [7] = u8
                [8] = u95
                [9] = u89
                [10] = u81
                [11] = u102
            --]]
            u103:Disconnect()
            u46:detachParts(u88, { u84:FindFirstChild("Head") })
            u36:playEffects({ u93 }, nil)
            local v104 = u8
            local v105 = u95[1]
            local v106 = {}
            local v107
            if u89 then
                v107 = nil
            else
                v107 = u81.PrimaryPart
                if v107 ~= nil then
                    v107 = v107.Position
                end
            end
            v106.position = v107
            v104:playSound(v105, v106)
            u102(1)
        end)
        local u108 = nil
        u108 = p80:GetMarkerReachedSignal("hammer_2"):Connect(function() --[[ Line: 368 ]]
            --[[
            Upvalues:
                [1] = u108
                [2] = u46
                [3] = u88
                [4] = u84
                [5] = u36
                [6] = u93
                [7] = u8
                [8] = u95
                [9] = u89
                [10] = u81
                [11] = u102
            --]]
            u108:Disconnect()
            u46:detachParts(u88, { u84:FindFirstChild("RightUpperArm"), u84:FindFirstChild("LeftUpperArm") })
            u36:playEffects({ u93 }, nil)
            local v109 = u8
            local v110 = u95[2]
            local v111 = {}
            local v112
            if u89 then
                v112 = nil
            else
                v112 = u81.PrimaryPart
                if v112 ~= nil then
                    v112 = v112.Position
                end
            end
            v111.position = v112
            v109:playSound(v110, v111)
            u102(1.25)
        end)
        local u113 = nil
        u113 = p80:GetMarkerReachedSignal("hammer_3"):Connect(function() --[[ Line: 391 ]]
            --[[
            Upvalues:
                [1] = u113
                [2] = u46
                [3] = u88
                [4] = u84
                [5] = u36
                [6] = u93
                [7] = u8
                [8] = u95
                [9] = u89
                [10] = u81
                [11] = u102
            --]]
            u113:Disconnect()
            u46:detachParts(u88, { u84:FindFirstChild("UpperTorso") })
            u36:playEffects({ u93 }, nil)
            local v114 = u8
            local v115 = u95[3]
            local v116 = {}
            local v117
            if u89 then
                v117 = nil
            else
                v117 = u81.PrimaryPart
                if v117 ~= nil then
                    v117 = v117.Position
                end
            end
            v116.position = v117
            v114:playSound(v115, v116)
            u102(1.25)
        end)
        local u118 = nil
        u118 = p80:GetMarkerReachedSignal("hammer_4"):Connect(function() --[[ Line: 414 ]]
            --[[
            Upvalues:
                [1] = u118
                [2] = u46
                [3] = u88
                [4] = u84
                [5] = u36
                [6] = u93
                [7] = u8
                [8] = u96
                [9] = u89
                [10] = u81
                [11] = u102
            --]]
            u118:Disconnect()
            u46:detachParts(u88, { u84:FindFirstChild("LeftLowerLeg"), u84:FindFirstChild("RightLowerLeg"), u84:FindFirstChild("LowerTorso") })
            u36:playEffects({ u93 }, nil, {
                ["particleMultiplier"] = 3
            })
            local v119 = u8
            local v120 = u96
            local v121 = {}
            local v122
            if u89 then
                v122 = nil
            else
                v122 = u81.PrimaryPart
                if v122 ~= nil then
                    v122 = v122.Position
                end
            end
            v121.position = v122
            v119:playSound(v120, v121)
            u102(2)
        end)
        p80.Stopped:Connect(function() --[[ Line: 439 ]]
            --[[
            Upvalues:
                [1] = u92
                [2] = u85
            --]]
            u92:Destroy()
            u85:DoCleaning()
        end)
        p80.Destroying:Connect(function() --[[ Line: 443 ]]
            --[[
            Upvalues:
                [1] = u92
                [2] = u85
            --]]
            u92:Destroy()
            u85:DoCleaning()
        end)
    end))
end
function u40.onKitReplicationDeactivated(_) --[[ Line: 449 ]] end
function u40.onInnateAbilityEnabled(_, _, _) --[[ Line: 451 ]] end
function u40.onAbilityUsed(_, _, _) --[[ Line: 453 ]] end
function u40.detachParts(u123, p124, p125) --[[ Line: 455 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    for _, u126 in p125 do
        local v127
        if u126 == nil then
            v127 = u126
        else
            v127 = u126:IsA("BasePart")
        end
        if v127 then
            for _, v128 in u126:GetChildren() do
                if v128:IsA("Motor6D") then
                    v128:Destroy()
                end
            end
            local v129 = u126.Position - p124
            local v130 = v129.X
            local v131 = v129.Z
            u126:ApplyImpulse((Vector3.new(v130, 0, v131).Unit * 20 + Vector3.new(0, 30, 0)) * u126.AssemblyMass)
            u126:ApplyAngularImpulse(Vector3.new(5, 10, 5) * u126.AssemblyMass)
            u126.Touched:Connect(function(p132) --[[ Line: 484 ]]
                --[[
                Upvalues:
                    [1] = u126
                    [2] = u6
                    [3] = u123
                --]]
                if u126.Parent and p132:IsDescendantOf(u126.Parent) then
                    return nil
                end
                if u6:isQueryIgnored(p132) then
                    return nil
                end
                task.wait(0.15)
                u123:despawnPart(u126)
            end)
        end
    end
end
function u40.despawnPart(u133, p134) --[[ Line: 496 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u35
        [3] = u8
    --]]
    if not p134.Parent then
        return nil
    end
    u8:playSound(u7.fromList(u35.ROCK_CRUMBLE_1, u35.ROCK_CRUMBLE_2, u35.ROCK_CRUMBLE_3), {
        ["volumeMultiplier"] = 0.2,
        ["position"] = p134.Position
    })
    local u135 = p134:GetConnectedParts(false)
    p134:Destroy()
    task.delay(0.12, function() --[[ Line: 507 ]]
        --[[
        Upvalues:
            [1] = u133
            [2] = u135
        --]]
        for v136, v137 in u135 do
            local _ = v136 - 1
            u133:despawnPart(v137)
        end
    end)
end
function u40.destroyPetrifyModel(_, p138, _) --[[ Line: 516 ]]
    p138:Destroy()
end
function u40.getPetrifyModel(_, p139) --[[ Line: 519 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v140 = nil
    for v141, v142 in u19:GetTagged("petrified-player:" .. p139) do
        local _ = v141 - 1
        if true == true then
            return v142
        end
    end
    return v140
end
function u40.getClosestPetrifiedPlayer(_, u143) --[[ Line: 535 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v144 = 0
    local v145 = {}
    for v146, v147 in u19:GetTagged("petrified-player") do
        local _ = v146 - 1
        if v147.PrimaryPart ~= nil == true then
            v144 = v144 + 1
            v145[v144] = v147
        end
    end
    table.sort(v145, function(p148, p149) --[[ Line: 550 ]]
        --[[
        Upvalues:
            [1] = u143
        --]]
        return (p148.PrimaryPart.Position - u143).Magnitude < (p149.PrimaryPart.Position - u143).Magnitude
    end)
    local v150 = nil
    for v151, v152 in v145 do
        local _ = v151 - 1
        if true == true then
            v150 = v152
            break
        end
    end
    return v150
end
function u40.setupMinerPrompts(p153, p154) --[[ Line: 574 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u26
        [4] = u25
        [5] = u34
        [6] = u27
        [7] = u2
        [8] = u17
        [9] = u29
        [10] = u20
        [11] = u28
    --]]
    local v155 = p153.minerPromptMaid
    if v155 ~= nil then
        v155:Destroy()
    end
    return u11.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Gather",
        ["interactionObjectText"] = "Petrified Player",
        ["interactionTag"] = "MinerInteraction",
        ["maxActivationDistance"] = 6,
        ["removePromptOnInteract"] = true,
        ["holdDuration"] = p154,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["priority"] = u26.ABILITY,
        ["category"] = u25.ABILITY,
        ["onInteracted"] = function(_, p156, _) --[[ Name: onInteracted, Line 589 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            local v157 = p156.Parent
            if v157 == nil or not v157:IsA("Model") then
                return nil
            end
            u34.Client:Get("DestroyPetrifiedPlayer"):SendToServer({
                ["petrifyId"] = v157:GetAttribute("PetrifyId")
            })
        end,
        ["promptButtonHoldBegan"] = function(_, p158, p159) --[[ Name: promptButtonHoldBegan, Line 598 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u2
                [3] = u17
                [4] = u29
                [5] = u20
                [6] = u28
            --]]
            local v160 = p158:GetAttribute("Team")
            local v161 = u27:getState().Game.myTeam
            if v161 ~= nil then
                v161 = v161.id
            end
            if v160 == v161 then
                p159:InputHoldEnd()
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You cannot mine your teammates!"
                })
                return nil
            end
            local u162 = u17.new()
            local u163 = u29:playAnimation(u20.LocalPlayer, u28.MINER_MINE_STONE)
            u162:GiveTask(function() --[[ Line: 614 ]]
                --[[
                Upvalues:
                    [1] = u163
                --]]
                local v164 = u163
                if v164 ~= nil then
                    v164:Stop()
                end
                local v165 = u163
                if v165 ~= nil then
                    v165:Destroy()
                end
            end)
            p159.PromptButtonHoldEnded:Connect(function() --[[ Line: 624 ]]
                --[[
                Upvalues:
                    [1] = u162
                --]]
                u162:DoCleaning()
            end)
        end
    })
end
u11.CreateController(u40.new())
return nil