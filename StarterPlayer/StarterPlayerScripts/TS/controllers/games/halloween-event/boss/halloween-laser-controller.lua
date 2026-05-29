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
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "HalloweenLaserController"
    end,
    ["__index"] = u13
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p21)
    p21.Name = "HalloweenLaserController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u9
        [4] = u4
        [5] = u17
        [6] = u7
        [7] = u6
        [8] = u5
        [9] = u3
        [10] = u16
        [11] = u15
        [12] = u10
        [13] = u12
        [14] = u11
    --]]
    u13.KnitStart(p22)
    local u23 = nil
    u14.On(function(p24, _, _, _, _, _, _, p25, _, _, _, _, _, _) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u17
            [4] = u23
            [5] = u7
            [6] = u6
        --]]
        local v26 = p24 == u9.LocalPlayer.Character
        local v27 = p24.PrimaryPart
        if v27 ~= nil then
            v27 = v27.Position
        end
        if p25 ~= nil then
            p25 = p25.halloweenLaser
        end
        if p25 then
            if v26 or v27 then
                local v28 = u4
                local v29 = u17.BURN_HIT
                local v30 = {
                    ["rollOffMaxDistance"] = 60,
                    ["rollOffMinDistance"] = 30
                }
                if v26 then
                    v27 = nil
                end
                v30.position = v27
                v28:playSound(v29, v30)
            end
            if v26 and not u23 then
                u23 = u7.new()
                u23:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = 0.75
                }))
                task.delay(5, function() --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    local v31 = u23
                    if v31 ~= nil then
                        v31:DoCleaning()
                    end
                    u23 = nil
                end)
            end
        end
    end)
    u5("CryptBoss", function(p32) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u16
            [4] = u15
            [5] = u10
            [6] = u12
            [7] = u4
            [8] = u17
            [9] = u11
        --]]
        local u33 = p32:WaitForChild("BeamTarget")
        local v34 = p32:WaitForChild("Humanoid")
        local u35 = p32:WaitForChild("staff"):WaitForChild("Handle"):WaitForChild("Neon"):WaitForChild("LaserSource")
        u3(v34, function(p36) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
                [3] = u15
                [4] = u10
                [5] = u12
                [6] = u4
                [7] = u17
                [8] = u11
                [9] = u35
                [10] = u33
            --]]
            p36.AnimationPlayed:Connect(function(p37) --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u16
                    [3] = u15
                    [4] = u10
                    [5] = u12
                    [6] = u4
                    [7] = u17
                    [8] = u11
                    [9] = u35
                    [10] = u33
                --]]
                local v38 = p37.Animation
                if v38 ~= nil then
                    v38 = v38.AnimationId
                end
                local u39 = u7.new()
                u39:GiveTask(p37.Stopped:Connect(function() --[[ Line: 86 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                    --]]
                    u39:DoCleaning()
                end))
                u39:GiveTask(p37)
                if v38 == u16:getAssetId(u15.HALLOWEEN_BOSS_CAST_BEAM) then
                    u39:GiveTask(p37:GetMarkerReachedSignal("BeamEnd"):Connect(function() --[[ Line: 91 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        u39:DoCleaning()
                    end))
                    u39:GiveTask(p37:GetMarkerReachedSignal("BeamBegin"):Connect(function() --[[ Line: 94 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u12
                            [3] = u4
                            [4] = u17
                            [5] = u39
                            [6] = u11
                            [7] = u35
                            [8] = u33
                        --]]
                        local function u50(u40) --[[ Line: 95 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                                [2] = u12
                                [3] = u4
                                [4] = u17
                                [5] = u39
                                [6] = u11
                                [7] = u35
                            --]]
                            if u40 ~= nil then
                                u40 = u40:FindFirstChild("UpperTorso")
                                if u40 ~= nil then
                                    u40 = u40:FindFirstChild("BodyFrontAttachment")
                                end
                            end
                            if not u40 then
                                return nil
                            end
                            local u41 = u10.Assets.Effects.HwBossLaser:Clone()
                            u41.CanCollide = false
                            u41.CanQuery = false
                            u41.Parent = u12
                            u4:playSound(u17.HALLOWEEN_BOSS_BEAM, {
                                ["rollOffMaxDistance"] = 400,
                                ["parent"] = u41
                            })
                            u39:GiveTask(u41)
                            u39:GiveTask(u11.Heartbeat:Connect(function() --[[ Line: 116 ]]
                                --[[
                                Upvalues:
                                    [1] = u40
                                    [2] = u35
                                    [3] = u41
                                --]]
                                local v42 = u40.WorldPosition - u35.WorldPosition
                                local v43 = CFrame.lookAt(Vector3.new(0, 0, 0), v42)
                                local v44 = v42.Magnitude
                                local v45 = Vector3.new(v44, 3, 3)
                                local v46 = -v44 / 2
                                local v47 = v43 * Vector3.new(0, 0, v46)
                                local v48 = u35.WorldCFrame.Position
                                local v49 = CFrame.new(v47 + v48) * (v43 * CFrame.Angles(0, -1.5707963267948966, 0))
                                u41.Size = v45
                                u41.CFrame = v49
                            end))
                        end
                        u50(u33.Value)
                        u39:GiveTask(u33.Changed:Connect(function() --[[ Line: 135 ]]
                            --[[
                            Upvalues:
                                [1] = u50
                                [2] = u33
                            --]]
                            u50(u33.Value)
                        end))
                    end))
                end
            end)
        end)
    end)
end
u6.CreateController(u18.new())
return nil