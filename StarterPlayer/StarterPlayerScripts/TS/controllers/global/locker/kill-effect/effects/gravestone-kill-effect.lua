local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.Linear
local u7 = v5.OutBounce
local u8 = v5.OutQuad
local u9 = v5.OutSine
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "GravestoneKillEffect"
    end,
    ["__index"] = u17
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
function u18.constructor(p21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p21, p22)
    u17.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(p23, u24, p25, u26) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u17
        [4] = u12
        [5] = u1
        [6] = u4
        [7] = u16
        [8] = u15
        [9] = u7
        [10] = u6
        [11] = u3
        [12] = u8
        [13] = u13
        [14] = u9
    --]]
    local u27 = u10.new()
    p25.Archivable = true
    local u28 = p25:Clone()
    u28.HumanoidRootPart.Anchored = true
    u28:PivotTo(u26)
    u28.Parent = u14
    u17.hideCharacter(p23, p25)
    u27:GiveTask(u28)
    local u29 = u12.Assets.Misc.Gravestone:Clone()
    u27:GiveTask(u29)
    local u30 = u12.Assets.Effects.GroundShakeParticles:Clone()
    u27:GiveTask(u30)
    local u31 = u12.Assets.Effects.OilPart:Clone()
    u27:GiveTask(u31)
    local u32 = u12.Assets.Effects.GroundShakeParticles:Clone()
    u27:GiveTask(u32)
    local u66 = u1.Promise.new(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u4
            [3] = u16
            [4] = u28
            [5] = u15
            [6] = u7
            [7] = u6
            [8] = u26
            [9] = u30
            [10] = u14
            [11] = u3
            [12] = u31
            [13] = u1
            [14] = u8
            [15] = u32
            [16] = u29
            [17] = u24
            [18] = u13
            [19] = u9
        --]]
        task.wait(0.1)
        u27:GiveTask(u4:playSound(u16.GHOST_PILLAR_ERUPT, {
            ["position"] = u28:GetPivot().Position
        }))
        u15(0.3, u7, function(p33) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u28
                [3] = u26
            --]]
            local v34 = u6(p33, 0, 90, 1)
            u28:PivotTo(u26 * CFrame.Angles(math.rad(v34), 0, 0))
        end, 0, 1):Wait()
        local v35 = u26
        local v36 = CFrame.new(0, -3.5, 0)
        local v37 = CFrame.Angles(0, 1.5707963267948966, 0)
        local v38 = v35 * v36 * v37
        u30.Parent = u14
        u30.CFrame = v38
        u3:setQueryIgnored(u30, true)
        u31.Parent = u14
        u31.Color = Color3.fromRGB(77, 59, 43)
        u31.CFrame = v38 * CFrame.new(0, 0.5, 0)
        u31.Size = Vector3.new(0.1, 0.1, 0.1)
        u3:setQueryIgnored(u31, true)
        u1.Promise.new(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u8
                [3] = u31
                [4] = u6
            --]]
            u15(0.15, u8, function(p39) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u6
                --]]
                u31.Size = (Vector3.new(0, 0, 0)):Lerp(Vector3.new(6.5, 0.1, 3), u6(p39, 0, 1, 1))
            end, 0, 1):Wait()
            task.wait(0.35)
            u15(0.1, u8, function(p40) --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u6
                --]]
                u31.Size = (Vector3.new(0.1, 0.1, 0.1)):Lerp(Vector3.new(6.5, 0.1, 3), u6(p40, 1, -1, 1))
            end, 0, 1):Wait()
            u31.Transparency = 1
        end)
        local u41 = false
        u15(0.3, u6, function(p42) --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u30
                [3] = u26
                [4] = u28
            --]]
            if p42 > 0.3 and u41 == false then
                u41 = true
                u30.ParticleEmitter:Emit(20)
            end
            u28:PivotTo(u26:Lerp(u26 - Vector3.new(0, 6, 0), p42) * CFrame.Angles(1.5707963267948966, 0, 0))
        end, 0, 1):Wait()
        u27:GiveTask(u4:playSound(u16.TURN_TO_STONE, {
            ["position"] = u28:GetPivot().Position
        }))
        u32.Parent = u14
        u3:setQueryIgnored(u32, true)
        u32.Size = Vector3.new(1, 1, 3)
        u32.ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(166, 166, 166))
        u32.ParticleEmitter.Enabled = true
        u32.ParticleEmitter.LockedToPart = true
        local v43 = u26
        local v44 = CFrame.new(0, -3.5, 3)
        local v45 = CFrame.Angles(0, 1.5707963267948966, 0)
        u32.CFrame = v43 * v44 * v45
        local u46 = u26 * CFrame.new(0, -1.5, 3)
        local u47 = u46 * CFrame.new(0, -4, 0)
        u29:PivotTo(u47)
        u29.Parent = u14
        u29.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText.Text = u24.DisplayName
        u3:setQueryIgnored(u29, true)
        local u48 = 0
        u27:GiveTask((u13.Heartbeat:Connect(function(p49) --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u26
                [3] = u32
            --]]
            u48 = u48 + p49
            local v50 = u26
            local v51 = CFrame.new(0, -3.5, 3)
            local v52 = CFrame.Angles(0, 1.5707963267948966, 0)
            local v53 = CFrame.new(math.noise(-u48 * 20, -u48 * 20) * 0.15, 0, math.noise((u48 + u48) * 20) * 0.15)
            u32.CFrame = v50 * v51 * v52 * v53
        end)))
        task.wait(0.6)
        local v54 = u4:playSound(u16.ROCK_RUMBLE, {
            ["looped"] = true,
            ["fadeOutTime"] = 1.75,
            ["position"] = u31.Position
        })
        u27:GiveTask(v54)
        u15(1.5, u9, function(p55) --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u47
                [3] = u46
            --]]
            local v56 = u29
            local v57 = u47:Lerp(u46, p55)
            local v58 = CFrame.new(math.noise(-p55 * 30) * 0.1, 0, math.noise(-p55 * 30, -8888, -p55 * 30) * 0.1)
            local v59 = CFrame.Angles
            local v60 = math.noise(-p55 * 30) * 3
            local v61 = math.rad(v60)
            local v62 = math.noise(0, 0, (-p55 + -p55) * 30) * 3
            local v63 = math.rad(v62)
            local v64 = math.noise(-p55 * 30, -8888, -p55 * 30) * 3
            local v65 = v59(v61, v63, (math.rad(v64)))
            v56:PivotTo(v57 * v58 * v65)
        end, 0, 1):Wait()
        if v54 ~= nil then
            v54:Stop()
        end
        if v54 ~= nil then
            v54:Destroy()
        end
        if u32.ParticleEmitter then
            u32.ParticleEmitter.Enabled = false
        end
    end)
    u27:GiveTask(function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        return u66:cancel()
    end)
    local u67 = u1.Promise.delay(7):andThen(function() --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:DoCleaning()
    end)
    u27:GiveTask(function() --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u67
        --]]
        return u67:cancel()
    end)
    return u27
end
return u18