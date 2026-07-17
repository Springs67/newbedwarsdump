-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedCoinProductList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "BedCoinProductPurchaseController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BedCoinProductPurchaseController";
end;

function u2.KnitStart(p5) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p5);
end;

function u2.purchase(p6, u7, u8) -- Line: 38
    -- upvalues: BedCoinProductList (copy), Flamework (copy), ClientStore (copy), BedwarsAppIds (copy), ColorUtil (copy), Theme (copy), StringUtil (copy), default (copy), SoundManager (copy), GameSound (copy), UILayers (copy)
    local u9 = BedCoinProductList.getProductInfo(u7.productId);

    if not u9 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "Product does not exist"
        });

        return nil;
    end;

    local u10 = ClientStore:getState().Bedwars.bedCoins >= u9.cost;
    local v11 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
    local v12 = {
        Title = "Confirm Purchase",
        Body = "Are you sure you want to purchase <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\"><b>[" .. u9.name .. "]</b></font> with <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\"><b>" .. StringUtil.formatNumberWithCommas(u9.cost) .. " Bed Coins</b></font>?"
    };
    local v13 = {
        Text = u10 and "PURCHASE" or "CAN\'T AFFORD"
    };
    local v14;

    if u10 then
        v14 = Theme.backgroundSuccess;
    else
        v14 = Theme.backgroundError;
    end;

    v13.BackgroundColor3 = v14;
    v12.PrimaryBtnProps = v13;
    v12.SecondaryBtnProps = {
        Text = "CANCEL"
    };

    function v12.OnPrimaryBtnClick() -- Line: 57
        -- upvalues: u10 (copy), default (ref), u7 (copy), SoundManager (ref), GameSound (ref), u8 (copy), Flamework (ref), StringUtil (ref), u9 (copy), ClientStore (ref)
        if u10 then
            default.Client:Get("PromptBedCoinPurchase"):CallServerAsync(u7):andThen(function() -- Line: 60
                -- upvalues: SoundManager (ref), GameSound (ref), u8 (ref)
                SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM);
                local v15 = u8;

                if v15 ~= nil then
                    v15();
                end;
            end):catch(function(p16) -- Line: 67
                print("[BED COIN PURCHASE] ", p16);
            end);

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "Not enough <b>Bed Coins</b>\n(Missing: " .. StringUtil.formatNumberWithCommas(u9.cost - ClientStore:getState().Bedwars.bedCoins) .. ")"
        });
    end;

    function v12.OnSecondaryBtnClick() -- Line: 76
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
    end;

    v11:openApp(CONFIRMATION_MODAL, v12);
end;

KnitClient.CreateController(u2.new());

return nil;