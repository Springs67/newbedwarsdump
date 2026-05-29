local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.MathExtras
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v3.StatusModifier
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds")
local u18 = v17.BlockFootstepSound
local u19 = v17.DefaultFootstepSound
local u20 = v17.FootstepSounds
local u21 = v17.TerrainFootstepSounds
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "FootstepsController"
    end,
    ["__index"] = u15
})
u22.__index = u22
function u22.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(u25) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u14
        [4] = u7
        [5] = u4
    --]]
    u15.constructor(u25)
    u25.Name = "FootstepsController"
    u25.footstepSoundFolder = u10("Folder", {
        ["Name"] = "FootstepSounds",
        ["Parent"] = u14
    })
    u25.localFoostepVolumeMultiplier = 1
    u25.mutedPlayers = {}
    u25.particleAttachment = u10("Attachment", {
        ["Parent"] = u14.Terrain
    })
    u25.footstepModifier = u7.new(function(p26) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u4
        --]]
        u25.footstepSoundConfig = nil
        u25.localFootstepFrequency = nil
        local v27 = 0
        for _, v28 in p26 do
            if v28.localVolumeMultiplier ~= nil and v28.localVolumeMultiplier ~= 0 then
                v27 = v27 + u4:getPercentFromMultiplier(v28.localVolumeMultiplier)
            end
            if v28.soundConfig then
                u25.footstepSoundConfig = v28.soundConfig
            end
            if v28.localFootstepFrequency ~= nil then
                u25.localFootstepFrequency = v28.localFootstepFrequency
            end
            if v28.particles ~= nil then
                u25.particles = v28.particles
                u25.particles.Parent = u25.particleAttachment
                u25.particles.Enabled = false
            end
        end
        u25.localFoostepVolumeMultiplier = u4:getMultiplierFromPercent(v27)
    end)
end
function u22.KnitStart(u29) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
    --]]
    u12.PlayerAdded:Connect(function(p30) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:hookPlayer(p30)
    end)
    for v31, v32 in u12:GetPlayers() do
        local _ = v31 - 1
        u29:hookPlayer(v32)
    end
    u12.PlayerRemoving:Connect(function(p33) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:unmuteFootsteps(p33)
    end)
    u29.particles = u13.Assets.Effects.FootstepParticles:Clone()
    u29.particles.Parent = u29.particleAttachment
    u29.particles.Enabled = false
end
function u22.hookPlayer(u34, u35) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local u36 = u35.Character
    u1.Promise.defer(function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u34
            [3] = u35
        --]]
        if u36 then
            u34:hookCharacter(u35, u36)
        end
    end)
    u35.CharacterAdded:Connect(function(p37) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u35
        --]]
        u34:hookCharacter(u35, p37)
    end)
end
function u22.hookCharacter(u38, u39, u40, u41) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u14
        [4] = u5
        [5] = u16
        [6] = u19
        [7] = u20
        [8] = u21
        [9] = u18
        [10] = u6
    --]]
    local v42 = u9.new()
    local u43 = true
    local u44 = u40:WaitForChild("Humanoid")
    local u45 = u40:WaitForChild("HumanoidRootPart")
    local u46
    if u39 then
        u46 = u39 == u12.LocalPlayer
    else
        u46 = false
    end
    u38:muteHumanoidSound(u45, "Running")
    u38:muteHumanoidSound(u45, "Landing")
    u38:muteHumanoidSound(u45, "Jumping")
    u38:muteHumanoidSound(u45, "Landing")
    v42:GiveTask(function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u45
            [3] = u43
        --]]
        u38:unmuteHumanoidSound(u45, "Running")
        u38:unmuteHumanoidSound(u45, "Landing")
        u38:unmuteHumanoidSound(u45, "Jumping")
        u38:unmuteHumanoidSound(u45, "Landing")
        u43 = false
    end)
    local v47 = u40:GetAttribute("NoFootstepSounds")
    if v47 == nil then
        v47 = false
    end
    local u48 = v47
    u40:GetAttributeChangedSignal("NoFootstepSounds"):Connect(function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u48
        --]]
        local v49 = u40:GetAttribute("NoFootstepSounds")
        if v49 == nil then
            v49 = false
        end
        u48 = v49
    end)
    local v50 = u40:GetAttribute("EnableFootstepParticles")
    if v50 == nil then
        v50 = false
    end
    local u51 = v50
    u40:GetAttributeChangedSignal("EnableFootstepParticles"):Connect(function() --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u51
        --]]
        local v52 = u40:GetAttribute("EnableFootstepParticles")
        if v52 == nil then
            v52 = false
        end
        u51 = v52
    end)
    local u53 = os.clock()
    task.spawn(function() --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u40
            [3] = u14
            [4] = u45
            [5] = u48
            [6] = u44
            [7] = u38
            [8] = u39
            [9] = u12
            [10] = u53
            [11] = u41
            [12] = u5
            [13] = u16
            [14] = u19
            [15] = u20
            [16] = u21
            [17] = u18
            [18] = u46
            [19] = u51
            [20] = u6
        --]]
        while true do
            local v54 = u43
            if v54 then
                v54 = task.wait(0.1)
                if v54 ~= 0 and (v54 == v54 and v54) then
                    v54 = u40.Parent ~= nil
                end
            end
            if v54 == 0 or (v54 ~= v54 or not v54) then
                return
            end
            if u14.CurrentCamera then
                local v55 = u14.CurrentCamera
                if v55 ~= nil then
                    v55 = (v55.CFrame.Position - u45.Position).Magnitude
                end
                if v55 <= 80 and not u48 then
                    local v56 = u45.AssemblyLinearVelocity.X
                    local v57 = u45.AssemblyLinearVelocity.Z
                    local v58 = Vector3.new(v56, 0, v57)
                    local v59 = u45.Anchored and Vector3.new(0, 0, 0) or v58
                    local v60 = "standing"
                    local v61 = u44:GetState()
                    if v61 == Enum.HumanoidStateType.Running or v61 == Enum.HumanoidStateType.RunningNoPhysics then
                        v60 = v59.Magnitude > 17 and "running" or (v59.Magnitude > 1 and "walking" or v60)
                    end
                    if v60 ~= "standing" then
                        local v62 = v60 == "running" and 0.2 or 0.3
                        if u38.localFootstepFrequency ~= nil and u39 == u12.LocalPlayer then
                            local v63 = u38.localFootstepFrequency
                            local v64 = v59.Magnitude * 4
                            v62 = 1 / (v63 * (math.ceil(v64) / 4))
                        end
                        if os.clock() - u53 >= v62 then
                            debug.profilebegin("footstep")
                            local v65 = u38:findPlatform(u45)
                            local v66 = nil
                            local v67 = u41 or u38.footstepSoundConfig
                            local v68
                            if v67 == nil then
                                v68 = v67
                            else
                                v68 = v67.volume
                            end
                            local v69 = v68 == nil and 0.13 or v68
                            if v67 and (v67.walk or v67.run) then
                                if v60 == "walking" and v67.walk then
                                    local v70 = u5.fromList
                                    local v71 = v67.walk
                                    v66 = v70(unpack(v71))
                                elseif v60 == "running" and v67.run then
                                    local v72 = u5.fromList
                                    local v73 = v67.run
                                    v66 = v72(unpack(v73))
                                end
                            elseif v65.block then
                                local v74 = u16(v65.block.Name).footstepSound
                                if v74 == nil then
                                    v74 = u19
                                end
                                local v75 = u20[v74]
                                if v75.volume ~= nil then
                                    v69 = v75.volume
                                end
                                if v60 == "walking" and v75.walk then
                                    local v76 = u5.fromList
                                    local v77 = v75.walk
                                    v66 = v76(unpack(v77))
                                elseif v60 == "running" and v75.run then
                                    local v78 = u5.fromList
                                    local v79 = v75.run
                                    v66 = v78(unpack(v79))
                                end
                            elseif v65.terrainMaterial then
                                local v80 = u21[v65.terrainMaterial]
                                if v80 == nil then
                                    v80 = u18.WOOD
                                end
                                local v81 = u20[v80]
                                if v81.volume ~= nil then
                                    v69 = v81.volume
                                end
                                if v60 == "walking" and v81.walk then
                                    local v82 = u5.fromList
                                    local v83 = v81.walk
                                    v66 = v82(unpack(v83))
                                elseif v60 == "running" and v81.run then
                                    local v84 = u5.fromList
                                    local v85 = v81.run
                                    v66 = v84(unpack(v85))
                                end
                            end
                            if u46 then
                                v69 = v69 * u38.localFoostepVolumeMultiplier
                            end
                            local v86
                            if v66 == "" or not v66 then
                                v86 = v66
                            else
                                v86 = v65.raycastResult
                            end
                            if v86 ~= "" and v86 then
                                u53 = os.clock()
                                local v87 = 0.85 + math.random() * 0.2
                                local v88 = u38.particles
                                if v88 then
                                    local v89 = u40:GetAttribute("Transparency")
                                    v88 = (v89 == nil and 0 or v89) ~= 0 or u51
                                    if v88 then
                                        local v90 = u40:GetAttribute("DisableInvisibilityFootstepParticles")
                                        if v90 == 0 or v90 ~= v90 then
                                            v90 = false
                                        elseif v90 == "" then
                                            v90 = false
                                        end
                                        v88 = not v90
                                    end
                                end
                                if v88 then
                                    local v91 = v65.raycastResult.Position
                                    u38.particleAttachment.CFrame = CFrame.new(v91 + Vector3.new(0, 0.1, 0))
                                    u38.particles:Emit(1)
                                end
                                local v92 = not u39
                                if not v92 then
                                    local v93 = u38.mutedPlayers[u39] ~= nil
                                    v92 = not v93
                                end
                                if v92 then
                                    if u46 then
                                        u6:playSound(v66, {
                                            ["playbackSpeedMultiplier"] = v87,
                                            ["volumeMultiplier"] = v69 / 0.5,
                                            ["parent"] = u38.footstepSoundFolder
                                        })
                                        local v94
                                        if v67 == nil then
                                            v94 = v67
                                        else
                                            v94 = v67.overlay
                                        end
                                        if v94 then
                                            local v95 = u6
                                            local v96 = u5.fromList
                                            local v97 = v67.overlay
                                            v95:playSound(v96(unpack(v97)), {
                                                ["playbackSpeedMultiplier"] = 0.85 + math.random() * 0.2,
                                                ["volumeMultiplier"] = v69 / 0.5,
                                                ["parent"] = u38.footstepSoundFolder
                                            })
                                        end
                                    else
                                        local v98 = u6
                                        local v99 = {
                                            ["playbackSpeedMultiplier"] = v87,
                                            ["volumeMultiplier"] = v69 == nil and 0.75 or v69
                                        }
                                        local v100
                                        if v67 == nil then
                                            v100 = v67
                                        else
                                            v100 = v67.rollOffMaxDistance
                                        end
                                        v99.rollOffMaxDistance = v100 == nil and 50 or v100
                                        v99.position = v65.raycastResult.Position
                                        v98:playSound(v66, v99)
                                        local v101
                                        if v67 == nil then
                                            v101 = v67
                                        else
                                            v101 = v67.overlay
                                        end
                                        if v101 then
                                            local v102 = u6
                                            local v103 = u5.fromList
                                            local v104 = v67.overlay
                                            local v105 = v103(unpack(v104))
                                            local v106 = {
                                                ["playbackSpeedMultiplier"] = 0.85 + math.random() * 0.2,
                                                ["volumeMultiplier"] = v69 * 0.75 / 0.5
                                            }
                                            if v67 ~= nil then
                                                v67 = v67.rollOffMaxDistance
                                            end
                                            v106.rollOffMaxDistance = v67 == nil and 50 or v67
                                            v106.position = v65.raycastResult.Position
                                            v102:playSound(v105, v106)
                                        end
                                    end
                                end
                            end
                            debug.profileend()
                        end
                    end
                end
            end
        end
    end)
    return v42
end
function u22.findPlatform(p107, p108, p109) --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
    --]]
    local v110 = p109 == nil and {} or p109
    local v111 = RaycastParams.new()
    v111.CollisionGroup = "Players"
    v111.FilterDescendantsInstances = v110
    v111.FilterType = Enum.RaycastFilterType.Exclude
    local v112 = u14:Raycast(p108.Position, Vector3.new(0, -9, 0), v111)
    if v112 then
        if v112.Instance:IsA("Terrain") then
            return {
                ["block"] = nil,
                ["raycastResult"] = v112,
                ["terrainMaterial"] = v112.Material
            }
        end
        if v112.Instance:IsA("BasePart") then
            if v112.Instance.CanCollide then
                local v113 = u2:getBlockInstanceFromChild(v112.Instance)
                return v113 and {
                    ["terrainMaterial"] = nil,
                    ["raycastResult"] = v112,
                    ["block"] = v113
                } or {
                    ["block"] = nil,
                    ["raycastResult"] = v112,
                    ["terrainMaterial"] = v112.Instance.Material
                }
            end
            local v114 = v112.Instance
            table.insert(v110, v114)
            return p107:findPlatform(p108, v110)
        end
    end
    return {
        ["block"] = nil,
        ["terrainMaterial"] = nil,
        ["raycastResult"] = v112
    }
end
function u22.muteHumanoidSound(_, p115, p116) --[[ Line: 412 ]]
    local v117 = p115:FindFirstChild(p116)
    if v117 then
        v117.Volume = 0
    end
end
function u22.unmuteHumanoidSound(_, p118, p119) --[[ Line: 418 ]]
    local v120 = p118:FindFirstChild(p119)
    if v120 then
        v120.Volume = 1
    end
end
function u22.muteFootsteps(p121, p122) --[[ Line: 424 ]]
    p121.mutedPlayers[p122] = true
end
function u22.unmuteFootsteps(p123, p124) --[[ Line: 429 ]]
    p123.mutedPlayers[p124] = nil
end
return {
    ["FootstepsController"] = v8.CreateController(u22.new())
}