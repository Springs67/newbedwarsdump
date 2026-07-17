-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "JellyfishMountController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "JellyfishMountController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), Players (copy), CollectionService (copy), VehicleType (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.StartConsuming:connect(function(p6) -- Line: 33
        -- upvalues: ItemType (ref), Players (ref)
        if p6.itemType ~= ItemType.JELLYFISH_MOUNT_DEPLOY then
            return nil;
        end;

        if p6:isCancelled() then
            return nil;
        end;

        if Players.LocalPlayer:GetAttribute("IsInVehicle") == true then
            p6:setCancelled(true);
        end;
    end);
    CollectionService:GetInstanceAddedSignal(VehicleType.JELLYFISH_MOUNT):Connect(function(p7) -- Line: 44
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref)
        local v8 = p7:FindFirstChild("AnimationController") or Instance.new("AnimationController");
        v8.Parent = p7;
        local Animator = Instance.new("Animator");
        Animator.Parent = v8;
        local u9 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_MOUNT_IDLE));
        u9:Play();
        p7.Destroying:Connect(function() -- Line: 53
            -- upvalues: u9 (copy)
            u9:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;