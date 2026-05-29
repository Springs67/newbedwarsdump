local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return function(_) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u2
        [4] = u12
        [5] = u8
        [6] = u5
        [7] = u13
        [8] = u11
        [9] = u10
        [10] = u9
        [11] = u3
    --]]
    local u14 = u4.new()
    local v15 = CFrame.new(30.913, 303.437, 469.703)
    local u16 = u7.Assets.Blocks.bed:Clone()
    local v17 = u2.hexColor(u12.lightBlue)
    u16.Root.Bed.Color = v17
    u16.Root.Blanket.Color = u2.brighten(v17, 0.2)
    u16:PivotTo(v15)
    u16.Parent = u8
    u14:GiveTask(u16)
    if not u16 then
        return nil
    end
    u16.Name = "BedBreakEffectBedClone"
    u16:PivotTo(v15)
    local u18 = u16:FindFirstChild("Root")
    if not u18 then
        return nil
    end
    for v19, v20 in u16:GetDescendants() do
        local _ = v19 - 1
        if v20:IsA("BasePart") and v20.CanCollide then
            v20.CanCollide = false
        end
    end
    u16.Parent = u8
    u14:GiveTask(u16)
    local u21 = u7.Assets.Effects.CentipedeBedRig:Clone()
    u21:PivotTo(v15)
    u5("WeldConstraint", {
        ["Enabled"] = true,
        ["Parent"] = u21.RootPart,
        ["Part0"] = u21.RootPart,
        ["Part1"] = u18
    })
    u21.Parent = u16
    u14:GiveTask(u21)
    local u22 = u5("Sound", {
        ["Looped"] = false,
        ["Parent"] = u18,
        ["SoundId"] = u13.CENTIPEDE_LEG_POP_OUT
    })
    u14:GiveTask(u22)
    local u23 = u5("PitchShiftSoundEffect", {
        ["Octave"] = 1,
        ["Parent"] = u22
    })
    u14:GiveTask(u23)
    local u24 = 0
    local v25 = false
    while true do
        if v25 then
            u24 = u24 + 1
        else
            v25 = true
        end
        if u24 >= 8 then
            break
        end
        task.delay(u24 * 0.1, function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
                [3] = u22
            --]]
            u23.Octave = u24 * 0.1 + 1
            u22:Play()
        end)
    end
    u11:playAnimation(u21.AnimationController.Animator, u10.CENTIPEDE_BED_BREAK)
    local v26 = u5("Sound", {
        ["Looped"] = false,
        ["Parent"] = u18,
        ["SoundId"] = u13.CENTIPEDE_STEP
    })
    u14:GiveTask(v26)
    u14:GiveTask((u5("PitchShiftSoundEffect", {
        ["Octave"] = 1,
        ["Parent"] = v26
    })))
    local v27 = false
    local v28 = 0
    while true do
        if v27 then
            v28 = v28 + 1
        else
            v27 = true
        end
        if v28 >= 30 then
            local u29 = u16:GetPivot()
            u9(3, u3, function(p30) --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u29
                --]]
                local v31 = u16
                local v32 = u29.RightVector
                local v33 = p30 * 2 * 3.141592653589793 * 3
                local v34 = u29 + v32 * math.sin(v33)
                local v35 = CFrame.Angles
                local v36 = p30 * 2 * 3.141592653589793 * 3
                local v37 = math.sin(v36) * 5
                local v38 = v35(0, math.rad(v37), 0)
                local v39 = u29.LookVector
                local v40 = math.lerp(0, 20, p30)
                v31:PivotTo(v34 * v38 + v39 * v40)
            end)
            task.delay(2, function() --[[ Line: 134 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u18
                    [3] = u21
                    [4] = u9
                    [5] = u3
                --]]
                for v41, u42 in u16:GetDescendants() do
                    local _ = v41 - 1
                    if u42:IsA("BasePart") and (u42 ~= u18 and u42 ~= u21.RootPart) then
                        u9(1, u3, function(p43) --[[ Line: 138 ]]
                            --[[
                            Upvalues:
                                [1] = u42
                            --]]
                            u42.Transparency = p43
                        end)
                    end
                end
            end)
            task.delay(3, function() --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                return u14:Destroy()
            end)
            return
        end
        task.delay(v28 * math.random() * 0.1, function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u22
            --]]
            u23.Octave = 1 + math.random() * 0.5
            u22:Play()
        end)
    end
end