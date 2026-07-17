-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SkyboxTextureMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxTextureMeta;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "SkyboxController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "SkyboxController";
end;

function u1.KnitStart(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.setSkybox(p5, p6) -- Line: 27
    -- upvalues: SkyboxTextureMeta (copy), KnitClient (copy)
    if p5.currentSkyboxModifier then
        p5.currentSkyboxModifier:Destroy();
        p5.currentSkyboxModifier = nil;
    end;

    local v7 = SkyboxTextureMeta[p6];
    p5.currentSkyboxModifier = KnitClient.Controllers.LightingController.skyModifier:addModifier(10, {
        CelestialBodiesShown = false,
        SkyboxBk = v7.backTexture,
        SkyboxDn = v7.downTexture,
        SkyboxFt = v7.frontTexture,
        SkyboxLf = v7.leftTexture,
        SkyboxRt = v7.rightTexture,
        SkyboxUp = v7.upTexture
    });

    return p5.currentSkyboxModifier;
end;

function u1.clearSkybox(p8) -- Line: 46
    if p8.currentSkyboxModifier then
        p8.currentSkyboxModifier:Destroy();
        p8.currentSkyboxModifier = nil;
    end;
end;

KnitClient.CreateController(u1.new());

return nil;