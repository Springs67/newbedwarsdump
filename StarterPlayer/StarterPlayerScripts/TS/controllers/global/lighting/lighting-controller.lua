local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GroupModifierBehavior
local u4 = v2.ModifierGroup
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v10 = v1.import(script, script.Parent, "default-lighting-constants")
local u11 = v10.DefaultAtmosphereProperties
local u12 = v10.DefaultLightingProperties
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "LightingController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u7
        [4] = u12
        [5] = u3
        [6] = u6
        [7] = u9
        [8] = u11
    --]]
    u8.constructor(p16)
    p16.Name = "LightingController"
    p16.lightingModifier = u4.new(u7, {
        ["baseProperties"] = u12,
        ["behavior"] = u3.Merge
    })
    p16.sunRayModifier = u4.new(u7:FindFirstChildOfClass("SunRaysEffect") or u6("SunRaysEffect", {
        ["Parent"] = u7
    }), {
        ["baseProperties"] = {
            ["Intensity"] = 0.04,
            ["Spread"] = 1
        },
        ["behavior"] = u3.Merge
    })
    p16.skyModifier = u4.new(u7:FindFirstChildOfClass("Sky") or u6("Sky", {
        ["Parent"] = u7
    }), {
        ["baseProperties"] = {
            ["CelestialBodiesShown"] = false,
            ["StarCount"] = 0,
            ["SkyboxBk"] = "rbxassetid://13839120191",
            ["SkyboxDn"] = "rbxassetid://13839122265",
            ["SkyboxFt"] = "rbxassetid://13839117957",
            ["SkyboxLf"] = "rbxassetid://13839116551",
            ["SkyboxRt"] = "rbxassetid://13839097493",
            ["SkyboxUp"] = "rbxassetid://13839112995"
        },
        ["behavior"] = u3.Merge
    })
    p16.colorCorrectionModifier = u4.new(u7:FindFirstChildOfClass("ColorCorrectionEffect") or u6("ColorCorrectionEffect", {
        ["Parent"] = u7
    }), {
        ["baseProperties"] = {
            ["Contrast"] = 0.05,
            ["Saturation"] = 0,
            ["TintColor"] = Color3.fromRGB(255, 255, 255)
        },
        ["behavior"] = u3.Merge
    })
    if not u9.isLobbyServer() then
        p16.atmosphereModifier = u4.new(u7:FindFirstChildOfClass("Atmosphere") or u6("Atmosphere", {
            ["Parent"] = u7
        }), {
            ["baseProperties"] = u11,
            ["behavior"] = u3.Merge
        })
    end
end
function u13.KnitStart(p17) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p17)
end
function u13.getAtmosphereModifier(p18) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u6
        [4] = u11
        [5] = u3
    --]]
    if not p18.atmosphereModifier then
        p18.atmosphereModifier = u4.new(u7:FindFirstChildOfClass("Atmosphere") or u6("Atmosphere", {
            ["Parent"] = u7
        }), {
            ["baseProperties"] = u11,
            ["behavior"] = u3.Merge
        })
    end
    return p18.atmosphereModifier
end
function u13.getAtmosphere(_) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    return u7:FindFirstChildOfClass("Atmosphere") or u6("Atmosphere", {
        ["Parent"] = u7
    })
end
v5.CreateController(u13.new())
return nil