-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;

return {
    KitDetailsKitSkinCard = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: u2 (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy), DeviceUtil (copy), KnitClient (copy), BedwarsImageId (copy), Flamework (copy), BedwarsAppIds (copy), BedwarsKit (copy), PlaceUtil (copy), ColorUtil (copy), ClientStore (copy), KitViewport (copy), Empty (copy)
        local _ = p5.useState;
        u2.createRef();
        local SelectedKitSkin = u4.SelectedKitSkin;

        if SelectedKitSkin then
            local variantOfSkin = BedwarsKitSkinMeta[u4.SelectedKitSkin].variantOfSkin;

            if variantOfSkin ~= nil then
                variantOfSkin = variantOfSkin.parentSkin;
            end;

            SelectedKitSkin = variantOfSkin == u4.Skin;
        end;

        local u6 = SelectedKitSkin and true or u4.SelectedKitSkin == u4.Skin;
        local v7 = u4.Skin == BedwarsKitSkin.DEFAULT;
        local u8;

        if u4.Skin then
            v7 = v7;

            if not v7 then
                if DeviceUtil.isHoarceKat() then
                    u8 = table.find(u4.store.Bedwars.ownedKitSkins, u4.Skin) ~= nil;
                else
                    u8 = KnitClient.Controllers.UnlockController:isKitSkinUnlocked(u4.Skin);
                end;
            end;
        else
            u8 = false;
        end;

        local u9;

        if u4.store.Bedwars.equippedKitSkins then
            u9 = u4.Skin == u4.store.Bedwars.equippedKitSkins[u4.Kit];
        else
            u9 = false;
        end;

        local v10 = {};

        for i, v in u4 do
            v10[i] = v;
        end;

        v10.Kit = nil;
        v10.Skin = nil;
        v10.SelectedKitSkin = nil;
        v10.SetSelectedKitSkin = nil;
        v10.store = nil;
        v10.Size = nil;
        local v11 = {};
        local v12;

        if u4.Size then
            if u6 then
                v12 = u4.Size + UDim2.fromOffset(u4.Size.X.Offset * 0.05, u4.Size.Y.Offset * 0.05);
            else
                v12 = u4.Size;
            end;
        else
            v12 = nil;
        end;

        v11.Size = v12;

        for i, v in v10 do
            v11[i] = v;
        end;

        local v13 = { (u2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                PaddingTop = UDim.new(0, 1)
            })) };
        local createElement = u2.createElement;
        local v21 = {
            Size = UDim2.fromScale(0.05, 0.05),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.95, 0.05),
            Image = BedwarsImageId.EYE_SOLID,
            BackgroundTransparency = 1,
            ImageTransparency = 0.2,
            ScaleType = Enum.ScaleType.Fit,

            [u2.Event.MouseEnter] = function(p14) -- Line: 101
                p14.ImageTransparency = 0;
            end,

            [u2.Event.MouseLeave] = function(p15) -- Line: 104
                p15.ImageTransparency = 0.2;
            end,

            [u2.Event.Activated] = function() -- Line: 107
                -- upvalues: KnitClient (ref), u4 (copy), BedwarsKitSkin (ref), u6 (ref), Flamework (ref), BedwarsAppIds (ref)
                local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
                local v16 = {
                    kit = u4.Kit
                };
                local v17;

                if u4.Skin == BedwarsKitSkin.DEFAULT then
                    v17 = BedwarsKitSkin.DEFAULT;
                elseif u6 then
                    v17 = u4.SelectedKitSkin;
                else
                    v17 = u4.Skin;
                end;

                v16.kitSkin = v17;
                LockerPreviewController:openFullscreenPreview(v16, {
                    onOpen = function() -- Line: 112, Name: onOpen
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                        KnitClient.Controllers.HotbarController:unmountHotbar();
                    end,

                    onClose = function() -- Line: 116, Name: onClose
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (ref), u6 (ref), KnitClient (ref)
                        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                        local KIT_DETAILS_APP = BedwarsAppIds.KIT_DETAILS_APP;
                        local v19 = {
                            SelectedKit = u4.Kit
                        };
                        local v20;

                        if u6 then
                            v20 = u4.SelectedKitSkin;
                        else
                            v20 = u4.Skin;
                        end;

                        v19.SelectedKitSkin = v20;
                        v18:openApp(KIT_DETAILS_APP, v19);
                        KnitClient.Controllers.LockerPreviewController:closePreview();
                    end
                });
            end
        };
        local v22;

        if u4.Kit == BedwarsKit.NONE then
            v22 = false;
        else
            v22 = PlaceUtil.isLobbyServer();
        end;

        v21.Visible = v22;
        v13.KitSkinPreviewButton = createElement("ImageButton", v21, { u2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(10, 10),
                MaxSize = Vector2.new(50, 50)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v23 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = ColorUtil.brighten(ColorUtil.BLACK, u6 and 0.2 or 0),
            BackgroundTransparency = u6 and 0.4 or 0.5,
            BorderSizePixel = 0,
            Selectable = true,

            [u2.Event.Activated] = function() -- Line: 145
                -- upvalues: u4 (copy), u8 (ref), u9 (ref), DeviceUtil (ref), ClientStore (ref), KnitClient (ref)
                u4.SetSelectedKitSkin(u4.Skin);

                if u8 and not u9 then
                    if DeviceUtil.isHoarceKat() then
                        ClientStore:dispatch({
                            type = "EquipKitSkin",
                            kit = u4.Kit,
                            kitSkin = u4.Skin
                        });

                        return;
                    end;

                    KnitClient.Controllers.KitSkinController:equipKitSkin(u4.Kit, u4.Skin);
                end;
            end
        };
        local v24 = {};
        local v25 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        });
        local createElement2 = u2.createElement;
        local v26 = {
            Thickness = 1,
            Transparency = 0.5
        };
        local v27;

        if u6 then
            v27 = Color3.fromRGB(204, 194, 61);
        else
            v27 = ColorUtil.WHITE;
        end;

        v26.Color = v27;
        v24[1], v24[2] = v25, createElement2("UIStroke", v26);
        local v28 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            Kit = u4.Kit
        };
        local v29;

        if v7 then
            v29 = nil;
        elseif u6 then
            v29 = u4.SelectedKitSkin;
        else
            v29 = u4.Skin;
        end;

        v28.Skin = v29;
        local v30 = {};
        local v31 = #v30;
        local v32 = not u8 and u2.createFragment({
            Icon_Locked = u2.createElement("Frame", {
                BackgroundTransparency = 0.5,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, {
                Icon_Locked = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.15, 0.15),
                    Image = BedwarsImageId.LOCK_SOLID,
                    ScaleType = Enum.ScaleType.Fit
                })
            })
        });

        if v32 then
            v30[v31 + 1] = v32;
        end;

        v24[#v24 + 1] = u2.createElement(KitViewport, v28, v30);
        v13[#v13 + 1] = u2.createElement("ImageButton", v23, v24);

        return u2.createElement(Empty, v11, v13);
    end)
};