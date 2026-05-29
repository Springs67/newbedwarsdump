local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent, "base-weather-particle-controller").BaseWeatherParticleController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "RainWeatherParticleController"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    u4.constructor(p8, {
        ["rateMin"] = 60,
        ["rateMax"] = 180,
        ["followOffset"] = Vector3.new(0, 100, 0),
        ["particleDistance"] = 150,
        ["weatherAsset"] = u3.Assets.Effects.RainParticlePart,
        ["speedMinRange"] = NumberRange.new(160, 170),
        ["speedMaxRange"] = NumberRange.new(200, 210)
    })
    p8.Name = "RainWeatherParticleController"
end
function u5.KnitStart(p9) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p9)
end
function u5.onEnable(_) --[[ Line: 35 ]] end
v2.CreateController(u5.new())
return nil