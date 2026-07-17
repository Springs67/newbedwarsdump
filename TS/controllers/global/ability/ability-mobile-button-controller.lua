-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "AbilityMobileButtonController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "AbilityMobileButtonController";
end;

function u3.KnitStart(p6) -- Line: 30
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), DeviceUtil (copy), u2 (copy), MobileButton (copy), Flamework (copy), Players (copy)
    KnitController.KnitStart(p6);
    ClientSyncEvents.AbilityEnabled:connect(function(u7) -- Line: 32
        -- upvalues: DeviceUtil (ref), u2 (ref), MobileButton (ref), Flamework (ref), Players (ref)
        local triggerConfig = u7.ability.triggerConfig;

        if triggerConfig ~= nil then
            triggerConfig = triggerConfig.mobileButton;
        end;

        if not triggerConfig then
            return nil;
        end;

        if not DeviceUtil.isMobileControls() then
            return nil;
        end;

        local u8 = u2.mount(u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(MobileButton, {
                Image = triggerConfig.icon,
                Position = triggerConfig.position,

                OnPressDown = function() -- Line: 50, Name: OnPressDown
                    -- upvalues: Flamework (ref), u7 (copy)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u7.ability.abilityId);
                end
            }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u7.ability.maid:GiveTask(function() -- Line: 55
            -- upvalues: u2 (ref), u8 (copy)
            u2.unmount(u8);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;