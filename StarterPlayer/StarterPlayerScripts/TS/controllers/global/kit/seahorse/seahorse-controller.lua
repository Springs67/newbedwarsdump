local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "base-kit-controller").BaseKitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "seahorse", "seahorse-util").SeahorseUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u25 = v1.import(script, script.Parent, "seahorse-display").SeahorseDisplay
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "SeahorseController"
    end,
    ["__index"] = u16
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
        [3] = u23
        [4] = u17
    --]]
    u16.constructor(p29, u20.SEAHORSE, {
        ["imageIds"] = {
            "rbxassetid://11902486870",
            "rbxassetid://11902487235",
            "rbxassetid://11902487139",
            "rbxassetid://11902486968"
        },
        ["sounds"] = {
            u23.SEAHORSE_DAMAGE_BEAM,
            u23.SEAHORSE_DAMAGE_SHOT_1,
            u23.SEAHORSE_DAMAGE_SHOT_2,
            u23.SEAHORSE_EVOLVE_1,
            u23.SEAHORSE_EVOLVE_2,
            u23.SEAHORSE_EVOLVE_3,
            u23.SEAHORSE_FREEZE,
            u23.SEAHORSE_HEAL_BEAM,
            u23.SEAHORSE_HEAL_SHOT_1,
            u23.SEAHORSE_HEAL_SHOT_2,
            u23.SEAHORSE_SPEEDUP
        },
        ["animations"] = {
            u17.SEAHORSE_BEAM,
            u17.SEAHORSE_IDLE_LOOP,
            u17.SEAHORSE_SHOOT,
            u17.SEAHORSE_SPAWN,
            u17.SEAHORSE_SWIM_LOOP
        }
    })
    p29.Name = "SeahorseController"
    p29.seahorseMap = {}
end
function u26.KnitStart(p30) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p30)
end
function u26.onKitLocalActivated(u31, p32) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u6
        [3] = u9
        [4] = u25
    --]]
    p32:GiveTask(u22.Client:Get("UpdateSeahorseStacks"):Connect(function(p33) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u6
            [3] = u9
            [4] = u25
        --]]
        if u31.stackStatusTree then
            u9.update(u31.stackStatusTree, u9.createElement(u25, {
                ["stacks"] = p33.stacks
            }))
        else
            u31.stackStatusTree = u6.Controllers.StatusInfoListController:waitForSetupAddElement(u9.createElement(u25, {
                ["stacks"] = p33.stacks
            }))
        end
    end))
end
function u26.onKitLocalDeactivated(p34) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p34.stackStatusTree then
        u9.unmount(p34.stackStatusTree)
        p34.stackStatusTree = nil
    end
end
function u26.onKitReplicationActivated(u35, u36) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u11
        [4] = u6
        [5] = u4
        [6] = u23
        [7] = u12
        [8] = u8
        [9] = u14
        [10] = u3
        [11] = u18
        [12] = u17
        [13] = u15
        [14] = u21
        [15] = u7
        [16] = u24
        [17] = u13
    --]]
    u36:GiveTask(u5("seahorse_data", function(p37) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u35
        --]]
        u36:GiveTask(u35:registerSeahorseData(p37))
    end))
    u36:GiveTask(u22.Client:Get("SeahorseBeamBlast"):Connect(function(p38) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u6
            [3] = u4
            [4] = u23
        --]]
        local v39 = p38.target.PrimaryPart
        if v39 ~= nil then
            v39 = v39.Position
        end
        if not v39 then
            return nil
        end
        local v40 = p38.target == u11.LocalPlayer.Character
        if v40 then
            local u41 = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = p38.heal and 1.2 or 0.3
            })
            task.delay(p38.heal and 2.5 or 0.5, function() --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41.Destroy()
            end)
        end
        local v42 = u4
        local v43
        if p38.heal then
            v43 = u23.SEAHORSE_SPEEDUP
        else
            v43 = u23.SEAHORSE_FREEZE
        end
        local v44 = {}
        if v40 then
            v39 = nil
        end
        v44.position = v39
        v42:playSound(v43, v44)
    end))
    u36:GiveTask(u22.Client:Get("SeahorseBasicShot"):Connect(function(u45) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u12
            [3] = u8
            [4] = u14
            [5] = u3
            [6] = u23
            [7] = u4
            [8] = u11
            [9] = u18
            [10] = u17
            [11] = u15
            [12] = u21
            [13] = u7
            [14] = u24
        --]]
        local u46 = u35.seahorseMap[u45.fromSeahorseId]
        local v47
        if u46 == nil then
            v47 = u46
        else
            v47 = u46.model
        end
        local v48 = u45.target.PrimaryPart
        if v48 ~= nil then
            v48 = v48.Parent
        end
        if not v48 then
            return nil
        end
        local u49 = u12.Assets.Effects.seahorse
        local u50 = u8.new()
        local u51 = true
        u50:GiveTask(function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            u51 = false
            return u51
        end)
        local v52, v53, v54
        if u46 then
            u46.inAction = true
            u46.target = u45.target
            u50:GiveTask(function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                u46.inAction = false
                u46.target = nil
            end)
            v52 = u51
            v53 = false
            v54 = 0
        else
            v52 = u51
            v53 = false
            v54 = 0
        end
        while true do
            if true then
                if v53 then
                    v54 = v54 + 1
                else
                    v53 = true
                end
            end
            if v54 >= u45.shotCount or not v52 then
                break
            end
            local v55
            if v47 == nil then
                v55 = v47
            else
                v55 = v47.Parent
            end
            if not v55 then
                break
            end
            local u56 = v47.RootPart.start.Position
            local v57
            if u45.heal then
                v57 = u49.heal_shard
            else
                v57 = u49.damage_shard
            end
            local u58 = v57:Clone()
            u58.Parent = u14
            local v59
            if u45.heal then
                v59 = u3.fromList(u23.SEAHORSE_HEAL_SHOT_1, u23.SEAHORSE_HEAL_SHOT_2)
            else
                v59 = u3.fromList(u23.SEAHORSE_DAMAGE_SHOT_1, u23.SEAHORSE_DAMAGE_SHOT_2)
            end
            local v60 = u4
            local v61 = {}
            local v62
            if u46 == nil then
                v62 = u46
            else
                v62 = u46.data.Owner.Value
            end
            local v63
            if v62 == u11.LocalPlayer.Character then
                v63 = nil
            else
                v63 = u56
            end
            v61.position = v63
            v61.playbackSpeedMultiplier = 0.95 + math.random() * 0.1
            v60:playSound(v59, v61)
            local v64 = v47.AnimationController:FindFirstChild("Animator")
            if v64 then
                u18:playAnimation(v64, u17.SEAHORSE_SHOOT)
            end
            local u69 = u15(u21.BASIC_SHOT_TRAVEL_DURATION_SEC, u7, function(p65) --[[ Line: 166 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u50
                    [3] = u56
                    [4] = u58
                --]]
                local v66 = u45.target.PrimaryPart
                if v66 ~= nil then
                    v66 = v66.CFrame.Position
                end
                if not v66 then
                    return u50:DoCleaning()
                end
                local v67 = u56:Lerp(v66, p65)
                local v68 = (v66 - u56).Unit
                u58.CFrame = CFrame.new(v67, v66 + v68)
                u58.CFrame = u58.CFrame * CFrame.Angles(0, 0, 3.141592653589793 * (u45.heal and 1 or -1))
            end)
            u50:GiveTask(function() --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u69
                --]]
                return u69:Cancel()
            end)
            task.spawn(function() --[[ Line: 185 ]]
                --[[
                Upvalues:
                    [1] = u69
                    [2] = u45
                    [3] = u49
                    [4] = u24
                    [5] = u58
                    [6] = u14
                    [7] = u3
                    [8] = u23
                    [9] = u4
                    [10] = u11
                --]]
                u69:Wait()
                local v70
                if u45.heal then
                    v70 = u49.heal_impact
                else
                    v70 = u49.damage_impact
                end
                local v71 = v70:Clone()
                u24:disableEffects(v71:GetDescendants())
                local v72 = u58.CFrame.Position
                v71.Position = v72
                v71.Parent = u14
                u24:playEffects({ v71 }, u45.target, {
                    ["destroyAfterSec"] = 3
                })
                u58:Destroy()
                local v73
                if u45.heal then
                    v73 = u3.fromList(u23.TRINITY_LIGHT_ORB_HEAL)
                else
                    v73 = u3.fromList(u23.ICICLE_IMPACT_1, u23.ICICLE_IMPACT_2)
                end
                local v74 = u4
                local v75 = {}
                if u45.target == u11.LocalPlayer.Character then
                    v72 = nil
                end
                v75.position = v72
                v75.playbackSpeedMultiplier = 0.95 + math.random() * 0.1
                v75.volumeMultiplier = u45.heal and 0.4 or 1
                v74:playSound(v73, v75)
            end)
            task.wait(u21.TIME_BETWEEN_BASIC_SHOT_SEC)
        end
        if u46 then
            u46.target = nil
            task.delay(0.2, function() --[[ Line: 208 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                u46.inAction = false
            end)
        end
    end))
    u36:GiveTask(u22.Client:Get("SeahorseShootBeam"):Connect(function(u76) --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u35
            [3] = u8
            [4] = u23
            [5] = u4
            [6] = u11
            [7] = u18
            [8] = u17
            [9] = u14
            [10] = u15
            [11] = u7
            [12] = u13
            [13] = u21
        --]]
        local v77
        if u76.heal then
            v77 = Color3.fromRGB(70, 253, 42)
        else
            v77 = Color3.fromRGB(188, 231, 249)
        end
        local v78 = u12.Assets.Effects.seahorse
        local u79 = u35.seahorseMap[u76.fromSeahorseId]
        if not u79 then
            return nil
        end
        local v80 = u79.model
        local v81 = u76.target.PrimaryPart
        if v81 ~= nil then
            v81 = v81.Parent
        end
        if not v81 then
            return nil
        end
        local u82 = u8.new()
        local u83 = true
        u82:GiveTask(function() --[[ Line: 232 ]]
            --[[
            Upvalues:
                [1] = u83
            --]]
            u83 = false
        end)
        if u79 then
            u79.inAction = true
            u79.target = u76.target
            u82:GiveTask(function() --[[ Line: 238 ]]
                --[[
                Upvalues:
                    [1] = u79
                --]]
                u79.inAction = false
                u79.target = nil
            end)
        end
        u79.beamMaid = u82
        local v84 = v80.RootPart.start
        local v85
        if u76.heal then
            v85 = u23.SEAHORSE_HEAL_BEAM
        else
            v85 = u23.SEAHORSE_DAMAGE_BEAM
        end
        local v86 = u4
        local v87 = {}
        if u79 ~= nil then
            u79 = u79.data.Owner.Value
        end
        local v88
        if u79 == u11.LocalPlayer.Character then
            v88 = nil
        else
            v88 = v84.Position
        end
        v87.position = v88
        v86:playSound(v85, v87)
        local v89 = v80.AnimationController:FindFirstChild("Animator")
        local u90 = v89 and u18:playAnimation(v89, u17.SEAHORSE_BEAM)
        if u90 then
            u82:GiveTask(function() --[[ Line: 259 ]]
                --[[
                Upvalues:
                    [1] = u90
                --]]
                return u90:Stop(0.1)
            end)
        end
        local u91 = u83
        for _, u92 in v84:GetDescendants() do
            if u92:IsA("ParticleEmitter") then
                u92.Enabled = true
                u92.Color = ColorSequence.new(v77)
                u82:GiveTask(function() --[[ Line: 268 ]]
                    --[[
                    Upvalues:
                        [1] = u92
                    --]]
                    u92.Enabled = false
                    return u92.Enabled
                end)
            end
        end
        local v93
        if u76.heal then
            v93 = v78.heal_impact
        else
            v93 = v78.damage_impact
        end
        local u94 = v93:Clone()
        u82:GiveTask(u94)
        local v95 = u94:FindFirstChild("end")
        for _, u96 in v80.Beam:GetChildren() do
            if u96:IsA("Beam") then
                u96.Color = ColorSequence.new(v77)
                u96.Attachment1 = v95
                u96.Enabled = true
                u82:GiveTask(function() --[[ Line: 284 ]]
                    --[[
                    Upvalues:
                        [1] = u96
                    --]]
                    u96.Enabled = false
                    return u96.Enabled
                end)
            end
        end
        local u97 = v84.CFrame
        u94.CFrame = u97
        u94.Parent = u14
        local u102 = u15(0.2, u7, function(p98) --[[ Line: 292 ]]
            --[[
            Upvalues:
                [1] = u76
                [2] = u82
                [3] = u97
                [4] = u94
            --]]
            local v99 = u76.target.PrimaryPart
            if v99 ~= nil then
                v99 = v99.Position
            end
            if not v99 then
                return u82:DoCleaning()
            end
            local v100 = u97.Position:Lerp(v99, p98)
            local v101 = (v99 - u97.Position).Unit
            u94.CFrame = CFrame.new(v100, v99 + v101)
        end)
        u82:GiveTask(function() --[[ Line: 306 ]]
            --[[
            Upvalues:
                [1] = u102
            --]]
            return u102:Cancel()
        end)
        task.spawn(function() --[[ Line: 309 ]]
            --[[
            Upvalues:
                [1] = u102
                [2] = u91
                [3] = u82
                [4] = u13
                [5] = u76
                [6] = u94
            --]]
            u102:Wait()
            if not u91 then
                return nil
            end
            u82:GiveTask(u13.Heartbeat:Connect(function() --[[ Line: 314 ]]
                --[[
                Upvalues:
                    [1] = u76
                    [2] = u82
                    [3] = u94
                --]]
                if not u76.target.PrimaryPart then
                    return u82:DoCleaning()
                end
                u94.Position = u76.target.PrimaryPart.Position
            end))
        end)
        task.delay(u21.BEAM_DURATION_SEC, function() --[[ Line: 321 ]]
            --[[
            Upvalues:
                [1] = u82
            --]]
            u82:DoCleaning()
        end)
    end))
    u36:GiveTask(u22.Client:Get("SeahorseBeamEnd"):Connect(function(p103) --[[ Line: 325 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        local v104 = u35.seahorseMap[p103.fromSeahorseId]
        if v104 ~= nil then
            local v105 = v104.beamMaid
            if v105 ~= nil then
                v105:DoCleaning()
            end
        end
    end))
end
function u26.onKitReplicationDeactivated(_) --[[ Line: 337 ]] end
function u26.onInnateAbilityEnabled(_, _, _) --[[ Line: 339 ]] end
function u26.onAbilityUsed(_, _, _) --[[ Line: 341 ]] end
function u26.registerSeahorseData(u106, u107) --[[ Line: 343 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u107:WaitForChild("Loaded")
    local u108 = u8.new()
    u108:GiveTask(u107.AncestryChanged:Connect(function() --[[ Line: 346 ]]
        --[[
        Upvalues:
            [1] = u108
        --]]
        u108:DoCleaning()
    end))
    local u109 = u8.new()
    u108:GiveTask(u109)
    u109:GiveTask(u106:spawnSeahorse(u107))
    u108:GiveTask(u107:GetAttributeChangedSignal("Level"):Connect(function() --[[ Line: 352 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u106
            [3] = u107
        --]]
        u109:DoCleaning()
        u109:GiveTask(u106:spawnSeahorse(u107, true))
    end))
    return u108
end
function u26.spawnSeahorse(u110, u111, p112) --[[ Line: 358 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u19
        [3] = u12
        [4] = u11
        [5] = u13
        [6] = u18
        [7] = u17
        [8] = u4
        [9] = u23
    --]]
    if p112 == nil then
        p112 = false
    end
    local u113 = u8.new()
    local v114 = u111:WaitForChild("Owner", 1)
    if v114 ~= nil then
        v114 = v114.Value
    end
    local v115
    if v114 == nil then
        v115 = v114
    else
        v115 = v114:IsA("Model")
    end
    if not v115 then
        return u113
    end
    local u116 = u19:getEntity(v114)
    local v117
    if u116 == nil then
        v117 = u116
    else
        v117 = u116:isAlive()
    end
    if not v117 then
        return u113
    end
    local u118 = u12.Assets.Misc.seahorse:FindFirstChild("level_" .. tostring(u111:GetAttribute("Level"))):Clone()
    u110.seahorseMap[u111:GetAttribute("Id")] = {
        ["model"] = u118,
        ["data"] = u111
    }
    print("SPAWNING: " .. tostring(u111:GetAttribute("Id")))
    u113:GiveTask(u118)
    local u119 = u118:FindFirstChild("AnimationController")
    if u119 ~= nil then
        u119 = u119:FindFirstChild("Animator")
    end
    local v120
    if v114 == u11.LocalPlayer.Character then
        v120 = u13.RenderStepped
    else
        v120 = u13.Heartbeat
    end
    local u121 = 50
    local u122 = u118:GetPivot().Position
    local u123 = u118:GetPivot().Position
    local u124 = true
    local u125 = Vector3.new(0, 0, 0)
    local u126 = nil
    u113:GiveTask(v120:Connect(function(p127) --[[ Line: 406 ]]
        --[[
        Upvalues:
            [1] = u116
            [2] = u113
            [3] = u122
            [4] = u110
            [5] = u111
            [6] = u124
            [7] = u126
            [8] = u121
            [9] = u119
            [10] = u18
            [11] = u17
            [12] = u118
            [13] = u125
            [14] = u123
        --]]
        if not u116:isAlive() then
            return u113:DoCleaning()
        end
        local v128 = u116:getInstance():GetPrimaryPartCFrame()
        u122 = v128 * Vector3.new(-3, 1.5, 0)
        local v129 = u110.seahorseMap[u111:GetAttribute("Id")]
        local v130
        if v129 == nil then
            v130 = v129
        else
            v130 = v129.inAction
        end
        if u124 then
            local v131 = u126
            if v131 ~= nil then
                v131:Stop()
            end
            local v132 = u126
            if v132 ~= nil then
                v132:Destroy()
            end
            u126 = nil
        end
        if not u124 and v130 then
            u121 = 0
        end
        if not (u124 or v130) then
            local v133 = u121 + 50 * p127 * 2
            u121 = math.min(v133, 50)
            if u119 and not u126 then
                u126 = u18:playAnimation(u119, u17.SEAHORSE_SWIM_LOOP, {
                    ["looped"] = true
                })
            end
        end
        local v134 = u118:GetPrimaryPartCFrame().Position
        local v135 = (u122 - v134).Magnitude
        local v136
        if v135 > 60 then
            v136 = u122
        else
            local v137 = u122
            local v138 = p127 * u121 / v135
            v136 = v134:Lerp(v137, (math.clamp(v138, 0, 1)))
        end
        if v130 then
            local v139 = u125.X
            local v140 = u125.Z
            Vector3.new(v139, 0, v140)
            local v141
            if u125.Magnitude > 15 * p127 then
                v141 = u125.Unit * (15 * p127)
            else
                local v142 = u125
                local v143 = 1 - 0.8 * p127
                v141 = v142 * math.max(v143, 0)
            end
            v136 = u123 + v141
        end
        local v144 = u118:GetPrimaryPartCFrame()
        local v145 = CFrame.new(v136) * (v144 - v144.Position)
        u118:PivotTo(v145)
        u125 = v136 - u123
        u123 = v136
        u124 = (v136 - u122).Magnitude < 0.5
        if v129 ~= nil then
            v129 = v129.target
            if v129 ~= nil then
                v129 = v129.PrimaryPart
                if v129 ~= nil then
                    v129 = v129.Position
                end
            end
        end
        local v146 = v129 or v128 * Vector3.new(-3, 1.5, -1)
        if v136 == v146 then
            v146 = v136 + Vector3.new(1, 0, 0)
        end
        local v147 = CFrame.new(v136, v146)
        local v148 = u118
        local v149 = p127 * 10
        v148:PivotTo(v145:Lerp(v147, (math.clamp(v149, 0, 1))))
    end))
    u118.Parent = game.Workspace
    if u119 then
        u18:playAnimation(u119, u17.SEAHORSE_IDLE_LOOP, {
            ["looped"] = true
        })
        u18:playAnimation(u119, u17.SEAHORSE_SPAWN)
    end
    if p112 then
        local v150 = u116:getInstance().PrimaryPart
        if v150 ~= nil then
            v150 = v150.Position
        end
        local v151 = u116:getInstance() == u11.LocalPlayer.Character
        if v151 or v150 then
            local v152 = u4
            local v153 = ({ u23.SEAHORSE_EVOLVE_1, u23.SEAHORSE_EVOLVE_2, u23.SEAHORSE_EVOLVE_3 })[u111:GetAttribute("Level") - 1 + 1]
            local v154 = {}
            if v151 then
                v150 = nil
            end
            v154.position = v150
            v152:playSound(v153, v154)
        end
    end
    return u113
end
u6.CreateController(u26.new())
return nil