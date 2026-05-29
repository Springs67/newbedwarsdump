local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").MaterialService
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqSkyboxType
local u6 = v1.import(script, script.Parent, "environments", "lobby-environment").LobbyEnvironment
local u7 = v1.import(script, script.Parent, "environments", "void-lobby-environment").VoidLobbyEnvironment
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "LobbyLightingController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p11)
    p11.Name = "LobbyLightingController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u6
    --]]
    u4.KnitStart(p12)
    u2.Controllers.EnvironmentController:setupEnvironment(u6)
    p12:setupDefaultMaterials()
end
function u8.setupEnvironment(p13, p14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u7
        [4] = u6
    --]]
    u2.Controllers.EnvironmentController:cleanupEnvironment()
    if p14 == u5.VOID_SKYBOX then
        u2.Controllers.EnvironmentController:setupEnvironment(u7)
        p13:setupDefaultMaterials()
    else
        local _ = p14 == u5.DEFAULT
        u2.Controllers.EnvironmentController:setupEnvironment(u6)
        p13:setupDefaultMaterials()
    end
end
function u8.setupDefaultMaterials(_) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3:SetBaseMaterialOverride(Enum.Material.Ground, "Ground V2")
    u3:SetBaseMaterialOverride(Enum.Material.Ground, "Groundconcrete")
    u3:SetBaseMaterialOverride(Enum.Material.Concrete, "TilesStylized")
    u3:SetBaseMaterialOverride(Enum.Material.Concrete, "M Clay")
    u3:SetBaseMaterialOverride(Enum.Material.Wood, "M Wood")
    u3:SetBaseMaterialOverride(Enum.Material.LeafyGrass, "Leaf Stylized")
    u3:SetBaseMaterialOverride(Enum.Material.Glacier, "SnowMaterialnew")
    u3:SetBaseMaterialOverride(Enum.Material.Sand, "SandPixel")
    u3:SetBaseMaterialOverride(Enum.Material.Limestone, "SandstoneStylized")
end
u2.CreateController(u8.new())
return nil