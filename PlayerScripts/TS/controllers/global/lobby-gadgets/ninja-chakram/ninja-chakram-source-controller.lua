-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local NinjaKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ninja", "ninja-kit-util").NinjaKitUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "NinjaChakramSourceController";
    end,

    __index = ProjectileSourceController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 24
    -- upvalues: ProjectileSourceController (copy), u1 (copy)
    ProjectileSourceController.constructor(p4, ...);
    p4.Name = "NinjaChakramSourceController";
    p4.chargingMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.KnitStart(p5);
end;

function u2.isRelevantItem(p6, p7) -- Line: 32
    -- upvalues: NinjaKitUtil (copy)
    return NinjaKitUtil:isItemTypeChakram(p7.itemType);
end;

function u2.onStartCharging(u8) -- Line: 35
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    local v9 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SPEAR_STARTUP);

    if v9 then
        u8.chargingMaid:GiveTask(v9);
        u8.chargingMaid:GiveTask(v9.Stopped:Connect(function() -- Line: 39
            -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u8 (copy)
            local u10 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SPEAR_IDLE, {
                looped = true
            });

            if u10 then
                u8.chargingMaid:GiveTask(function() -- Line: 44
                    -- upvalues: u10 (copy)
                    u10:Stop();
                end);
            end;
        end));
    end;
end;

function u2.onStopCharging(p11) -- Line: 51
    p11.chargingMaid:DoCleaning();
end;

function u2.onLaunch(p12) -- Line: 54
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.NINJA_THROW_CHAKRAM_SHORTENED);
end;

function u2.onStartReload(p13) -- Line: 66
end;

function u2.onMaxCharge(p14) -- Line: 68
end;

KnitClient.CreateController(u2.new());

return nil;