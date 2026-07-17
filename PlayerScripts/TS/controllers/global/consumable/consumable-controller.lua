-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ConsumableBoostList = RuntimeLib.import(script, script.Parent, "ui", "consumable-boost-list").ConsumableBoostList;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ConsumableController";
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
    p4.Name = "ConsumableController";
    p4.displayBoostList = true;
    p4.inventory = {};
    p4.record = {};
end;

function u2.KnitStart(u5) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), Flamework (copy), ConsumableBoostList (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("ConsumableUpdate"):Connect(function(p6) -- Line: 36
        -- upvalues: u5 (copy), ClientStore (ref)
        u5.inventory = p6.inventory;
        u5.record = p6.record;
        ClientStore:dispatch({
            type = "ConsumableSetSome",
            data = {
                inventory = p6.inventory,
                record = p6.record
            }
        });
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "ConsumableBoostList",
        app = ConsumableBoostList
    }, {});
end;

function u2.setDisplayBoostList(p7, p8) -- Line: 52
    p7.displayBoostList = p8;
end;

function u2.getConsumablesOfTypeFromInv(p9, u10) -- Line: 55
    -- upvalues: u1 (copy)
    local function _(p11) -- Line: 57
        -- upvalues: u10 (copy)
        local _ = p11[1];

        return p11[2].consumable == u10;
    end;

    local v12 = 0;
    local v13 = {};

    for i, v in u1.entries(p9.inventory) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].consumable == u10 == true then
            v12 = v12 + 1;
            v13[v12] = v;
        end;
    end;

    return v13;
end;

function u2.getConsumablesOfCategoryFromInv(p14, u15) -- Line: 74
    -- upvalues: u1 (copy), getConsumableMeta (copy)
    local function _(p16) -- Line: 76
        -- upvalues: getConsumableMeta (ref), u15 (copy)
        local _ = p16[1];

        return getConsumableMeta(p16[2].consumable).category == u15;
    end;

    local v17 = 0;
    local v18 = {};

    for i, v in u1.entries(p14.inventory) do
        local _ = i - 1;
        local _ = v[1];

        if getConsumableMeta(v[2].consumable).category == u15 == true then
            v17 = v17 + 1;
            v18[v17] = v;
        end;
    end;

    return v18;
end;

function u2.getConsumablesOfCategoryFromRecord(p19, u20) -- Line: 93
    -- upvalues: u1 (copy), getConsumableMeta (copy)
    local function _(p21) -- Line: 95
        -- upvalues: getConsumableMeta (ref), u20 (copy)
        local _ = p21[1];

        return getConsumableMeta(p21[2].consumable).category == u20;
    end;

    local v22 = 0;
    local v23 = {};

    for i, v in u1.entries(p19.record) do
        local _ = i - 1;
        local _ = v[1];

        if getConsumableMeta(v[2].consumable).category == u20 == true then
            v22 = v22 + 1;
            v23[v22] = v;
        end;
    end;

    return v23;
end;

function u2.useConsumableFromLocker(p24, p25) -- Line: 112
    -- upvalues: default (copy), SoundManager (copy), GameSound (copy)
    local v26 = default.Client:Get("LockerUseConsumabler"):CallServer(p25);

    if v26 then
        SoundManager:playSound(GameSound.FLETCHERY_UPGRADE_BOARD_PLACE);
    end;

    return v26;
end;

KnitClient.CreateController(u2.new());

return nil;