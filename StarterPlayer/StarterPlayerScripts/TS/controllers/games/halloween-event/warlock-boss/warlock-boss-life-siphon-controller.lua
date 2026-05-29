local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimatorAdded
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v8.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "halloween-2023", "warlock-boss-constants").WarlockBossConstants
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "WarlockBossLifeSiphonController"
    end,
    ["__index"] = u13
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p23)
    p23.Name = "WarlockBossLifeSiphonController"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u9
        [4] = u4
        [5] = u19
        [6] = u7
        [7] = u6
        [8] = u5
        [9] = u17
        [10] = u3
        [11] = u16
        [12] = u15
        [13] = u10
        [14] = u12
        [15] = u11
        [16] = u18
    --]]
    u13.KnitStart(p24)
    local u25 = nil
    u14.On(function(p26, _, _, _, _, _, _, p27, _, _, _, _, _, _) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u19
            [4] = u25
            [5] = u7
            [6] = u6
        --]]
        local v28 = p26 == u9.LocalPlayer.Character
        local v29 = p26.PrimaryPart
        if v29 ~= nil then
            v29 = v29.Position
        end
        if p27 ~= nil then
            p27 = p27.halloweenLaser
        end
        if p27 then
            if v28 or v29 then
                local v30 = u4
                local v31 = u19.BURN_HIT
                local v32 = {
                    ["rollOffMaxDistance"] = 60,
                    ["rollOffMinDistance"] = 30
                }
                if v28 then
                    v29 = nil
                end
                v32.position = v29
                v30:playSound(v31, v32)
            end
            if v28 and not u25 then
                u25 = u7.new()
                u25:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = 0.75
                }))
                task.delay(5, function() --[[ Line: 66 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    local v33 = u25
                    if v33 ~= nil then
                        v33:DoCleaning()
                    end
                    u25 = nil
                end)
            end
        end
    end)
    u5("WarlockBoss", function(p34) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u3
            [3] = u7
            [4] = u16
            [5] = u15
            [6] = u10
            [7] = u12
            [8] = u4
            [9] = u19
            [10] = u11
            [11] = u18
        --]]
        local u35 = p34:WaitForChild("BeamTarget")
        local u36 = p34:WaitForChild("Humanoid")
        local u37 = p34:WaitForChild("staff"):WaitForChild("Handle"):WaitForChild("Neon"):WaitForChild("LaserSource")
        local u38 = u17:getEntity(p34)
        u3(u36, function(p39) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
                [3] = u15
                [4] = u38
                [5] = u10
                [6] = u12
                [7] = u4
                [8] = u19
                [9] = u11
                [10] = u37
                [11] = u36
                [12] = u18
                [13] = u35
            --]]
            p39.AnimationPlayed:Connect(function(p40) --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u16
                    [3] = u15
                    [4] = u38
                    [5] = u10
                    [6] = u12
                    [7] = u4
                    [8] = u19
                    [9] = u11
                    [10] = u37
                    [11] = u36
                    [12] = u18
                    [13] = u35
                --]]
                local v41 = p40.Animation
                if v41 ~= nil then
                    v41 = v41.AnimationId
                end
                local u42 = u7.new()
                u42:GiveTask(p40.Stopped:Connect(function() --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                    --]]
                    u42:DoCleaning()
                end))
                u42:GiveTask(p40)
                if v41 == u16:getAssetId(u15.HALLOWEEN_BOSS_CAST_BEAM) then
                    u42:GiveTask(p40:GetMarkerReachedSignal("BeamEnd"):Connect(function() --[[ Line: 94 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                        --]]
                        u42:DoCleaning()
                    end))
                    u42:GiveTask(p40:GetMarkerReachedSignal("BeamBegin"):Connect(function() --[[ Line: 97 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                            [2] = u42
                            [3] = u10
                            [4] = u12
                            [5] = u4
                            [6] = u19
                            [7] = u11
                            [8] = u37
                            [9] = u36
                            [10] = u18
                            [11] = u35
                        --]]
                        local v43 = u38
                        if v43 ~= nil then
                            v43 = v43:isDead()
                        end
                        if v43 then
                            u42:DoCleaning()
                        end
                        local function u62(u44) --[[ Line: 105 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                                [2] = u12
                                [3] = u4
                                [4] = u19
                                [5] = u42
                                [6] = u11
                                [7] = u38
                                [8] = u37
                                [9] = u36
                                [10] = u18
                            --]]
                            local u45
                            if u44 == nil then
                                u45 = u44
                            else
                                u45 = u44:FindFirstChild("UpperTorso")
                                if u45 ~= nil then
                                    u45 = u45:FindFirstChild("BodyFrontAttachment")
                                end
                            end
                            if not u45 then
                                return nil
                            end
                            local u46 = u10.Assets.Effects.HwBossLaser:Clone()
                            u46.CanCollide = false
                            u46.CanQuery = false
                            u46.Parent = u12
                            u4:playSound(u19.DRAIN_HEALTH_LOOP, {
                                ["rollOffMaxDistance"] = 400,
                                ["parent"] = u46
                            })
                            u42:GiveTask(u46)
                            u42:GiveTask(u11.Heartbeat:Connect(function() --[[ Line: 126 ]]
                                --[[
                                Upvalues:
                                    [1] = u38
                                    [2] = u42
                                    [3] = u45
                                    [4] = u37
                                    [5] = u46
                                    [6] = u36
                                    [7] = u44
                                    [8] = u18
                                --]]
                                local v47 = u38
                                if v47 ~= nil then
                                    v47 = v47:isDead()
                                end
                                if v47 then
                                    u42:DoCleaning()
                                end
                                local v48 = u45.WorldPosition - u37.WorldPosition
                                local v49 = CFrame.lookAt(Vector3.new(0, 0, 0), v48)
                                local v50 = v48.Magnitude
                                local v51 = Vector3.new(v50, 3, 3)
                                local v52 = -v50 / 2
                                local v53 = v49 * Vector3.new(0, 0, v52)
                                local v54 = u37.WorldCFrame.Position
                                local v55 = CFrame.new(v53 + v54) * (v49 * CFrame.Angles(0, -1.5707963267948966, 0))
                                u46.Size = v51
                                u46.CFrame = v55
                                local u56 = (u36.Parent:GetPivot().Position - u44:GetPivot().Position).Magnitude
                                if u18.LifeSiphonMaxHealLength < u56 then
                                    local v57 = u46:GetChildren()
                                    local function v59(p58) --[[ Line: 154 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u56
                                            [2] = u18
                                        --]]
                                        if p58:IsA("Beam") or p58:IsA("ParticleEmitter") then
                                            p58.Color = ColorSequence.new(Color3.fromRGB(255, 184, 48):Lerp(Color3.fromRGB(252, 56, 56), (u56 - u18.LifeSiphonMaxHealLength) / (135 - u18.LifeSiphonMaxHealLength)))
                                        end
                                    end
                                    for v60, v61 in v57 do
                                        v59(v61, v60 - 1, v57)
                                    end
                                end
                            end))
                        end
                        u62(u35.Value)
                        u42:GiveTask(u35.Changed:Connect(function() --[[ Line: 166 ]]
                            --[[
                            Upvalues:
                                [1] = u62
                                [2] = u35
                            --]]
                            u62(u35.Value)
                        end))
                    end))
                end
            end)
        end)
    end)
end
u6.CreateController(u20.new())
return nil