-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FrostyHammerUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade;
local FrostyHammerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-util").FrostyHammerUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "FrostyHammerController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 39
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 43
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "FrostyHammerController";
    p6.maid = u2.new();
    p6.abilityMaid = u2.new();
    p6.isPreloaded = false;
end;

function u4.isRelevantItem(p7, p8) -- Line: 50
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.FROSTY_HAMMER;
end;

function u4.onEnable(u9, p10, p11) -- Line: 53
    -- upvalues: Flamework (copy), AbilityId (copy), ClientSyncEvents (copy), Players (copy), FrostyHammerUtil (copy), FrostyHammerUpgrade (copy)
    u9:setupYield(function() -- Line: 54
        -- upvalues: Flamework (ref), AbilityId (ref), ClientSyncEvents (ref), Players (ref), u9 (copy)
        local u12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.FROST_HAMMER_MENU, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = "rbxassetid://11831565831"
            }
        }):expect();
        local u14 = ClientSyncEvents.AbilityUsed:connect(function(p13) -- Line: 61
            -- upvalues: Players (ref), AbilityId (ref), u9 (ref)
            if p13.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            if p13.ability ~= AbilityId.FROST_HAMMER_MENU then
                return nil;
            end;

            u9:openUpgradeMenu();
        end);

        return function() -- Line: 70
            -- upvalues: u12 (copy), u14 (copy)
            u12.Destroy();
            u14:Destroy();
        end;
    end);
    local v15 = FrostyHammerUtil.getUpgradesFromHammer(Players.LocalPlayer);
    local v16 = v15[FrostyHammerUpgrade.STRENGTH];
    local v17 = v15[FrostyHammerUpgrade.SHIELD];

    if (v17 == nil and 0 or v17) >= 3 then
        u9:mountShieldAbility();
    end;

    if (v16 == nil and 0 or v16) >= 3 then
        u9:mountSlamAbility();
    end;
end;

function u4.onDisable(p18) -- Line: 99
    p18:unmountAbility();
    p18.maid:DoCleaning();
end;

function u4.KnitStart(u19) -- Line: 103
    -- upvalues: HandKnitController (copy), default (copy), Players (copy), InventoryUtil (copy), ItemType (copy), FrostyHammerUtil (copy), FrostyHammerUpgrade (copy), RandomUtil (copy), GameSound (copy), SoundManager (copy), KnitClient (copy)
    HandKnitController.KnitStart(u19);
    default.Client:Get("FrostyHammerUpgrade"):Connect(function(p20) -- Line: 105
        -- upvalues: u19 (copy), Players (ref), InventoryUtil (ref), ItemType (ref), FrostyHammerUtil (ref), FrostyHammerUpgrade (ref)
        u19:upgradeEffect(p20.player);

        if p20.player == Players.LocalPlayer then
            local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            if hand ~= ItemType.FROSTY_HAMMER then
                return nil;
            end;

            local v21 = FrostyHammerUtil.getUpgradesFromHammer(p20.player);
            local v22 = v21[FrostyHammerUpgrade.STRENGTH];
            local v23 = v21[FrostyHammerUpgrade.SHIELD];
            u19:unmountAbility();

            if (v23 == nil and 0 or v23) >= 3 then
                u19:mountShieldAbility();
            end;

            if (v22 == nil and 0 or v22) >= 3 then
                u19:mountSlamAbility();
            end;
        end;
    end);
    default.Client:Get("CollectCrystalIce"):Connect(function(u24, p25) -- Line: 140
        -- upvalues: RandomUtil (ref), GameSound (ref), SoundManager (ref), KnitClient (ref), ItemType (ref), Players (ref)
        local Character = u24.Character;
        RandomUtil.fromList({ GameSound.ICICLE_BREAK_1, GameSound.ICICLE_BREAK_2 });
        local v26 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(u24);

        if v26 ~= nil then
            v26 = v26.adetunde;

            if v26 ~= nil then
                v26 = v26.shieldSound;
            end;
        end;

        if v26 == nil then
            v26 = GameSound.FROST_SHIELD_SUMMON;
        end;

        SoundManager:playSound(v26, {
            rollOffMaxDistance = 220,
            position = p25
        });
        KnitClient.Controllers.ReceiveItemEffectController:playEffectForItems({
            {
                amount = 1,
                itemType = ItemType.FROST_CRYSTAL
            }
        }, p25, function() -- Line: 162
            -- upvalues: u24 (copy), Character (copy)
            local Character2 = u24.Character;

            if Character2 ~= Character then
                return nil;
            end;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.CFrame;
                end;
            end;

            return Character2;
        end, u24 == Players.LocalPlayer and "PlayLocally" or "PlayGlobally");
    end);
end;

function u4.openUpgradeMenu(p27) -- Line: 178
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.FROSTY_HAMMER_UPGRADES, {});
end;

function u4.mountShieldAbility(p28) -- Line: 181
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local u29 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.FROST_SHIELD, AbilityMeta[AbilityId.FROST_SHIELD].triggerConfig):expect();
    p28.abilityMaid:GiveTask(function() -- Line: 183
        -- upvalues: u29 (copy)
        u29.Destroy();
    end);
end;

function u4.mountSlamAbility(p30) -- Line: 187
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local u31 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.FROST_HAMMER_SLAM, AbilityMeta[AbilityId.FROST_HAMMER_SLAM].triggerConfig):expect();
    p30.abilityMaid:GiveTask(function() -- Line: 189
        -- upvalues: u31 (copy)
        u31.Destroy();
    end);
end;

function u4.unmountAbility(p32) -- Line: 193
    p32.abilityMaid:DoCleaning();
end;

function u4.upgradeEffect(p33, p34) -- Line: 196
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), EntityUtil (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local u35 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p34);

    if u35 ~= nil then
        u35 = u35.adetunde;
    end;

    if u35 ~= nil then
        u35 = u35.frostHammerUpgradeModel;

        if u35 ~= nil then
            u35 = u35:Clone();
        end;
    end;

    if u35 == nil then
        u35 = ReplicatedStorage.Assets.Effects.FrostHammerUpgrade:Clone();
    end;

    local Character = p34.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    if Character ~= nil then
        Character = Character + Character.LookVector.Unit * 3 - Vector3.new(0, 2, 0);
    end;

    if not Character then
        return nil;
    end;

    u35:PivotTo(Character);
    u35.Parent = Workspace;
    local u36 = p34 == Players.LocalPlayer;
    local u37 = EntityUtil:getEntity(p34);

    if u37 ~= nil then
        u37 = u37:getHandItemInstanceFromCharacter();

        if u37 ~= nil then
            u37 = u37:FindFirstChild("Handle");
        end;
    end;

    if u37 then
        u37.Transparency = 1;
        local Ice = u37:FindFirstChild("Ice");
        local Neon = u37:FindFirstChild("Neon");

        if Ice then
            Ice.Transparency = 1;
        end;

        if Neon then
            Neon.Transparency = 1;
        end;

        if u37 then
            u37.Transparency = 1;
        end;

        if Ice then
            local function _(p38) -- Line: 257
                if p38:IsA("Decal") then
                    p38.Transparency = 1;
                end;
            end;

            for i, child in Ice:GetChildren() do
                local _ = i - 1;

                if child:IsA("Decal") then
                    child.Transparency = 1;
                end;
            end;
        end;
    end;

    local u39 = ReplicatedStorage.Assets.Effects.RepairEnchantTableHammer:Clone();
    u39.Parent = p34.Character;
    WeldUtil:weldCharacterAccessories(p34.Character);
    local u40 = GameAnimationUtil:playAnimation(p34, AnimationType.FROSTY_HAMMER_UPGRADE);
    local HammerEffect = u35:FindFirstChild("Root"):FindFirstChild("HammerEffect");
    local u41 = nil;
    local v42;

    if u40 == nil then
        v42 = u40;
    else
        v42 = u40:GetMarkerReachedSignal("hammer_1"):Connect(function() -- Line: 277
            -- upvalues: HammerEffect (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref), u36 (copy), Character (copy), u41 (ref)
            if HammerEffect then
                EffectUtil:playEffects(HammerEffect:GetChildren(), nil);
            end;

            local ENCHANT_TABLE_REPAIR_HAMMER_1 = GameSound.ENCHANT_TABLE_REPAIR_HAMMER_1;
            local v43 = {};
            local v44;

            if u36 then
                v44 = nil;
            else
                v44 = Character;

                if v44 ~= nil then
                    v44 = v44.Position;
                end;
            end;

            v43.position = v44;
            SoundManager:playSound(ENCHANT_TABLE_REPAIR_HAMMER_1, v43);
            local v45 = u41;

            if v45 ~= nil then
                v45:Disconnect();
            end;
        end);
    end;

    local u46 = nil;
    local v47;

    if u40 == nil then
        v47 = u40;
    else
        v47 = u40:GetMarkerReachedSignal("hammer_2"):Connect(function() -- Line: 307
            -- upvalues: HammerEffect (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref), u36 (copy), Character (copy), u46 (ref)
            if HammerEffect then
                EffectUtil:playEffects(HammerEffect:GetChildren(), nil);
            end;

            local ENCHANT_TABLE_REPAIR_HAMMER_2 = GameSound.ENCHANT_TABLE_REPAIR_HAMMER_2;
            local v48 = {};
            local v49;

            if u36 then
                v49 = nil;
            else
                v49 = Character;

                if v49 ~= nil then
                    v49 = v49.Position;
                end;
            end;

            v48.position = v49;
            SoundManager:playSound(ENCHANT_TABLE_REPAIR_HAMMER_2, v48);
            local v50 = u46;

            if v50 ~= nil then
                v50:Disconnect();
            end;
        end);
    end;

    task.delay(2, function() -- Line: 335
        -- upvalues: u40 (copy), u35 (copy), u39 (copy), u37 (copy)
        local v51 = u40;

        if v51 ~= nil then
            v51:Stop();
        end;

        local v52 = u40;

        if v52 ~= nil then
            v52:Destroy();
        end;

        u35:Destroy();
        u39:Destroy();

        if u37 then
            local Ice = u37:FindFirstChild("Ice");
            local Neon = u37:FindFirstChild("Neon");

            if Ice then
                Ice.Transparency = 0;
            end;

            if Neon then
                Neon.Transparency = 0;
            end;

            if u37 then
                u37.Transparency = 0;
            end;

            if Ice then
                local function _(p53) -- Line: 360
                    if p53:IsA("Decal") then
                        p53.Transparency = 0;
                    end;
                end;

                for i, child in Ice:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Decal") then
                        child.Transparency = 0;
                    end;
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;