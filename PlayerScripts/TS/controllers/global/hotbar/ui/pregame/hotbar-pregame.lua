-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util");
local KitWithCustomWeapon = v5.KitWithCustomWeapon;
local WeaponType = v5.WeaponType;
local HotbarKitViewport = RuntimeLib.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport;
local WeaponViewport = RuntimeLib.import(script, script.Parent.Parent, "weapon-selection", "weapon-viewport").WeaponViewport;
local v25 = v3.new(u2)(function(p6, p7) -- Line: 24
    -- upvalues: u2 (copy), getQueueMeta (copy), KnitClient (copy), QueueType (copy), ClientStore (copy), BedwarsKit (copy), KitWithCustomWeapon (copy), DeviceUtil (copy), Button (copy), GameType (copy), Flamework (copy), BedwarsAppIds (copy), HotbarKitViewport (copy), Empty (copy), WeaponViewport (copy), WeaponType (copy), BedwarsImageId (copy)
    local _ = p7.useState;
    local _ = p7.useEffect;

    if p6.QueueType == nil then
        return u2.createFragment();
    end;

    local u8 = getQueueMeta(p6.QueueType);
    local v9 = p6.QueueType or KnitClient.Controllers.MatchController:getQueueType();
    local v10;

    if v9 == QueueType.CUSTOM_KIT_CREATION or v9 == QueueType.CUSTOM_KIT then
        v10 = false;
    else
        v10 = v9 ~= QueueType.TRAINING_ROOM;
    end;

    local weapon = ClientStore:getState().Bedwars.weapon;
    local v11 = KitWithCustomWeapon[ClientStore:getState().Bedwars.kit or BedwarsKit.NONE] == nil;
    local v12 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Modal = false,
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.7 or 0.5),
        Position = UDim2.fromScale(0.5, -0.5),
        AnchorPoint = Vector2.new(0.5, 1)
    };
    local v13 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 3)
        }) };
    local _ = #v13;
    local v14 = {
        LayoutOrder = 0,
        Size = UDim2.fromScale(1, 1)
    };
    local v15 = { u2.createElement(
            "UIListLayout",
            {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder"
            }
        ) };
    local v16 = #v15;
    local v17;

    if v10 then
        v17 = u2.createElement(Button, {
            Text = "<b>KITS</b>",
            LayoutOrder = 10,

            OnClick = function() -- Line: 70, Name: OnClick
                -- upvalues: u8 (copy), GameType (ref), KnitClient (ref), Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
                if u8.game == GameType.COMBINED_KIT then
                    KnitClient.Controllers.CombinedKitDraftController:mountUI();

                    return;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
                    SelectedKit = ClientStore:getState().Bedwars.kit
                });
            end,

            Size = UDim2.fromScale(0.28, 1)
        }, { u2.createElement(HotbarKitViewport, {
                store = p6.store,
                Size = UDim2.fromScale(1.5, 1.5),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.02, 0.48)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.795918367346939,
                DominantAxis = "Height"
            }) });
    else
        v17 = v10;
    end;

    if v17 then
        v15[v16 + 1] = v17;
    end;

    local v18 = #v15;

    if v10 then
        v10 = u2.createElement(Empty, {
            LayoutOrder = 10,
            Size = UDim2.fromScale(0.14, 1)
        });
    end;

    if v10 then
        v15[v18 + 1] = v10;
    end;

    local v19 = #v15;
    local enableWeapons = u8.enableWeapons;

    if enableWeapons then
        local v20 = {
            LayoutOrder = 10,
            Text = v11 and "<b>Weapons</b>" or "<b>Unavailable For Kit</b>",

            OnClick = function() -- Line: 109, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.WEAPON_SELECTION_APP, {});
            end,

            Size = UDim2.fromScale(0.28, 1),
            Interactable = v11
        };
        local v21 = {};
        local v22 = #v21;

        if v11 then
            local createElement = u2.createElement;
            local v23 = {
                WeaponType = weapon or WeaponType.SWORD,
                Size = UDim2.fromScale(0.4, 1.75),
                Position = UDim2.fromScale(-0.1, -0.8)
            };
            local v24;

            if v11 then
                v24 = nil;
            else
                v24 = BedwarsImageId.BLOCK_ICON;
            end;

            v23.image = v24;
            v11 = createElement(WeaponViewport, v23);
        end;

        if v11 then
            v21[v22 + 1] = v11;
        end;

        v21[#v21 + 1] = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.795918367346939,
            DominantAxis = "Height"
        });
        enableWeapons = u2.createElement(Button, v20, v21);
    end;

    if enableWeapons then
        v15[v19 + 1] = enableWeapons;
    end;

    v13.SpectatorBar = u2.createElement(Empty, v14, v15);

    return u2.createElement("ImageButton", v12, v13);
end);

return {
    HotbarPregame = v4.connect(function(p26, p27) -- Line: 141
        local v28 = {};

        for i, v in p27 do
            v28[i] = v;
        end;

        v28.store = p26;
        v28.QueueType = p26.Game.queueType;

        return v28;
    end)(v25)
};