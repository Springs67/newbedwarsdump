-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getArmorTrimEffect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-definition").getArmorTrimEffect;
local ArmorTrimEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType;
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local ArmorTrimEffectRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;

return {
    ArmorTrimEffectButton = v3.new(u2)(function(u4) -- Line: 20
        -- upvalues: PlaceUtil (copy), ArmorTrimUtil (copy), ArmorTrimMeta (copy), getArmorTrimEffect (copy), ArmorTrimEffectType (copy), ArmorTrimEffectRank (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), Button (copy), ColorUtil (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy)
        local v5 = {};

        for i, v in u4 do
            v5[i] = v;
        end;

        v5.DefaultColor = nil;
        v5.SelectedKit = nil;
        v5.ArmorTrimType = nil;
        v5.ArmorTrimEffectRank = nil;
        local v7 = {
            OnClick = function() -- Line: 31, Name: OnClick
                -- upvalues: PlaceUtil (ref), ArmorTrimUtil (ref), u4 (copy), ArmorTrimMeta (ref), getArmorTrimEffect (ref), ArmorTrimEffectType (ref), ArmorTrimEffectRank (ref), KnitClient (ref), Flamework (ref), BedwarsAppIds (ref)
                if not PlaceUtil.isLobbyServer() then
                    return nil;
                end;

                if table.find(ArmorTrimUtil.BLACK_LISTED_ARMOR_TRIM_KITS, u4.SelectedKit) ~= nil then
                    return nil;
                end;

                local effects = ArmorTrimMeta[u4.ArmorTrimType].effects;

                if effects ~= nil then
                    effects = effects.definition;
                end;

                local v6;

                if effects == nil then
                    v6 = ArmorTrimEffectType.DEFAULT;
                else
                    v6 = getArmorTrimEffect(effects, u4.DefaultColor);
                end;

                KnitClient.Controllers.LockerPreviewController:openFullscreenPreview({
                    armorTrim = {
                        armorSet = "LEATHER",
                        type = u4.ArmorTrimType,
                        color = u4.DefaultColor,
                        effectRank = ArmorTrimEffectRank.T7,
                        effectType = v6
                    },
                    kit = u4.SelectedKit
                }, {
                    fromLocker = false,

                    onOpen = function() -- Line: 58, Name: onOpen
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                        KnitClient.Controllers.HotbarController:unmountHotbar();
                    end,

                    onClose = function() -- Line: 62, Name: onClose
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (ref), KnitClient (ref)
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ARMOR_TRIM_APP, {
                            SelectedKit = u4.SelectedKit
                        });
                        KnitClient.Controllers.LockerPreviewController:closePreview();
                    end
                });
            end
        };

        for i, v in v5 do
            v7[i] = v;
        end;

        return u2.createElement(Button, v7, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("Frame", {
                BackgroundTransparency = 0.75,
                ZIndex = 3,
                BackgroundColor3 = ColorUtil.BLACK,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.22, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    Image = BedwarsImageId.SPARKLE_SOLID,
                    Size = UDim2.fromScale(0.65, 0.65),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY
                }) }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Switch Effect",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }) });
    end)
};