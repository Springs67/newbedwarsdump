local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Lighting
local u5 = v3.SoundService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local u9 = v1.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "CaveEnvironmentPresetController"
    end,
    ["__index"] = u9
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u7
        [4] = u6
    --]]
    local v14 = u9.constructor
    local v15 = u8.Cave
    local v16 = {
        ["ColorCorrectionEffect"] = {
            ["TintColor"] = Color3.fromRGB(247, 247, 255)
        },
        ["Lighting"] = {
            ["FogEnd"] = 2000,
            ["FogStart"] = 30,
            ["FogColor"] = Color3.fromRGB(255, 255, 255)
        }
    }
    v14(p13, v15, v16, {
        {
            ["ambientSoundName"] = u7.CAVE_AMBIENCE
        }
    }, u6.Night)
    p13.Name = "CaveEnvironmentPresetController"
end
function u10.KnitStart(p17) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p17)
end
function u10.onEnable(_) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v18 = u4:WaitForChild("Atmosphere")
    if v18 ~= nil then
        v18:Destroy()
    end
    u5.AmbientReverb = Enum.ReverbType.Cave
end
function u10.onIntensityChanged(_, _) --[[ Line: 50 ]] end
function u10.onDynamicEventStarted(_) --[[ Line: 52 ]] end
function u10.onDynamicEventEnded(_) --[[ Line: 54 ]] end
v2.CreateController(u10.new())
return nil