-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local MountType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u1 = {
    MountType.FISH_TANK_TINKER,
    MountType.FISH_TANK_IRON_TINKER,
    MountType.FISH_TANK_DIAMOND_TINKER,
    MountType.FISH_TANK_EMERALD_TINKER,
    MountType.FISH_TANK_VOID_TINKER
};
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "FishTankTinkerSkinController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "FishTankTinkerSkinController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), u1 (copy), ReplicatedStorage (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.GenericMountMounted:connect(function(p6) -- Line: 32
        -- upvalues: u1 (ref), ReplicatedStorage (ref), WeldUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if table.find(u1, p6.mountType) ~= nil then
            local v7 = ReplicatedStorage.Assets.Effects.GoldFish:Clone();
            v7.Parent = p6.model;
            WeldUtil:weldAccessory(p6.model, v7);
            local Handle = v7:WaitForChild("Handle", 1);

            if Handle ~= nil then
                Handle = Handle:WaitForChild("rig", 1);

                if Handle ~= nil then
                    Handle = Handle:WaitForChild("AnimationController", 1);

                    if Handle ~= nil then
                        Handle = Handle:WaitForChild("Animator", 1);
                    end;
                end;
            end;

            if Handle then
                GameAnimationUtil:playAnimation(Handle, AnimationType.GOLD_FISH_SWIM);
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;