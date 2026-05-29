local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.ExpireList
local u6 = v3.SoundManager
local u7 = v3.WatchCharacterAnimation
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.RunService
local u19 = v14.Workspace
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u22 = v21.InteractionCategory
local u23 = v21.InteractionPriority
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dragon-slayer", "dragon-slayer-constants").DragonSlayerConstants
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u34 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "DragonSlayerController"
    end,
    ["__index"] = u34
})
u35.__index = u35
function u35.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u28
        [3] = u24
        [4] = u31
    --]]
    u34.constructor(p38, u28.DRAGON_SLAYER, {
        ["animations"] = { u24.DRAGON_SLAYER_PUNCH, u24.DRAGON_SLAYER_LAUNCH_LOOP, u24.DRAGON_SLAYER_LAUNCH_IMPACT },
        ["sounds"] = { u31.KALIYAH_EXPLOSION, u31.KALIYAH_PUNCH, u31.KALIYAH_WALL_HIT }
    })
    p38.Name = "DragonSlayerController"
    p38.dragonEmblems = {}
end
function u35.KnitStart(p39) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    u34.KnitStart(p39)
end
function u35.onKitLocalActivated(u40, p41) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u26
        [3] = u4
        [4] = u23
        [5] = u22
        [6] = u16
        [7] = u27
        [8] = u30
    --]]
    p41:GiveTask(u9.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Punch",
        ["interactionTag"] = "KaliyahPunchInteraction",
        ["instantActivation"] = true,
        ["maxActivationDistance"] = u26.RAYCAST_SWORD_CHARACTER_DISTANCE,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["priority"] = u23.ABILITY,
        ["category"] = u22.ABILITY,
        ["onInteracted"] = function(_, p42, _) --[[ Name: onInteracted, Line 70 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u27
                [3] = u40
                [4] = u30
            --]]
            if not p42:IsA("Model") then
                return nil
            end
            local v43 = p42:GetPrimaryPartCFrame().Position
            local v44 = u16.LocalPlayer.Character
            local v45 = u27:getLocalPlayerEntity()
            if not v44 or (not v45 or v45:isDead()) then
                return nil
            end
            u40:deleteEmblem(p42)
            local v46 = v44:GetPrimaryPartCFrame().Position
            local v47 = v43 * Vector3.new(1, 0, 1)
            local v48 = v46.Y
            local v49 = Vector3.new(0, v48, 0)
            local v50 = CFrame.new(v46, v47 + v49)
            v44:PivotTo(v50)
            u40:playPunchAnimation(v50 - v50.Position)
            u30.Client:Get("RequestDragonPunch"):SendToServer({
                ["target"] = p42
            })
        end
    }))
end
function u35.onKitLocalDeactivated(_) --[[ Line: 96 ]] end
function u35.onKitReplicationActivated(u51) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u16
        [3] = u2
        [4] = u18
        [5] = u19
        [6] = u17
        [7] = u29
        [8] = u10
        [9] = u15
        [10] = u12
        [11] = u25
        [12] = u24
        [13] = u20
        [14] = u11
        [15] = u6
        [16] = u31
        [17] = u32
        [18] = u5
        [19] = u7
        [20] = u33
        [21] = u28
        [22] = u9
    --]]
    u30.Client:Get("UpdateDragonSlayerStacks"):Connect(function(u52) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u51
            [3] = u2
        --]]
        if u52.kitUser ~= u16.LocalPlayer.UserId then
            return nil
        end
        if u52.stacks == 0 then
            u51:deleteEmblem(u52.target)
            return nil
        end
        if u51.dragonEmblems[u52.target] == nil then
            local u53 = nil
            u53 = u52.target.AncestryChanged:Connect(function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u52
                    [3] = u53
                --]]
                u51:deleteEmblem(u52.target)
                u53:Disconnect()
            end)
        end
        u2.getOrCreate(u51.dragonEmblems, u52.target, {
            ["stackCount"] = 0
        }).stackCount = u52.stacks
    end)
    u18.Heartbeat:Connect(function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u51
            [3] = u17
            [4] = u29
            [5] = u10
            [6] = u15
        --]]
        local v54 = u19.CurrentCamera
        if v54 ~= nil then
            v54 = v54.CFrame
        end
        if not v54 then
            return nil
        end
        for v55, v56 in u51.dragonEmblems do
            if v55.PrimaryPart then
                local v57 = (v55:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)).Position
                local v58 = CFrame.new
                local v59 = v54.X
                local v60 = v57.Y
                local v61 = v54.Z
                local v62 = v58(v57, (Vector3.new(v59, v60, v61))) * CFrame.Angles(0, 1.5707963267948966, 0)
                if not v56.model then
                    v56.model = u17.Assets.Misc.DragonEmblem:Clone()
                    v56.model.Parent = u51:getDragonEmblemFolder()
                end
                v56.model:PivotTo(v62)
                local v63 = false
                local v64 = 1
                while true do
                    if true then
                        if v63 then
                            v64 = v64 + 1
                        else
                            v63 = true
                        end
                    end
                    if v64 > u29.MAX_STACKS then
                        break
                    end
                    local v65 = v56.model:FindFirstChild(v64)
                    if v65 then
                        local v66 = v64 <= v56.stackCount
                        local v67
                        if v66 then
                            v67 = Color3.fromRGB(255, 67, 45)
                        else
                            v67 = Color3.fromRGB(185, 148, 153)
                        end
                        v65.Color = v67
                        local v68
                        if v66 then
                            v68 = Enum.Material.Neon
                        else
                            v68 = Enum.Material.Glass
                        end
                        v65.Material = v68
                        v65.Transparency = 0.1
                    end
                end
                local v69 = v55:FindFirstChildWhichIsA("ProximityPrompt")
                local v70 = v56.stackCount == u29.MAX_STACKS
                if not v70 and v69 then
                    u10.Controllers.InteractionRegistryController:removePrompt(v55, "KaliyahPunchInteraction")
                end
                if v70 and not v69 then
                    u15:AddTag(v55, "KaliyahPunchInteraction")
                end
            end
        end
    end)
    u30.Client:Get("PlayerDragonPunched"):Connect(function(u71) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u17
            [3] = u51
            [4] = u25
            [5] = u24
            [6] = u20
            [7] = u11
            [8] = u16
            [9] = u6
            [10] = u31
            [11] = u19
            [12] = u32
        --]]
        if not u71.target.PrimaryPart then
            return nil
        end
        local u72 = u12.new()
        local v73 = u71.target:GetPrimaryPartCFrame().Position
        local v74 = u71.destination.Position - v73
        local v75 = v74.X
        local v76 = v74.Z
        local v77 = Vector3.new(v75, 0, v76)
        local v78 = CFrame.lookAt(Vector3.new(0, 0, 0), v77) * CFrame.Angles(0, 3.141592653589793, 0)
        local v79 = (u71.target:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)).Position
        local v80 = CFrame.new(v79) * v78 * CFrame.Angles(0, 1.5707963267948966, 0)
        local v81 = u17.Assets.Misc.DragonEmblem:Clone()
        u72:GiveTask(v81)
        v81.Parent = u51:getDragonEmblemFolder()
        v81:PivotTo(v80)
        local u82 = CFrame.new(v73) * v78
        local u83 = CFrame.new(u71.destination.Position) * v78
        local u84 = u71.target:FindFirstChildWhichIsA("Humanoid")
        if u84 ~= nil then
            u84 = u84:FindFirstChild("Animator")
        end
        if u84 then
            local u85 = u25:playAnimation(u84, u24.DRAGON_SLAYER_LAUNCH_LOOP)
            u72:GiveTask(function() --[[ Line: 208 ]]
                --[[
                Upvalues:
                    [1] = u85
                --]]
                local v86 = u85
                if v86 ~= nil then
                    v86:Stop()
                end
            end)
        end
        u20(u71.knockbackDuration, u11, function(p87) --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u82
                [3] = u83
            --]]
            if not u71.target.PrimaryPart then
                return nil
            end
            u71.target:PivotTo(u82:Lerp(u83, p87))
        end)
        local u88 = u71.target == u16.LocalPlayer.Character
        local v89 = task.delay
        local v90 = u71.knockbackDuration - 0.1
        v89(math.max(0, v90), function() --[[ Line: 222 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u71
                [3] = u6
                [4] = u31
            --]]
            if u88 or u71.target.PrimaryPart then
                local v91 = {}
                local v92
                if u88 then
                    v92 = nil
                else
                    v92 = u71.target:GetPrimaryPartCFrame().Position
                end
                v91.position = v92
                u6:playSound(u31.KALIYAH_WALL_HIT, v91)
                local v93 = u6
                local v94 = u31.KALIYAH_EXPLOSION
                local v95 = {
                    ["rollOffMaxDistance"] = 80,
                    ["rollOffMinDistance"] = 30
                }
                for v96, v97 in v91 do
                    v95[v96] = v97
                end
                v93:playSound(v94, v95)
            end
        end)
        task.delay(u71.knockbackDuration, function() --[[ Line: 240 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u71
                [3] = u17
                [4] = u19
                [5] = u32
                [6] = u84
                [7] = u25
                [8] = u24
            --]]
            u72:DoCleaning()
            if u71.target.PrimaryPart then
                local v98 = u71.target:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0)
                local v99 = u17.Assets.Effects.DragonEmblemExplode:Clone()
                v99.Position = v98
                v99.Parent = u19
                u32:playEffects({ v99 }, nil, {
                    ["destroyAfterSec"] = 3
                })
            end
            if u84 then
                u25:playAnimation(u84, u24.DRAGON_SLAYER_LAUNCH_IMPACT)
            end
        end)
    end)
    local u100 = u5.new(2)
    u7({ u25:getAssetId(u24.DRAGON_SLAYER_PUNCH) }, function(p101, p102) --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u33
            [3] = u28
            [4] = u100
            [5] = u6
            [6] = u31
            [7] = u9
            [8] = u17
            [9] = u19
            [10] = u20
            [11] = u11
        --]]
        local u103 = p101.Character
        if not u103 then
            return nil
        end
        local u104 = p101 == u16.LocalPlayer
        if not u33(p101, u28.DRAGON_SLAYER) then
            return nil
        end
        if not u104 and u100:has(p101) then
            return nil
        end
        u100:add(p101)
        if u103.PrimaryPart or u104 then
            local v105 = u6
            local v106 = u31.KALIYAH_PUNCH
            local v107 = {}
            local v108
            if u104 then
                v108 = nil
            else
                v108 = u103:GetPrimaryPartCFrame().Position
            end
            v107.position = v108
            v105:playSound(v106, v107)
        end
        p102:GetMarkerReachedSignal("impact"):Connect(function() --[[ Line: 278 ]]
            --[[
            Upvalues:
                [1] = u104
                [2] = u16
                [3] = u9
                [4] = u103
                [5] = u17
                [6] = u19
                [7] = u20
                [8] = u11
            --]]
            if u104 then
                local v109 = u16.LocalPlayer.Character
                if v109 ~= nil then
                    v109 = v109.PrimaryPart
                    if v109 ~= nil then
                        v109 = v109.CFrame
                    end
                end
                if v109 == nil then
                    v109 = CFrame.new()
                end
                u9.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), v109.LookVector, {
                    ["cycles"] = 3
                })
            end
            task.delay(0.03, function() --[[ Line: 302 ]]
                --[[
                Upvalues:
                    [1] = u103
                    [2] = u17
                    [3] = u19
                    [4] = u20
                    [5] = u11
                --]]
                local v110 = u103:FindFirstChild("RightHand")
                if v110 then
                    local u111 = u17.Assets.Misc.DragonPunchRune:Clone()
                    local v112 = v110.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)
                    u111.CFrame = CFrame.new(v112 * Vector3.new(0, 0, 1.5)) * (v112 - v110.Position)
                    u111.Parent = u19
                    task.delay(0.04, function() --[[ Line: 315 ]]
                        --[[
                        Upvalues:
                            [1] = u111
                            [2] = u20
                            [3] = u11
                        --]]
                        local u113 = u111.SurfaceGui.Brightness
                        u20(0.4, u11, function(p114) --[[ Line: 317 ]]
                            --[[
                            Upvalues:
                                [1] = u111
                                [2] = u113
                            --]]
                            for _, v115 in u111:GetChildren() do
                                if v115:IsA("SurfaceGui") then
                                    v115.Brightness = (1 - p114 / 2) * u113
                                    for _, v116 in v115:GetChildren() do
                                        if v116:IsA("ImageLabel") then
                                            v116.ImageTransparency = p114
                                        end
                                    end
                                end
                            end
                        end):Wait()
                        u111:Destroy()
                    end)
                end
            end)
        end)
    end)
end
function u35.onKitReplicationDeactivated(_) --[[ Line: 339 ]] end
function u35.onInnateAbilityEnabled(_, _, _) --[[ Line: 341 ]] end
function u35.onAbilityUsed(_, _, _) --[[ Line: 343 ]] end
function u35.playPunchAnimation(_, u117) --[[ Line: 345 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u25
        [3] = u16
        [4] = u24
        [5] = u9
        [6] = u18
    --]]
    local u118 = u12.new()
    local u119 = u25:playAnimation(u16.LocalPlayer, u24.DRAGON_SLAYER_PUNCH)
    u118:GiveTask(function() --[[ Line: 348 ]]
        --[[
        Upvalues:
            [1] = u119
        --]]
        local v120 = u119
        if v120 ~= nil then
            v120:Stop()
        end
    end)
    u118:GiveTask(u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0
    }))
    u118:GiveTask(u18.Heartbeat:Connect(function() --[[ Line: 357 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u118
            [3] = u117
        --]]
        local v121 = u16.LocalPlayer.Character
        local v122
        if v121 == nil then
            v122 = v121
        else
            v122 = v121.PrimaryPart
        end
        if not v122 then
            u118:DoCleaning()
            return nil
        end
        v121:PivotTo(CFrame.new(v121:GetPrimaryPartCFrame().Position) * u117)
    end))
    task.delay(0.46, function() --[[ Line: 372 ]]
        --[[
        Upvalues:
            [1] = u118
        --]]
        u118:DoCleaning()
    end)
    return u118
end
function u35.deleteEmblem(p123, p124) --[[ Line: 377 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.Controllers.InteractionRegistryController:removePrompt(p124, "KaliyahPunchInteraction")
    local v125 = p123.dragonEmblems[p124]
    if v125 ~= nil then
        local v126 = v125.model
        if v126 ~= nil then
            v126:Destroy()
        end
    end
    p123.dragonEmblems[p124] = nil
end
function u35.getDragonEmblemFolder(p127) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u19
    --]]
    if not p127.dragonEmblemFolder then
        p127.dragonEmblemFolder = u13("Folder", {
            ["Name"] = "DragonEmblems",
            ["Parent"] = u19
        })
    end
    return p127.dragonEmblemFolder
end
u9.CreateController(u35.new())
return nil