local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InQuad
local u8 = v6.Linear
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "VoidCreatureBedBreakEffect"
    end,
    ["__index"] = u19
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
        [1] = u19
        [2] = u17
    --]]
    u19.constructor(p23, u17.VOID_CREATURES)
    p23.Name = "VoidCreatureBedBreakEffect"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p24)
end
function u20.onBedBreak(u25, _, p26, p27, p28) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u13
        [4] = u12
        [5] = u3
        [6] = u16
        [7] = u15
        [8] = u14
        [9] = u7
        [10] = u4
        [11] = u18
        [12] = u10
        [13] = u8
    --]]
    local u29 = u9.new()
    u25.maid:GiveTask(u29)
    local u30 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p27)
    u30:PivotTo(p26)
    u30.Parent = u13
    local u31
    if u30 == nil then
        u31 = u30
    else
        u31 = u30:WaitForChild("Root", 1)
    end
    local v32 = math.random(15, 20)
    local v33 = math.random
    local v34 = p28 + Vector3.new(v32, 2, v33(15, 20))
    local v35 = math.random(0, 100)
    local v36 = (p28 - v34).Unit
    if v35 < 70 then
        local v37 = u12.Assets.Effects.VoidPortal:Clone()
        v37:PivotTo(CFrame.new(v34))
        v37.Parent = u13
        task.wait(0.5)
        local u38 = u12.Assets.Misc.VoidCrab:Clone()
        u38:PivotTo(CFrame.new(v34, p28))
        u38.Parent = u13
        local v39 = u3:playAnimation(u38, u16:getAssetId(u15.VOID_CRAB_WALKING))
        local v40 = u38.PrimaryPart.CFrame
        local v41 = v36 * 10
        u14(1, u7, function(p42) --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            u38:PivotTo(p42)
        end, v40, CFrame.new(p28 - v41, p28))
        task.wait(1)
        v37:Destroy()
        if v39 ~= nil then
            v39:Stop()
        end
        local u43 = u38:WaitForChild("TargetBeam")
        local u44 = u38:WaitForChild("BlastBeam")
        if u43 and u44 then
            local v45 = u3:playAnimation(u38, u16:getAssetId(u15.VOID_CRAB_BEAM_ATTACK))
            u4:playSound(u18.VOID_CRAB_BEAM_ATTACK, {
                ["rollOffMaxDistance"] = 100,
                ["position"] = p28
            })
            local v46 = u10("Attachment", {
                ["Parent"] = u31
            })
            u43.Attachment1 = v46
            u44.Attachment1 = v46
            u43.Enabled = true
            if v45 then
                u29:GiveTask(v45:GetMarkerReachedSignal("blast"):Connect(function() --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                        [2] = u44
                        [3] = u14
                        [4] = u8
                        [5] = u29
                        [6] = u25
                        [7] = u31
                        [8] = u30
                        [9] = u38
                    --]]
                    u43.Enabled = false
                    u44.Enabled = true
                    local u48 = u14(0.1, u8, function(p47) --[[ Line: 99 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                        --]]
                        u44.Width0 = 0.1 + p47 * 0.4
                        u44.Width1 = 0.2 + p47 * 0.6
                    end)
                    u29:GiveTask(function() --[[ Line: 103 ]]
                        --[[
                        Upvalues:
                            [1] = u48
                        --]]
                        return u48:Cancel()
                    end)
                    task.delay(0.3, function() --[[ Line: 106 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                            [2] = u25
                            [3] = u31
                            [4] = u30
                            [5] = u14
                            [6] = u8
                            [7] = u29
                            [8] = u38
                        --]]
                        if not u44.Parent then
                            return nil
                        end
                        u25:createBedDebris(u31, true, { Color3.fromRGB(255, 0, 0), Color3.fromRGB(204, 0, 255) })
                        u30:Destroy()
                        local u50 = u14(0.05, u8, function(p49) --[[ Line: 112 ]]
                            --[[
                            Upvalues:
                                [1] = u44
                            --]]
                            u44.Width0 = 0.5 * (1 - p49)
                            u44.Width1 = 0.8 * (1 - p49)
                        end)
                        u29:GiveTask(function() --[[ Line: 116 ]]
                            --[[
                            Upvalues:
                                [1] = u50
                            --]]
                            return u50:Cancel()
                        end)
                        task.delay(1, function() --[[ Line: 119 ]]
                            --[[
                            Upvalues:
                                [1] = u38
                                [2] = u29
                            --]]
                            u38:Destroy()
                            u29:DoCleaning()
                        end)
                    end)
                end))
                return
            end
        end
    else
        local v51 = u12.Assets.Effects.VoidPortal:Clone()
        v51:PivotTo(CFrame.new(v34))
        v51.Parent = u13
        task.wait(0.5)
        local u52 = u12.Assets.Misc.VoidHound:Clone()
        u52:PivotTo(CFrame.new(v34, p28))
        u52.Parent = u13
        local v53 = u3:playAnimation(u52, u16:getAssetId(u15.VOID_HOUND_WALK))
        local v54 = u52.PrimaryPart.CFrame
        local v55 = v36 * 7
        u14(1, u7, function(p56) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52:PivotTo(p56)
        end, v54, CFrame.new(p28 - v55, p28))
        task.wait(1)
        v51:Destroy()
        if v53 ~= nil then
            v53:Stop()
        end
        u3:playAnimation(u52, u16:getAssetId(u15.VOID_HOUND_ATTACK_4))
        u4:playSound(u18.VOID_HOUND_TAIL_ATTACK, {
            ["rollOffMaxDistance"] = 100,
            ["position"] = p28
        })
        task.delay(2, function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u31
                [3] = u30
            --]]
            u25:createBedDebris(u31)
            u30:Destroy()
        end)
    end
end
u5.CreateController(u20.new())
return nil