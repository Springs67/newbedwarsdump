local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "VoidWorldLightingController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.constructor(p11)
    p11.Name = "VoidWorldLightingController"
    p11.lightingMaid = u5.new()
end
function u8.KnitStart(u12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u7
    --]]
    u6.KnitStart(u12)
    u3.Controllers.WorldController:watchLocalWorld(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
        --]]
        if p13 ~= nil then
            p13 = p13.Name
        end
        if p13 == u7.VOID_WORLD then
            for _, v14 in u12:applyVoidLighting() do
                u12.lightingMaid:GiveTask(v14)
            end
        else
            u12.lightingMaid:DoCleaning()
        end
    end)
end
function u8.applyVoidLighting(_) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v15 = {}
    local v16 = u4.Controllers.LightingController.lightingModifier:addModifier(20, {
        ["Brightness"] = 0,
        ["ClockTime"] = 6.3,
        ["ExposureCompensation"] = 0.62,
        ["Ambient"] = Color3.fromRGB(255, 255, 255)
    })
    table.insert(v15, v16)
    local v17 = u4.Controllers.LightingController.atmosphereModifier
    if v17 ~= nil then
        v17 = v17:addModifier(20, {
            ["Density"] = 0.45,
            ["Offset"] = 0,
            ["Glare"] = 0,
            ["Haze"] = 0,
            ["Color"] = Color3.fromRGB(193, 193, 193)
        })
    end
    if v17 then
        table.insert(v15, v17)
    end
    local v18 = u4.Controllers.LightingController.sunRayModifier:addModifier(20, {
        ["Intensity"] = 0.005
    })
    table.insert(v15, v18)
    local v19 = u4.Controllers.LightingController.skyModifier:addModifier(20, {
        ["SkyboxBk"] = "rbxassetid://9851144466",
        ["SkyboxDn"] = "rbxassetid://9851144249",
        ["SkyboxFt"] = "rbxassetid://9851144099",
        ["SkyboxLf"] = "rbxassetid://9851143942",
        ["SkyboxRt"] = "rbxassetid://9851143761",
        ["SkyboxUp"] = "rbxassetid://9851143257",
        ["CelestialBodiesShown"] = false,
        ["StarCount"] = 3000
    })
    table.insert(v15, v19)
    return v15
end
u3.CreateController(u8.new())
return nil