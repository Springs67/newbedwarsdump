-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;

return {
    KitSkinCard = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: u2 (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy), DeviceUtil (copy), KnitClient (copy), ClientStore (copy), TweenService (copy), ColorUtil (copy), Theme (copy), BedwarsImageId (copy), KitViewport (copy), Empty (copy)
        local _ = p5.useState;
        local u6 = u2.createRef();
        local SelectedSkin = u4.SelectedSkin;

        if SelectedSkin then
            local variantOfSkin = BedwarsKitSkinMeta[u4.SelectedSkin].variantOfSkin;

            if variantOfSkin ~= nil then
                variantOfSkin = variantOfSkin.parentSkin;
            end;

            SelectedSkin = variantOfSkin == u4.Skin;
        end;

        local u7 = SelectedSkin and true or u4.SelectedSkin == u4.Skin;
        local v8 = u4.Skin == BedwarsKitSkin.DEFAULT;
        local u9;

        if u4.Skin then
            v8 = v8;

            if v8 then
                u9 = v8;
            elseif DeviceUtil.isHoarceKat() then
                u9 = table.find(u4.store.Bedwars.ownedKitSkins, u4.Skin) ~= nil;
            else
                u9 = KnitClient.Controllers.UnlockController:isKitSkinUnlocked(u4.Skin);
            end;
        else
            u9 = false;
        end;

        local u10;

        if u4.store.Bedwars.equippedKitSkins then
            u10 = u4.Skin == u4.store.Bedwars.equippedKitSkins[u4.Kit];
        else
            u10 = false;
        end;

        local v11 = {
            Size = UDim2.fromScale(0.25, 0.88),
            BackgroundTransparency = 1,

            [u2.Event.Activated] = function() -- Line: 57
                -- upvalues: u4 (copy), u9 (ref), u10 (ref), DeviceUtil (ref), ClientStore (ref), KnitClient (ref)
                u4.SetSelectedSkin(u4.Skin);

                if u9 and not u10 then
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
            end,

            [u2.Event.MouseEnter] = function() -- Line: 71
                -- upvalues: u6 (copy), TweenService (ref)
                TweenService:Create(u6:getValue(), TweenInfo.new(0.15), {
                    BackgroundTransparency = 1
                }):Play();
            end,

            [u2.Event.MouseLeave] = function() -- Line: 78
                -- upvalues: u7 (ref), u6 (copy), TweenService (ref)
                if u7 then
                    return nil;
                end;

                TweenService:Create(u6:getValue(), TweenInfo.new(0.15), {
                    BackgroundTransparency = 0.8
                }):Play();
            end
        };
        local v12 = {};
        local v13 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.03, 0)
        });
        local createElement = u2.createElement;
        local v14 = {
            Thickness = 1.5
        };
        local v15;

        if u7 then
            v15 = ColorUtil.WHITE;
        else
            v15 = Theme.textPrimary;
        end;

        v14.Color = v15;
        v14.Transparency = u10 and 0 or (u7 and 0 or 0.7);
        v12[1], v12[2] = v13, createElement("UIStroke", v14);
        v12.Dark_Overlay = u2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = u7 and 1 or 0.8,
            BorderSizePixel = 0,
            [u2.Ref] = u6,
            ZIndex = 3
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }) });
        local v16 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.93, 0.93)
        };
        local v17 = {};
        local v18 = #v17;
        local v19 = not u9 and u2.createFragment({
            Icon_Locked = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 4,
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(0.95, 0.05),
                Size = UDim2.fromScale(0.15, 0.15),
                Image = BedwarsImageId.LOCK_SOLID
            })
        });

        if v19 then
            v17[v18 + 1] = v19;
        end;

        local v20;

        if v8 then
            v20 = u2.createElement(KitViewport, {
                Kit = u4.Kit
            });
        else
            v20 = u2.createElement(KitViewport, {
                Kit = u4.Kit,
                Skin = u4.Skin
            });
        end;

        v17[#v17 + 1] = v20;
        v12[#v12 + 1] = u2.createElement(Empty, v16, v17);

        return u2.createElement("ImageButton", v11, v12);
    end)
};