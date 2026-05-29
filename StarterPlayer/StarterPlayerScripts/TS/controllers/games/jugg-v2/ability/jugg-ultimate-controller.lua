local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.TweenService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "JuggUltimateController"
    end,
    ["__index"] = u15
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
        [1] = u15
        [2] = u9
        [3] = u11
        [4] = u18
    --]]
    u15.constructor(p31)
    p31.Name = "JuggUltimateController"
    p31.maid = u9.new()
    p31.defaultCameraMaxDistance = u11.LocalPlayer.CameraMaxZoomDistance
    p31.defaultCameraMinDistance = u11.LocalPlayer.CameraMinZoomDistance
    p31.animationList = { u18.HEAVENLY_SWORD_SWING, u18.JUGGERNAUT_SWING }
end
function u28.KnitStart(u32) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u23
        [3] = u25
        [4] = u11
        [5] = u4
        [6] = u19
        [7] = u18
        [8] = u5
        [9] = u26
        [10] = u16
        [11] = u22
    --]]
    u7.Controllers.PreloadController:runPreload({
        ["animations"] = u32.animationList,
        ["loadOnGameTypes"] = { u23.JUGGERNAUT_V2 }
    })
    u25.Client:Get("NewJuggernaut"):Connect(function(p33) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u32
        --]]
        if p33.player == u11.LocalPlayer then
            u32:mountAbility()
        else
            local v34 = u11.LocalPlayer:GetAttribute("Juggernaut")
            if v34 == 0 or (v34 ~= v34 or (v34 == "" or not v34)) then
                u32:unmountAbility()
            end
        end
    end)
    u25.Client:Get("EntityDeathEvent"):Connect(function(p35) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u32
        --]]
        if u11:GetPlayerFromCharacter(p35.entityInstance) == u11.LocalPlayer then
            u32:unmountAbility()
        end
    end)
    u25.Client:Get("JuggernautStabGroundEvent"):Connect(function(u36) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u19
            [3] = u18
            [4] = u5
            [5] = u26
            [6] = u11
            [7] = u32
        --]]
        local v37 = u36.player.Character
        if v37 ~= nil then
            v37 = v37:GetPrimaryPartCFrame().Position
        end
        if not v37 then
            return nil
        end
        local v38 = u4:playAnimation(u36.player, u19:getAssetId(u18.HEAVENLY_SWORD_CHARGE))
        u5:playSound(u26.SPIRIT_DAGGER_CHARGE, {
            ["rollOffMaxDistance"] = 45,
            ["volumeMultiplier"] = 0.7,
            ["position"] = v37
        })
        local v39 = u11.LocalPlayer.Character
        if v39 ~= nil then
            v39 = v39.PrimaryPart
            if v39 ~= nil then
                v39 = v39.Position
            end
        end
        if v39 then
            v39 = (v39 - v37).Magnitude <= 40
        end
        if v39 then
            u32:shakeScreen(v37)
        end
        v38:AdjustSpeed(2)
        v38.Stopped:Connect(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u36
            --]]
            u32:playTweenEffect(u36.player, u36.victims)
        end)
    end)
    u25.Client:Get("JuggernautUseUltEvent"):Connect(function(p40) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:stabGroundAnimation(p40.player)
        u32:playStabGroundEffect(p40.player)
    end)
    u16.On(function(p41, _, p42, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u11
            [3] = u32
        --]]
        if p42 ~= u22.JUGGERNAUT_ULT then
            return nil
        end
        local v43 = p41:FindFirstChild("JuggUltSlash")
        local v44 = u11:GetPlayerFromCharacter(p41)
        if v43 and v44 then
            u32:playExplosionEffect(v44)
            v43:Destroy()
        end
    end)
end
function u28.playStabGroundEffect(u45, u46) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u5
        [4] = u26
    --]]
    if u46 == u11.LocalPlayer then
        local v47 = u46.Character
        local v48 = u14.CurrentCamera
        if v48 ~= nil then
            v48 = (v48.CFrame.Position - v47.Head.Position).Magnitude
        end
        u45.cameraDistance = v48
        u11.LocalPlayer.CameraMaxZoomDistance = u45.defaultCameraMaxDistance * 2
        u11.LocalPlayer.CameraMinZoomDistance = u45.defaultCameraMaxDistance * 2
        u11.LocalPlayer.CameraMinZoomDistance = u45.defaultCameraMinDistance
    end
    task.delay(0.7, function() --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u45
            [3] = u5
            [4] = u26
        --]]
        local v49 = u46.Character
        if v49 ~= nil then
            v49 = v49:GetPrimaryPartCFrame()
        end
        if not v49 then
            return nil
        end
        u45:playStomperEffects(v49 + v49.LookVector.Unit * 3)
        local v50 = u5
        local v51 = u26.JUGGERNAUT_GROUND_SMASH
        local v52 = {}
        local v53 = u46.Character
        if v53 ~= nil then
            v53 = v53:GetPrimaryPartCFrame().Position
        end
        v52.position = v53
        v52.rollOffMaxDistance = 45
        v52.volumeMultiplier = 0.7
        v50:playSound(v51, v52)
    end)
end
function u28.playTweenEffect(u54, u55, p56) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u4
        [4] = u19
        [5] = u18
        [6] = u13
        [7] = u5
        [8] = u26
    --]]
    local u57 = u55.Character
    u57.Archivable = true
    local u58 = u57:Clone()
    u58.Parent = u14
    if u55 == u11.LocalPlayer then
        u14.CurrentCamera.CameraSubject = u58.Humanoid
    end
    u55.Character:SetAttribute("Transparency", 1)
    u58:PivotTo(u57:GetPrimaryPartCFrame())
    local v59 = u58.Humanoid.Animator
    local v60 = 0
    for _, u61 in p56 do
        local u62 = u4:playAnimation(u61, u19:getAssetId(u18.DRAGON_SLAYER_LAUNCH_LOOP))
        task.delay(#p56 * 0.2 + 1.5, function() --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u62
            --]]
            u62:Stop()
            u62:Destroy()
        end)
        u58.PrimaryPart.Anchored = false
        local v63 = TweenInfo.new(0.05)
        local u64 = u13:Create(u58.PrimaryPart, v63, {
            ["CFrame"] = CFrame.new(u61.Character.PrimaryPart.Position)
        })
        local u65 = v59:LoadAnimation(u19:getAnimation(u54.animationList[v60 + 1]))
        v60 = v60 == 1 and 0 or 1
        u64:Play()
        u64.Completed:Connect(function() --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u65
                [3] = u64
                [4] = u54
                [5] = u61
            --]]
            u58.PrimaryPart.Anchored = true
            u65:AdjustSpeed(3)
            u65:Play()
            u64:Destroy()
            task.delay(0.05, function() --[[ Line: 201 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u58
                    [3] = u61
                --]]
                u54:playSlashEffect(u58, u61.Character)
            end)
        end)
        task.wait(0.2)
    end
    local v66 = TweenInfo.new(0.05)
    local v67 = u13:Create(u58.PrimaryPart, v66, {
        ["CFrame"] = u57:GetPrimaryPartCFrame()
    })
    v67:Play()
    local u68 = u4:playAnimation(u55, u19:getAssetId(u18.JUGGERNAUT_ULTIMATE))
    u68:GetMarkerReachedSignal("air2"):Connect(function() --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u68
        --]]
        u68:AdjustSpeed(0)
        task.delay(0.25, function() --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u68
            --]]
            u68:AdjustSpeed(1)
        end)
    end)
    u68:GetMarkerReachedSignal("slam"):Connect(function() --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u54
            [3] = u5
            [4] = u26
        --]]
        local v69 = u55.Character
        if v69 ~= nil then
            v69 = v69:GetPrimaryPartCFrame()
        end
        if v69 ~= nil then
            v69 = v69 + v69.LookVector.Unit * 3
        end
        if v69 then
            u54:stabGroundExplosionEffect(v69)
        end
        local v70 = u5
        local v71 = u26.STOMPER_HIT
        local v72 = {}
        if v69 ~= nil then
            v69 = v69.Position
        end
        v72.position = v69
        v72.rollOffMaxDistance = 45
        v72.volumeMultiplier = 0.7
        v70:playSound(v71, v72)
    end)
    v67.Completed:Connect(function() --[[ Line: 247 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u11
            [3] = u14
            [4] = u58
            [5] = u57
            [6] = u54
        --]]
        if u55 == u11.LocalPlayer then
            u14.CurrentCamera.CameraSubject = u11.LocalPlayer.Character.Humanoid
        end
        u58:Destroy()
        u57:SetAttribute("Transparency", 0)
        task.delay(1.5, function() --[[ Line: 253 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u11
                [3] = u54
            --]]
            local v73
            if u55 == u11.LocalPlayer then
                v73 = u54.cameraDistance
            else
                v73 = false
            end
            if v73 ~= 0 and (v73 == v73 and v73) then
                u11.LocalPlayer.CameraMaxZoomDistance = u54.cameraDistance
                u11.LocalPlayer.CameraMaxZoomDistance = u54.defaultCameraMaxDistance
            end
        end)
    end)
end
function u28.mountAbility(p74) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u24
        [4] = u21
        [5] = u20
    --]]
    local v75 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v76 = u17.JUGGERNAUT_ULTIMATE
    local v77 = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = u24.JUGG_BARB_ULT
        }
    }
    local u78 = v75:enableAbility(v76, v77):expect()
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u21.JUGGERNAUT_ULT, u20.ULT_COOLDOWN)
    p74.maid:GiveTask(function() --[[ Line: 270 ]]
        --[[
        Upvalues:
            [1] = u78
        --]]
        u78.Destroy()
    end)
end
function u28.unmountAbility(p79) --[[ Line: 274 ]]
    p79.maid:DoCleaning()
end
function u28.playSlashEffect(_, p80, p81) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u26
        [3] = u12
    --]]
    local v82 = p80:GetPrimaryPartCFrame()
    if not v82 then
        return nil
    end
    u5:playSound(u26.SPIRIT_DAGGER_SLASH, {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.7,
        ["position"] = v82.Position
    })
    local v83 = u12.Assets.Effects.JuggernautSwing:Clone()
    v83.Name = "JuggUltSlash"
    v83:PivotTo(v82)
    v83.Parent = p81
    v83:PivotTo(v82 * CFrame.new(0, 0, -2))
end
function u28.playExplosionEffect(_, p84) --[[ Line: 296 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    local u85 = u12.Assets.Effects.JuggernautUltExplosion:Clone()
    local v86 = p84.Character
    if v86 ~= nil then
        v86 = v86.PrimaryPart
        if v86 ~= nil then
            v86 = v86.Position
        end
    end
    if not v86 then
        return nil
    end
    u85.Position = v86
    u85.Parent = u14
    for v87, v88 in u85:GetDescendants() do
        local _ = v87 - 1
        if v88:IsA("ParticleEmitter") then
            v88:Emit(30)
        end
    end
    task.delay(1, function() --[[ Line: 320 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        u85:Destroy()
    end)
end
function u28.playStomperEffects(_, p89) --[[ Line: 324 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u27
    --]]
    local u90 = u12.Assets.Effects.Stomper:Clone()
    if not u90.PrimaryPart then
        return nil
    end
    u90:PivotTo(p89)
    u90.Parent = u14
    u27:playEffects({ u90 }, nil)
    task.delay(0.5, function() --[[ Line: 333 ]]
        --[[
        Upvalues:
            [1] = u90
        --]]
        u90:Destroy()
    end)
end
function u28.stabGroundExplosionEffect(_, p91) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    local v92 = p91.Position
    local u93 = u12.Assets.Effects.NewJuggernaut:Clone()
    u93.Position = v92
    u93.Parent = u14
    for v94, v95 in u93:GetDescendants() do
        local _ = v94 - 1
        if v95:IsA("ParticleEmitter") then
            v95:Emit(30)
        end
    end
    task.delay(1, function() --[[ Line: 351 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        u93:Destroy()
    end)
end
function u28.stabGroundAnimation(_, p96) --[[ Line: 355 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u19
        [3] = u18
        [4] = u11
        [5] = u8
    --]]
    u4:playAnimation(p96, u19:getAssetId(u18.JUGGERNAUT_STAB_GROUND))
    if p96 == u11.LocalPlayer then
        u8.Controllers.ViewmodelController:playAnimation(u18.JUGGERNAUT_GROUND_STAB_FP)
    end
end
function u28.shakeScreen(_, p97) --[[ Line: 361 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
    --]]
    local v98 = u11.LocalPlayer.Character
    if v98 ~= nil then
        v98 = v98:GetPrimaryPartCFrame()
    end
    if not v98 then
        return nil
    end
    u7.Controllers.ScreenShakeController:shake(p97, v98.LookVector, {
        ["magnitude"] = 5,
        ["cycles"] = 5,
        ["duration"] = 0.4
    })
end
u7.CreateController(u28.new())
return nil