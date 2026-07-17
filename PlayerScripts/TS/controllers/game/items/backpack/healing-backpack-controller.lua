-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "HealingBackpckController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p6);
    p6.Name = "HealingBackpckController";
    p6.abilityMaid = u1.new();
end;

function u4.equip(u7) -- Line: 39
    -- upvalues: Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy)
    local u8 = true;
    u7.abilityMaid:GiveTask(function() -- Line: 41
        -- upvalues: u8 (ref)
        u8 = false;

        return u8;
    end);
    task.spawn(function() -- Line: 45
        -- upvalues: Flamework (ref), AbilityId (ref), getItemMeta (ref), ItemType (ref), u8 (ref), u7 (copy)
        local v9 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local HEALING_BACKPACK = AbilityId.HEALING_BACKPACK;
        local v10 = {};
        local v11 = {};
        local image = getItemMeta(ItemType.HEALING_BACKPACK).image;
        v11.icon = image == nil and "" or image;
        v10.abilityButton = v11;
        v10.abilityType = "MiscPrimary";
        local v12 = v9:enableAbility(HEALING_BACKPACK, v10):expect();

        if u8 then
            u7.abilityMaid:GiveTask(v12);

            return;
        end;

        v12.Destroy();
    end);
end;

function u4.unequip(p13) -- Line: 67
    p13.abilityMaid:DoCleaning();
end;

function u4.KnitStart(u14) -- Line: 70
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), InventoryUtil (copy), ItemType (copy), default (copy), u2 (copy), BedwarsImageId (copy), TweenService (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u14);
    ClientSyncEvents.AbilityUsed:connect(function(p15) -- Line: 72
        -- upvalues: AbilityId (ref), Players (ref), InventoryUtil (ref), ItemType (ref), default (ref)
        local v16;

        if p15.ability == AbilityId.HEALING_BACKPACK then
            v16 = p15.userCharacter == Players.LocalPlayer.Character;
        else
            v16 = false;
        end;

        if v16 then
            local backpack = InventoryUtil.getInventory(Players.LocalPlayer).backpack;

            if backpack ~= nil then
                backpack = backpack.itemType;
            end;

            v16 = backpack == ItemType.HEALING_BACKPACK;
        end;

        if v16 then
            default.Client:Get("HealingBackpackUsed"):SendToServer({
                player = Players.LocalPlayer
            });
        end;
    end);
    ClientSyncEvents.BackpackEquipEvent:connect(function(p17) -- Line: 87
        -- upvalues: Players (ref), ItemType (ref), u14 (copy)
        if p17.player == Players.LocalPlayer then
            if p17.item == ItemType.HEALING_BACKPACK then
                u14:equip();

                return;
            end;

            u14:unequip();
        end;
    end);
    default.Client:Get("HealingBackpackEffect"):Connect(function(p18) -- Line: 96
        -- upvalues: u2 (ref), BedwarsImageId (ref), TweenService (ref)
        local Character = p18.healer.Character;
        local Character2 = p18.target.Character;

        if not (Character and Character2) then
            return nil;
        end;

        local BodyFrontAttachment = Character:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
        local BodyFrontAttachment2 = Character2:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");

        if BodyFrontAttachment and BodyFrontAttachment2 then
            local u19 = u2("Beam", {
                TextureSpeed = 0.7,
                Width0 = 0,
                Width1 = 0,
                FaceCamera = true,
                Attachment0 = BodyFrontAttachment,
                Attachment1 = BodyFrontAttachment2,
                Texture = BedwarsImageId.WHITE_BEAM_ARROW,
                Color = ColorSequence.new(Color3.fromRGB(33, 247, 61)),
                Parent = BodyFrontAttachment
            });
            TweenService:Create(u19, TweenInfo.new(2), {
                Width0 = 2.5,
                Width1 = 1
            }):Play();
            task.delay(2, function() -- Line: 120
                -- upvalues: u19 (copy)
                u19:Destroy();
            end);
        end;
    end);
    default.Client:Get("HealingBackpackSound"):Connect(function(p20) -- Line: 125
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.HEALING_BACKPACK_USED, {
            rollOffMaxDistance = 45,
            volumeMultiplier = 0.5,
            position = p20.position
        });
    end);
end;

KnitClient.CreateController(u4.new());

return nil;