-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "SkyScytheController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p4);
    p4.Name = "SkyScytheController";
    p4.readyTime = -1;
    p4.cooldown = 1;
end;

function u2.isRelevantItem(p5, p6) -- Line: 35
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.SKY_SCYTHE;
end;

function u2.onEnable(p7, p8, p9) -- Line: 38
end;

function u2.onDisable(p10) -- Line: 40
end;

function u2.KnitStart(u11) -- Line: 42
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), getItemMeta (copy), ClientSyncEvents (copy), Workspace (copy), default (copy)
    HandKnitController.KnitStart(u11);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.SKY_SCYTHE, {
        sounds = { GameSound.SKY_SCYTHE_1, GameSound.SKY_SCYTHE_2, GameSound.SKY_SCYTHE_3 }
    });
    local sword = getItemMeta(ItemType.SKY_SCYTHE).sword;

    if sword ~= nil then
        sword = sword.attackSpeed;
    end;

    u11.cooldown = sword == nil and 1 or sword;
    ClientSyncEvents.SwordSwing:connect(function(p12) -- Line: 56
        -- upvalues: ItemType (ref), u11 (copy), Workspace (ref), default (ref)
        if p12.swordType == ItemType.SKY_SCYTHE and u11.readyTime < Workspace:GetServerTimeNow() then
            u11.readyTime = Workspace:GetServerTimeNow() + u11.cooldown;
            default.Client:Get("SkyScytheSpin"):SendToServer();
        end;
    end);
    default.Client:Get("SkyScytheSpinEffect"):Connect(function(p13) -- Line: 62
        -- upvalues: u11 (copy)
        u11:spinEffect(p13.player);
    end);
end;

function u2.spinEffect(p14, u15) -- Line: 66
    -- upvalues: EntityUtil (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy)
    local v16 = EntityUtil:getEntity(u15);
    local u17 = ReplicatedStorage.Assets.Effects.SkyScytheEffect:Clone();
    local Character = u15.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not (Character and v16) then
        return nil;
    end;

    u17.Position = Character;
    u17.Parent = Workspace;
    local Ground = u17:FindFirstChild("Ground");

    if Ground ~= nil then
        local function _(p18) -- Line: 85
            if p18:IsA("ParticleEmitter") then
                p18:Emit(3);
            end;
        end;

        for i, child in Ground:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child:Emit(3);
            end;
        end;
    end;

    local u19 = RunService.Heartbeat:Connect(function() -- Line: 94
        -- upvalues: u15 (copy), Character (ref), u17 (copy)
        local Character2 = u15.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.Position;
            end;
        end;

        Character = Character2;

        if Character then
            u17.Position = Character;
        end;
    end);
    local u20 = v16:getHandItemInstanceFromCharacter();

    if u20 ~= nil then
        u20 = u20:FindFirstChild("Handle");

        if u20 ~= nil then
            u20 = u20:FindFirstChild("trail");

            if u20 ~= nil then
                u20 = u20:FindFirstChild("t0");
            end;
        end;
    end;

    if u20 then
        u20.Enabled = true;
    end;

    task.delay(0.5, function() -- Line: 121
        -- upvalues: u19 (copy), u17 (copy), u20 (copy)
        u19:Disconnect();
        u17:Destroy();

        if u20 then
            u20.Enabled = false;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;