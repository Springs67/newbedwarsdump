-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local HttpService = v1.HttpService;
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SpiritGardenerSeedController";
    end,

    __index = CollectableEntityController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p4);
    p4.Name = "SpiritGardenerSeedController";
    p4.pickupListenerActive = false;
end;

function u2.KnitStart(p5) -- Line: 35
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p5);
end;

function u2.validCollectableEntityTypes(p6) -- Line: 38
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.SPIRIT_GARDENER_ENERGY };
end;

function u2.pickDisplayModel(p7, p8, p9) -- Line: 41
    -- upvalues: ReplicatedStorage (copy)
    return {
        repStorageModel = ReplicatedStorage.Assets.Misc.SpiritGardenerEnergy,
        collectionTag = p8
    };
end;

function u2.onWillRemoveEntity(p10, p11, p12, p13, p14) -- Line: 47
    -- upvalues: GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), Workspace (copy), HttpService (copy), RunService (copy)
    if not p13 then
        return nil;
    end;

    local SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT = GameSound.SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT;
    local _ = GameSound.SPIRIT_GARDENER_SPIRIT_ORB_COLLECTED;

    if p13 then
        local grove = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p13)].grove;

        if grove then
            SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT = grove.collectStartSound;
            local _ = grove.collectedSound;
        end;
    end;

    SoundManager:playSound(SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT, {
        volumeMultiplier = 0.5
    });
    local u15 = p14:Clone();
    u15.Parent = Workspace;
    u15:PivotTo(p14:GetPivot());

    if not u15.PrimaryPart then
        return nil;
    end;

    local u16 = 0;
    local Character = p13.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("UpperTorso");
    end;

    if Character == nil then
        return nil;
    end;

    local u17 = HttpService:GenerateGUID(false);
    RunService:BindToRenderStep(u17, Enum.RenderPriority.Last.Value, function(p18) -- Line: 85
        -- upvalues: Character (copy), u15 (copy), u16 (ref), RunService (ref), u17 (copy)
        if Character.Parent == nil then
            return nil;
        end;

        if u15.PrimaryPart == nil then
            return nil;
        end;

        u16 = u16 + p18;
        local v19 = math.clamp(u16 / 2, 0, 1);
        local v20 = (1 - v19) * 5 + v19 * 1;
        local v21 = 6.283185307179586 * u16;
        local v22 = math.cos(v21) * v20;
        local v23 = math.sin(v19 * 3.141592653589793 * 2) * 2;
        local v24 = math.sin(v21) * v20;
        local v25 = Vector3.new(v22, v23, v24);
        local v26 = u15.PrimaryPart.Position:Lerp(Character.Position + v25, v19);
        local v27 = CFrame.Angles(0, v21, 0);
        u15:PivotTo(CFrame.new(v26) * v27);

        if v19 >= 1 then
            RunService:UnbindFromRenderStep(u17);
            u15:Destroy();
        end;
    end);
    task.delay(2, function() -- Line: 106
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.SPIRIT_GARDENER_SPIRIT_ORB_COLLECTED, {
            volumeMultiplier = 0.5
        });
    end);
end;

function u2.onCreatedEntity(p28, p29, p30, p31) -- Line: 112
    p31:PivotTo(CFrame.new(p31:GetPivot().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * 3.141592653589793, 0));
end;

function u2.listenToPickup(u32) -- Line: 119
    -- upvalues: RuntimeLib (copy)
    if u32.pickupListenerActive then
        return nil;
    end;

    u32.pickupListenerActive = true;
    RuntimeLib.Promise.defer(function() -- Line: 124
        -- upvalues: u32 (copy), RuntimeLib (ref)
        while true do
            local v33 = task.wait(0.2);

            if v33 ~= 0 and (v33 == v33 and v33) then
                v33 = u32.pickupListenerActive;
            end;

            if v33 == 0 or (v33 ~= v33 or not v33) then
                return;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 133
                -- upvalues: u32 (ref)
                u32:checkForPickup();
            end);
        end;
    end);

    return {
        Destroy = function() -- Line: 139, Name: Destroy
            -- upvalues: u32 (copy)
            u32.pickupListenerActive = false;
        end
    };
end;

function u2.checkForPickup(u34) -- Line: 144
    -- upvalues: Players (copy), CollectionService (copy), Workspace (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v35 = u34:validCollectableEntityTypes();

    local function v41(u36) -- Line: 154
        -- upvalues: CollectionService (ref), Workspace (ref), Character (copy), u34 (copy), Players (ref)
        local v37 = CollectionService:GetTagged(u36);

        local function v40(p38) -- Line: 156
            -- upvalues: Workspace (ref), Character (ref), u34 (ref), Players (ref), u36 (copy)
            local v39 = p38:GetAttribute("SpawnTime");

            if Workspace:GetServerTimeNow() - v39 < 1 then
                return nil;
            end;

            if (Character.Position - p38:GetPivot().Position).Magnitude <= 5.5 then
                u34:collectEntity(Players.LocalPlayer, p38, u36);
            end;
        end;

        for i, v in v37 do
            v40(v, i - 1, v37);
        end;
    end;

    for i, v in v35 do
        v41(v, i - 1, v35);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;