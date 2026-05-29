local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxTextureMeta
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "SkyboxController"
    end,
    ["__index"] = u3
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
        [1] = u3
    --]]
    u3.constructor(p8)
    p8.Name = "SkyboxController"
end
function u5.KnitStart(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p9)
end
function u5.setSkybox(p10, p11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    if p10.currentSkyboxModifier then
        p10.currentSkyboxModifier:Destroy()
        p10.currentSkyboxModifier = nil
    end
    local v12 = u4[p11]
    p10.currentSkyboxModifier = u2.Controllers.LightingController.skyModifier:addModifier(10, {
        ["CelestialBodiesShown"] = false,
        ["SkyboxBk"] = v12.backTexture,
        ["SkyboxDn"] = v12.downTexture,
        ["SkyboxFt"] = v12.frontTexture,
        ["SkyboxLf"] = v12.leftTexture,
        ["SkyboxRt"] = v12.rightTexture,
        ["SkyboxUp"] = v12.upTexture
    })
    return p10.currentSkyboxModifier
end
function u5.clearSkybox(p13) --[[ Line: 46 ]]
    if p13.currentSkyboxModifier then
        p13.currentSkyboxModifier:Destroy()
        p13.currentSkyboxModifier = nil
    end
end
u2.CreateController(u5.new())
return nil