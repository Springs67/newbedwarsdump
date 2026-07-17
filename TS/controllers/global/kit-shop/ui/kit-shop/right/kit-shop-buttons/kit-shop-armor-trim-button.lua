-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    KitShopArmorTrimButton = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: u2 (copy), Button (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), DeviceUtil (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), getBedwarsKitMeta (copy)
        local _ = p5.useState;

        return u2.createFragment({
            ArmorTrimButton = u2.createElement(Button, {
                BackgroundTransparency = 1,
                Selectable = true,
                Size = u4.Size,

                OnClick = function() -- Line: 22, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (copy)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ARMOR_TRIM_APP, {
                        SelectedKit = u4.SelectedKit
                    });
                end,

                LayoutOrder = u4.LayoutOrder
            }, {
                u2.createElement("UIStroke", {
                    Color = ColorUtil.hexColor(12077930),
                    Thickness = DeviceUtil.isSmallScreen() and 1 or 2
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1000, 0)
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScaleType = "Fit",
                    SizeConstraint = "RelativeYY",
                    Image = BedwarsImageId.SHIELD,
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.65, 0.65),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }),
                u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        Text = "Armor Trim",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }), u2.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = getBedwarsKitMeta(u4.SelectedKit).name,
                        Font = Enum.Font.SourceSansSemibold,
                        Limits = Vector2.new(300, 500)
                    }) })
            })
        });
    end)
};