-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v1.MarketplaceService;
local Players = v1.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local getPlayerKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPlayerKitSkin;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "KitSkinController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "KitSkinController";
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p5);
end;

function u2.equipKitSkin(p6, p7, p8) -- Line: 37
    -- upvalues: default (copy), ClientStore (copy), SoundManager (copy), GameSound (copy)
    default.Client:Get("BedwarsEquipKitSkin"):CallServerAsync({
        kit = p7,
        kitSkin = p8
    }):andThen(function() -- Line: 42
    end):catch(function(p9) -- Line: 43
        warn(p9);
    end);
    ClientStore:dispatch({
        type = "EquipKitSkin",
        kit = p7,
        kitSkin = p8
    });
    SoundManager:playSound(GameSound.ARMOR_UNEQUIP);
end;

function u2.purchaseKitSkin(p10, p11, p12) -- Line: 53
    -- upvalues: ClientStore (copy), Flamework (copy), getBedwarsKitMeta (copy), BedwarsKitSkinMeta (copy), MarketplaceService (copy), Players (copy)
    local ownedKits = ClientStore:getState().Bedwars.ownedKits;
    local v13 = table.find(ownedKits, p12) ~= nil;

    if not v13 and p12 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You can only purchase this kit skin if you own the " .. getBedwarsKitMeta(p12).name .. " kit."
        });

        return nil;
    end;

    if not v13 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You can only purchase this kit skin if you own the kit."
        });

        return nil;
    end;

    local v14 = BedwarsKitSkinMeta[p11];
    local product = v14.product;

    if product ~= nil then
        product = product.devProductId;
    end;

    if product ~= nil then
        local product2 = v14.product;

        if product2 ~= nil then
            product2 = product2.devProductId;
        end;

        MarketplaceService:PromptProductPurchase(Players.LocalPlayer, product2);
    end;
end;

function u2.getKitSkin(p15, p16) -- Line: 83
    -- upvalues: getPlayerKitSkin (copy)
    return getPlayerKitSkin(p16);
end;

function u2.getPlayerKitSkinMeta(p17, p18) -- Line: 86
    -- upvalues: BedwarsKitSkinMeta (copy)
    return BedwarsKitSkinMeta[p17:getKitSkin(p18)];
end;

function u2.getCharacterKitSkinMeta(p19, p20) -- Line: 90
    -- upvalues: BedwarsKitSkinMeta (copy)
    return BedwarsKitSkinMeta[p19:getKitSkin(p20)];
end;

function u2.isUsingKitSkinModel(p21, p22) -- Line: 94
    return p22:GetAttribute("UsingKitSkinModel") == true;
end;

function u2.ownsKitSkin(p23, p24) -- Line: 97
    -- upvalues: ClientStore (copy)
    local ownedKitSkins = ClientStore:getState().Bedwars.ownedKitSkins;

    return table.find(ownedKitSkins, p24) ~= nil;
end;

KnitClient.CreateController(u2.new());

return nil;