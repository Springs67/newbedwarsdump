local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local u11 = v1.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "DesertEnvironmentPresetController"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u9
        [4] = u8
        [5] = u5
    --]]
    local v16 = u11.constructor
    local v17 = u10.Desert
    local v18 = {
        ["ColorCorrectionEffect"] = {
            ["TintColor"] = Color3.fromRGB(255, 242, 230)
        }
    }
    local v19 = {
        {
            ["baseVolumeOverride"] = 7,
            ["ambientSoundName"] = u9.WIND_AMBIENCE
        }
    }
    local v20 = u8.Sunset
    local v21 = {
        ["sounds"] = {
            {
                ["soundId"] = u9.DESERT_ISLAND_MUSIC
            },
            {
                ["volumeMultiplier"] = 0.65,
                ["soundId"] = u9.DESERT_TRAILER_MUSIC
            },
            {
                ["soundId"] = u9.DESERT_BOSS_MUSIC
            }
        }
    }
    v16(p15, v17, v18, v19, v20, v21)
    p15.Name = "DesertEnvironmentPresetController"
    p15.desertSandstormMaid = u5.new()
end
function u12.KnitStart(p22) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p22)
end
function u12.onEnable(p23) --[[ Line: 51 ]]
    local v24 = p23.mapMeta
    if v24 ~= nil then
        v24 = v24.environment
        if v24 ~= nil then
            v24 = v24.desertSettings
        end
    end
    p23.sandstormSettings = v24
end
function u12.onIntensityChanged(p25, p26) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not p25.weatherIntensityInitialized then
        u3.Controllers.SandstormWeatherParticleController:enable(p26)
        p25.maid:GiveTask(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3.Controllers.SandstormWeatherParticleController:disable()
        end)
    end
    u3.Controllers.SandstormWeatherParticleController:setIntensity(p26)
end
function u12.onDynamicEventStarted(u27) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    u27.desertSandstormMaid:DoCleaning()
    u27.desertSandstormMaid:GiveTask(u27:setDesertSandstormEnvironment(true))
    u27:applySpeedReduction()
    u27.dynamicWeatherEventMaid:GiveTask(u2(function(p28, _) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u27
        --]]
        if p28 == u6.LocalPlayer then
            task.delay(1, function() --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                if u27.weatherEventIsActive then
                    u27:applySpeedReduction()
                end
            end)
        end
    end))
end
function u12.onDynamicEventEnded(p29) --[[ Line: 87 ]]
    p29.desertSandstormMaid:DoCleaning()
    p29.desertSandstormMaid:GiveTask(p29:setDesertSandstormEnvironment(false))
end
function u12.applySpeedReduction(p30) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v31 = u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0.8
    })
    p30.desertSandstormMaid:GiveTask(v31)
end
function u12.setDesertSandstormEnvironment(u32, u33) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u7
        [4] = u4
    --]]
    local v34 = u5.new()
    local u35 = u3.Controllers.LightingController:getAtmosphere()
    if not u35 then
        return v34
    end
    if u33 then
        u32.lastAtmosphereDensity = u35.Density
    end
    local u40 = u7(3, u4, function(p36) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u32
            [3] = u35
        --]]
        if not u33 then
            p36 = 1 - p36
        end
        local v37 = math
        local v38 = u32.lastAtmosphereDensity
        local v39 = v38 == nil and 0 or v38
        u35.Density = v37.lerp(v39, 0.6, p36)
    end)
    v34:GiveTask(function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        if u40.Running then
            u40:Cancel()
        end
    end)
    return v34
end
u3.CreateController(u12.new())
return nil