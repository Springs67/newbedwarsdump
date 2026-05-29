local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GroupModifierBehavior
local u4 = v2.MathExtras
local u5 = v2.ModifierGroup
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "base-environment-settings").BaseEnvironmentSettings
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "BaseEnvironmentPresetController"
    end,
    ["__index"] = u13
})
v16.__index = v16
function v16.constructor(p17, p18, p19, p20, p21, p22) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u5
        [4] = u11
        [5] = u10
        [6] = u3
    --]]
    u13.constructor(p17)
    p17.preset = p18
    p17.environmentTable = p19
    p17.ambientSoundSettings = p20
    p17.skyboxId = p21
    p17.backgroundMusicOverride = p22
    p17.Name = "BaseEnvironmentPresetController"
    p17.currentIntensity = 0
    p17.environmentMaid = u9.new()
    p17.colorCorrectionModifier = u5.new(u11:FindFirstChildOfClass("ColorCorrectionEffect") or u10("ColorCorrectionEffect", {
        ["Parent"] = u11
    }), {
        ["baseProperties"] = {
            ["Contrast"] = 0.05,
            ["Saturation"] = 0,
            ["TintColor"] = Color3.fromRGB(255, 255, 255)
        },
        ["behavior"] = u3.Merge
    })
    p17.ambientSoundInstances = {}
    p17.ambientSoundVolumeTweens = {}
    p17.weatherIntensityInitialized = false
    p17.maid = u9.new()
    p17.dynamicWeatherEventMaid = u9.new()
    p17.enabled = false
    p17.weatherEventIsActive = false
end
function v16.KnitStart(u23) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
    --]]
    u13.KnitStart(u23)
    u15.Client:Get("SetupWeather"):Connect(function(p24) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if p24.preset == u23.preset then
            u23:enable()
        end
    end)
    u15.Client:Get("DynamicWeatherEventStarted"):Connect(function(p25) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if p25.preset == u23.preset then
            u23.weatherEventIsActive = true
            u23:onDynamicEventStarted()
        end
    end)
    u15.Client:Get("DynamicWeatherEventEnded"):Connect(function(p26) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if p26.preset == u23.preset then
            u23.weatherEventIsActive = false
            u23.dynamicWeatherEventMaid:DoCleaning()
            u23:onDynamicEventEnded()
        end
    end)
end
function v16.enable(u27) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u15
    --]]
    u27.enabled = true
    u27.maid:GiveTask(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.enabled = false
    end)
    if u27.environmentTable then
        u7.Controllers.EnvironmentController:setupEnvironment(u27.environmentTable)
    end
    if u27.ambientSoundSettings ~= nil and #u27.ambientSoundSettings > 0 then
        u7.Controllers.AmbientSoundController:stopAmbience()
        for _, v28 in u27.ambientSoundSettings do
            local v29 = u6:playModifiableSound(v28.ambientSoundName, {
                ["looped"] = true
            })
            if v29 then
                local v30 = v28.baseVolumeOverride
                if v30 == nil then
                    v30 = v29.Volume
                end
                u27.ambientSoundInstances[v28.ambientSoundName] = {
                    ["sound"] = v29,
                    ["originalVolume"] = v30,
                    ["setting"] = v28
                }
            end
        end
        u27.maid:GiveTask(function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            for _, v31 in u27.ambientSoundInstances do
                v31.sound:Stop()
            end
            table.clear(u27.ambientSoundInstances)
        end)
    end
    if u27.skyboxId ~= nil then
        u7.Controllers.SkyboxController:setSkybox(u27.skyboxId)
    end
    local u33 = u15.Client:Get("EnvironmentIntensityVarianceUpdate"):Connect(function(p32) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:setIntensity(p32.newIntensity)
    end)
    u27.maid:GiveTask(function() --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:Disconnect()
    end)
    u15.Client:Get("RequestEnvironmentWeatherIntensityFromServer"):CallServerAsync():andThen(function(p34) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if p34 ~= nil then
            u27:setIntensity(p34)
        end
    end)
    if u27.backgroundMusicOverride ~= nil and #u27.backgroundMusicOverride.sounds > 0 then
        task.delay(1, function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u27
            --]]
            local v35 = u7.Controllers.BackgroundMusicController
            local v36 = u27.backgroundMusicOverride.sounds[1].soundId
            local v37 = {}
            local v38 = u27.backgroundMusicOverride.sounds[1].volumeMultiplier
            v37.volumeMultiplier = v38 == nil and 1 or v38
            v35:startMusic(v36, nil, v37)
        end)
    end
    u27:onEnable()
end
function v16.setIntensity(p39, p40) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u12
        [4] = u8
    --]]
    if not p39.enabled then
        return nil
    end
    p39.currentIntensity = p40
    for v41, u42 in p39.ambientSoundInstances do
        if not u42.setting.intensityInfluencedDisabled then
            local v43 = u42.sound.Volume
            local v44 = u4
            local v45 = u42.setting.volumeMultiplierMinOverride
            if v45 == nil then
                v45 = u14.AMBIENT_SOUND_VOLUME_MULTIPLIER_MIN
            end
            local v46 = u42.setting.volumeMultiplierMaxOverride
            if v46 == nil then
                v46 = u14.AMBIENT_SOUND_VOLUME_MULTIPLIER_MAX
            end
            local v47 = v44:lerp(v45, v46, p40)
            local v48 = u42.originalVolume * v47
            local v49 = p39.ambientSoundVolumeTweens[v41]
            if v49 ~= nil then
                v49:Cancel()
            end
            local v51 = u12(3, u8, function(p50) --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42.sound.Volume = p50
            end, v43, v48)
            p39.ambientSoundVolumeTweens[v41] = v51
            v51:Play()
        end
    end
    p39:onIntensityChanged(p40)
    p39.weatherIntensityInitialized = true
end
return {
    ["BaseEnvironmentPresetController"] = v16
}