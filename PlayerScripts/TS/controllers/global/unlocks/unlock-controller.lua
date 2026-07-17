-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ConfigType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType;
local getConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local rankSkins = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rewards", "ranked-rewards-meta").rankSkins;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local UnlocksConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "unlocks", "unlocks-config").UnlocksConfig;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "UnlockController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "UnlockController";
    p4.allKitsUnlocked = false;
    p4.allKitSkinsUnlocked = false;
    p4.testerAccessRankedSkins = true;
end;

function u2.KnitStart(u5) -- Line: 38
    -- upvalues: default (copy), ClientStore (copy), KnitClient2 (copy), getConfig (copy), ConfigType (copy)
    default.Client:WaitFor("KitUpdate"):andThen(function(p6) -- Line: 40
        -- upvalues: ClientStore (ref), default (ref)
        p6:Connect(function(p7) -- Line: 41
            -- upvalues: ClientStore (ref)
            if p7.ownedKits then
                ClientStore:dispatch({
                    type = "AddOwnedKits",
                    kits = p7.ownedKits
                });
            end;

            if p7.ownedKitSkins then
                ClientStore:dispatch({
                    type = "SetOwnedKitSkins",
                    ownedKitSkins = p7.ownedKitSkins
                });
            end;

            if p7.useKitSkin ~= nil then
                ClientStore:dispatch({
                    type = "SetUseKitSkin",
                    useKitSkin = p7.useKitSkin
                });
            end;

            if p7.active then
                ClientStore:dispatch({
                    type = "SetBedwarsKit",
                    kit = p7.active.kit
                });
            end;

            if p7.activeKitSkins then
                ClientStore:dispatch({
                    type = "SetEquippedKitSkins",
                    equippedKitSkins = p7.activeKitSkins
                });
            end;
        end);
        default.Client:WaitFor("RequestKitUpdate"):andThen(function(p8) -- Line: 74
            p8:SendToServer();
        end);
    end);
    task.spawn(function() -- Line: 80
        -- upvalues: KnitClient2 (ref), getConfig (ref), ConfigType (ref), u5 (copy)
        KnitClient2.Controllers.PermissionController:waitForLocalPermissions();

        if KnitClient2.Controllers.PermissionController:hasAllKitsUnlocked() and getConfig(ConfigType.DisableOwningAllKits) ~= true then
            u5.allKitsUnlocked = true;
        end;

        if KnitClient2.Controllers.PermissionController:hasAllKitSkinsUnlocked() then
            u5.allKitSkinsUnlocked = true;
        end;
    end);
end;

function u2.isKitOwned(p9, p10) -- Line: 90
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), ClientStore (copy)
    local v11 = p10 == BedwarsKit.NONE and true or getBedwarsKitMeta(p10).freeKit;

    if not v11 then
        local ownedKits = ClientStore:getState().Bedwars.ownedKits;
        v11 = table.find(ownedKits, p10) ~= nil;
    end;

    return v11;
end;

function u2.isKitUnlocked(p12, p13) -- Line: 99
    -- upvalues: BedwarsKit (copy), KnitClient (copy), UnlocksConfig (copy)
    return (p13 == BedwarsKit.NONE or p13 == BedwarsKit.RANDOM) and true or (p12.allKitsUnlocked and true or (KnitClient.Controllers.KitController:isKitFree(p13) and true or (p12:isKitOwned(p13) and true or (KnitClient.Controllers.KitRentalController:isKitRented(p13) and true or (UnlocksConfig.isFreeKitsEventActive() and true or false)))));
end;

function u2.getUnlockedShopKits(u14) -- Line: 128
    -- upvalues: BedwarsKitShop (copy)
    local ShopKits = BedwarsKitShop.ShopKits;

    if u14.allKitsUnlocked then
        return ShopKits;
    end;

    local function _(p15) -- Line: 134
        -- upvalues: u14 (copy)
        return u14:isKitUnlocked(p15);
    end;

    local v16 = 0;
    local v17 = {};

    for i, v in ShopKits do
        local _ = i - 1;

        if u14:isKitUnlocked(v) == true then
            v16 = v16 + 1;
            v17[v16] = v;
        end;
    end;

    return v17;
end;

function u2.isKitSkinOwned(p18, p19) -- Line: 150
    -- upvalues: ClientStore (copy)
    local ownedKitSkins = ClientStore:getState().Bedwars.ownedKitSkins;

    return table.find(ownedKitSkins, p19) ~= nil;
end;

function u2.isKitSkinUnlocked(p20, p21) -- Line: 155
    -- upvalues: rankSkins (copy), KnitClient2 (copy)
    local v22 = p20:isKitSkinOwned(p21);
    local allKitSkinsUnlocked = p20.allKitSkinsUnlocked;
    local v23 = table.find(rankSkins, p21) ~= nil;

    if v23 and not v22 then
        allKitSkinsUnlocked = false;
    end;

    if v23 then
        local v24 = KnitClient2.Controllers.PermissionController:canTesterAccessRankedSkins() and p20.testerAccessRankedSkins and true or allKitSkinsUnlocked;
        allKitSkinsUnlocked = KnitClient2.Controllers.PermissionController:hasPermission("ranked_skins_bypass") and true or v24;
    end;

    return v22 or allKitSkinsUnlocked;
end;

return {
    UnlockController = KnitClient.CreateController(u2.new())
};