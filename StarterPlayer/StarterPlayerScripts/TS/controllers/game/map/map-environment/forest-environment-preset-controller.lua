local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local u8 = v1.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "ForestEnvironmentPresetController"
    end,
    ["__index"] = u8
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u5
    --]]
    local v13 = u8.constructor
    local v14 = u7.Forest
    local v15 = {
        ["ColorCorrectionEffect"] = {
            ["TintColor"] = Color3.fromRGB(243, 255, 247)
        }
    }
    local v16 = {
        {
            ["ambientSoundName"] = u6.WIND_AMBIENCE
        }
    }
    local v17 = u5.Blue
    local v18 = {
        ["sounds"] = {
            {
                ["volumeMultiplier"] = 0.4,
                ["soundId"] = u6.LOBBY_MUSIC_FOREST
            }
        }
    }
    v13(p12, v14, v15, v16, v17, v18)
    p12.Name = "ForestEnvironmentPresetController"
end
function u9.KnitStart(p19) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p19)
end
function u9.onEnable(_) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u4
    --]]
    local v20 = {
        ["looped"] = true,
        ["volumeMultiplier"] = 1.5,
        ["parent"] = u4
    }
    u2:playSound(u6.FOREST_AMBIENCE, v20)
end
function u9.onIntensityChanged(p21, p22) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not p21.weatherIntensityInitialized then
        u3.Controllers.WindWeatherParticleController:enable(p22)
        p21.maid:GiveTask(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3.Controllers.WindWeatherParticleController:disable()
        end)
    end
    u3.Controllers.WindWeatherParticleController:setIntensity(p22)
end
function u9.onDynamicEventStarted(_) --[[ Line: 60 ]] end
function u9.onDynamicEventEnded(_) --[[ Line: 62 ]] end
u3.CreateController(u9.new())
return nil