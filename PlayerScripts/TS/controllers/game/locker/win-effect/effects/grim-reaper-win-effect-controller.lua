-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v3.Lighting;
local Players = v3.Players;
local TweenService = v3.TweenService;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "GrimReaperWinEffectController";
    end,

    __index = WinEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: WinEffect (copy), WinEffectType (copy), u2 (copy)
    WinEffect.constructor(p6, WinEffectType.GRIM_REAPER);
    p6.Name = "GrimReaperWinEffectController";
    p6.lightingMaid = u2.new();
    p6.changedEnvironment = false;
end;

function u4.KnitStart(p7) -- Line: 33
    -- upvalues: WinEffect (copy)
    WinEffect.KnitStart(p7);
end;

function u4.onWin(u8, p9) -- Line: 36
    -- upvalues: TweenService (copy), Lighting (copy), Players (copy), KnitClient2 (copy)
    if not u8.changedEnvironment then
        u8.changedEnvironment = true;
        local v10 = TweenService:Create(Lighting, TweenInfo.new(1), {
            Brightness = 10,
            Ambient = Color3.fromRGB(189, 112, 217)
        });
        v10:Play();
        local v11 = Lighting:FindFirstChildOfClass("Atmosphere");

        if v11 then
            TweenService:Create(v11, TweenInfo.new(1), {
                Glare = 0.3,
                Haze = 10,
                Color = Color3.fromRGB(231, 195, 197),
                Decay = Color3.fromRGB(135, 70, 156)
            }):Play();
            u8.lightingMaid:GiveTask(v11);
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if Character then
            KnitClient2.Controllers.ScreenShakeController:shake(Character, Vector3.new(0, -1, 0), {
                zMagnitude = 1,
                magnitude = 1,
                cycles = 30,
                duration = 2
            });
        end;

        v10.Completed:Connect(function() -- Line: 68
            -- upvalues: TweenService (ref), Lighting (ref), u8 (copy), KnitClient2 (ref)
            TweenService:Create(Lighting, TweenInfo.new(1), {
                Brightness = 2,
                Ambient = Color3.fromRGB(112, 20, 232)
            }):Play();
            local v12 = Lighting:FindFirstChildOfClass("Atmosphere");

            if v12 then
                TweenService:Create(v12, TweenInfo.new(1), {
                    Glare = 1,
                    Haze = 2,
                    Color = Color3.fromRGB(231, 195, 197),
                    Decay = Color3.fromRGB(135, 70, 156)
                }):Play();
                u8.lightingMaid:GiveTask(v12);
            end;

            local v13 = KnitClient2.Controllers.LightingController.skyModifier:addModifier(
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
            u8.lightingMaid:GiveTask(v13);
        end);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;