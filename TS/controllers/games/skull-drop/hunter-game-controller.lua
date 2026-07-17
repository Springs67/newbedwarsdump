-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SkullDropHud = RuntimeLib.import(script, script.Parent, "ui", "hud", "skull-drop-hud").SkullDropHud;
local SkullBillBoard = RuntimeLib.import(script, script.Parent, "ui", "skull-count-ui").SkullBillBoard;
local u4 = {
    GameSound.SKULL_LOOP_1,
    GameSound.SKULL_LOOP_2,
    GameSound.SKULL_LOOP_3,
    GameSound.SKULL_LOOP_4
};
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "HunterGameController";
    end,

    __index = GameKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 40
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p7, { GameType.SKULL_DROP });
    p7.Name = "HunterGameController";
    p7.uiMaidMap = {};
end;

function u5.KnitStart(p8) -- Line: 45
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p8);
end;

function u5.onGameInit(u9) -- Line: 48
    -- upvalues: KnitClient (copy), GameSound (copy), default (copy), ClientStore (copy), MatchState (copy), QueueType (copy), Players (copy), Flamework (copy), SkullDropHud (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), ClientSyncEvents (copy), ItemType (copy), SoundManager (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.SKULL_DROP_ITEM_MERGE, GameSound.SKULL_DROP_ITEM_PICKUP, GameSound.SKULL_DROP_SKULL_PICKUP }
    });
    default.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p10, p11, p12) -- Line: 52
        -- upvalues: ClientStore (ref), MatchState (ref), QueueType (ref), Players (ref), u9 (copy), Flamework (ref), SkullDropHud (ref)
        local queueType = ClientStore:getState().Game.queueType;

        if p10 == MatchState.RUNNING and queueType == QueueType.SKULL_DROP then
            for _, v in Players:GetPlayers() do
                u9:setupPlayerBillboard(v);
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "SkullDropHud",
                app = SkullDropHud
            }, {});
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p13) -- Line: 65
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), u9 (copy)
        local v14 = EntityUtil:getEntity(p13.entityInstance);

        if not RuntimeLib.instanceof(v14, PlayerEntity) then
            return nil;
        end;

        u9:cleanPlayerBillBoard(v14:getPlayer());
    end);
    default.Client:Get("SkullUpdateEvent"):Connect(function(p15) -- Line: 72
        -- upvalues: u9 (copy)
        u9:updatePlayerBillboard(p15.player);
        u9:updateHighlight(p15.player);
        u9:updateLoopingSound(p15.player);
    end);
    local u16 = os.clock();
    local u17 = 0;
    ClientSyncEvents.ItemAdded:connect(function(p18) -- Line: 79
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref), u16 (ref), u17 (ref)
        if p18.item.Name ~= ItemType.HEADHUNT_SKULL then
            SoundManager:playSound(GameSound.SKULL_DROP_ITEM_PICKUP);

            return;
        end;

        if os.clock() - u16 < 2 then
            u17 = u17 + 1;
        else
            u17 = 0;
        end;

        SoundManager:playSound(GameSound.SKULL_DROP_SKULL_PICKUP, {
            playbackSpeedMultiplier = math.clamp(u17 / 10, 0, 1) * 0.15 + 0.95
        });
        u16 = os.clock();
    end);
end;

function u5.setupPlayerBillboard(u19, u20) -- Line: 96
    -- upvalues: u1 (copy)
    local v21 = u1.new();

    if u19.uiMaidMap[u20] ~= nil then
        return nil;
    end;

    u20.CharacterAdded:Connect(function() -- Line: 103
        -- upvalues: u19 (copy), u20 (copy)
        u19:updatePlayerBillboard(u20);
    end);
    u19.uiMaidMap[u20] = v21;
    u19:updatePlayerBillboard(u20);
end;

function u5.updatePlayerBillboard(p22, p23) -- Line: 111
    -- upvalues: Players (copy), InventoryUtil (copy), ItemType (copy), u3 (copy), SkullBillBoard (copy)
    if p23 == Players.LocalPlayer then
        return nil;
    end;

    local v24 = p22.uiMaidMap[p23];
    local Character = p23.Character;

    if Character ~= nil then
        Character = Character:WaitForChild("Head", 3);
    end;

    if not (v24 and Character) then
        return nil;
    end;

    v24:DoCleaning();
    local v25 = InventoryUtil.getAmount(p23, ItemType.HEADHUNT_SKULL);

    if v25 <= 0 then
        v24:DoCleaning();

        return nil;
    end;

    local u26 = u3.mount(u3.createElement("BillboardGui", {
        AlwaysOnTop = true,
        MaxDistance = 100,
        ExtentsOffset = Vector3.new(0, 7, 0),
        Size = UDim2.fromScale(5, 2.5)
    }, { u3.createElement(SkullBillBoard, {
            amount = v25
        }) }), Character);
    v24:GiveTask(function() -- Line: 142
        -- upvalues: u3 (ref), u26 (copy)
        u3.unmount(u26);
    end);
end;

function u5.cleanPlayerBillBoard(p27, p28) -- Line: 146
    local v29 = p27.uiMaidMap[p28];

    if not v29 then
        return nil;
    end;

    v29:DoCleaning();
end;

function u5.updateHighlight(p30, p31) -- Line: 155
    -- upvalues: Players (copy), InventoryUtil (copy), ItemType (copy), u2 (copy)
    if p31 == Players.LocalPlayer then
        return nil;
    end;

    local Character = p31.Character;

    if not Character then
        return nil;
    end;

    local SkullHighlight = Character:FindFirstChild("SkullHighlight");
    local v32 = InventoryUtil.getAmount(p31, ItemType.HEADHUNT_SKULL);

    if v32 > 4 and not SkullHighlight then
        u2("Highlight", {
            Name = "SkullHighlight",
            FillTransparency = 1,
            OutlineTransparency = 0,
            Parent = Character,
            OutlineColor = Color3.fromRGB(255, 120, 120),
            FillColor = Color3.fromRGB(255, 150, 150),
            DepthMode = Enum.HighlightDepthMode.Occluded
        });

        return;
    end;

    if v32 < 4 and SkullHighlight ~= nil then
        SkullHighlight:Destroy();
    end;
end;

function u5.updateLoopingSound(p33, p34) -- Line: 182
    -- upvalues: InventoryUtil (copy), ItemType (copy), u4 (copy), u2 (copy)
    local v35 = InventoryUtil.getAmount(p34, ItemType.HEADHUNT_SKULL);
    local Character = p34.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character:FindFirstChild("SkullLoopingSound");
        end;
    end;

    if v35 == 0 then
        if Character ~= nil then
            Character:Stop();
        end;

        if Character ~= nil then
            Character:Destroy();
        end;

        return nil;
    end;

    local v36 = math.floor(v35 / 3);
    local v37 = u4[math.min(v36, #u4 - 1) + 1];
    local v38;

    if Character == nil then
        v38 = Character;
    else
        v38 = Character.SoundId;
    end;

    if v38 == v37 then
        return nil;
    end;

    if Character ~= nil then
        Character:Destroy();
    end;

    local v39 = {
        Name = "SkullLoopingSound",
        RollOffMinDistance = 20,
        RollOffMaxDistance = 40,
        Volume = 0.06,
        Playing = true,
        Looped = true,
        SoundId = v37
    };
    local Character2 = p34.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;
    end;

    v39.Parent = Character2;
    u2("Sound", v39);
end;

KnitClient.CreateController(u5.new());

return nil;