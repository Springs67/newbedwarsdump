-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "SkeletonController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SkeletonController";
end;

function u4.KnitStart(u7) -- Line: 39
    -- upvalues: KnitController (copy), default (copy), MonsterType (copy), SoundManager (copy), GameSound (copy), WatchCollectionTag (copy), InventoryEntity (copy), ItemUtil (copy), ReplicatedStorage (copy), WeldUtil (copy), KnitClient2 (copy), ItemType (copy)
    KnitController.KnitStart(u7);
    default.Client:WaitFor("EntityDeathEvent"):andThen(function(p8) -- Line: 43
        -- upvalues: MonsterType (ref), SoundManager (ref), GameSound (ref)
        p8:Connect(function(p9) -- Line: 44
            -- upvalues: MonsterType (ref), SoundManager (ref), GameSound (ref)
            if p9.entityInstance:GetAttribute("MonsterType") ~= MonsterType.SKELETON then
                return nil;
            end;

            SoundManager:playSound(GameSound.SKELETON_DEATH, {
                position = p9.cframe.Position
            });
        end);
    end);
    WatchCollectionTag("Monster", function(u10) -- Line: 54
        -- upvalues: MonsterType (ref), u7 (copy), InventoryEntity (ref), ItemUtil (ref), ReplicatedStorage (ref), WeldUtil (ref), KnitClient2 (ref), GameSound (ref), ItemType (ref)
        if u10:GetAttribute("MonsterType") == MonsterType.SKELETON then
            task.spawn(function() -- Line: 56
                -- upvalues: u7 (ref), u10 (copy), InventoryEntity (ref), ItemUtil (ref), ReplicatedStorage (ref), WeldUtil (ref), KnitClient2 (ref), GameSound (ref)
                u7:setUpTeamColor(u10);
                local v11 = u10:GetAttribute("ArmorType");
                local v12 = u10:GetAttribute("WeaponType");

                if not InventoryEntity.new(u10) then
                    return nil;
                end;

                u10:WaitForChild("Humanoid");
                ItemUtil.createItemInstance(v11).Parent = u10;
                ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(v11):WaitForChild(v11):Clone().Parent = u10;
                ItemUtil.createItemInstance(v12).Parent = u10;
                WeldUtil:weldCharacterAccessories(u10);
                KnitClient2.Controllers.FootstepsController:hookCharacter(nil, u10, {
                    walk = {
                        GameSound.SKELETON_FOOTSTEP_1,
                        GameSound.SKELETON_FOOTSTEP_2,
                        GameSound.SKELETON_FOOTSTEP_3,
                        GameSound.SKELETON_FOOTSTEP_4
                    },
                    run = {
                        GameSound.SKELETON_FOOTSTEP_1,
                        GameSound.SKELETON_FOOTSTEP_2,
                        GameSound.SKELETON_FOOTSTEP_3,
                        GameSound.SKELETON_FOOTSTEP_4
                    }
                });
            end);

            return;
        end;

        if u10:GetAttribute("MonsterType") == MonsterType.SKELETON_ARCHER then
            task.spawn(function() -- Line: 78
                -- upvalues: u7 (ref), u10 (copy), InventoryEntity (ref), ItemType (ref), ItemUtil (ref), WeldUtil (ref)
                task.wait(1);
                u7:setUpTeamColor(u10);

                if not InventoryEntity.new(u10) then
                    return nil;
                end;

                u10:WaitForChild("Humanoid");
                local v13 = u10:GetAttribute("BowType") or ItemType.WOOD_BOW;
                ItemUtil.createItemInstance(v13).Parent = u10;
                WeldUtil:weldCharacterAccessories(u10);
            end);
        end;
    end);
end;

function u4.setUpTeamColor(p14, p15) -- Line: 94
    -- upvalues: EntityUtil (copy), Players (copy)
    local v16 = EntityUtil:getEntity(Players.LocalPlayer);
    local v17 = p15:GetAttribute("Team");

    if v16 ~= nil then
        v16 = v16:getInstance():GetAttribute("Team");
    end;

    local v18 = v17 == v16;
    local v19;

    if v18 then
        v19 = Color3.fromRGB(74, 255, 186);
    else
        v19 = Color3.fromRGB(192, 53, 49);
    end;

    local v20;

    if v18 then
        v20 = Color3.fromRGB(163, 250, 164);
    else
        v20 = Color3.fromRGB(210, 99, 102);
    end;

    local v21 = p15:WaitForChild("3DClothing", 3);

    if v21 ~= nil then
        v21 = v21:WaitForChild("Head", 3);

        if v21 ~= nil then
            v21 = v21:WaitForChild("Neon", 3);
        end;
    end;

    v21.Color = v19;

    for _, descendant in v21:GetDescendants() do
        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = true;
            descendant.Color = ColorSequence.new(v19, v20);
        end;
    end;

    for _, descendant in p15:WaitForChild("TeamIndicator", 3):GetDescendants() do
        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = true;
            descendant.Color = ColorSequence.new(v19, v20);
        end;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;