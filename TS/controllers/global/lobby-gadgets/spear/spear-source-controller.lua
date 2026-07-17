-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SpearSourceController";
    end,

    __index = ProjectileSourceController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 26
    -- upvalues: ProjectileSourceController (copy), u1 (copy)
    ProjectileSourceController.constructor(p4, ...);
    p4.Name = "SpearSourceController";
    p4.chargingMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.KnitStart(p5);
end;

function u2.isRelevantItem(p6, p7) -- Line: 34
    -- upvalues: ItemType (copy)
    return (p7.itemType == ItemType.SPEAR or p7.itemType == ItemType.SAND_SPEAR) and true or p7.itemType == ItemType.HARPOON;
end;

function u2.onStartCharging(u8) -- Line: 37
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    local v9 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SPEAR_STARTUP);

    if v9 then
        u8.chargingMaid:GiveTask(v9);
        u8.chargingMaid:GiveTask(v9.Stopped:Connect(function() -- Line: 41
            -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u8 (copy)
            local u10 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SPEAR_IDLE, {
                looped = true
            });

            if u10 then
                u8.chargingMaid:GiveTask(function() -- Line: 46
                    -- upvalues: u10 (copy)
                    u10:Stop();
                end);
            end;
        end));
    end;
end;

function u2.onStopCharging(p11) -- Line: 53
    p11.chargingMaid:DoCleaning();
end;

function u2.onLaunch(p12) -- Line: 56
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    local SPEAR_THROW = GameSound.SPEAR_THROW;
    local v13 = {};
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame().Position;
    end;

    v13.position = Character;
    v13.parent = Players.LocalPlayer.Character;
    SoundManager:playSound(SPEAR_THROW, v13);
    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SPEAR_THROW);
end;

function u2.onStartReload(p14) -- Line: 70
end;

function u2.onMaxCharge(p15) -- Line: 72
end;

KnitClient.CreateController(u2.new());

return nil;