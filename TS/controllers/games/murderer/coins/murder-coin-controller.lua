-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local MurderCoinDisplay = RuntimeLib.import(script, script.Parent, "ui", "murder-coin-display").MurderCoinDisplay;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "MurderCoinController";
    end,

    __index = CollectableEntityController
});
u4.__index = u4;

function u4.new(...) -- Line: 36
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 40
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p6, ...);
    p6.Name = "MurderCoinController";
    p6.pickupListenerActive = false;
end;

function u4.KnitStart(u7) -- Line: 45
    -- upvalues: CollectableEntityController (copy), KnitClient2 (copy), getQueueMeta (copy), GameType (copy), ClientStore (copy), MatchState (copy), ClientSyncEvents (copy)
    CollectableEntityController.KnitStart(u7);
    KnitClient2.Controllers.MatchController:getQueueTypeAsync():andThen(function(p8) -- Line: 48
        -- upvalues: getQueueMeta (ref), GameType (ref), u7 (copy), ClientStore (ref), MatchState (ref), ClientSyncEvents (ref)
        if getQueueMeta(p8).game ~= GameType.MURDERER_GAME then
            return nil;
        end;

        u7:setupCoinUI();

        if ClientStore:getState().Game.matchState == MatchState.RUNNING then
            u7:listenToPickup();
        end;

        ClientSyncEvents.MatchStateChange:connect(function(p9) -- Line: 58
            -- upvalues: MatchState (ref), u7 (ref)
            if p9.matchState == MatchState.RUNNING then
                u7:listenToPickup();

                return;
            end;

            if p9.matchState == MatchState.POST then
                u7.pickupListenerActive = false;
            end;
        end);
    end);
end;

function u4.validCollectableEntityTypes(p10) -- Line: 68
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.MURDER_COIN };
end;

function u4.pickDisplayModel(p11, p12, p13) -- Line: 71
    -- upvalues: ReplicatedStorage (copy)
    return {
        repStorageModel = ReplicatedStorage.Assets.Misc.CoinModel,
        collectionTag = p12
    };
end;

function u4.onWillRemoveEntity(p14, p15, p16, p17, u18) -- Line: 77
    -- upvalues: KnitClient2 (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    if not (u18.PrimaryPart and p17) then
        return nil;
    end;

    local v19 = KnitClient2.Controllers.PickupEffectController:playEffect(u18.PrimaryPart, p17.Character);

    if v19 then
        v19:GiveTask(function() -- Line: 83
            -- upvalues: u18 (copy)
            u18:Destroy();
        end);
    else
        u18:Destroy();
    end;

    if p17 == Players.LocalPlayer then
        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.PUNCH);
        SoundManager:playSound(GameSound.COIN_COLLECT);
    end;

    return nil;
end;

function u4.onCreatedEntity(p20, p21, p22, u23) -- Line: 95
    -- upvalues: RunService (copy)
    local v24 = p20:getEntityMaid(p21);

    if not v24 then
        return nil;
    end;

    local u25 = 0;

    if not u23.PrimaryPart then
        return nil;
    end;

    v24:GiveTask(RunService.Heartbeat:Connect(function(p26) -- Line: 105
        -- upvalues: u25 (ref), u23 (copy)
        u25 = u25 + p26;
        u23:PivotTo(CFrame.new(u23.PrimaryPart.Position) * CFrame.Angles(-1.5707963267948966, 0, 6.283185307179586 * u25 * 0.3));
    end));

    return nil;
end;

function u4.setupCoinUI(u27) -- Line: 114
    -- upvalues: KnitClient (copy), u2 (copy), MurderCoinDisplay (copy), default (copy)
    u27.coinCountTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(MurderCoinDisplay, {
        coins = 0
    }));
    default.Client:Get("MurderCoinUpdate"):Connect(function(p28) -- Line: 118
        -- upvalues: u27 (copy), KnitClient (ref), u2 (ref), MurderCoinDisplay (ref)
        if u27.coinCountTree then
            u2.update(u27.coinCountTree, u2.createElement(MurderCoinDisplay, {
                coins = p28.coins
            }));

            return;
        end;

        u27.coinCountTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(MurderCoinDisplay, {
            coins = p28.coins
        }));
    end);
end;

function u4.listenToPickup(u29) -- Line: 130
    -- upvalues: RuntimeLib (copy)
    if u29.pickupListenerActive then
        return nil;
    end;

    u29.pickupListenerActive = true;
    RuntimeLib.Promise.defer(function() -- Line: 135
        -- upvalues: u29 (copy), RuntimeLib (ref)
        while true do
            local v30 = task.wait(0.2);

            if v30 ~= 0 and (v30 == v30 and v30) then
                v30 = u29.pickupListenerActive;
            end;

            if v30 == 0 or (v30 ~= v30 or not v30) then
                return;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 144
                -- upvalues: u29 (ref)
                u29:checkForPickup();
            end);
        end;
    end);
end;

function u4.checkForPickup(u31) -- Line: 150
    -- upvalues: Players (copy), CollectionService (copy), CollectableEntityType (copy), Workspace (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v32 = CollectionService:GetTagged(CollectableEntityType.MURDER_COIN);

    local function v35(p33) -- Line: 160
        -- upvalues: Workspace (ref), Character (copy), u31 (copy), Players (ref), CollectableEntityType (ref)
        local v34 = p33:GetAttribute("SpawnTime");

        if Workspace:GetServerTimeNow() - v34 < 1 then
            return nil;
        end;

        if (Character.Position - p33:GetPivot().Position).Magnitude <= 4 then
            u31:collectEntity(Players.LocalPlayer, p33, CollectableEntityType.MURDER_COIN);
        end;
    end;

    for i, v in v32 do
        v35(v, i - 1, v32);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;