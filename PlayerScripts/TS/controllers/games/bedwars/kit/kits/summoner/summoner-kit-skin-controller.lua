-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local PartEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-effect-util").PartEffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SummonerKitSkinController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SummonerKitSkinController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), WatchCharacter (copy), KnitClient2 (copy), PartEffectUtil (copy)
    KnitController.KnitStart(u5);
    WatchCharacter(function(u6, u7, p8) -- Line: 33
        -- upvalues: KnitClient2 (ref), u5 (copy), PartEffectUtil (ref)
        if not KnitClient2.Controllers.KitSkinController:isUsingKitSkinModel(u6) then
            return nil;
        end;

        if not u5:isPrismaticSkin(u6) then
            p8:GiveTask(u7:GetAttributeChangedSignal("KitSkin"):Connect(function(p9) -- Line: 38
                -- upvalues: u5 (ref), u6 (copy), u7 (copy), PartEffectUtil (ref)
                if u5:isPrismaticSkin(u6) then
                    local v10 = u5:getPrismaticParts(u7);
                    PartEffectUtil.applyRGB(v10);
                end;
            end));

            return nil;
        end;

        local v11 = u5:getPrismaticParts(u7);
        p8:GiveTask(PartEffectUtil.applyRGB(v11));
    end);
end;

function u2.getPrismaticParts(p12, p13) -- Line: 50
    return {
        p13:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("hair"),
        p13:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("eye"),
        p13:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("detail"),
        p13:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("transparent"),
        p13:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("transparent"):WaitForChild("ParticleEmitter"),
        p13:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("transparent"):WaitForChild("ParticleEmitter2"),
        p13:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("purple"),
        p13:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("purple")
    };
end;

function u2.isPrismaticSkin(p14, p15) -- Line: 54
    -- upvalues: KnitClient (copy), isUsingKit (copy), BedwarsKit (copy), BedwarsKitSkin (copy)
    local Character = p15.Character;

    if not Character then
        return false;
    end;

    local v16 = KnitClient.Controllers.KitController:getKitSkin(Character);
    KnitClient.Controllers.KitController:getActiveKits(p15);
    local v17 = isUsingKit(p15, BedwarsKit.SUMMONER) and v16 == BedwarsKitSkin.PRISMATIC_KAIDA;

    return v17;
end;

function u2.applyClawRGB(p18, p19) -- Line: 63
    -- upvalues: PartEffectUtil (copy)
    local dragon_claw_mesh = p19:WaitForChild("dragon_claw_mesh");
    local Portal1 = p19:FindFirstChild("Portal1");

    if Portal1 ~= nil then
        Portal1 = Portal1:WaitForChild("Ring1"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal12 = p19:FindFirstChild("Portal1");

    if Portal12 ~= nil then
        Portal12 = Portal12:WaitForChild("Ring2"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal13 = p19:FindFirstChild("Portal1");

    if Portal13 ~= nil then
        Portal13 = Portal13:WaitForChild("Ring3"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal14 = p19:FindFirstChild("Portal1");

    if Portal14 ~= nil then
        Portal14 = Portal14:WaitForChild("PortalBottom"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal15 = p19:FindFirstChild("Portal1");

    if Portal15 ~= nil then
        Portal15 = Portal15:WaitForChild("PortalTop"):WaitForChild("PortalWhite"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal16 = p19:FindFirstChild("Portal1");

    if Portal16 ~= nil then
        Portal16 = Portal16:WaitForChild("PortalTop"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Logo = p19:WaitForChild("Portal2"):WaitForChild("Ring1"):WaitForChild("UI"):WaitForChild("Logo");
    local Logo2 = p19:WaitForChild("Portal2"):WaitForChild("Ring2"):WaitForChild("UI"):WaitForChild("Logo");
    local Logo3 = p19:WaitForChild("Portal2"):WaitForChild("Ring3"):WaitForChild("UI"):WaitForChild("Logo");
    local Portal2 = p19:FindFirstChild("Portal2");

    if Portal2 ~= nil then
        Portal2 = Portal2:WaitForChild("PortalBottom"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal22 = p19:FindFirstChild("Portal2");

    if Portal22 ~= nil then
        Portal22 = Portal22:WaitForChild("PortalTop"):WaitForChild("PortalWhite"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    local Portal23 = p19:FindFirstChild("Portal2");

    if Portal23 ~= nil then
        Portal23 = Portal23:WaitForChild("PortalTop"):WaitForChild("UI"):WaitForChild("Logo");
    end;

    return PartEffectUtil.applyRGB({
        dragon_claw_mesh,
        Portal1,
        Portal12,
        Portal13,
        Portal14,
        Portal15,
        Portal16,
        Logo,
        Logo2,
        Logo3,
        Portal2,
        Portal22,
        Portal23
    }, nil, {
        randomizeOrder = true
    });
end;

function u2.applyCircleRGB(p20, p21) -- Line: 109
    -- upvalues: PartEffectUtil (copy)
    local v22 = {
        p21:WaitForChild("Pivot"):WaitForChild("Ring1"):WaitForChild("UI"):WaitForChild("Logo"),
        p21:WaitForChild("Pivot"):WaitForChild("Ring2"):WaitForChild("UI"):WaitForChild("Logo"),
        p21:WaitForChild("Pivot"):WaitForChild("Ring3"):WaitForChild("UI"):WaitForChild("Logo"),
        p21:WaitForChild("Pivot"):WaitForChild("PortalBottom"):WaitForChild("UI"):WaitForChild("Logo"),
        p21:WaitForChild("Pivot"):WaitForChild("PortalTop"):WaitForChild("PortalWhite"):WaitForChild("UI"):WaitForChild("Logo"),
        p21:WaitForChild("Pivot"):WaitForChild("PortalTop"):WaitForChild("UI"):WaitForChild("Logo")
    };

    return PartEffectUtil.applyRGB(v22, nil, {
        randomizeOrder = true
    });
end;

function u2.applyDragonHeadRGB(p23, p24) -- Line: 115
    -- upvalues: PartEffectUtil (copy)
    local v25 = {
        p24:WaitForChild("tendril_glow_mesh"),
        p24:WaitForChild("tendril_hair_glow_mesh"),
        p24:WaitForChild("eye_gem_mesh"),
        p24:WaitForChild("eye_glow_mesh")
    };

    return PartEffectUtil.applyRGB(v25, nil, {
        randomizeOrder = true
    });
end;

KnitClient.CreateController(u2.new());

return nil;