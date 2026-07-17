-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ClanShopController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "ClanShopController";
    p3.clansRemotes = default.Client:GetNamespace("Clans");
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: KnitController (copy), ClientStore (copy)
    KnitController.KnitStart(p4);
    p4.clansRemotes:Get("ShopDataUpdate"):Connect(function(p5) -- Line: 30
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "ClanSetShopData",
            clanContributionCoins = p5.clanContributionCoins,
            weekPurchaseHistory = p5.weekPurchaseHistory
        });
    end);
end;

function u1.purchaseItem(p6, u7) -- Line: 38
    -- upvalues: SoundManager (copy), GameSound (copy), ClientStore (copy)
    local v8 = p6.clansRemotes:Get("ShopPurchase"):CallServerAsync(u7);
    v8:andThen(function(p9) -- Line: 40
        -- upvalues: SoundManager (ref), GameSound (ref), ClientStore (ref), u7 (copy)
        if p9.success then
            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
            local v10 = {};
            local clanContributionShop = ClientStore:getState().Clans.clanContributionShop;
            local v11;

            if clanContributionShop == nil then
                v11 = clanContributionShop;
            else
                v11 = clanContributionShop.weekPurchaseHistory;
            end;

            if v11 then
                v10 = {};
                local weekPurchaseHistory = clanContributionShop.weekPurchaseHistory;
                table.move(weekPurchaseHistory, 1, #weekPurchaseHistory, #v10 + 1, v10);
            end;

            table.insert(v10, {
                itemType = u7
            });
            ClientStore:dispatch({
                type = "ClanSetShopData",
                clanContributionCoins = p9.newBalance,
                weekPurchaseHistory = v10
            });
        end;
    end);

    return v8;
end;

function u1.requestClanShopData(p12) -- Line: 73
    -- upvalues: ClientStore (copy)
    local v13 = p12.clansRemotes:Get("RequestShopData"):CallServerAsync():expect();
    ClientStore:dispatch({
        type = "ClanSetShopData",
        clanContributionCoins = v13.clanContributionCoins,
        weekPurchaseHistory = v13.weekPurchaseHistory
    });

    return v13;
end;

KnitClient.CreateController(u1.new());

return nil;