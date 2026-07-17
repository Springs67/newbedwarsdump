-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Lighting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getEmoteAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CloseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "close-button").CloseButton;
local KitSkinStoreList = RuntimeLib.import(script, script.Parent, "kit-skins", "kit-skin-store-list").KitSkinStoreList;
local AppNavbarVertical = RuntimeLib.import(script, script.Parent, "navbar", "app-navbar-vertical").AppNavbarVertical;
local RobuxStore = RuntimeLib.import(script, script.Parent, "robux-store").RobuxStore;
local UGCStoreList = RuntimeLib.import(script, script.Parent, "ugc-page", "ugc-store-list").UGCStoreList;
local v7 = {
    Id = "RobuxStore",
    Element = u4.createElement(RobuxStore, {
        AppId = "RobuxStore"
    })
};
local v8 = getEmoteAsset(EmoteType.LUCKY_GIFT);
v7.Icon = v8 == nil and "" or v8;
v7.Title = "Store";
v7.ElementProps = {
    FrameProps = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0)
    }
};
local u9 = {
    v7,
    {
        Id = "KitSkins",
        Title = "Kit Skins",
        Element = u4.createElement(KitSkinStoreList, {
            AppId = "KitSkinList",
            FrameProps = {
                Size = UDim2.fromScale(0.95, 1),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0, 0)
            }
        }),
        Icon = BedwarsImageId.DODO_WHISPER_KIT_RENDER
    },
    {
        Id = "UGC",
        Title = "UGC",
        Element = u4.createElement(UGCStoreList, {
            AppId = "UGCStoreList",
            FrameProps = {
                Size = UDim2.fromScale(0.95, 1),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0, 0)
            }
        }),
        Icon = BedwarsImageId.DODO_BIRD_SHOULDER_BUDDY_UGC_RENDER
    }
};
local v53 = v5.new(u4)(function(u10, p11) -- Line: 75
    -- upvalues: u9 (copy), u4 (copy), u2 (copy), u3 (copy), Lighting (copy), DeviceUtil (copy), KnitClient (copy), ColorUtil (copy), Padding (copy), Empty (copy), SlideIn (copy), ScaleComponent (copy), Theme (copy), ClientStore (copy), getBedwarsKitMeta (copy), getEmoteAsset (copy), EmoteType (copy), Flamework (copy), BedwarsAppIds (copy), AppNavbarVertical (copy), CloseButton (copy), EmptyButton (copy)
    local useEffect = p11.useEffect;
    local v12;

    if u10.DefaultPageId == "KitSkins" then
        v12 = u9[2];
    else
        v12 = u9[1];
    end;

    local u13, u14 = p11.useState(v12);
    local v15 = UDim2.fromOffset(820, 520);
    local u16 = u4.createRef();
    local u17 = u4.createRef();
    useEffect(function() -- Line: 82
        -- upvalues: u2 (ref), u3 (ref), Lighting (ref), DeviceUtil (ref), KnitClient (ref)
        local u18 = u2.new();
        local v19 = u3("BlurEffect", {
            Name = "UIBlurEffect",
            Parent = Lighting
        });
        v19.Size = 12;
        u18:GiveTask(v19);

        if not DeviceUtil.isHoarceKat() then
            KnitClient.Controllers.FovController:playUIOpenFOVTween();
            KnitClient.Controllers.HotbarController:hideHotbar("store-menu-app");
            KnitClient.Controllers.LobbyHudController:hideLobbyHud("store-menu-app");

            if DeviceUtil.isMobileControls() then
                KnitClient.Controllers.MobileUiController:hideUi("store-menu-app");
            end;
        end;

        return function() -- Line: 101
            -- upvalues: u18 (copy), DeviceUtil (ref), KnitClient (ref)
            u18:DoCleaning();

            if DeviceUtil.isMobileControls() then
                KnitClient.Controllers.MobileUiController:unhideUi("store-menu-app");
            end;

            KnitClient.Controllers.FovController:playUICloseFOVTween();
            KnitClient.Controllers.HotbarController:unhideHotbar("store-menu-app");
            KnitClient.Controllers.LobbyHudController:unhideLobbyHud("store-menu-app");
        end;
    end, {});

    local function u20() -- Line: 112
        -- upvalues: u13 (copy)
        return u13.Element;
    end;

    local function u26() -- Line: 115
        -- upvalues: DeviceUtil (ref), ColorUtil (ref), u4 (ref), u17 (copy), Padding (ref), u13 (copy), u20 (copy), Empty (ref)
        local v21 = {};
        local fromScale = UDim2.fromScale;
        DeviceUtil.isSmallScreen();
        v21.Size = fromScale(1, 1);
        v21.Position = UDim2.fromScale(0.5, 0);
        v21.AnchorPoint = Vector2.new(0.5, 0);
        local v22 = {};
        local _ = #v22;
        local v23 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            AutomaticCanvasSize = "Y",
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ScrollBarThickness = 4,
            ScrollBarImageTransparency = 0.3,
            ScrollBarImageColor3 = ColorUtil.WHITE,
            ClipsDescendants = false,
            [u4.Ref] = u17
        };
        local v24 = { u4.createElement(Padding, {
                Padding = {
                    Right = 16
                }
            }) };
        local v25 = {};
        local ElementProps = u13.ElementProps;

        if ElementProps then
            for i, v in ElementProps do
                v25[i] = v;
            end;
        end;

        v24[#v24 + 1] = u4.createElement(u20, v25);
        v22.ContentScrollingFrame = u4.createElement("ScrollingFrame", v23, v24);

        return u4.createFragment({
            Content = u4.createElement(Empty, v21, v22)
        });
    end;

    local function v27() -- Line: 155
        -- upvalues: u4 (ref), SlideIn (ref), u26 (copy)
        return u4.createElement(SlideIn, {
            TweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Cubic),
            StartPosition = UDim2.fromScale(0, 0.15)
        }, { u4.createElement(u26) });
    end;

    local v28 = {
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        [u4.Ref] = u16
    };
    local v29 = {
        DarkBackground = u4.createElement("Frame", {
            BackgroundTransparency = 0.1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, { u4.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 48)) })
            }) })
    };
    local _ = #v29;
    local v30 = {
        Modal = true,
        Size = v15,
        Position = UDim2.new(0.5, 0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v31 = { u4.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.8,
            MaximumSize = Vector2.new(v15.X.Offset * 2.25, v15.Y.Offset * 2.25),
            ScreenPadding = Vector2.new(24, 24)
        }), u4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.07, Theme.topBarGuiInset),
            PaddingBottom = UDim.new(0.04, 0)
        }) };
    local _ = #v31;
    local v32 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v33 = {};
    local v34 = #v33;
    local v35 = {};
    local v36 = {};
    local v37 = #v36;
    local v38 = #u9;
    table.move(u9, 1, v38, v37 + 1, v36);
    local v39 = {
        Id = "Kits"
    };
    local v40;

    if ClientStore:getState().Bedwars.kit then
        v40 = getBedwarsKitMeta(ClientStore:getState().Bedwars.kit).renderImage;
    else
        local v41 = getEmoteAsset(EmoteType.LUCKY_GIFT);
        v40 = v41 == nil and "" or v41;
    end;

    v39.Icon = v40;
    v39.Title = "Kits";
    v36[v37 + v38 + 1] = v39;
    v35.NavButtons = v36;
    v35.ActiveAppId = u13.Id;

    function v35.SetActiveAppId(u42) -- Line: 232
        -- upvalues: u9 (ref), u14 (copy), u17 (copy), Flamework (ref), BedwarsAppIds (ref), u13 (copy)
        local function _(p43) -- Line: 233
            -- upvalues: u42 (copy)
            return p43.Id == u42;
        end;

        local v44 = nil;

        for i, v in u9 do
            local _ = i - 1;

            if v.Id == u42 == true then
                v44 = v;
                break;
            end;
        end;

        if v44 then
            u14(v44);
        end;

        local u45 = u17:getValue();

        if u42 == "Kits" then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {});

            return;
        end;

        if u42 == "Daily" and u45 then
            local function u48(p46) -- Line: 253
                -- upvalues: u45 (copy)
                local v47 = u45;

                if v47 ~= nil then
                    v47 = v47:FindFirstChild(p46);
                end;

                if v47 then
                    u45.CanvasPosition = Vector2.new(0, v47.AbsolutePosition.Y - u45.AbsolutePosition.Y);
                end;
            end;

            if u13.Id == "RobuxStore" then
                local v49;

                if u45 == nil then
                    v49 = u45;
                else
                    v49 = u45:FindFirstChild("BedCoinsTitle");
                end;

                if v49 then
                    u45.CanvasPosition = Vector2.new(0, v49.AbsolutePosition.Y - u45.AbsolutePosition.Y);
                end;
            else
                local function _(p50) -- Line: 265
                    return p50.Id == "RobuxStore";
                end;

                local v51 = nil;

                for i, v in u9 do
                    local _ = i - 1;

                    if v.Id == "RobuxStore" == true then
                        v51 = v;
                        break;
                    end;
                end;

                if v51 then
                    u14(v51);
                    task.delay(1, function() -- Line: 280
                        -- upvalues: u48 (copy)
                        return u48("BedCoinsTitle");
                    end);
                end;
            end;
        end;
    end;

    v35.FrameProps = {
        Position = UDim2.fromScale(-0.085, 0.6),
        AnchorPoint = Vector2.new(0, 0.5)
    };
    v33[v34 + 1] = u4.createElement(AppNavbarVertical, v35);
    v33[v34 + 2] = u4.createElement(CloseButton, {
        OnClick = function() -- Line: 295, Name: OnClick
            -- upvalues: Flamework (ref), u10 (copy), u16 (copy), Lighting (ref), KnitClient (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u10.AppId);
            task.delay(3, function() -- Line: 297
                -- upvalues: u16 (ref), Lighting (ref), KnitClient (ref)
                if u16:getValue() then
                    local v52 = u16:getValue();

                    if v52 ~= nil then
                        v52:Destroy();
                    end;

                    local UIBlurEffect = Lighting:FindFirstChild("UIBlurEffect");

                    if UIBlurEffect ~= nil then
                        UIBlurEffect:Destroy();
                    end;

                    KnitClient.Controllers.FovController:playUICloseFOVTween();
                    KnitClient.Controllers.HotbarController:mountHotbar();
                    KnitClient.Controllers.LobbyHudController:mountLobbyHud();
                end;
            end);
        end,

        ButtonProps = {
            Position = UDim2.fromScale(1.02, 0),
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromScale(0.1, 0.1)
        }
    });
    v33.Content = u4.createElement(Empty, {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    }, { u4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0, 0),
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0.05, 0)
        }), u4.createElement(v27) });
    v31.Body = u4.createElement(Empty, v32, v33);
    v29.StoreApp = u4.createElement(EmptyButton, v30, v31);

    return u4.createElement("ScreenGui", v28, v29);
end);

return {
    StoreMenuApp = v6.connect(function(p54, p55) -- Line: 337
        local v56 = {};

        for i, v in p55 do
            v56[i] = v;
        end;

        return v56;
    end)(v53)
};