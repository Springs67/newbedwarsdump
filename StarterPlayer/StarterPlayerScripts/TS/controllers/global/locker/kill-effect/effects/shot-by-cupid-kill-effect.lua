local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u16 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "ShotByCupidKillEffect"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p20, p21)
    u16.setPlayDefaultKillEffect(p20, false)
end
function u17.onKill(p22, _, p23, u24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u12
        [4] = u11
        [5] = u16
        [6] = u8
        [7] = u4
        [8] = u13
        [9] = u10
        [10] = u5
        [11] = u3
        [12] = u15
        [13] = u1
        [14] = u14
    --]]
    local u25 = u6.new()
    p23.Archivable = true
    local u26 = p23:Clone()
    u26.HumanoidRootPart.Anchored = true
    u26:PivotTo(u24)
    u26.Parent = u9
    u25:GiveTask(u26)
    local u27 = u26.Humanoid.Animator:LoadAnimation(u12:getAnimation(u11.CUPID_BOT_SHOOT_R15_IDLE_START))
    local u28 = u26.Humanoid.Animator:LoadAnimation(u12:getAnimation(u11.CUPID_BOT_SHOOT_R15_IDLE_LOOP))
    u28.Looped = true
    u25:GiveTask(u27)
    u25:GiveTask(u28)
    u16.hideCharacter(p22, p23)
    local u29 = u8.Assets.Effects.CupidBow:Clone()
    local v30 = CFrame
    local v31 = u24.Position
    local v32 = CFrame.Angles(0, -2.356194490192345, 0)
    local v33 = u24.LookVector
    local u34 = v30.lookAt(v31 + v32 * v33 * Vector3.new(8, 0, 8) + Vector3.new(0, 5, 0), u24.Position) * CFrame.Angles(1.5707963267948966, 0, 4.71238898038469)
    u29:PivotTo(u34)
    u29.Parent = u9
    u25:GiveTask(u29)
    local u35 = u8.Assets.Effects.CupidArrow:Clone()
    u35:PivotTo(u34)
    local u36 = u35.PrimaryPart
    u36.Anchored = true
    u35.Parent = u9
    u25:GiveTask(u35)
    u4:playSound(u13.BOW_DRAW, {
        ["position"] = u34.Position
    })
    local v37 = u12:playAnimation(u29.AnimationController.Animator, u11.CUPID_BOW_SHOOT, {
        ["looped"] = false,
        ["speed"] = 2
    })
    if v37 then
        u25:GiveTask(v37:GetMarkerReachedSignal("release"):Connect(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u13
                [3] = u34
                [4] = u12
                [5] = u26
                [6] = u11
                [7] = u25
                [8] = u24
                [9] = u10
                [10] = u5
                [11] = u35
                [12] = u8
                [13] = u3
                [14] = u9
                [15] = u15
                [16] = u1
                [17] = u36
                [18] = u27
                [19] = u28
                [20] = u14
                [21] = u29
            --]]
            u4:playSound(u13.BOW_FIRE, {
                ["position"] = u34.Position
            })
            local u38 = u12:playAnimation(u26.Humanoid.Animator, u11.CUPID_BOT_SHOOT_R15_RECOIL)
            u25:GiveTask(task.spawn(function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u24
                    [3] = u10
                    [4] = u5
                    [5] = u35
                    [6] = u25
                    [7] = u4
                    [8] = u13
                    [9] = u8
                    [10] = u3
                    [11] = u9
                    [12] = u15
                    [13] = u26
                    [14] = u1
                    [15] = u36
                    [16] = u38
                    [17] = u27
                    [18] = u28
                    [19] = u14
                    [20] = u29
                --]]
                local u39 = u34
                local u40 = CFrame.new(u24.Position) * u39.Rotation
                local u42 = u10(0.2, u5, function(p41) --[[ Line: 87 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u39
                        [3] = u40
                    --]]
                    u35:PivotTo(u39:Lerp(u40, p41))
                end)
                u25:GiveTask(task.spawn(function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u4
                        [3] = u13
                        [4] = u40
                        [5] = u8
                        [6] = u3
                        [7] = u9
                        [8] = u25
                        [9] = u15
                        [10] = u26
                        [11] = u1
                        [12] = u36
                        [13] = u38
                        [14] = u27
                        [15] = u28
                        [16] = u14
                        [17] = u35
                        [18] = u29
                    --]]
                    u42:Wait()
                    u4:playSound(u13.ARROW_HIT, {
                        ["position"] = u40.Position
                    })
                    local u43 = u8.Assets.Effects.HeartParticle:Clone()
                    u3:setQueryIgnored(u43, true)
                    u43.CFrame = u40
                    u43.Parent = u9
                    u25:GiveTask(u43)
                    u15:weldAccessory(u26, (u8.Assets.Misc.HeartEyes:Clone()))
                    local u46 = u1.Promise.defer(function() --[[ Line: 102 ]]
                        --[[
                        Upvalues:
                            [1] = u43
                        --]]
                        local v44 = false
                        local v45 = 0
                        while true do
                            if v44 then
                                v45 = v45 + 1
                            else
                                v44 = true
                            end
                            if v45 >= 5 then
                                return
                            end
                            u43.Attachment.Heart:Emit(10)
                            u43.Attachment.Glow:Emit(10)
                        end
                    end)
                    u25:GiveTask(function() --[[ Line: 120 ]]
                        --[[
                        Upvalues:
                            [1] = u46
                        --]]
                        return u46:cancel()
                    end)
                    local v47 = u26:FindFirstChild("Waist", true)
                    local v48
                    if v47 == nil then
                        v48 = v47
                    else
                        v48 = v47.Part1
                    end
                    if v48 then
                        u15:weldPartsWithJoint(u36, v47.Part1, "Motor6D")
                        u36.Anchored = false
                    end
                    if u38 then
                        u25:GiveTask(u38.Stopped:Once(function() --[[ Line: 133 ]]
                            --[[
                            Upvalues:
                                [1] = u27
                                [2] = u25
                                [3] = u28
                                [4] = u14
                                [5] = u26
                                [6] = u35
                                [7] = u29
                            --]]
                            u27:Play(0)
                            u25:GiveTask(u27.Stopped:Once(function() --[[ Line: 135 ]]
                                --[[
                                Upvalues:
                                    [1] = u28
                                --]]
                                u28:Play(0)
                            end))
                            u25:GiveTask(task.delay(2, function() --[[ Line: 138 ]]
                                --[[
                                Upvalues:
                                    [1] = u14
                                    [2] = u26
                                    [3] = u35
                                    [4] = u29
                                --]]
                                u14.tweenModelTransparency(u26, 1, 1)
                                u14.tweenModelTransparency(u35, 1, 1)
                                u14.tweenModelTransparency(u29, 1, 1)
                            end))
                        end))
                    end
                end))
                u42:Play()
                u25:GiveTask(function() --[[ Line: 147 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                    --]]
                    return u42:Cancel()
                end)
            end))
        end))
    end
    task.delay(7, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:DoCleaning()
    end)
    return u25
end
return u17