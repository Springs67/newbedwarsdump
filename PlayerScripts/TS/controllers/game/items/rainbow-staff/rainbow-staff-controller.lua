-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "sound", "sound-manager").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "RainbowStaffController";
    end,

    __index = ProjectileSourceController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.constructor(p4);
    p4.Name = "RainbowStaffController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: ProjectileSourceController (copy), default (copy), ReplicatedStorage (copy), TweenService (copy), SoundManager (copy), GameSound (copy), Players (copy)
    ProjectileSourceController.KnitStart(p5);
    default.Client:OnEvent("RainbowBridgeCreate", function(u6) -- Line: 35
        -- upvalues: ReplicatedStorage (ref), TweenService (ref), SoundManager (ref), GameSound (ref), Players (ref)
        local v7 = ReplicatedStorage.Assets.Misc.RainbowBridge:Clone():GetChildren();

        local function v9(p8) -- Line: 38
            -- upvalues: u6 (copy), TweenService (ref)
            p8.Parent = u6.part;

            if p8:IsA("Decal") then
                local Transparency = p8.Transparency;
                p8.Transparency = 1;
                TweenService:Create(p8, TweenInfo.new(1), {
                    Transparency = Transparency
                }):Play();
            end;

            if p8:IsA("ParticleEmitter") then
                p8.Enabled = u6.usable;
            end;
        end;

        for i, v in v7 do
            v9(v, i - 1, v7);
        end;

        local Transparency = u6.part.Transparency;
        u6.part.Transparency = 1;
        TweenService:Create(u6.part, TweenInfo.new(1), {
            Transparency = Transparency
        }):Play();

        if u6.usable then
            SoundManager:playSound(GameSound.RAINBOW_BRIDGE_AURA, {
                rollOffMaxDistance = 40,
                looped = true,
                position = u6.part.Position,
                parent = u6.part
            });
        end;

        if u6.creator == Players.LocalPlayer then
            SoundManager:playSound(GameSound.RAINBOW_BRIDGE_CREATE, {
                position = u6.part.Position
            });
        end;
    end);
    default.Client:OnEvent("RainbowBridgeDestroy", function(u10) -- Line: 76
        -- upvalues: TweenService (ref)
        local v11 = u10.part:GetChildren();

        local function v13(p12) -- Line: 79
            -- upvalues: TweenService (ref), u10 (copy)
            if p12:IsA("Decal") then
                TweenService:Create(p12, TweenInfo.new(u10.fadeTime), {
                    Transparency = 1
                }):Play();
            end;
        end;

        for i, v in v11 do
            v13(v, i - 1, v11);
        end;

        TweenService:Create(u10.part, TweenInfo.new(u10.fadeTime - 1), {
            Transparency = 1
        }):Play();
    end);
end;

function u2.getProjectileSource(p14, p15) -- Line: 94
    -- upvalues: getItemMeta (copy)
    local multiProjectileSource = getItemMeta(p15.itemType).multiProjectileSource;

    if multiProjectileSource ~= nil then
        multiProjectileSource = multiProjectileSource.rainbow_bridge;
    end;

    return multiProjectileSource;
end;

function u2.isRelevantItem(p16, p17) -- Line: 103
    -- upvalues: ItemType (copy)
    return p17.itemType == ItemType.RAINBOW_STAFF;
end;

function u2.onEnable(p18, p19, p20) -- Line: 106
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.onEnable(p18, p19, p20);
end;

function u2.onDisable(p21) -- Line: 109
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.onDisable(p21);
end;

function u2.onStartCharging(p22) -- Line: 112
end;

function u2.onStopCharging(p23) -- Line: 114
end;

function u2.onLaunch(p24, p25) -- Line: 116
end;

function u2.onStartReload(p26, p27) -- Line: 118
end;

KnitClient.CreateController(u2.new());

return nil;