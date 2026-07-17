-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local WorldId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "VoidWorldLightingController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p5);
    p5.Name = "VoidWorldLightingController";
    p5.lightingMaid = u2.new();
end;

function u3.KnitStart(u6) -- Line: 28
    -- upvalues: KnitController (copy), KnitClient (copy), WorldId (copy)
    KnitController.KnitStart(u6);
    KnitClient.Controllers.WorldController:watchLocalWorld(function(p7) -- Line: 30
        -- upvalues: WorldId (ref), u6 (copy)
        if p7 ~= nil then
            p7 = p7.Name;
        end;

        if p7 == WorldId.VOID_WORLD then
            for _, v in u6:applyVoidLighting() do
                u6.lightingMaid:GiveTask(v);
            end;

            return;
        end;

        u6.lightingMaid:DoCleaning();
    end);
end;

function u3.applyVoidLighting(p8) -- Line: 44
    -- upvalues: KnitClient2 (copy)
    local v9 = {};
    local v10 = KnitClient2.Controllers.LightingController.lightingModifier:addModifier(20, {
        Brightness = 0,
        ClockTime = 6.3,
        ExposureCompensation = 0.62,
        Ambient = Color3.fromRGB(255, 255, 255)
    });
    table.insert(v9, v10);
    local atmosphereModifier = KnitClient2.Controllers.LightingController.atmosphereModifier;

    if atmosphereModifier ~= nil then
        atmosphereModifier = atmosphereModifier:addModifier(20, {
            Density = 0.45,
            Offset = 0,
            Glare = 0,
            Haze = 0,
            Color = Color3.fromRGB(193, 193, 193)
        });
    end;

    if atmosphereModifier then
        table.insert(v9, atmosphereModifier);
    end;

    local v11 = KnitClient2.Controllers.LightingController.sunRayModifier:addModifier(20, {
        Intensity = 0.005
    });
    table.insert(v9, v11);
    local v12 = KnitClient2.Controllers.LightingController.skyModifier:addModifier(
        20,
        {
            SkyboxBk = "rbxassetid://9851144466",
            SkyboxDn = "rbxassetid://9851144249",
            SkyboxFt = "rbxassetid://9851144099",
            SkyboxLf = "rbxassetid://9851143942",
            SkyboxRt = "rbxassetid://9851143761",
            SkyboxUp = "rbxassetid://9851143257",
            CelestialBodiesShown = false,
            StarCount = 3000
        }
    );
    table.insert(v9, v12);

    return v9;
end;

KnitClient.CreateController(u3.new());

return nil;