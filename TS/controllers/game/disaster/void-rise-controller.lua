-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v3.InQuad;
local Linear = v3.Linear;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "VoidRiseController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 31
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "VoidRiseController";
end;

function u6.KnitStart(p9) -- Line: 39
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), default (copy), InQuad (copy), u4 (copy), Workspace (copy), GameQueryUtil (copy), Linear (copy), Lighting (copy), RunService (copy)
    KnitController.KnitStart(p9);
    default2.Client:GetNamespace("Disaster"):OnEvent("VoidRise", function(p10) -- Line: 41
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient2 (ref), default (ref), InQuad (ref), u4 (ref), Workspace (ref), GameQueryUtil (ref), Linear (ref), Lighting (ref), RunService (ref)
        local u11 = SoundManager:playSound(GameSound.RAVEN_SPACE_AMBIENT, {
            volumeMultiplier = 0,
            looped = true
        });
        SoundManager:tweenSoundVolume(u11, 0.3, 1);
        local u12 = KnitClient2.Controllers.LightingController:getAtmosphereModifier():addModifier(30, {
            Density = 0,
            Haze = 0,
            Color = Color3.fromRGB(0, 0, 0)
        });
        default(2, InQuad, function(p13) -- Line: 52
            -- upvalues: u12 (copy)
            local v14 = {};

            for i, v in u12:getProperties() do
                v14[i] = v;
            end;

            v14.Haze = p13 * 2;
            u12:setProperties(v14);
        end, 0, 1);
        local u15 = u4("Part", {
            Anchored = true,
            Size = Vector3.new(2000, 2, 2000),
            CanCollide = false,
            Reflectance = -1,
            CastShadow = false,
            Position = Vector3.new(0, p10.startingLevel, 0),
            Color = Color3.fromRGB(0, 0, 0),
            TopSurface = Enum.SurfaceType.Smooth,
            BottomSurface = Enum.SurfaceType.Smooth,
            Parent = Workspace
        });
        GameQueryUtil:setQueryIgnored(u15, true);
        local u17 = default((p10.endTime - Workspace:GetServerTimeNow()) * 0.9, Linear, function(p16) -- Line: 74
            -- upvalues: u15 (copy)
            u15.Position = Vector3.new(0, p16, 0);
        end, p10.startingLevel, p10.endLevel);
        local u18 = u4("ColorCorrectionEffect", {
            Parent = Lighting
        });
        local u21 = RunService.Heartbeat:Connect(function() -- Line: 80
            -- upvalues: Workspace (ref), u15 (copy), u18 (copy), u12 (copy)
            if Workspace.CurrentCamera.CFrame.Position.Y < u15.Position.Y then
                u18.Saturation = -0.8;
                u18.TintColor = Color3.fromRGB(83, 83, 83);
                local v19 = {};

                for i, v in u12:getProperties() do
                    v19[i] = v;
                end;

                v19.Density = 0.9;
                u12:setProperties(v19);

                return;
            end;

            u18.Saturation = 0;
            u18.TintColor = Color3.fromRGB(255, 255, 255);
            local v20 = {};

            for i, v in u12:getProperties() do
                v20[i] = v;
            end;

            v20.Density = 0.1;
            u12:setProperties(v20);
        end);
        task.delay(p10.endTime - Workspace:GetServerTimeNow(), function() -- Line: 103
            -- upvalues: u12 (copy), u17 (copy), u15 (copy), u11 (copy), u21 (copy), u18 (copy)
            u12:destroy();
            u17:Cancel();
            u15:Destroy();
            u11:Destroy();
            u21:Disconnect();
            u18:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;