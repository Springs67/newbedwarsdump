local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "DragonIncinerateBreakEffectController"
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
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
    --]]
    u17.constructor(p21, u14.DRAGON_INCINERATE)
    p21.Name = "DragonIncinerateBreakEffectController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p22)
end
function u18.onBedBreak(u23, u24, u25, u26, _) --[[ Line: 40 ]]
    task.spawn(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u25
            [3] = u24
            [4] = u26
        --]]
        u23:createEffect(u25, u24, u26)
    end)
end
function u18.createEffect(u27, u28, _, p29) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u10
        [4] = u8
        [5] = u6
        [6] = u15
        [7] = u13
        [8] = u12
        [9] = u16
        [10] = u11
        [11] = u4
        [12] = u9
        [13] = u2
    --]]
    local u30 = u5.new()
    u27.maid:GiveTask(u30)
    local u31 = u3.Controllers.BreakBedEffectUtilController:createBedClone(p29)
    if not u31 then
        return nil
    end
    u31.Name = "BedBreakEffectBedClone"
    u31:PivotTo(u28)
    u31.Parent = u10
    u30:GiveTask(u31)
    for v32, v33 in u31:GetDescendants() do
        local _ = v32 - 1
        if v33:IsA("BasePart") or v33:IsA("MeshPart") then
            v33.CanCollide = false
            v33.CanQuery = false
            v33.CanTouch = false
        end
    end
    local u34 = u8.Assets.Misc.FlyingDragon:Clone()
    u34.PrimaryPart.Anchored = true
    u34:PivotTo(u28)
    u34:ScaleTo(0.5)
    u34.Parent = u10
    u30:GiveTask(u34)
    local u35 = u6("Sound", {
        ["Volume"] = 1,
        ["RollOffMaxDistance"] = 300,
        ["SoundId"] = u15.DRAGON_ROAR,
        ["Parent"] = u34.PrimaryPart
    })
    u30:GiveTask(u35)
    local u36 = u6("Sound", {
        ["Volume"] = 1,
        ["RollOffMaxDistance"] = 300,
        ["SoundId"] = u15.DRAGON_WING_FLAP_1,
        ["Parent"] = u34.PrimaryPart
    })
    u30:GiveTask(u36)
    local u37 = u6("Sound", {
        ["Volume"] = 1,
        ["RollOffMaxDistance"] = 300,
        ["SoundId"] = u15.DRAGON_WING_FLAP_2,
        ["Parent"] = u34.PrimaryPart
    })
    u30:GiveTask(u37)
    local v38 = u34.AnimationController.Animator
    local v39 = u6("Animation", {
        ["AnimationId"] = u13:getAssetId(u12.DRAGON_FLYING)
    })
    u30:GiveTask(v39)
    local v40 = u6("Animation", {
        ["AnimationId"] = u13:getAssetId(u12.DRAGON_BREATH)
    })
    u30:GiveTask(v40)
    local v41 = v38:LoadAnimation(v39)
    u30:GiveTask(v41)
    local u42 = v38:LoadAnimation(v40)
    u30:GiveTask(u42)
    v41:Play()
    local u43 = u8.Assets.Effects.DragonEffect:Clone()
    local v44 = u34.PrimaryPart.CFrame
    local v45 = CFrame.new(0, 5, -15)
    local v46 = CFrame.Angles(0, 1.5707963267948966, 0)
    u43.CFrame = v44 * v45 * v46
    u43.CanCollide = false
    u43.Anchored = true
    u43.Parent = u10
    u30:GiveTask(u43)
    u16:toggleEffects(u43, false)
    local u47 = {}
    for _, v48 in u8.Assets.Effects.Burn:GetChildren() do
        if v48:IsA("ParticleEmitter") then
            local v49 = v48:Clone()
            v49.Parent = u31:FindFirstChild("Root"):FindFirstChild("Bed")
            u30:GiveTask(v49)
            table.insert(u47, v49)
        end
    end
    task.delay(0.5, function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u35
            [3] = u16
            [4] = u43
            [5] = u31
            [6] = u11
            [7] = u4
            [8] = u47
        --]]
        u42:Play()
        u35:Play()
        u16:toggleEffects(u43, true)
        u16:toggleEffects(u43, true, 0.5)
        for v50, u51 in u31:GetDescendants() do
            local _ = v50 - 1
            if u51:IsA("BasePart") then
                u11(3, u4, function(p52) --[[ Line: 131 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                    --]]
                    u51.LocalTransparencyModifier = p52
                end):Play()
            end
        end
        for _, v53 in u47 do
            v53.Enabled = true
        end
    end)
    task.delay(3.5, function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u43
            [3] = u42
            [4] = u47
        --]]
        u16:toggleEffects(u43, false, 0.5)
        u42:Stop(1)
        for _, v54 in u47 do
            v54.Enabled = false
        end
    end)
    local u55 = os.clock()
    local u56 = 0
    u30:GiveTask(u9.Heartbeat:Connect(function(p57) --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u27
            [3] = u28
            [4] = u34
        --]]
        u56 = u56 + p57
        local v58 = u27:getDragonOffsetAt(u56)
        local v59 = v58 - u27:getDragonOffsetAt(u56 + 0.05)
        local v60 = v59.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v59.Unit)
        local v61 = u28.Position + v58
        u34:PivotTo(CFrame.lookAt(v61, v61 + v60))
        local v62 = u27:getDragonTransparencyAt(u56)
        for v63, v64 in u34:GetDescendants() do
            local _ = v63 - 1
            if v64:IsA("BasePart") and v64.Name ~= "RootPart" or v64:IsA("Decal") then
                v64.Transparency = v62
            end
        end
    end))
    u30:GiveTask(u9.Heartbeat:Connect(function(_) --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u43
            [3] = u28
            [4] = u55
        --]]
        local v65 = u34.RootPart.master_bone.torso["torso.001"].neck["neck.001"]["neck.002"].head.TransformedWorldCFrame
        local v66 = CFrame.new(0, 20, 1)
        local v67 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
        u43.CFrame = v65 * v66 * v67
        local v68 = u28.Position
        if v68 then
            for _, v69 in u43:GetDescendants() do
                if v69:IsA("Beam") then
                    local v70 = v69.Attachment0
                    local v71 = v69.Attachment1
                    if v71 and v70 then
                        local v72 = os.clock() - u55
                        local v73 = math.clamp(v72, 0, 1)
                        local v74 = (CFrame.new(v68) * (v71.CFrame - v71.CFrame.Position)).Position + v71.CFrame.LookVector * 7
                        v71.WorldPosition = v70.WorldPosition:Lerp(v74, (math.clamp(v73, 0.3, 1)))
                    end
                end
            end
        end
    end))
    u30:GiveTask(v41:GetMarkerReachedSignal("sound"):Connect(function() --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u36
            [3] = u37
        --]]
        u2.fromList(u36, u37):Play()
    end))
    task.delay(5.5, function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:Destroy()
    end)
end
function u18.getDragonOffsetAt(_, p75) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v76 = u4(p75, -100, 200, 5)
    local v77 = -20 / (((p75 - 2) / 0.5) ^ 2 + 2) + 50
    local v78 = p75 * 3
    local v79 = v77 + math.sin(v78) * 3
    return Vector3.new(v76, v79, 0)
end
function u18.getDragonTransparencyAt(_, p80) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p80 <= 1 then
        return u4(p80, 1, -1, 0.5)
    else
        return p80 <= 4.5 and 0 or u4(p80 - 4.5, 0, 1, 0.5)
    end
end
u3.CreateController(u18.new())
return nil