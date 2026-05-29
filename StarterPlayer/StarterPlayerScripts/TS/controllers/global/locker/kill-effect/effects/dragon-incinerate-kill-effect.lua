local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.RunService
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "DragonIncinerateKillEffect"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, ...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p19, ...)
end
function u16.onKill(p20, _, p21, u22) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u15
        [4] = u7
        [5] = u5
        [6] = u13
        [7] = u12
        [8] = u11
        [9] = u14
        [10] = u10
        [11] = u3
        [12] = u8
        [13] = u2
    --]]
    local u23 = u4.new()
    p21.Archivable = true
    local u24 = p21:Clone()
    u24.HumanoidRootPart.Anchored = true
    u24:PivotTo(u22)
    u24.Parent = u9
    u15.hideCharacter(p20, p21)
    u23:GiveTask(u24)
    local v25 = u24:FindFirstChild("_DamageHighlight_")
    if v25 then
        v25:Destroy()
    end
    for v26, v27 in u24:GetDescendants() do
        local _ = v26 - 1
        if v27:IsA("GuiObject") then
            v27.Transparency = 1
        elseif v27:IsA("UIStroke") then
            v27.Transparency = 1
        elseif v27:IsA("Decal") then
            v27.Transparency = 1
        end
    end
    if not p21.PrimaryPart then
        return u23
    end
    local u28 = u7.Assets.Misc.FlyingDragon:Clone()
    u28.PrimaryPart.Anchored = true
    u28:PivotTo(u22)
    u28:ScaleTo(0.5)
    u28.Parent = u9
    u23:GiveTask(u28)
    local u29 = u5("Sound", {
        ["Volume"] = 1,
        ["RollOffMaxDistance"] = 300,
        ["SoundId"] = u13.DRAGON_ROAR,
        ["Parent"] = u28.PrimaryPart
    })
    u23:GiveTask(u29)
    local u30 = u5("Sound", {
        ["Volume"] = 1,
        ["RollOffMaxDistance"] = 300,
        ["SoundId"] = u13.DRAGON_WING_FLAP_1,
        ["Parent"] = u28.PrimaryPart
    })
    u23:GiveTask(u30)
    local u31 = u5("Sound", {
        ["Volume"] = 1,
        ["RollOffMaxDistance"] = 300,
        ["SoundId"] = u13.DRAGON_WING_FLAP_2,
        ["Parent"] = u28.PrimaryPart
    })
    u23:GiveTask(u31)
    local v32 = u28.AnimationController.Animator
    local v33 = u5("Animation", {
        ["AnimationId"] = u12:getAssetId(u11.DRAGON_FLYING)
    })
    u23:GiveTask(v33)
    local v34 = u5("Animation", {
        ["AnimationId"] = u12:getAssetId(u11.DRAGON_BREATH)
    })
    u23:GiveTask(v34)
    local v35 = v32:LoadAnimation(v33)
    u23:GiveTask(v35)
    local u36 = v32:LoadAnimation(v34)
    u23:GiveTask(u36)
    v35:Play()
    local u37 = u7.Assets.Effects.DragonEffect:Clone()
    local v38 = u28.PrimaryPart.CFrame
    local v39 = CFrame.new(0, 5, -15)
    local v40 = CFrame.Angles(0, 1.5707963267948966, 0)
    u37.CFrame = v38 * v39 * v40
    u37.CanCollide = false
    u37.Anchored = true
    u37.Parent = u9
    u23:GiveTask(u37)
    u14:toggleEffects(u37, false)
    local u41 = {}
    for _, v42 in u7.Assets.Effects.Burn:GetChildren() do
        if v42:IsA("ParticleEmitter") then
            local v43 = v42:Clone()
            v43.Parent = u24.UpperTorso
            u23:GiveTask(v43)
            table.insert(u41, v43)
        end
    end
    task.delay(0.5, function() --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u29
            [3] = u14
            [4] = u37
            [5] = u24
            [6] = u10
            [7] = u3
            [8] = u41
        --]]
        u36:Play()
        u29:Play()
        u14:toggleEffects(u37, true)
        u14:toggleEffects(u37, true, 0.5)
        local v44 = u24:GetDescendants()
        local function v47(u45) --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u3
            --]]
            if u45:IsA("BasePart") and u45.Name ~= "HumanoidRootPart" then
                u10(3, u3, function(p46) --[[ Line: 146 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    u45.LocalTransparencyModifier = p46
                end):Play()
            end
        end
        for v48, v49 in v44 do
            v47(v49, v48 - 1, v44)
        end
        for _, v50 in u41 do
            v50.Enabled = true
        end
    end)
    task.delay(3.5, function() --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u37
            [3] = u36
            [4] = u41
        --]]
        u14:toggleEffects(u37, false, 0.5)
        u36:Stop(1)
        for _, v51 in u41 do
            v51.Enabled = false
        end
    end)
    local u52 = os.clock()
    local u53 = 0
    u23:GiveTask(u8.Heartbeat:Connect(function(p54) --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u3
            [3] = u22
            [4] = u28
        --]]
        u53 = u53 + p54
        local v55 = u53
        local v56 = u3(v55, -100, 200, 5)
        local v57 = -20 / (((v55 - 2) / 0.5) ^ 2 + 2) + 50
        local v58 = v55 * 3
        local v59 = v57 + math.sin(v58) * 3
        local v60 = Vector3.new(v56, v59, 0)
        local v61 = u53 + 0.05
        local v62 = u3(v61, -100, 200, 5)
        local v63 = -20 / (((v61 - 2) / 0.5) ^ 2 + 2) + 50
        local v64 = v61 * 3
        local v65 = v63 + math.sin(v64) * 3
        local v66 = v60 - Vector3.new(v62, v65, 0)
        local v67 = v66.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v66.Unit)
        local v68 = u22.Position + v60
        u28:PivotTo(CFrame.lookAt(v68, v68 + v67))
        local v69 = u53
        local v70
        if v69 <= 1 then
            v70 = u3(v69, 1, -1, 0.5)
        else
            v70 = v69 <= 4.5 and 0 or u3(v69 - 4.5, 0, 1, 0.5)
        end
        for v71, v72 in u28:GetDescendants() do
            local _ = v71 - 1
            if v72:IsA("BasePart") and v72.Name ~= "RootPart" or v72:IsA("Decal") then
                v72.Transparency = v70
            end
        end
    end))
    u23:GiveTask(u8.Heartbeat:Connect(function(_) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u37
            [3] = u22
            [4] = u52
        --]]
        local v73 = u28.RootPart.master_bone.torso["torso.001"].neck["neck.001"]["neck.002"].head.TransformedWorldCFrame
        local v74 = CFrame.new(0, 20, 1)
        local v75 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
        u37.CFrame = v73 * v74 * v75
        local v76 = u22.Position
        if v76 then
            for _, v77 in u37:GetDescendants() do
                if v77:IsA("Beam") then
                    local v78 = v77.Attachment0
                    local v79 = v77.Attachment1
                    if v79 and v78 then
                        local v80 = os.clock() - u52
                        local v81 = math.clamp(v80, 0, 1)
                        local v82 = (CFrame.new(v76) * (v79.CFrame - v79.CFrame.Position)).Position + v79.CFrame.LookVector * 7
                        v79.WorldPosition = v78.WorldPosition:Lerp(v82, (math.clamp(v81, 0.3, 1)))
                    end
                end
            end
        end
    end))
    u23:GiveTask(v35:GetMarkerReachedSignal("sound"):Connect(function() --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u30
            [3] = u31
        --]]
        u2.fromList(u30, u31):Play()
    end))
    task.delay(5.5, function() --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:Destroy()
    end)
    return u23
end
return u16