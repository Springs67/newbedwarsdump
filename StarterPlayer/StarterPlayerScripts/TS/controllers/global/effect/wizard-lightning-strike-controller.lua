local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "lightning-beams", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Lighting
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u27 = {
    v25.WIZARD_LIGHTNING_STRIKE,
    v25.WIZARD_LIGHTNING_STRIKE_02,
    v25.WIZARD_LIGHTNING_STRIKE_03,
    v25.WIZARD_LIGHTNING_STRIKE_04
}
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "WizardLightningStrikeController"
    end,
    ["__index"] = u19
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p31)
    p31.Name = "WizardLightningStrikeController"
end
function u28.KnitStart(u32) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u24
        [3] = u6
        [4] = u23
        [5] = u13
        [6] = u17
        [7] = u20
        [8] = u22
        [9] = u21
    --]]
    u19.KnitStart(u32)
    u24.Client:OnEvent("WizardLightningStrike", function(p33) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u23
            [3] = u32
            [4] = u13
        --]]
        local v34 = p33.caster.Character
        if not v34 then
            return nil
        end
        local v35
        if v34 then
            v35 = u6.Controllers.KitSkinController:getKitSkin(v34)
        else
            v35 = nil
        end
        local v36
        if v35 then
            v36 = u23[v35]
        else
            v36 = nil
        end
        local v37 = nil
        local v38 = {}
        local v39
        if v36 == nil then
            v39 = v36
        else
            v39 = v36.wizard
        end
        if v39 then
            if v36 == nil then
                v37 = v36
            else
                v37 = v36.wizard.lightingStrikeColor
            end
            local v40
            if v36 == nil then
                v40 = v36
            else
                v40 = v36.wizard.lightningStrikeOverlay
            end
            if v40 ~= "" and (v40 and v38 ~= nil) then
                local v41
                if v36 == nil then
                    v41 = v36
                else
                    v41 = v36.wizard.lightningStrikeOverlay
                end
                table.insert(v38, v41)
            end
            local v42
            if v36 == nil then
                v42 = v36
            else
                v42 = v36.wizard.lightningStrikeStaticOverlay
            end
            if v42 ~= "" and (v42 and v38 ~= nil) then
                if v36 ~= nil then
                    v36 = v36.wizard.lightningStrikeStaticOverlay
                end
                table.insert(v38, v36)
            end
        end
        u32:playLightningEffects(p33.target, p33.caster == u13.LocalPlayer, p33.caster, v37, v38)
    end)
    u17.AbilityUsed:connect(function(p43) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u13
            [3] = u22
            [4] = u21
            [5] = u6
        --]]
        if p43:isCancelled() then
            return nil
        end
        if p43.ability ~= u20.LIGHTNING_STRIKE then
            return nil
        end
        if p43.userCharacter ~= u13.LocalPlayer.Character then
            return nil
        end
        u22:playAnimation(u13.LocalPlayer, u21.WIZARD_LIGHTNING_STRIKE_CAST)
        u6.Controllers.ViewmodelController:playAnimation(u21.FP_SWING_SWORD)
    end)
end
function u28.playLightningEffects(u44, u45, u46, u47, u48, p49) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u27
        [4] = u5
        [5] = u8
    --]]
    local u50 = u9.new()
    local v51 = u27
    u50:GiveTask(u5:playSound(u4.fromList(unpack(v51)), {
        ["rollOffMaxDistance"] = 200,
        ["rollOffMinDistance"] = 35,
        ["volumeMultiplier"] = 0.7,
        ["position"] = u45
    }))
    if p49 then
        for v52, v53 in p49 do
            local _ = v52 - 1
            u50:GiveTask(u5:playSound(v53, {
                ["rollOffMaxDistance"] = 200,
                ["rollOffMinDistance"] = 35,
                ["volumeMultiplier"] = 0.7,
                ["position"] = u45
            }))
        end
    end
    u50:GiveTask(task.delay(0.15, function() --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u44
            [3] = u45
            [4] = u46
            [5] = u47
            [6] = u48
        --]]
        u50:GiveTask(u44:playStrikeImpactEffects(u45, u46, u47, u48))
    end))
    local v54 = false
    local v55 = 0
    while true do
        if v54 then
            v55 = v55 + 1
        else
            v54 = true
        end
        if v55 >= 2 then
            return u50
        end
        local v56 = {
            ["WorldAxis"] = Vector3.new(1, 0, 0),
            ["WorldPosition"] = u45 + Vector3.new(0, 24, 0)
        }
        local v57 = u8.new(v56, {
            ["WorldAxis"] = Vector3.new(1, 0, 0),
            ["WorldPosition"] = u45
        }, 20)
        v57.PulseLength = 1.2
        v57.FadeLength = 0.2
        v57.PulseSpeed = 6.666666666666667
        v57.ColorOffsetSpeed = 1
        local v58 = math.random() < 0.5 and 8 or -8
        v57.CurveSize0 = v58
        v57.CurveSize1 = v58
        v57.Color = u48 or ColorSequence.new(Color3.fromRGB(118, 156, 245), Color3.fromRGB(79, 166, 171))
    end
end
function u28.getLightningImpactEffect(_, p59) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u23
    --]]
    if not p59.Character then
        return nil
    end
    local v60 = u6.Controllers.KitSkinController:getKitSkin(p59.Character)
    if not v60 then
        return nil
    end
    local v61 = u23[v60]
    if not v61 then
        return nil
    end
    local v62 = v61.wizard
    if v62 ~= nil then
        v62 = v62.lightningImpactEffect
    end
    if v62 then
        return v61.wizard.lightningImpactEffect:Clone()
    end
end
function u28.playStrikeImpactEffects(p63, p64, p65, p66, p67) --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v68 = u9.new()
    local v69
    if p67 == nil then
        v69 = p67
    else
        v69 = p67.Keypoints[1].Value
    end
    v68:GiveTask(p63:playLightBlastImpactEffect(p64, v69))
    v68:GiveTask(p63:scorchImpactPosition(p64, p67, p66))
    if p65 then
        p63:playBlurEffect()
        p63:playScreenShakeEffect(p64)
    end
    return v68
end
function u28.playScreenShakeEffect(_, p70) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u3
        [3] = u18
    --]]
    local v71 = u15.CurrentCamera
    if not v71 then
        return nil
    end
    local v72, v73 = v71:WorldToScreenPoint(p70)
    if not v73 then
        return nil
    end
    local v74 = v72.X
    local v75 = v72.Y
    local v76 = math
    local v77 = (p70 - v71.CFrame.Position).Magnitude - 9
    local v78 = v71:ScreenPointToRay(v74, v75, (v76.max(v77, 0)))
    local v79 = u3:raycast(v78.Origin, v78.Direction)
    if v79 ~= nil then
        v79 = v79.Instance
    end
    if v79 then
        return nil
    end
    u18.shake(p70, Vector3.new(0, -1, 0), {
        ["duration"] = 0.22,
        ["magnitude"] = 0.25
    })
end
function u28.playBlurEffect(_) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u16
        [4] = u7
    --]]
    local u80 = u10("DepthOfFieldEffect", {
        ["Name"] = "WizardDepthOfField",
        ["InFocusRadius"] = 20,
        ["FocusDistance"] = 0,
        ["FarIntensity"] = 0,
        ["Parent"] = u12
    })
    local u82 = u16(0.14, u7, function(p81) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u80
        --]]
        u80.FarIntensity = (math.sqrt(p81) - p81) / 1.2 * 0.8
    end)
    task.spawn(function() --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u80
        --]]
        u82:Wait()
        u80:Destroy()
    end)
end
function u28.playLightBlastImpactEffect(_, p83, p84) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u15
        [4] = u16
        [5] = u7
    --]]
    local v85 = u9.new()
    local u86 = u10("Part", {
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Position"] = p83,
        ["Parent"] = u15
    })
    v85:GiveTask(u86)
    local u87 = u10("PointLight", {
        ["Range"] = 16.1,
        ["Brightness"] = 0,
        ["Color"] = p84 or Color3.fromRGB(26, 208, 240),
        ["Parent"] = u86
    })
    v85:GiveTask(u87)
    local u89 = u16(0.24, u7, function(p88) --[[ Line: 276 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87.Brightness = (math.sqrt(p88) - p88) / 1.2 * 4 * 8
    end)
    v85:GiveTask(function() --[[ Line: 280 ]]
        --[[
        Upvalues:
            [1] = u89
        --]]
        return u89:Cancel()
    end)
    v85:GiveTask(task.spawn(function() --[[ Line: 283 ]]
        --[[
        Upvalues:
            [1] = u89
            [2] = u87
            [3] = u86
        --]]
        u89:Wait()
        u87.Brightness = 0
        u87.Enabled = false
        u86:Destroy()
    end))
    return v85
end
function u28.scorchImpactPosition(p90, p91, p92, p93) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u15
        [4] = u26
        [5] = u16
        [6] = u7
    --]]
    local v94 = u9.new()
    local u95 = u14.Assets.Effects.WizardImpact:Clone()
    if p93 then
        u95 = p90:getLightningImpactEffect(p93) or u95
    end
    v94:GiveTask(u95)
    if not u95.PrimaryPart then
        return v94
    end
    if p92 then
        u95.Crack.SurfaceGui.ImageLabel.UIGradient.Color = p92
    end
    local v96 = u95.PrimaryPart.Size.Y / 2 + 0.5
    local v97 = Vector3.new(0, v96, 0)
    u95:PivotTo(CFrame.new(p91 + v97))
    u95.Parent = u15
    for v98, v99 in u95:GetDescendants() do
        local _ = v98 - 1
        if v99:IsA("ParticleEmitter") and p92 then
            local v100 = string.find(v99.Name, "Lightning")
            if v100 ~= 0 and (v100 == v100 and v100) then
                v99.Color = p92
            end
        end
    end
    u26:playEffects({ u95 }, nil)
    v94:GiveTask(task.delay(0.5, function() --[[ Line: 326 ]]
        --[[
        Upvalues:
            [1] = u95
            [2] = u16
            [3] = u7
        --]]
        local u101 = u95.Crack.SurfaceGui.ImageLabel
        local u102 = u95.Crack.SurfaceGui.Brightness
        u16(0.5, u7, function(p103) --[[ Line: 330 ]]
            --[[
            Upvalues:
                [1] = u95
                [2] = u102
                [3] = u101
            --]]
            local v104 = u95:FindFirstChild("Crack")
            if v104 ~= nil then
                v104 = v104:FindFirstChild("SurfaceGui")
            end
            if v104 then
                v104.Brightness = u102 * (1 - p103)
                u101.ImageTransparency = p103 * 0.4
            end
        end)
        task.wait(1.5)
        u16(1.5, u7, function(p105) --[[ Line: 343 ]]
            --[[
            Upvalues:
                [1] = u101
            --]]
            u101.ImageTransparency = 0.4 + p105 * 0.6
        end):Wait()
        u95:Destroy()
    end))
    return v94
end
u6.CreateController(u28.new())
return nil