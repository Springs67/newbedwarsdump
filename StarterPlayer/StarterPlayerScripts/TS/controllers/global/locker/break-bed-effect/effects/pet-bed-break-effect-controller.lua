local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.InOutQuad
local u9 = v7.InQuad
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.RunService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u20 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "PetBreakEffectController"
    end,
    ["__index"] = u20
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u17
    --]]
    u20.constructor(p24, u17.PET)
    p24.Name = "PetBreakEffectController"
end
function u21.KnitStart(p25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.KnitStart(p25)
end
function u21.onBedBreak(u26, u27, u28, u29, _) --[[ Line: 43 ]]
    task.spawn(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u28
            [3] = u27
            [4] = u29
        --]]
        u26:createEffect(u28, u27, u29)
    end)
end
function u21.createEffect(u30, p31, p32, p33) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u11
        [4] = u16
        [5] = u15
        [6] = u5
        [7] = u4
        [8] = u18
        [9] = u12
        [10] = u14
        [11] = u8
        [12] = u3
        [13] = u19
        [14] = u9
    --]]
    local u34 = u6.Controllers.BreakBedEffectUtilController:createBedClone(p33)
    if not u34 then
        return nil
    end
    u30.maid:GiveTask(u34)
    u34.Name = "BedBreakEffectBedClone"
    u34:PivotTo(p31)
    u34.Parent = u13
    for v35, v36 in u34:GetDescendants() do
        local _ = v35 - 1
        if v36:IsA("BasePart") or v36:IsA("MeshPart") then
            v36.CanCollide = false
            v36.CanQuery = false
            v36.CanTouch = false
        end
    end
    local u37 = u11.Assets.Misc.PetBedWings:Clone()
    local u38 = u37:GetScale() / u34:GetScale()
    local u39 = u37:GetScale()
    local v40 = u34:GetPivot()
    local v41 = CFrame.new(Vector3.new(0, 1.303, 1.384))
    local v42 = CFrame.Angles(0, 0, 0)
    u37:PivotTo(v40 * v41 * v42)
    u37.Parent = u13
    u30.maid:GiveTask(u37)
    u30.maid:GiveTask(task.spawn(function() --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u16
            [3] = u15
            [4] = u5
            [5] = u4
            [6] = u18
            [7] = u30
        --]]
        local v43 = u37
        if v43 ~= nil then
            v43 = v43:WaitForChild("AnimationController", 3)
            if v43 ~= nil then
                v43 = v43:WaitForChild("Animator", 3)
            end
        end
        if v43 then
            local u44 = u16:playAnimation(v43, u15.FLYING_LUCKY_BLOCK_FLAP)
            if u44 ~= nil then
                u44:AdjustSpeed(2)
            end
            if u44 ~= nil then
                u44 = u44.DidLoop:Connect(function() --[[ Line: 100 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u4
                        [3] = u18
                        [4] = u37
                        [5] = u30
                    --]]
                    local v45 = u5:playSound(u4.fromList(u18.FLYING_LUCKY_BLOCK_WING_FLAP_1, u18.FLYING_LUCKY_BLOCK_WING_FLAP_2), {
                        ["volumeMultiplier"] = 0.05,
                        ["position"] = u37:GetPivot().Position,
                        ["playbackSpeedMultiplier"] = math.random(7, 10)
                    })
                    u30.maid:GiveTask(v45)
                end)
            end
            u30.maid:GiveTask(function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                local v46 = u44
                if v46 ~= nil then
                    v46 = v46:Disconnect()
                end
                return v46
            end)
        end
    end))
    local u52 = u12.Heartbeat:Connect(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u34
            [3] = u38
            [4] = u39
        --]]
        u37:ScaleTo(u34:GetScale() * u38)
        local v47 = u37
        local v48 = u34:GetPivot()
        local v49 = u37:GetScale() / u39
        local v50 = CFrame.new(Vector3.new(0, 1.303, 1.384) * v49)
        local v51 = CFrame.Angles(0, 0, 0)
        v47:PivotTo(v48 * v50 * v51)
    end)
    u30.maid:GiveTask(u52)
    local u53 = u34:GetScale()
    u14(2, u8, function(p54) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u3
            [3] = u53
        --]]
        u34:ScaleTo(u3:lerp(u53, 0.2, p54))
    end, 0, 1):Play()
    local u55
    if u19.isLobbyServer() then
        u55 = u13:FindFirstChild("LockerPreview")
        if u55 ~= nil then
            u55 = u55:FindFirstChild("CameraSubject")
        end
    else
        u55 = p32.Character
        if u55 ~= nil then
            u55 = u55.PrimaryPart
        end
    end
    if not u55 then
        task.delay(2, function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            return u34:Destroy()
        end)
        return nil
    end
    local u56 = u34:GetPivot().Position
    local u57 = u34:GetPivot().Rotation
    u14(2, u9, function(p58) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u56
            [3] = u57
            [4] = u34
        --]]
        local v59 = u56:Lerp(u55.Position + Vector3.new(5, 2, 0), p58)
        local v60 = u55.Position + Vector3.new(0, 2, 0)
        local v61 = u57:Lerp(CFrame.lookAt(v59, v60).Rotation, p58)
        u34:PivotTo(CFrame.new(v59) * v61)
    end, 0, 1):Play():Wait()
    local u62 = 0
    local u73 = u12.Heartbeat:Connect(function(p63) --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u62
            [3] = u34
        --]]
        local v64 = u55.Position + Vector3.new(0, 2, 0)
        u62 = u62 + 100 * p63
        local v65 = u62
        local v66 = math.rad(v65)
        local v67 = u55.Position + Vector3.new(0, 2, 0)
        local v68 = v64.X + math.cos(v66) * 5
        local v69 = v64.Z + math.sin(v66) * 5
        local v70 = v64.Y
        local v71 = u62 * 0.05
        local v72 = v70 + math.sin(v71) * 0.5
        u34:PivotTo(CFrame.new(Vector3.new(v68, v72, v69), v67))
    end)
    u30.maid:GiveTask(u73)
    u30.maid:GiveTask(task.delay(20, function() --[[ Line: 196 ]]
        --[[
        Upvalues:
            [1] = u73
            [2] = u34
            [3] = u52
            [4] = u37
        --]]
        u73:Disconnect()
        u34:Destroy()
        u52:Disconnect()
        u37:Destroy()
    end))
end
u6.CreateController(u21.new())
return nil