-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local MaterialService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").MaterialService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClanHqSkyboxType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqSkyboxType;
local LobbyEnvironment = RuntimeLib.import(script, script.Parent, "environments", "lobby-environment").LobbyEnvironment;
local VoidLobbyEnvironment = RuntimeLib.import(script, script.Parent, "environments", "void-lobby-environment").VoidLobbyEnvironment;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "LobbyLightingController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "LobbyLightingController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), KnitClient (copy), LobbyEnvironment (copy)
    KnitController.KnitStart(p4);
    KnitClient.Controllers.EnvironmentController:setupEnvironment(LobbyEnvironment);
    p4:setupDefaultMaterials();
end;

function u1.setupEnvironment(p5, p6) -- Line: 32
    -- upvalues: KnitClient (copy), ClanHqSkyboxType (copy), VoidLobbyEnvironment (copy), LobbyEnvironment (copy)
    KnitClient.Controllers.EnvironmentController:cleanupEnvironment();

    if p6 == ClanHqSkyboxType.VOID_SKYBOX then
        KnitClient.Controllers.EnvironmentController:setupEnvironment(VoidLobbyEnvironment);
        p5:setupDefaultMaterials();

        return;
    end;

    local _ = p6 == ClanHqSkyboxType.DEFAULT;
    KnitClient.Controllers.EnvironmentController:setupEnvironment(LobbyEnvironment);
    p5:setupDefaultMaterials();
end;

function u1.setupDefaultMaterials(p7) -- Line: 48
    -- upvalues: MaterialService (copy)
    MaterialService:SetBaseMaterialOverride(Enum.Material.Ground, "Ground V2");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Ground, "Groundconcrete");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Concrete, "TilesStylized");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Concrete, "M Clay");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Wood, "M Wood");
    MaterialService:SetBaseMaterialOverride(Enum.Material.LeafyGrass, "Leaf Stylized");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Glacier, "SnowMaterialnew");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Sand, "SandPixel");
    MaterialService:SetBaseMaterialOverride(Enum.Material.Limestone, "SandstoneStylized");
end;

KnitClient.CreateController(u1.new());

return nil;