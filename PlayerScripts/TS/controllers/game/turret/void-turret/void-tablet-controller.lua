-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local VoidTurretViewWrapper = RuntimeLib.import(script, script.Parent, "ui", "void-turret-view").VoidTurretViewWrapper;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "VoidTabletController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 37
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "VoidTabletController";
    p7.nextAllowActivation = -1;
    p7.maid = u2.new();
end;

function u5.KnitStart(p8) -- Line: 43
    -- upvalues: HandKnitController (copy), ClientStore (copy)
    HandKnitController.KnitStart(p8);
    ClientStore.changed:connect(function(p9, p10) -- Line: 45
        -- upvalues: ClientStore (ref)
        local selectedTurret = p9.Game.selectedTurret;

        if selectedTurret == nil and selectedTurret ~= p10.Game.selectedTurret then
            ClientStore:dispatch({
                type = "InventorySelectHotbarSlot",
                slot = 0
            });
        end;
    end);
end;

function u5.attemptToActivate(u11) -- Line: 57
    -- upvalues: EntityUtil (copy), CollectionService (copy), TurretId (copy), Players (copy), Flamework (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), CreateRoduxApp (copy), VoidTurretViewWrapper (copy), u3 (copy), EntityDamageEventZap (copy)
    if time() < u11.nextAllowActivation then
        return false;
    end;

    u11.nextAllowActivation = time() + 1;

    if EntityUtil:getLocalPlayerEntity() == nil then
        warn("Could not find entity for localplayer");

        return false;
    end;

    local function _(p12) -- Line: 68
        -- upvalues: Players (ref)
        return p12:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
    end;

    local v13 = 0;
    local v14 = {};

    for i, v in CollectionService:GetTagged(TurretId.VOID_TURRET) do
        local _ = i - 1;

        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId == true then
            v13 = v13 + 1;
            v14[v13] = v;
        end;
    end;

    if #v14 == 0 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You do not have any void turrets placed yet."
        });

        return false;
    end;

    local u15 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        moveSpeedMultiplier = 0
    });
    u11.maid:GiveTask(function() -- Line: 93
        -- upvalues: u15 (copy)
        u15.Destroy();
    end);
    local u16 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.USE_TABLET, {
        looped = true
    });
    u11.maid:GiveTask(function() -- Line: 99
        -- upvalues: u16 (copy)
        local v17 = u16;

        if v17 ~= nil then
            v17:Stop();
        end;
    end);
    local u18 = KnitClient.Controllers.ViewmodelController:addDisabler();
    u11.maid:GiveTask(function() -- Line: 106
        -- upvalues: KnitClient (ref), u18 (copy)
        KnitClient.Controllers.ViewmodelController:removeDisabler(u18);
    end);
    u11:setupYield(function() -- Line: 109
        -- upvalues: CreateRoduxApp (ref), VoidTurretViewWrapper (ref), u3 (ref)
        local u19 = CreateRoduxApp("VoidCameraView", VoidTurretViewWrapper);

        return function() -- Line: 111
            -- upvalues: u3 (ref), u19 (copy)
            u3.unmount(u19);
        end;
    end);
    local u34 = EntityDamageEventZap.On(function(p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33) -- Line: 115
        -- upvalues: Players (ref), u11 (copy)
        if Players.LocalPlayer.Character and p20 == Players.LocalPlayer.Character then
            u11.maid:DoCleaning();
        end;
    end);
    u11.maid:GiveTask(function() -- Line: 120
        -- upvalues: u34 (copy)
        u34();
    end);

    return true;
end;

function u5.onEnable(p35) -- Line: 125
    -- upvalues: ClientStore (copy)
    if p35:attemptToActivate() == false then
        ClientStore:dispatch({
            type = "InventorySelectHotbarSlot",
            slot = 0
        });
    end;
end;

function u5.isRelevantItem(p36, p37) -- Line: 134
    -- upvalues: ItemType (copy)
    return p37.itemType == ItemType.VOID_TURRET_TABLET;
end;

function u5.onDisable(p38) -- Line: 137
    p38.maid:DoCleaning();
end;

return {
    VoidTabletController = KnitClient.CreateController(u5.new())
};