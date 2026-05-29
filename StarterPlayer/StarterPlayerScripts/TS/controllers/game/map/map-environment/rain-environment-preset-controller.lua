local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Lighting
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local u15 = v1.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController
local u16 = Color3.fromRGB(64, 64, 77)
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "RainEnvironmentPresetController"
    end,
    ["__index"] = u15
})
u17.__index = u17
function u17.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
        [3] = u16
        [4] = u13
        [5] = u12
    --]]
    local v21 = u15.constructor
    local v22 = u14.Rain
    local v23 = {
        ["ColorCorrectionEffect"] = {
            ["TintColor"] = Color3.fromRGB(240, 237, 252)
        },
        ["Clouds"] = {
            ["Cover"] = 0.7,
            ["Density"] = 0.4,
            ["Color"] = u16
        }
    }
    local v24 = {
        {
            ["ambientSoundName"] = u13.PIRATE_EVENT_RAIN_LOOP
        }
    }
    local v25 = u12.Night
    local v26 = {
        ["sounds"] = {
            {
                ["soundId"] = u13.PIRATE_EVENT_LOBBY_MUSIC
            }
        }
    }
    v21(p20, v22, v23, v24, v25, v26)
    p20.Name = "RainEnvironmentPresetController"
    p20.originalLightingBrightness = 2
    p20.cachedClouds = nil
end
function u17.KnitStart(p27) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.KnitStart(p27)
end
function u17.onEnable(u28) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u11
        [4] = u8
    --]]
    local v29 = u28.mapMeta
    if v29 ~= nil then
        v29 = v29.environment
        if v29 ~= nil then
            v29 = v29.rainSettings
        end
    end
    u28.rainSettings = v29
    u5.Controllers.PreloadController:runPreload({
        ["sounds"] = { u13.PIRATE_EVENT_THUNDER }
    })
    u11.Client:Get("EnvironmentWeatherPlayLightningEffect"):Connect(function(p30) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:playLightningEffect(p30.intensity)
    end)
    u28.originalLightingBrightness = u8.Brightness
    u5.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u13.LIGHTNING_STRIKE_1,
            u13.LIGHTNING_STRIKE_2,
            u13.LIGHTNING_STATIC_1,
            u13.LIGHTNING_STATIC_2,
            u13.LIGHTNING_STATIC_3,
            u13.LIGHTNING_STATIC_4,
            u13.LIGHTNING_STATIC_5,
            u13.LIGHTNING_STATIC_6,
            u13.LIGHTNING_THUNDER_STORM_LOOP
        }
    })
end
function u17.onIntensityChanged(p31, p32) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u10
        [4] = u6
    --]]
    if not p31.weatherIntensityInitialized then
        u5.Controllers.RainWeatherParticleController:enable(p32)
        p31.maid:GiveTask(function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            u5.Controllers.RainWeatherParticleController:disable()
        end)
    end
    u5.Controllers.RainWeatherParticleController:setIntensity(p32)
    local u33 = p31:getClouds()
    if u33 then
        local u34 = u33.Cover
        local u35 = u3:lerp(0.7, 0.85, p32)
        local u36 = u33.Density
        local u37 = u3:lerp(0.4, 0.5, p32)
        u10(6, u6, function(p38) --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u3
                [3] = u34
                [4] = u35
                [5] = u36
                [6] = u37
            --]]
            if u33 then
                u33.Cover = u3:lerp(u34, u35, p38)
                u33.Density = u3:lerp(u36, u37, p38)
            end
        end, 0, 1):Play()
    end
end
function u17.playLightningEffect(p39, p40) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u3
        [4] = u10
        [5] = u6
        [6] = u8
    --]]
    u4:playSound(u13.PIRATE_EVENT_THUNDER, {
        ["volumeMultiplier"] = u3:lerp(0.4, 1, p40)
    })
    u10(0.2, u6, function(p41) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.Brightness = p41
    end, p39.originalLightingBrightness, 10):Play():Wait()
    u10(0.2, u6, function(p42) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.Brightness = p42
    end, 10, p39.originalLightingBrightness):Play():Wait()
    u10(0.2, u6, function(p43) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.Brightness = p43
    end, p39.originalLightingBrightness, 10):Play():Wait()
    u10(1.5, u6, function(p44) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.Brightness = p44
    end, 10, p39.originalLightingBrightness):Play():Wait()
end
function u17.getClouds(p45) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v46 = p45.cachedClouds
    if v46 then
        local v47 = p45.cachedClouds
        if v47 ~= nil then
            v47 = v47.Parent
        end
        v46 = v47 == u9.Terrain
    end
    if v46 then
        return p45.cachedClouds
    else
        return u9.Terrain:FindFirstChildOfClass("Clouds")
    end
end
function u17.onDynamicEventStarted(_) --[[ Line: 142 ]] end
function u17.onDynamicEventEnded(_) --[[ Line: 144 ]] end
u5.CreateController(u17.new())
return nil