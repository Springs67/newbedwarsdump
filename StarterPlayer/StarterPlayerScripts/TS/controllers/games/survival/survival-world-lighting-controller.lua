local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting
local u7 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "SurvivalWorldLightingController"
    end,
    ["__index"] = u7
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
        [1] = u7
        [2] = u8
        [3] = u5
    --]]
    u7.constructor(p12, { u8.SURVIVAL })
    p12.Name = "SurvivalWorldLightingController"
    p12.lightingMaid = u5.new()
end
function u9.onGameInit(_) --[[ Line: 29 ]] end
function u9.applyVoidLighting(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    local v13 = {}
    local v14 = u4.Controllers.LightingController.lightingModifier:addModifier(20, {
        ["Brightness"] = 3,
        ["ClockTime"] = 14.5,
        ["ExposureCompensation"] = 0,
        ["Ambient"] = Color3.fromRGB(70, 70, 70)
    })
    table.insert(v13, v14)
    local v15 = u4.Controllers.LightingController.atmosphereModifier
    if v15 ~= nil then
        v15 = v15:addModifier(20, {
            ["Density"] = 0.3,
            ["Offset"] = 0.25,
            ["Glare"] = 0,
            ["Haze"] = 0,
            ["Color"] = Color3.fromRGB(199, 199, 199),
            ["Decay"] = Color3.fromRGB(106, 112, 125)
        })
    end
    if v15 then
        table.insert(v13, v15)
    end
    local v16 = u4.Controllers.LightingController.sunRayModifier:addModifier(20, {
        ["Intensity"] = 0.005
    })
    table.insert(v13, v16)
    u6:WaitForChild("Sky"):Destroy()
    return v13
end
v3.CreateController(u9.new())
return nil