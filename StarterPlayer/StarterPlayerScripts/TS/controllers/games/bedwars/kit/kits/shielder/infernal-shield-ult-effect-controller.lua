local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.TweenService
local u10 = v6.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "InfernalShieldUltEffectController"
    end,
    ["__index"] = u11
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
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p20)
    p20.Name = "InfernalShieldUltEffectController"
end
function u17.KnitStart(u21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
    --]]
    u11.KnitStart(u21)
    u15.Client:Get("ShieldUltEffect"):Connect(function(p22) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:shieldUltEffect(p22.player, p22.target)
    end)
end
function u17.shieldUltEffect(u23, u24, p25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u14
        [4] = u10
        [5] = u7
        [6] = u3
        [7] = u13
        [8] = u12
        [9] = u16
        [10] = u4
        [11] = u9
    --]]
    local u26 = u8.Assets.Effects.ShieldUltMark:Clone()
    u5.Controllers.InfernalShieldController:changeIndicatorColor(u24, u26)
    local u27 = u24.Character
    local u28 = u14:getEntity(u24)
    if u28 ~= nil then
        u28:hideNametag()
    end
    local v29 = u27.PrimaryPart
    if v29 ~= nil then
        v29 = v29.Position
    end
    if not (u27 and v29) then
        return nil
    end
    u27.Archivable = true
    local u30 = u27:Clone()
    u30:SetAttribute("Transparency", 0)
    u30.Parent = u10
    if u24 == u7.LocalPlayer then
        u10.CurrentCamera.CameraSubject = u30.Humanoid
    end
    local u31 = u30.Humanoid.Animator
    if not u30.PrimaryPart then
        return nil
    end
    u27:SetAttribute("Transparency", 1)
    local v32 = u23:getHighPoint(v29, p25)
    local v33 = u3:playAnimation(u31, u13:getAssetId(u12.INFERNAL_SHIELD_CHARGE))
    local u34 = u5.Controllers.InfernalShieldController:getKitSkinMeta(u24)
    if u34 ~= nil then
        u34 = u34.shielder
        if u34 ~= nil then
            u34 = u34.sound
        end
    end
    local v35
    if u34 == nil then
        v35 = u34
    else
        v35 = u34.launchSound
    end
    local v36
    if v35 == "" or not v35 then
        v36 = u16.SHIELDER_CHARGE_1
    elseif u34 == nil then
        v36 = u34
    else
        v36 = u34.launchSound
    end
    local v37
    if u34 == nil then
        v37 = u34
    else
        v37 = u34.leapSound
    end
    local v38
    if v37 == "" or not v37 then
        v38 = u16.SHIELDER_LEAP
    elseif u34 == nil then
        v38 = u34
    else
        v38 = u34.leapSound
    end
    local v39
    if u34 == nil then
        v39 = u34
    else
        v39 = u34.landingSound
    end
    if v39 == "" or not v39 then
        u34 = u16.SHIELDER_SMASH_1
    elseif u34 ~= nil then
        u34 = u34.landingSound
    end
    local v40 = u4
    local v41 = {}
    local v42 = u24.Character
    if v42 ~= nil then
        v42 = v42.PrimaryPart
        if v42 ~= nil then
            v42 = v42.Position
        end
    end
    v41.position = v42
    v41.rollOffMaxDistance = 220
    v40:playSound(v36, v41)
    task.wait(1)
    if v33 ~= nil then
        v33:Destroy()
    end
    local u43 = u3:playAnimation(u31, u13:getAssetId(u12.INFERNAL_SHIELD_LEAP))
    local u44 = nil
    local v45 = TweenInfo.new(0.5)
    local v46 = u9:Create(u30.PrimaryPart, v45, {
        ["CFrame"] = CFrame.new(v32, p25)
    })
    v46:Play()
    local v47 = u4
    local v48 = {}
    local v49 = u24.Character
    if v49 ~= nil then
        v49 = v49.PrimaryPart
        if v49 ~= nil then
            v49 = v49.Position
        end
    end
    v48.position = v49
    v48.rollOffMaxDistance = 220
    v47:playSound(v38, v48)
    local v50 = u9
    local v51 = u30.PrimaryPart
    local v52 = TweenInfo.new(0.3)
    local v53 = {}
    local v54 = u27.PrimaryPart
    if v54 ~= nil then
        v54 = v54.CFrame
    end
    v53.CFrame = v54
    local u55 = v50:Create(v51, v52, v53)
    task.delay(0.1, function() --[[ Line: 182 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u26
            [3] = u10
        --]]
        local v56 = u24.Character
        if v56 ~= nil then
            v56 = v56.PrimaryPart
            if v56 ~= nil then
                v56 = v56.Position
            end
        end
        if v56 then
            u26.Position = u24.Character.PrimaryPart.Position - Vector3.new(0, 2, 0)
            u26.Parent = u10
        end
    end)
    task.delay(0.7, function() --[[ Line: 198 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u24
            [3] = u4
            [4] = u34
        --]]
        u23:playParticleEffect(u24)
        local v57 = u4
        local v58 = u34
        local v59 = {}
        local v60 = u24.Character
        if v60 ~= nil then
            v60 = v60.PrimaryPart
            if v60 ~= nil then
                v60 = v60.Position
            end
        end
        v59.position = v60
        v59.rollOffMaxDistance = 220
        v57:playSound(v58, v59)
    end)
    v46.Completed:Connect(function() --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u43
            [3] = u44
            [4] = u3
            [5] = u31
            [6] = u13
            [7] = u12
            [8] = u24
        --]]
        u55:Play()
        local v61 = u43
        if v61 ~= nil then
            v61:Destroy()
        end
        u44 = u3:playAnimation(u31, u13:getAssetId(u12.INFERNAL_SHIELD_SLAM))
        u3:playAnimation(u24, u13:getAssetId(u12.INFERNAL_SHIELD_SLAM))
    end)
    u55.Completed:Connect(function() --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u27
            [3] = u24
            [4] = u7
            [5] = u10
            [6] = u28
            [7] = u26
        --]]
        u30:Destroy()
        u27:SetAttribute("Transparency", 0)
        if u24 == u7.LocalPlayer then
            u10.CurrentCamera.CameraSubject = u27.Humanoid
        end
        local v62 = u28
        if v62 ~= nil then
            v62:showNametag()
        end
        u26:Destroy()
    end)
end
function u17.getHighPoint(_, p63, p64) --[[ Line: 237 ]]
    local v65 = (p63.X + p64.X) / 2
    local v66 = (p63.Z + p64.Z) / 2
    local v67 = p63.Y + 50
    return Vector3.new(v65, v67, v66)
end
function u17.playParticleEffect(p68, p69) --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u10
        [4] = u7
    --]]
    local v70 = p69.Character
    if v70 ~= nil then
        v70 = v70.PrimaryPart
        if v70 ~= nil then
            v70 = v70.Position
        end
    end
    if not v70 then
        return nil
    end
    local v71 = u8.Assets.Effects.ShieldUltEffect
    local v72 = u5.Controllers.InfernalShieldController:getKitSkinMeta(p69)
    if v72 ~= nil then
        v72 = v72.shielder
        if v72 ~= nil then
            v72 = v72.effect
        end
    end
    local u73 = (v72 or v71):Clone()
    local u74 = u8.Assets.Effects.GroudCrack:Clone()
    u73.Position = v70
    u73.Parent = u10
    u74.Position = v70
    u74.Parent = u10
    local v75 = u7.LocalPlayer.Character
    if v75 ~= nil then
        v75 = v75.PrimaryPart
        if v75 ~= nil then
            v75 = v75.Position
        end
    end
    if v75 then
        v75 = (v75 - v70).Magnitude <= 20
    end
    if v75 then
        p68:shakeScreen(v70)
    end
    for v76, v77 in u73:GetDescendants() do
        local _ = v76 - 1
        if v77:IsA("ParticleEmitter") then
            v77:Emit(30)
        end
    end
    task.delay(1, function() --[[ Line: 299 ]]
        --[[
        Upvalues:
            [1] = u73
            [2] = u74
        --]]
        u73:Destroy()
        u74:Destroy()
    end)
end
function u17.shakeScreen(_, p78) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    local v79 = u7.LocalPlayer.Character
    if v79 ~= nil then
        v79 = v79:GetPrimaryPartCFrame()
    end
    if not v79 then
        return nil
    end
    u5.Controllers.ScreenShakeController:shake(p78, v79.LookVector, {
        ["magnitude"] = 5,
        ["cycles"] = 5,
        ["duration"] = 0.4
    })
end
u5.CreateController(u17.new())
return nil