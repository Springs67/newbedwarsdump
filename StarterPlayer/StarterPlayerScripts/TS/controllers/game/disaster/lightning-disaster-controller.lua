local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient").Controllers
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.InQuad
local u9 = v7.Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Lighting
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "LightningMechanicController"
    end,
    ["__index"] = u17
})
u22.__index = u22
function u22.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u20
    --]]
    u17.constructor(p25)
    p25.Name = "LightningMechanicController"
    p25.staticSounds = {
        u20.LIGHTNING_STATIC_1,
        u20.LIGHTNING_STATIC_2,
        u20.LIGHTNING_STATIC_3,
        u20.LIGHTNING_STATIC_4,
        u20.LIGHTNING_STATIC_5,
        u20.LIGHTNING_STATIC_6
    }
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u5
        [3] = u18
        [4] = u4
        [5] = u20
        [6] = u19
        [7] = u2
        [8] = u10
        [9] = u12
        [10] = u16
        [11] = u9
        [12] = u8
        [13] = u14
        [14] = u15
        [15] = u13
        [16] = u6
    --]]
    u17.KnitStart(u26)
    task.spawn(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u18
            [3] = u4
            [4] = u20
            [5] = u26
        --]]
        local v27, v28 = u5.Controllers.MatchController:getQueueTypeAsync():await()
        if v27 and (v28 == u18.BEDWARS_DISASTERS_20v20 or v28 == u18.BEDWARS_DISASTERS_TO4) then
            u4.Controllers.PreloadController:runPreload({
                ["sounds"] = {
                    u20.LIGHTNING_STRIKE_1,
                    u20.LIGHTNING_STRIKE_2,
                    u20.LIGHTNING_STATIC_1,
                    u20.LIGHTNING_STATIC_2,
                    u20.LIGHTNING_STATIC_3,
                    u20.LIGHTNING_STATIC_4,
                    u20.LIGHTNING_STATIC_5,
                    u20.LIGHTNING_STATIC_6,
                    u20.LIGHTNING_THUNDER_STORM_LOOP
                }
            })
            u26.initialAtmosphereColor = u5.Controllers.LightingController:getAtmosphere().Color
        end
    end)
    u19.Client:Get("LightningMechanic_StormStarted"):Connect(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u2
            [3] = u20
            [4] = u5
            [5] = u10
            [6] = u12
            [7] = u16
            [8] = u9
        --]]
        u26.stormSoundLoopRef = u2:playSound(u20.LIGHTNING_THUNDER_STORM_LOOP, {
            ["looped"] = true,
            ["volumeMultiplier"] = 2.5
        })
        local u29 = u5.Controllers.LightingController:getAtmosphere().Color
        if not u26.currentAtmosphereModifier then
            u26.currentAtmosphereModifier = u5.Controllers.LightingController:getAtmosphereModifier():addModifier(30, {
                ["Density"] = 0,
                ["Haze"] = 0,
                ["Color"] = u29
            })
        end
        if u26.colorCorrectionEffect then
            u26.colorCorrectionEffect:Destroy()
            u26.colorCorrectionEffect = nil
        end
        if not u26.colorCorrectionEffect then
            u26.colorCorrectionEffect = u10("ColorCorrectionEffect", {
                ["Name"] = "LightningMechanicColorCorrectionEffect",
                ["Saturation"] = 0,
                ["Enabled"] = true,
                ["TintColor"] = Color3.fromRGB(255, 255, 255),
                ["Parent"] = u12
            })
        end
        if u26.currentAtmosphereTween then
            u26.currentAtmosphereTween:Cancel()
        end
        u26.currentAtmosphereTween = u16(3, u9, function(p30) --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u29
            --]]
            local v31 = u26.currentAtmosphereModifier
            local v32 = {}
            for v33, v34 in u26.currentAtmosphereModifier:getProperties() do
                v32[v33] = v34
            end
            v32.Color = u29:Lerp(Color3.fromRGB(8, 0, 59), p30)
            v32.Density = 0.3 * p30
            v32.Haze = 2.25 * p30
            v31:setProperties(v32)
            u26.colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(145, 135, 191), p30)
        end, 0, 1)
    end)
    u19.Client:Get("LightningMechanic_StormEnded"):Connect(function() --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u2
            [3] = u16
            [4] = u8
        --]]
        if u26.stormSoundLoopRef then
            task.spawn(function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u26
                --]]
                u2:tweenSoundVolume(u26.stormSoundLoopRef, 0, 3)
                task.wait(3.1)
                if u26.stormSoundLoopRef then
                    u26.stormSoundLoopRef:Stop()
                    u26.stormSoundLoopRef:Destroy()
                end
            end)
        end
        if u26.currentAtmosphereModifier then
            if u26.currentAtmosphereTween then
                u26.currentAtmosphereTween:Cancel()
            end
            u26.currentAtmosphereTween = u16(3, u8, function(p35) --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                local v36 = u26.currentAtmosphereModifier
                local v37 = {}
                for v38, v39 in u26.currentAtmosphereModifier:getProperties() do
                    v37[v38] = v39
                end
                v37.Color = Color3.fromRGB(8, 0, 59):Lerp(u26.initialAtmosphereColor or Color3.fromRGB(255, 255, 255), p35)
                v37.Density = 0.3 - 0.3 * p35
                v37.Haze = 2.25 - 2.25 * p35
                v36:setProperties(v37)
                u26.colorCorrectionEffect.TintColor = Color3.fromRGB(145, 135, 191):Lerp(Color3.fromRGB(255, 255, 255), p35)
            end, 0, 1)
        end
    end)
    u19.Client:Get("LightningMechanic_ShowStaticOnPlayers"):Connect(function(p40) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        for v41, v42 in p40.staticPlayers do
            local _ = v41 - 1
            u26:playStaticEffectForPlayer(v42)
        end
    end)
    u19.Client:Get("LightningMechanic_ShowLightningStrikeIndicator"):Connect(function(u43) --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u15
            [3] = u2
            [4] = u26
        --]]
        local u44 = u14.Assets.Effects.LightningMechanic_Indicator:Clone()
        u44.Parent = u15
        u44.Position = u43.position
        task.spawn(function() --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u26
                [3] = u43
            --]]
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
            task.wait(0.5)
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
            task.wait(0.5)
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
            task.wait(0.5)
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
            task.wait(0.5)
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
            task.wait(0.5)
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
            task.wait(0.5)
            u2:playSound(u26:getRandomStaticSound(), {
                ["position"] = u43.position
            })
        end)
        task.delay(3, function() --[[ Line: 182 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:Destroy()
        end)
    end)
    u19.Client:Get("LightningMechanic_LightningStrike"):Connect(function(p45) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u5
            [3] = u6
        --]]
        local v46 = u13.LocalPlayer
        if v46 ~= nil then
            v46 = v46.Character
            if v46 ~= nil then
                v46 = v46.PrimaryPart
                if v46 ~= nil then
                    v46 = v46.Position
                end
            end
        end
        local v47 = v46 and (v46 - p45.position).Magnitude < 50
        if v47 then
            u5.Controllers.ScreenShakeController:shake(v46, Vector3.new(0, -1, 0), {
                ["magnitude"] = 0.5,
                ["cycles"] = 3,
                ["duration"] = 0.3,
                ["zMagnitude"] = 0.2
            })
        end
        u6.WizardLightningStrikeController:playLightningEffects(p45.position, v47)
    end)
end
function u22.playStaticEffectForPlayer(p48, p49) --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v50 = p49.Character
    if v50 ~= nil then
        v50 = v50.PrimaryPart
    end
    if not v50 then
        return nil
    end
    local v51 = p48:getOrCreateStaticShockParticlesParent(p49)
    if not v51 then
        return nil
    end
    local u52 = v51:GetChildren()
    task.spawn(function() --[[ Line: 233 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        for v53, v54 in u52 do
            local _ = v53 - 1
            if v54:IsA("ParticleEmitter") then
                v54.Enabled = true
            end
        end
        task.wait(0.2)
        for v55, v56 in u52 do
            local _ = v55 - 1
            if v56:IsA("ParticleEmitter") then
                v56.Enabled = false
            end
        end
    end)
    u2:playSound(p48:getRandomStaticSound(), {
        ["position"] = v50.Position
    })
end
function u22.getOrCreateStaticShockParticlesParent(_, p57) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u21
    --]]
    local v58 = p57.Character
    if v58 ~= nil then
        v58 = v58.PrimaryPart
    end
    if not v58 then
        return nil
    end
    local v59 = v58:FindFirstChild("LightningMechanic_StaticParticles")
    if v59 then
        return v59
    end
    local v60 = u14.Assets.Effects.LightningMechanic_StaticParticles:Clone()
    v60.Parent = v58
    v60.CFrame = v58.CFrame
    u21:weldParts(v60, v58)
end
function u22.getRandomStaticSound(p61) --[[ Line: 279 ]]
    return p61.staticSounds[math.random(0, #p61.staticSounds - 1) + 1]
end
u4.CreateController(u22.new())
return nil