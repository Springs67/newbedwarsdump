-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MathExtras = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutBack = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutBack;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v2.Lighting;
local Players = v2.Players;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "LobbyLightingChangeSectionController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy), Lighting (copy)
    KnitController.constructor(p5);
    p5.Name = "LobbyLightingChangeSectionController";
    p5.environmentChangeSections = {};
    p5.isTouchingEnvironmentChangeSection = false;
    p5.initialClockTime = Lighting.ClockTime;
    p5.sunRayRef = Lighting:FindFirstChildOfClass("SunRaysEffect");
    local v6 = Lighting:FindFirstChildOfClass("SunRaysEffect");

    if v6 ~= nil then
        v6 = v6.Intensity;
    end;

    p5.initialSunRayIntensity = v6;
    p5.darkColorCorrectionProperties = {
        TintColor = Color3.fromRGB(227, 196, 173)
    };
    p5.transitionTime = 10;
    p5.nightClockTime = 18.6;
end;

function u3.KnitStart(p7) -- Line: 48
    -- upvalues: PlaceUtil (copy), RunService (copy), Players (copy)
    PlaceUtil.isLobbyServer();

    return nil;
end;

function u3.setupEnvironmentChangeSections(u8) -- Line: 106
    -- upvalues: Workspace (copy), Players (copy)
    local v9 = Workspace:WaitForChild("Lobby"):WaitForChild("LightingChangeSections"):GetChildren();

    local function v12(p10) -- Line: 109
        -- upvalues: u8 (copy), Players (ref)
        if not p10:IsA("Part") then
            return nil;
        end;

        if not p10 then
            return nil;
        end;

        p10.Transparency = 1;
        table.insert(u8.environmentChangeSections, p10);
        p10.Touched:Connect(function(p11) -- Line: 122
            -- upvalues: Players (ref), u8 (ref)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not Character then
                return nil;
            end;

            if p11 ~= Character then
                return nil;
            end;

            if not u8.isTouchingEnvironmentChangeSection then
                u8:setCurrentLightingSection(true);
            end;
        end);
    end;

    for i, v in v9 do
        v12(v, i - 1, v9);
    end;
end;

function u3.setCurrentLightingSection(u13, p14) -- Line: 143
    -- upvalues: Lighting (copy), default (copy), OutBack (copy), MathExtras (copy)
    u13.isTouchingEnvironmentChangeSection = p14;

    if u13.currentColorCorrectionTween then
        u13.currentColorCorrectionTween:Cancel();
    end;

    u13:getColorCorrectionProperties();
    local ClockTime = Lighting.ClockTime;

    if p14 then
        local _ = u13.darkColorCorrectionProperties;
        local nightClockTime = u13.nightClockTime;
        u13.currentColorCorrectionTween = default(u13.transitionTime, OutBack, function(p15) -- Line: 158
            -- upvalues: Lighting (ref), MathExtras (ref), ClockTime (copy), nightClockTime (copy), u13 (copy)
            Lighting.ClockTime = MathExtras:lerp(ClockTime, nightClockTime, p15);
            local v16 = u13.sunRayRef and u13.initialSunRayIntensity;

            if v16 ~= 0 and (v16 == v16 and v16) then
                u13.sunRayRef.Intensity = MathExtras:lerp(u13.initialSunRayIntensity, 0, p15);
            end;
        end, 0, 1);

        return;
    end;

    local _ = u13.initialColorCorrectionProperties;
    local initialClockTime = u13.initialClockTime;
    u13.currentColorCorrectionTween = default(u13.transitionTime, OutBack, function(p17) -- Line: 190
        -- upvalues: Lighting (ref), MathExtras (ref), ClockTime (copy), initialClockTime (copy), u13 (copy)
        Lighting.ClockTime = MathExtras:lerp(ClockTime, initialClockTime, p17);
        local v18 = u13.sunRayRef and u13.initialSunRayIntensity;

        if v18 ~= 0 and (v18 == v18 and v18) then
            u13.sunRayRef.Intensity = MathExtras:lerp(0, u13.initialSunRayIntensity, p17);
        end;
    end, 0, 1);
end;

function u3.getColorCorrectionRef(p19) -- Line: 218
    -- upvalues: Lighting (copy), u1 (copy)
    return Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or u1("ColorCorrectionEffect", {
        Brightness = 0.05,
        Contrast = 0.1,
        Enabled = true,
        Saturation = 0.2,
        TintColor = Color3.fromRGB(255, 255, 255)
    });
end;

function u3.getColorCorrectionProperties(p20) -- Line: 227
    local v21 = p20:getColorCorrectionRef();

    return {
        Brightness = v21.Brightness,
        Contrast = v21.Contrast,
        Enabled = v21.Enabled,
        Saturation = v21.Saturation,
        TintColor = v21.TintColor
    };
end;

function u3.setColorCorrectionProperties(p22, p23) -- Line: 237
    local v24 = p22:getColorCorrectionRef();
    local Brightness = p23.Brightness;

    if Brightness ~= 0 and (Brightness == Brightness and Brightness) then
        v24.Brightness = p23.Brightness;
    end;

    local Contrast = p23.Contrast;

    if Contrast ~= 0 and (Contrast == Contrast and Contrast) then
        v24.Contrast = p23.Contrast;
    end;

    if p23.Enabled then
        v24.Enabled = p23.Enabled;
    end;

    local Saturation = p23.Saturation;

    if Saturation ~= 0 and (Saturation == Saturation and Saturation) then
        v24.Saturation = p23.Saturation;
    end;

    if p23.TintColor then
        v24.TintColor = p23.TintColor;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;