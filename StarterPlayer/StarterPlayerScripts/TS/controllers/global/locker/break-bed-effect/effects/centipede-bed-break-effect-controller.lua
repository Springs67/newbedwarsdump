local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "CentipedeBedBreakEffectController"
    end,
    ["__index"] = u13
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
    --]]
    u13.constructor(p17, u11.CENTIPEDE)
    p17.Name = "CentipedeBedBreakEffectController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p18)
end
function u14.onBedBreak(u19, _, u20, u21, u22) --[[ Line: 36 ]]
    task.spawn(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u22
            [4] = u21
        --]]
        u19:createEffect(u20, u22, u21)
    end)
end
function u14.createEffect(u23, p24, _, p25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u6
        [4] = u4
        [5] = u12
        [6] = u10
        [7] = u9
        [8] = u8
        [9] = u3
    --]]
    local u26 = u2.Controllers.BreakBedEffectUtilController:createBedClone(p25)
    if not u26 then
        return nil
    end
    u26.Name = "BedBreakEffectBedClone"
    u26:PivotTo(p24)
    local u27 = u26:FindFirstChild("Root")
    if not u27 then
        return nil
    end
    for v28, v29 in u26:GetDescendants() do
        local _ = v28 - 1
        if v29:IsA("BasePart") and v29.CanCollide then
            v29.CanCollide = false
        end
    end
    u26.Parent = u7
    u23.maid:GiveTask(u26)
    local u30 = u6.Assets.Effects.CentipedeBedRig:Clone()
    u30:PivotTo(p24)
    u4("WeldConstraint", {
        ["Enabled"] = true,
        ["Parent"] = u30.RootPart,
        ["Part0"] = u30.RootPart,
        ["Part1"] = u27
    })
    u30.Parent = u26
    u23.maid:GiveTask(u30)
    local u31 = u4("Sound", {
        ["Looped"] = false,
        ["Parent"] = u27,
        ["SoundId"] = u12.CENTIPEDE_LEG_POP_OUT
    })
    u23.maid:GiveTask(u31)
    local u32 = u4("PitchShiftSoundEffect", {
        ["Octave"] = 1,
        ["Parent"] = u31
    })
    u23.maid:GiveTask(u32)
    local u33 = 0
    local v34 = false
    while true do
        if v34 then
            u33 = u33 + 1
        else
            v34 = true
        end
        if u33 >= 8 then
            local v35 = u10:playAnimation(u30.AnimationController.Animator, u9.CENTIPEDE_BED_BREAK)
            local u36 = u4("Sound", {
                ["Looped"] = false,
                ["Volume"] = 0.7,
                ["Parent"] = u27,
                ["SoundId"] = u12.CENTIPEDE_STEP
            })
            u23.maid:GiveTask(u31)
            local u37 = u4("PitchShiftSoundEffect", {
                ["Octave"] = 1,
                ["Parent"] = u36
            })
            u23.maid:GiveTask(u37)
            if v35 then
                local u38 = true
                u23.maid:GiveTask(function() --[[ Line: 121 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    u38 = false
                end)
                u23.maid:GiveTask(task.spawn(function() --[[ Line: 124 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                        [2] = u37
                        [3] = u36
                    --]]
                    while u38 do
                        u37.Octave = 1 + math.random() * 0.5
                        u36:Play()
                        task.wait(math.random() * 0.1)
                    end
                end))
            end
            local u39 = u26:GetPivot()
            u8(3, u3, function(p40) --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u39
                --]]
                local v41 = u26
                local v42 = u39.RightVector
                local v43 = p40 * 2 * 3.141592653589793 * 3
                local v44 = u39 + v42 * math.sin(v43)
                local v45 = CFrame.Angles
                local v46 = p40 * 2 * 3.141592653589793 * 3
                local v47 = math.sin(v46) * 5
                local v48 = v45(0, math.rad(v47), 0)
                local v49 = u39.LookVector
                local v50 = math.lerp(0, 20, p40)
                v41:PivotTo(v44 * v48 + v49 * v50)
            end)
            u23.maid:GiveTask(task.delay(2, function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u27
                    [3] = u30
                    [4] = u8
                    [5] = u3
                --]]
                for v51, u52 in u26:GetDescendants() do
                    local _ = v51 - 1
                    if u52:IsA("BasePart") and (u52 ~= u27 and u52 ~= u30.RootPart) then
                        u8(1, u3, function(p53) --[[ Line: 147 ]]
                            --[[
                            Upvalues:
                                [1] = u52
                            --]]
                            u52.Transparency = p53
                        end)
                    end
                end
            end))
            u23.maid:GiveTask(task.delay(3, function() --[[ Line: 156 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                return u23.maid:Destroy()
            end))
            return
        end
        u23.maid:GiveTask(task.delay(u33 * 0.1, function() --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u31
            --]]
            u32.Octave = u33 * 0.1 + 1
            u31:Play()
        end))
    end
end
u2.CreateController(u14.new())
return nil