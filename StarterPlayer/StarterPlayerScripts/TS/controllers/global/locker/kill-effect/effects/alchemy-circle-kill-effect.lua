local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.TweenService
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "AlchemyCircleKillEffect"
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
function u18.onKill(u23, _, p24, p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u17
        [4] = u10
        [5] = u3
        [6] = u14
        [7] = u13
        [8] = u6
        [9] = u16
    --]]
    local u26 = u8.new()
    p24.Archivable = true
    local u27 = p24:Clone()
    u27.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u27.HumanoidRootPart.Anchored = true
    u27:PivotTo(p25)
    u27.Parent = u12
    u17.hideCharacter(u23, p24)
    u26:GiveTask(u27)
    local v28 = u27:FindFirstChild("_DamageHighlight_")
    if v28 then
        v28:Destroy()
    end
    for v29, v30 in u27:GetDescendants() do
        local _ = v29 - 1
        if v30:IsA("GuiObject") then
            v30.Transparency = 1
        elseif v30:IsA("UIStroke") then
            v30.Transparency = 1
        elseif v30:IsA("Decal") then
            v30.Transparency = 1
        end
    end
    local u31 = u10.Assets.Effects.AlchemyCircle:Clone()
    u31:PivotTo(p25 + Vector3.new(0, -2.9, 0))
    u31.Parent = u12
    u26:GiveTask(u31)
    u31.Ground.Summon.SummonCircle:Clear()
    u31.Ground.Summon.SummonCircle:Emit(1)
    u26:GiveTask(u31)
    u3:playAnimation(u27:FindFirstChild("Humanoid"):FindFirstChild("Animator"), u14:getAssetId(u13.ALCHEMY_CIRCLE_KILL_EFFECT), {
        ["looped"] = false
    })
    local v32 = u6:playSound(u16.MAGIC_CIRCLE_SPAWN, {
        ["playbackSpeedMultiplier"] = 0.5,
        ["rollOffMaxDistance"] = 180,
        ["volumeMultiplier"] = 1,
        ["position"] = p25.Position
    })
    u6:tweenSoundVolume(v32, 0, 6)
    u26:GiveTask(v32)
    task.delay(0.8, function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u31
            [3] = u27
            [4] = u26
        --]]
        u23:fadeInImageLabel(u31.Outer.UI.Circle0, 1)
        u23:fadeInImageLabel(u31.Outer.UI.Circle1, 1)
        u23:fadeInImageLabel(u31.Middle.UI.Star, 1)
        u31.Ground.Particle.Main.Enabled = true
        u31.Ground.Particle.PulseUp:Emit(1)
        task.delay(0.5, function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u23
                [3] = u27
            --]]
            u31.Ground1.Sparks.Enabled = false
            u31.Ground1.GoldSparks.Enabled = true
            u23:turnModelGold(u27)
        end)
        task.delay(1.5, function() --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u31
            --]]
            u23:fadeOutImageLabel(u31.Outer.UI.Circle0, 1)
            u23:fadeOutImageLabel(u31.Outer.UI.Circle1, 1)
            u23:fadeOutImageLabel(u31.Middle.UI.Star, 1)
            u31.Ground.Particle.Main.Enabled = false
        end)
        task.delay(4, function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u27
            --]]
            u23:detachParts({ u27:FindFirstChild("Head") })
        end)
        task.delay(4.25, function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u27
            --]]
            u23:detachParts({ u27:FindFirstChild("RightUpperArm"), u27:FindFirstChild("LeftUpperArm") })
        end)
        task.delay(4.5, function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u27
            --]]
            u23:detachParts({ u27:FindFirstChild("UpperTorso") })
        end)
        task.delay(4.75, function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u27
            --]]
            u23:detachParts({ u27:FindFirstChild("LeftLowerLeg"), u27:FindFirstChild("RightLowerLeg"), u27:FindFirstChild("LowerTorso") })
        end)
        task.delay(5, function() --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26:DoCleaning()
        end)
    end)
    return u26
end
function u18.fadeInImageLabel(_, p33, p34) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11:Create(p33, TweenInfo.new(p34, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        ["ImageTransparency"] = 0
    }):Play()
end
function u18.fadeOutImageLabel(_, p35, p36) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11:Create(p35, TweenInfo.new(p36, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        ["ImageTransparency"] = 1
    }):Play()
end
function u18.turnModelGold(_, p37) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u15
    --]]
    for v38, v39 in p37:GetDescendants() do
        local _ = v38 - 1
        if v39:IsA("BasePart") then
            v39.Material = Enum.Material.Metal
        end
    end
    u7.Controllers.EntityHighlightController:highlight(p37, {
        ["transparency"] = 0,
        ["fadeInTime"] = 1,
        ["lastsForever"] = true,
        ["color"] = Color3.fromHex("#dbb658"),
        ["shouldApplyToPart"] = function(p40) --[[ Name: shouldApplyToPart, Line 149 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            local v41 = p40:FindFirstAncestorWhichIsA("Accessory")
            if not v41 or v41:GetAttribute("ArmorSlot") ~= u15.HELMET then
                return true
            end
            for v42, v43 in v41:GetDescendants() do
                local _ = v42 - 1
                if v43:IsA("Texture") then
                    v43.Transparency = 1
                end
            end
            return false
        end
    })
end
function u18.detachParts(u44, p45) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for _, u46 in p45 do
        local v47
        if u46 == nil then
            v47 = u46
        else
            v47 = u46:IsA("BasePart")
        end
        if v47 then
            for _, v48 in u46:GetChildren() do
                if v48:IsA("Motor6D") then
                    v48:Destroy()
                end
            end
            local v49 = u44:getRandomPositionAround(u46.Position, 6)
            local v50 = u46.Position - v49
            local v51 = v50.X
            local v52 = v50.Z
            u46:ApplyImpulse((Vector3.new(v51, 0, v52).Unit * 10 + Vector3.new(0, 15, 0)) * u46.AssemblyMass)
            u46:ApplyAngularImpulse(Vector3.new(5, 10, 5) * u46.AssemblyMass)
            u46.Touched:Connect(function(p53) --[[ Line: 197 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u4
                    [3] = u44
                --]]
                if u46.Parent and p53:IsDescendantOf(u46.Parent) then
                    return nil
                end
                if u4:isQueryIgnored(p53) then
                    return nil
                end
                task.wait(0.15)
                u44:despawnPart(u46)
            end)
        end
    end
end
function u18.getRandomPositionAround(_, p54, p55) --[[ Line: 209 ]]
    local v56 = math.random() * 2 * 3.141592653589793
    local v57 = math.random() * p55
    local v58 = math.cos(v56) * v57
    local v59 = math.sin(v56) * v57
    return p54 + Vector3.new(v58, 0, v59)
end
function u18.despawnPart(u60, p61) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u16
        [3] = u6
    --]]
    if not p61.Parent then
        return nil
    end
    u6:playSound(u5.fromList(u16.ROCK_CRUMBLE_1, u16.ROCK_CRUMBLE_2, u16.ROCK_CRUMBLE_3), {
        ["volumeMultiplier"] = 0.2,
        ["position"] = p61.Position
    })
    local u62 = p61:GetConnectedParts(false)
    p61:Destroy()
    task.delay(0.12, function() --[[ Line: 229 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u62
        --]]
        for v63, v64 in u62 do
            local _ = v63 - 1
            u60:despawnPart(v64)
        end
    end)
end
return u18