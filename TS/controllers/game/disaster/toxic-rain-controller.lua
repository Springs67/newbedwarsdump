-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v3.Lighting;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "rain");
local DisasterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-type").DisasterType;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "ToxicRainController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "ToxicRainController";
end;

function u5.KnitStart(p8) -- Line: 34
    -- upvalues: KnitController (copy), Workspace (copy), GameQueryUtil (copy), ClientSyncEvents (copy), default (copy), DisasterType (copy), u4 (copy), u2 (copy), Lighting (copy), KnitClient2 (copy)
    KnitController.KnitStart(p8);
    Workspace.CurrentCamera.ChildAdded:Connect(function(p9) -- Line: 36
        -- upvalues: GameQueryUtil (ref)
        if p9.Name == "__RainEmitter" and p9:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(p9, true);
        end;
    end);
    ClientSyncEvents.DisasterBegan:connect(function(p10) -- Line: 41
        -- upvalues: default (ref), DisasterType (ref), u4 (ref), Workspace (ref), GameQueryUtil (ref), u2 (ref), Lighting (ref), KnitClient2 (ref)
        default.Debug("Received on the client");

        if p10.disasterType == DisasterType.TOXIC_RAIN then
            u4:Enable();
            u4:SetColor(Color3.fromRGB(0, 255, 0));
            u4:SetIntensityRatio(0.5);
            u4:SetSoundId("rbxassetid://9112794264");
            local __RainEmitter = Workspace.CurrentCamera:FindFirstChild("__RainEmitter");

            if __RainEmitter then
                GameQueryUtil:setQueryIgnored(__RainEmitter, true);
            end;

            local u11 = u2("Clouds", {
                Cover = 0.9,
                Density = 1,
                Color = Color3.fromRGB(50, 32, 32),
                Parent = Workspace.Terrain
            });
            local u12 = u2("ColorCorrectionEffect", {
                Brightness = -0.02,
                TintColor = Color3.fromRGB(224, 221, 255),
                Parent = Lighting
            });
            local u13 = KnitClient2.Controllers.LightingController.lightingModifier:addModifier(60, {
                Ambient = Color3.fromRGB(81, 68, 149),
                OutdoorAmbient = Color3.fromRGB(110, 138, 198)
            });
            local u14 = KnitClient2.Controllers.LightingController:getAtmosphereModifier():addModifier(60, {
                Density = 0.52,
                Offset = 0,
                Glare = 0,
                Haze = 10,
                Color = Color3.fromRGB(71, 216, 95),
                Decay = Color3.fromRGB(0, 0, 0)
            });
            task.delay(p10.endTime - Workspace:GetServerTimeNow(), function() -- Line: 75
                -- upvalues: u4 (ref), u12 (copy), u11 (copy), u13 (copy), u14 (copy)
                u4:Disable();
                u12:Destroy();
                u11:Destroy();
                u13:destroy();
                u14:destroy();
            end);
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;