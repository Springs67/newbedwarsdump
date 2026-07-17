-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedWarsArmor = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedWarsArmor;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "PlayerDummyController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "PlayerDummyController";
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), MonsterType (copy), KnitClient2 (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag("Monster", function(u6) -- Line: 35
        -- upvalues: MonsterType (ref), KnitClient2 (ref), u5 (copy)
        if u6:GetAttribute("MonsterType") ~= MonsterType.PLAYER_DUMMY then
            return nil;
        end;

        task.spawn(function() -- Line: 39
            -- upvalues: KnitClient2 (ref), u6 (copy)
            KnitClient2.Controllers.FootstepsController:hookCharacter(nil, u6);
        end);
        u5:setupEquips(u6);
        u5:setupAnimations(u6);
    end);
end;

function u2.setupEquips(p7, u8) -- Line: 46
    -- upvalues: EntityUtil (copy), InventoryEntity (copy), BedWarsArmor (copy), ReplicatedStorage (copy), WeldUtil (copy), ItemUtil (copy)
    local v9 = EntityUtil:getEntity(u8);
    local v10 = InventoryEntity.new(u8);
    u8:WaitForChild("Humanoid");

    if not (v9 and v10) then
        return nil;
    end;

    local u11 = u8:GetAttribute("ArmorType");
    local u12 = u8:GetAttribute("WeaponType");

    local function _(p13) -- Line: 55
        -- upvalues: u11 (copy)
        return table.find(p13, u11) ~= nil;
    end;

    local v14 = nil;

    for i, v in BedWarsArmor do
        local _ = i - 1;

        if table.find(v, u11) ~= nil == true then
            v14 = v;
            break;
        end;
    end;

    if v14 ~= nil then
        local function _(u15) -- Line: 70
            -- upvalues: ReplicatedStorage (ref), u8 (copy)
            task.spawn(function() -- Line: 71
                -- upvalues: ReplicatedStorage (ref), u15 (copy), u8 (ref)
                local function _(p16) -- Line: 73
                    -- upvalues: u8 (ref)
                    if not p16:IsA("Accessory") then
                        return nil;
                    end;

                    p16:Clone().Parent = u8;
                end;

                for i, child in ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(u15):GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Accessory") then
                        child:Clone().Parent = u8;
                    end;
                end;
            end);
        end;

        for i, v in v14 do
            local _ = i - 1;
            task.spawn(function() -- Line: 71
                -- upvalues: ReplicatedStorage (ref), v (copy), u8 (copy)
                local function _(p17) -- Line: 73
                    -- upvalues: u8 (ref)
                    if not p17:IsA("Accessory") then
                        return nil;
                    end;

                    p17:Clone().Parent = u8;
                end;

                for i2, child in ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(v):GetChildren() do
                    local _ = i2 - 1;

                    if child:IsA("Accessory") then
                        child:Clone().Parent = u8;
                    end;
                end;
            end);
        end;
    end;

    WeldUtil:weldCharacterAccessories(u8);
    task.delay(2, function() -- Line: 89
        -- upvalues: ItemUtil (ref), u12 (copy), u8 (copy), WeldUtil (ref)
        local v18 = ItemUtil.createItemInstance(u12);
        v18.Parent = u8;

        local function _(p19) -- Line: 93
            if p19:IsA("Attachment") and p19.Name ~= "RightGripAttachment" then
                p19:Destroy();
            end;
        end;

        for i, descendant in v18:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Attachment") and descendant.Name ~= "RightGripAttachment" then
                descendant:Destroy();
            end;
        end;

        WeldUtil:weldAccessory(u8, v18);
    end);
end;

function u2.setupAnimations(p20, p21) -- Line: 104
end;

KnitClient.CreateController(u2.new());

return nil;