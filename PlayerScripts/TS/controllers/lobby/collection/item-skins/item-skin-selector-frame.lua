-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local CrateItemRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;

return {
    ItemSkinSelectorFrame = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: u2 (copy), getItemSkinMeta (copy), UserInputService (copy), UIUtil (copy), CrateItemRarity (copy), getCrateItemRarityMeta (copy), getItemMeta (copy), DeviceUtil (copy), BedwarsImageId (copy), RewardShowcase (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local v7 = u4.SelectedItemSkin == u4.ItemSkinType;
        local v8 = u4.EquipedItemSkin == u4.ItemSkinType;
        local v9;

        if u4.ItemSkinType then
            v9 = getItemSkinMeta(u4.ItemSkinType);
        else
            v9 = nil;
        end;

        useEffect(function() -- Line: 22
            -- upvalues: u4 (copy), UserInputService (ref), UIUtil (ref), u6 (copy)
            if u4.GamepadShouldAutoSelect and UserInputService.GamepadEnabled then
                UIUtil:selectGui(u6:getValue());
            end;
        end, {});
        local v10 = {
            Size = UDim2.fromScale(0.25, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = (v7 or v8) and 0.7 or 0.85,
            BorderSizePixel = 0,

            [u2.Event.Activated] = function() -- Line: 32
                -- upvalues: u4 (copy)
                u4.SetSelectedItemSkin(u4.ItemSkinType);
            end
        };
        local ImageButtonProps = u4.ImageButtonProps;

        if ImageButtonProps then
            for i, v in ImageButtonProps do
                v10[i] = v;
            end;
        end;

        v10[u2.Ref] = u6;
        local v11 = {};
        local v12 = #v11;

        if v7 then
            v7 = u2.createElement("UIStroke", {
                Thickness = 2,
                ZIndex = 10,
                Color = Color3.fromRGB(255, 255, 255),
                BorderStrokePosition = Enum.BorderStrokePosition.Inner
            });
        end;

        if v7 then
            v11[v12 + 1] = v7;
        end;

        local v13 = #v11;
        v11[v13 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement = u2.createElement;
        local v14 = {
            Rotation = -90
        };
        local new = ColorSequence.new;
        local v15 = {};
        local new2 = ColorSequenceKeypoint.new;
        local v16;

        if v8 then
            v16 = Color3.fromRGB(51, 255, 89);
        else
            v16 = Color3.fromRGB(96, 96, 96);
        end;

        local v17 = new2(0, v16);
        local new3 = ColorSequenceKeypoint.new;
        local v18;

        if v8 then
            v18 = Color3.fromRGB(51, 255, 89);
        else
            v18 = Color3.fromRGB(255, 255, 255);
        end;

        v15[1], v15[2] = v17, new3(1, v18);
        v14.Color = new(v15);
        v14.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) });
        v11[v13 + 2] = createElement("UIGradient", v14);
        local ItemSkinType = u4.ItemSkinType;

        if ItemSkinType then
            local v19 = {
                Size = UDim2.fromScale(1, 0.03),
                Position = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0, 1)
            };
            local rarity = getItemSkinMeta(u4.ItemSkinType).rarity;

            if rarity == nil then
                rarity = CrateItemRarity.ONE_STAR;
            end;

            v19.BackgroundColor3 = getCrateItemRarityMeta(rarity).gradient.colorTop;
            v19.BorderSizePixel = 0;
            v19.ZIndex = 1;
            ItemSkinType = u2.createFragment({
                RarityIndicator = u2.createElement("Frame", v19, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 12)
                    }) })
            });
        end;

        if ItemSkinType then
            v11[v13 + 3] = ItemSkinType;
        end;

        local v20;

        if u4.ItemSkinType then
            if DeviceUtil.isHoarceKat() then
                local v21 = {};

                if v9 ~= nil then
                    v9 = v9.renderImage;
                end;

                if v9 == nil then
                    v9 = BedwarsImageId.RANDOM_KIT_RENDER;
                end;

                v21.Image = v9;
                v21.Size = UDim2.fromScale(0.7, 0.7);
                v21.Position = UDim2.fromScale(0.5, 0.5);
                v21.AnchorPoint = Vector2.new(0.5, 0.5);
                v21.BackgroundTransparency = 1;
                v21.ImageTransparency = u4.IsOwned and 0 or 0.3;
                v20 = u2.createFragment({
                    StudioTestImage = u2.createElement("ImageLabel", v21, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                });
            else
                v20 = u2.createElement(RewardShowcase, {
                    Reward = {
                        itemSkin = u4.ItemSkinType
                    },
                    GroupTransparency = u4.IsOwned and 0 or 0.3
                });
            end;
        else
            v20 = u2.createFragment({
                DefaultSkin = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = getItemMeta(u4.BaseItemSkinType).image,
                    Size = UDim2.fromScale(0.7, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        end;

        v11[#v11 + 1] = v20;
        local v22 = #v11;

        if v8 then
            v8 = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.125, 0.125),
                Image = BedwarsImageId.CIRCLE_CHECK_SOLID,
                ImageColor3 = Color3.fromRGB(51, 255, 89),
                Position = UDim2.fromScale(0.925, 0.925),
                AnchorPoint = Vector2.new(1, 1)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v8 then
            v11[v22 + 1] = v8;
        end;

        local v23 = #v11;
        local v24 = not u4.IsOwned and u2.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.125, 0.125),
            Image = BedwarsImageId.LOCK_ART,
            Position = UDim2.fromScale(0.05, 0.925),
            AnchorPoint = Vector2.new(0, 1)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });

        if v24 then
            v11[v23 + 1] = v24;
        end;

        return u2.createFragment({
            ItemSkinFrame = u2.createElement("ImageButton", v10, v11)
        });
    end)
};