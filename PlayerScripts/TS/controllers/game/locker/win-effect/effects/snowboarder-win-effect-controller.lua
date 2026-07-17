-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local SkyboxId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local _ = {
    Color3.fromRGB(20, 232, 30),
    Color3.fromRGB(0, 234, 141),
    Color3.fromRGB(1, 126, 213),
    Color3.fromRGB(181, 61, 255),
    Color3.fromRGB(141, 0, 196)
};
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "AuroraWinEffectController";
    end,

    __index = WinEffect
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: WinEffect (copy), WinEffectType (copy)
    WinEffect.constructor(p4, WinEffectType.SNOWBOARDER);
    p4.Name = "AuroraWinEffectController";
    p4.active = true;
end;

function u2.KnitStart(p5) -- Line: 36
    -- upvalues: WinEffect (copy)
    WinEffect.KnitStart(p5);
end;

function u2.onWin(p6, u7) -- Line: 39
    -- upvalues: Players (copy), CollectionService (copy)
    if u7 == Players.LocalPlayer then
        p6:applyEnvironment();
    end;

    local function _(p8) -- Line: 44
        -- upvalues: u7 (copy)
        return p8.Name == u7.Name;
    end;

    local v9 = nil;

    for i, v in CollectionService:GetTagged("SnowboardClone") do
        local _ = i - 1;

        if v.Name == u7.Name == true then
            v9 = v;
            break;
        end;
    end;

    if v9 then
        p6:applyCharacterEffects(v9);
    end;
end;

function u2.applyEnvironment(p10) -- Line: 61
    -- upvalues: KnitClient (copy), SkyboxId (copy), SoundManager (copy), GameSound (copy)
    KnitClient.Controllers.SkyboxController:setSkybox(SkyboxId.NorthernLights);
    KnitClient.Controllers.SnowWeatherParticleController:enable(1);
    KnitClient.Controllers.BackgroundMusicController:stopMusic();
    KnitClient.Controllers.GameMusicController:disableAutoplayer();
    SoundManager:playSound(GameSound.CHRISTMAS_MUSIC, {
        looped = true
    });
    p10:spawnAurora();
end;

function u2.applyCharacterEffects(p11, p12) -- Line: 75
    -- upvalues: ReplicatedStorage (copy)
    ReplicatedStorage.Assets.Effects.AuroraBlast.aurora:Clone().Parent = p12;
end;

function u2.spawnAurora(u13) -- Line: 79
    -- upvalues: ReplicatedStorage (copy), KnitClient (copy), Workspace (copy), default (copy), Linear (copy)
    local u14 = Random.new();
    local v15 = ReplicatedStorage.Assets.Effects.AuroraBorealis:Clone();
    local v16 = KnitClient.Controllers.MapController:getCFrame("center"):expect();

    if not v16 then
        return nil;
    end;

    local Position = v16.Position;
    local v17 = u14:NextNumber(-75, 75);
    local v18 = u14:NextNumber(30, 125);
    local v19 = Vector3.new(v17, v18, u14:NextNumber(-75, 75));
    v15:PivotTo(CFrame.new(Position + v19) * CFrame.Angles(0, u14:NextNumber(-180, 180), 0));
    v15.Parent = Workspace;
    local v20 = v15:GetDescendants();

    local function v30(u21) -- Line: 96
        -- upvalues: default (ref), Linear (ref), u14 (copy), u13 (copy)
        if not u21:IsA("Beam") then
            return nil;
        end;

        local function _() -- Line: 100
            -- upvalues: default (ref), Linear (ref), u21 (copy), u14 (ref)
            local v23 = default(5, Linear, function(p22) -- Line: 101
                -- upvalues: u21 (ref)
                u21.CurveSize0 = p22;
            end, u21.CurveSize0, u14:NextNumber(400, 600));
            v23:Play();

            return v23;
        end;

        local function _() -- Line: 107
            -- upvalues: default (ref), Linear (ref), u21 (copy), u14 (ref)
            local v25 = default(5, Linear, function(p24) -- Line: 108
                -- upvalues: u21 (ref)
                u21.CurveSize1 = p24;
            end, u21.CurveSize1, u14:NextNumber(150, 350));
            v25:Play();

            return v25;
        end;

        task.spawn(function() -- Line: 114
            -- upvalues: u13 (ref), default (ref), Linear (ref), u21 (copy), u14 (ref)
            while u13.active do
                local v27 = default(5, Linear, function(p26) -- Line: 101
                    -- upvalues: u21 (ref)
                    u21.CurveSize0 = p26;
                end, u21.CurveSize0, u14:NextNumber(400, 600));
                v27:Play();
                v27:Wait();
                task.wait(3);
            end;
        end);
        task.spawn(function() -- Line: 120
            -- upvalues: u13 (ref), default (ref), Linear (ref), u21 (copy), u14 (ref)
            while u13.active do
                local v29 = default(5, Linear, function(p28) -- Line: 108
                    -- upvalues: u21 (ref)
                    u21.CurveSize1 = p28;
                end, u21.CurveSize1, u14:NextNumber(150, 350));
                v29:Play();
                v29:Wait();
                task.wait(3);
            end;
        end);
    end;

    for i, v in v20 do
        v30(v, i - 1, v20);
    end;

    return v15;
end;

KnitClient.CreateController(u2.new());

return nil;