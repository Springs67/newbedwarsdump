-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v3.MarketplaceService;
local Players = v3.Players;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local BundleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local GiftType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local MilestoneRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "LobbyBundleController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "LobbyBundleController";
end;

function u4.KnitStart(u7) -- Line: 43
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), BundleType (copy), BedwarsKitSkin (copy)
    KnitController.KnitStart(u7);
    WatchCollectionTag("podium-purchase-prompt-1", function(p8) -- Line: 50
        -- upvalues: u7 (copy), BundleType (ref)
        u7:setupLobbyBundlePrompt(p8, BundleType.BEEKEEPER_BUNDLE, {
            maxActivationDistance = 15
        });
    end);
    WatchCollectionTag("podium-purchase-prompt-2", function(p9) -- Line: 55
        -- upvalues: u7 (copy), BedwarsKitSkin (ref)
        u7:setupKitSkinPrompt(p9, BedwarsKitSkin.TRINITY_ICECREAM, {
            MaxActivationDistance = 12
        });
    end);
end;

function u4.setupLobbyBundlePrompt(p10, p11, u12, u13) -- Line: 81
    -- upvalues: BundleMeta (copy), KnitClient2 (copy), Flamework (copy), BedwarsAppIds (copy), MarketplaceService (copy)
    local u14 = BundleMeta[u12];
    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v15 = {};
    local v16;

    if u13 == nil then
        v16 = u13;
    else
        v16 = u13.giftOnly;
    end;

    v15.ActionText = v16 and "Gift" or "Purchase";
    v15.ObjectText = u14.name;
    v15.HoldDuration = 0;
    local v17;

    if u13 == nil then
        v17 = u13;
    else
        v17 = u13.maxActivationDistance;
    end;

    v15.MaxActivationDistance = v17 == nil and 12 or v17;
    v15.RequiresLineOfSight = false;
    local v18;

    if u13 == nil then
        v18 = u13;
    else
        v18 = u13.promptConfig;
    end;

    if type(v18) == "table" then
        for i, v in v18 do
            v15[i] = v;
        end;
    end;

    v15.Parent = p11;
    ProximityPromptController:createProximityPrompt(v15).Triggered:Connect(function(p19) -- Line: 115
        -- upvalues: u12 (copy), u13 (copy), Flamework (ref), BedwarsAppIds (ref), u14 (copy), MarketplaceService (ref)
        local v20 = p19:GetAttribute("Purchased" .. u12);

        if not v20 then
            v20 = u13;

            if v20 ~= nil then
                v20 = v20.giftOnly;
            end;
        end;

        if v20 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                GiftType = u12
            });

            return;
        end;

        local gamepassId = u14.gamepassId;

        if gamepassId ~= 0 and (gamepassId == gamepassId and gamepassId) then
            MarketplaceService:PromptGamePassPurchase(p19, u14.gamepassId);

            return;
        end;

        local devProductId = u14.devProductId;

        if devProductId ~= 0 and (devProductId == devProductId and devProductId) then
            MarketplaceService:PromptProductPurchase(p19, u14.devProductId);
        end;
    end);
end;

function u4.setupBattlePassPrompt(p21, p22, p23) -- Line: 144
    -- upvalues: KnitClient2 (copy), getBattlePassMetadata (copy), BattlePassUtils (copy), ClientStore (copy), Flamework (copy), BedwarsAppIds (copy), GiftType (copy), MarketplaceService (copy)
    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v24 = {
        ActionText = "Purchase"
    };
    local name = getBattlePassMetadata(BattlePassUtils.BATTLE_PASS_SEASON).name;
    v24.ObjectText = name == nil and "Battle Pass" or name;
    v24.HoldDuration = 0;
    v24.MaxActivationDistance = 24;
    v24.RequiresLineOfSight = false;

    if type(p23) == "table" then
        for i, v in p23 do
            v24[i] = v;
        end;
    end;

    v24.Parent = p22;
    ProximityPromptController:createProximityPrompt(v24).Triggered:Connect(function(p25) -- Line: 165
        -- upvalues: BattlePassUtils (ref), ClientStore (ref), Flamework (ref), BedwarsAppIds (ref), GiftType (ref), MarketplaceService (ref)
        if not BattlePassUtils.isActiveBattlePassPaid() then
            return nil;
        end;

        if ClientStore:getState().BattlePass.paid then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                GiftType = GiftType.BattlePass
            });

            return;
        end;

        MarketplaceService:PromptGamePassPurchase(p25, BattlePassUtils.BATTLE_PASS_SEASON_GAMEPASS);
    end);
end;

function u4.setupKitPrompt(p26, p27, u28, p29) -- Line: 181
    -- upvalues: getBedwarsKitMeta (copy), KnitClient2 (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), MarketplaceService (copy)
    local u30 = getBedwarsKitMeta(u28);
    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v31 = {
        ActionText = "Purchase",
        HoldDuration = 0,
        MaxActivationDistance = 18,
        RequiresLineOfSight = false,
        ObjectText = u30.name .. " Kit"
    };

    if type(p29) == "table" then
        for i, v in p29 do
            v31[i] = v;
        end;
    end;

    v31.Parent = p27;
    ProximityPromptController:createProximityPrompt(v31).Triggered:Connect(function(p32) -- Line: 198
        -- upvalues: KnitClient (ref), u28 (copy), Flamework (ref), BedwarsAppIds (ref), u30 (copy), MarketplaceService (ref)
        if KnitClient.Controllers.UnlockController:isKitOwned(u28) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                GiftType = u28
            });

            return;
        end;

        local gamepassId = u30.gamepassId;

        if gamepassId ~= 0 and (gamepassId == gamepassId and gamepassId) then
            MarketplaceService:PromptGamePassPurchase(p32, u30.gamepassId);
        end;
    end);
end;

function u4.setupKitSkinPrompt(p33, p34, u35, p36) -- Line: 213
    -- upvalues: BedwarsKitSkinMeta (copy), KnitClient2 (copy), ClientStore (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), KitViewport (copy)
    local u37 = BedwarsKitSkinMeta[u35];
    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v38 = {
        ActionText = "Purchase",
        HoldDuration = 0,
        MaxActivationDistance = 24,
        RequiresLineOfSight = false,
        ObjectText = u37.name
    };

    if type(p36) == "table" then
        for i, v in p36 do
            v38[i] = v;
        end;
    end;

    v38.Parent = p34;
    ProximityPromptController:createProximityPrompt(v38).Triggered:Connect(function(p39) -- Line: 230
        -- upvalues: ClientStore (ref), u35 (copy), Flamework (ref), BedwarsAppIds (ref), u2 (ref), KitViewport (ref), u37 (copy), KnitClient2 (ref)
        local function _(p40) -- Line: 232
            -- upvalues: u35 (ref)
            return p40 == u35;
        end;

        local v41 = nil;

        for i, v in ClientStore:getState().Bedwars.ownedKitSkins do
            local _ = i - 1;

            if v == u35 == true then
                v41 = v;
                break;
            end;
        end;

        if v41 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                GiftType = u35,
                CustomImage = u2.createElement(KitViewport, {
                    SizeConstraint = "RelativeYY",
                    Kit = u37.kit,
                    Skin = u35,
                    Size = UDim2.fromScale(1, 1)
                })
            });

            return;
        end;

        if u37.kit then
            KnitClient2.Controllers.KitSkinController:purchaseKitSkin(u35, u37.kit);
        end;
    end);
end;

function u4.setupMilestonePrompt(p42, p43, u44, p45) -- Line: 264
    -- upvalues: MilestoneRewards (copy), KnitClient2 (copy), Flamework (copy), BedwarsAppIds (copy)
    local function _(p46) -- Line: 265
        -- upvalues: u44 (copy)
        return p46.id == u44;
    end;

    local v47 = nil;

    for i, v in MilestoneRewards do
        local _ = i - 1;

        if v.id == u44 == true then
            v47 = v;
            break;
        end;
    end;

    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v48 = {
        ActionText = "Open Milestones App",
        HoldDuration = 0,
        MaxActivationDistance = 18,
        RequiresLineOfSight = false,
        ObjectText = not v47 and "Free Reward" or v47.description
    };

    if type(p45) == "table" then
        for i, v in p45 do
            v48[i] = v;
        end;
    end;

    v48.Parent = p43;
    ProximityPromptController:createProximityPrompt(v48).Triggered:Connect(function(p49) -- Line: 295
        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.MILESTONES, {});
    end);
end;

function u4.purchaseBundle(p50, p51) -- Line: 299
    -- upvalues: BundleMeta (copy), MarketplaceService (copy), Players (copy)
    local v52 = BundleMeta[p51];
    local gamepassId = v52.gamepassId;

    if gamepassId ~= 0 and (gamepassId == gamepassId and gamepassId) then
        MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, v52.gamepassId);

        return;
    end;

    local devProductId = v52.devProductId;

    if devProductId ~= 0 and (devProductId == devProductId and devProductId) then
        MarketplaceService:PromptProductPurchase(Players.LocalPlayer, v52.devProductId);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;