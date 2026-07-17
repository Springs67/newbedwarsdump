-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ShopItemList = RuntimeLib.import(script, script.Parent, "shop-items", "shop-item-list").ShopItemList;
local BedwarsItemShopLeft = RuntimeLib.import(script, script.Parent, "shop-left", "shop-left").BedwarsItemShopLeft;
local ShopDisruptionTop = RuntimeLib.import(script, script.Parent, "toolbar", "shop-disruption-top").ShopDisruptionTop;
local ShopToolbar = RuntimeLib.import(script, script.Parent, "toolbar", "shop-toolbar").ShopToolbar;
local v4 = u2.Component:extend("BedwarsItemShopAppBase");

function v4.init(p5, p6) -- Line: 25
    -- upvalues: DeviceUtil (copy), BedwarsShop (copy), Players (copy)
    p5.alive = true;

    if not DeviceUtil.isHoarceKat() then
        p5:setState({
            selectedItem = BedwarsShop.getShop(Players.LocalPlayer, p5.props.shopId, true)[1]
        });
    end;
end;

function v4.didMount(u7) -- Line: 33
    -- upvalues: SoundManager (copy), GameSound (copy), DeviceUtil (copy), KnitClient (copy), getQueueMeta (copy), Players (copy), RuntimeLib (copy), Flamework (copy)
    SoundManager:playSound(GameSound.UI_OPEN);
    local v8 = false;

    if not DeviceUtil.isHoarceKat() then
        local v9 = KnitClient.Controllers.MatchController:getQueueType();
        v8 = v9 and getQueueMeta(v9).enableBedwarsShopAnywhere and true or v8;
    end;

    local LocalPlayer = Players.LocalPlayer;

    if LocalPlayer ~= nil then
        LocalPlayer = LocalPlayer.Character;
    end;

    if LocalPlayer then
        LocalPlayer = not v8;
    end;

    if LocalPlayer then
        local Position = Players.LocalPlayer.Character:GetPivot().Position;
        local shopId = u7.props.shopId;
        local u10;

        if shopId == "" or not shopId then
            u10 = nil;
        else
            u10 = KnitClient.Controllers.BedwarsShopController:getShopComponent(u7.props.shopId);
        end;

        RuntimeLib.Promise.defer(function() -- Line: 60
            -- upvalues: u7 (copy), Players (ref), Position (copy), Flamework (ref), u10 (ref), KnitClient (ref)
            while true do
                local v11 = task.wait(0.2);

                if v11 ~= 0 and (v11 == v11 and v11) then
                    v11 = u7.alive;
                end;

                if v11 == 0 or (v11 ~= v11 or not v11) then
                    return;
                end;

                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:GetPivot().Position;
                end;

                if Character == nil then
                    Character = Vector3.new();
                end;

                if (Character - Position).Magnitude > 6 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.props.AppId);
                end;

                local shopId2 = u7.props.shopId;

                if shopId2 ~= "" and shopId2 then
                    shopId2 = u10 and not KnitClient.Controllers.BedwarsShopController:getShopComponent(u7.props.shopId);
                end;

                if shopId2 ~= "" and shopId2 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.props.AppId);
                end;
            end;
        end);
    end;
end;

function v4.willUnmount(p12) -- Line: 94
    p12.alive = false;
end;

function v4.render(u13) -- Line: 97
    -- upvalues: u2 (copy), DarkBackground (copy), DeviceUtil (copy), ShopDisruptionTop (copy), Players (copy), Empty (copy), BedwarsItemShopLeft (copy), ShopToolbar (copy), ShopItemList (copy), EmptyButton (copy), SlideIn (copy)
    local v14 = {
        DisplayOrder = 20
    };
    local v15 = { u2.createElement(DarkBackground, {
            DisplayOrder = 20,
            AppId = u13.props.AppId
        }) };
    local v16 = {};
    local v17 = {
        Modal = true
    };
    local v18;

    if DeviceUtil.isSmallScreen() then
        v18 = UDim2.fromScale(0.825, 0.825);
    else
        v18 = UDim2.fromScale(0.775, 0.775);
    end;

    v17.Size = v18;
    v17.Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0 or 0.05);
    v17.AnchorPoint = Vector2.new(0.5, 0);
    local v19 = { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.8135652173913046
        }), u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder"
        }), u2.createElement(ShopDisruptionTop, {
            Size = UDim2.fromScale(1, 0.12)
        }) };
    local v20 = {};
    local v21 = UDim2;
    local v22;

    if DeviceUtil.isHoarceKat() then
        v22 = 1;
    else
        local v23 = Players.LocalPlayer:GetAttribute("DisruptionPriceIncrease");
        v22 = (v23 == 0 or (v23 ~= v23 or (v23 == "" or not v23))) and 1 or 0.88;
    end;

    v20.Size = v21.fromScale(1, v22);
    v19[#v19 + 1] = u2.createElement(Empty, v20, { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder"
        }), u2.createElement(BedwarsItemShopLeft, {
            SelectedItem = u13.state.selectedItem,
            Size = UDim2.fromScale(0.27, 1),
            Position = UDim2.fromScale(0.73, 0),

            SetSelectedShopItem = function(p24) -- Line: 148, Name: SetSelectedShopItem
                -- upvalues: u13 (copy), u2 (ref)
                u13:setState({
                    selectedItem = p24 or u2.None
                });
            end,

            ShopID = u13.props.shopId
        }), u2.createElement(Empty, {
            Size = UDim2.fromScale(0.73, 1)
        }, { u2.createElement("UIListLayout", {
                FillDirection = "Vertical"
            }), u2.createElement(ShopToolbar, {
                Size = UDim2.fromScale(1, 0.09),
                ObservedInventory = u13.props.ObservedInventory,
                IsHomeBase = u13.props.IsHomeBase
            }), u2.createElement(ShopItemList, {
                Size = UDim2.fromScale(1, 0.91),
                Position = UDim2.fromScale(0, 0.09),
                ShopID = u13.props.shopId,
                SelectedItem = u13.state.selectedItem,

                SetSelectedShopItem = function(p25) -- Line: 171, Name: SetSelectedShopItem
                    -- upvalues: u13 (copy), u2 (ref)
                    u13:setState({
                        selectedItem = p25 or u2.None
                    });
                end,

                ObservedInventory = u13.props.ObservedInventory,
                IsHomeBase = u13.props.IsHomeBase,
                QueueType = u13.props.QueueType
            }) }) });
    v16[#v16 + 1] = u2.createElement(EmptyButton, v17, v19);
    v15[#v15 + 1] = u2.createElement(SlideIn, {}, v16);

    return u2.createFragment({
        ItemShop = u2.createElement("ScreenGui", v14, v15)
    });
end;

return {
    BedwarsItemShopAppBase = v4,
    BedwarsItemShopApp = v3.connect(function(p26, p27) -- Line: 189
        local v28 = {
            ObservedInventory = p26.Inventory.observedInventory,
            QueueType = p26.Game.queueType
        };

        for i, v in p27 do
            v28[i] = v;
        end;

        return v28;
    end)(v4)
};