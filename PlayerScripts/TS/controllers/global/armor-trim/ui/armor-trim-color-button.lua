-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v6 = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport-base");
local ArmorTrimPlayerViewportBase = v6.ArmorTrimPlayerViewportBase;
local DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = v6.DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION;

return {
    ArmorTrimColorButton = v4.new(u3)(function(u7) -- Line: 19
        -- upvalues: u2 (copy), u5 (copy), Flamework (copy), BedwarsAppIds (copy), u3 (copy), ArmorTrimPlayerViewportBase (copy), DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION (copy), Theme (copy), Button (copy), ColorUtil (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy)
        local v8 = {};

        for i, v in u7 do
            v8[i] = v;
        end;

        v8.OnColorSelected = nil;
        v8.DefaultColor = nil;
        v8.SelectedKit = nil;
        v8.ArmorTrimType = nil;
        v8.ArmorTrimEffectRank = nil;
        local v13 = {
            OnClick = function() -- Line: 31, Name: OnClick
                -- upvalues: u2 (ref), u5 (ref), Flamework (ref), BedwarsAppIds (ref), u3 (ref), ArmorTrimPlayerViewportBase (ref), u7 (copy), DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION (ref), Theme (ref)
                local u9 = u2.new();
                local u10 = u5.new();
                u9:GiveTask(u10);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.COLOR_PICKER_APP, {
                    Children = u3.createFragment({
                        ViewportCard = u3.createElement(ArmorTrimPlayerViewportBase, {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            ButtonMode = "ALWAYS_VISIBLE",
                            ColorSignal = u10,
                            SelectedKit = u7.SelectedKit,
                            ArmorTrimType = u7.ArmorTrimType,
                            ArmorTrimEffectRank = u7.ArmorTrimEffectRank,
                            StartingSelection = {
                                armorSet = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.armorSet,
                                displayMode = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.displayMode
                            },
                            ViewportProps = {
                                BackgroundTransparency = 0.5,
                                BackgroundColor3 = Theme.backgroundPrimary
                            }
                        })
                    }),
                    Color = u7.DefaultColor,

                    OnSelect = function(p11) -- Line: 56, Name: OnSelect
                        -- upvalues: u7 (ref), u9 (copy), Flamework (ref), BedwarsAppIds (ref)
                        local OnColorSelected = u7.OnColorSelected;

                        if OnColorSelected ~= nil then
                            OnColorSelected(p11);
                        end;

                        u9:DoCleaning();
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.COLOR_PICKER_APP);
                    end,

                    OnUpdateColor = function(p12) -- Line: 64, Name: OnUpdateColor
                        -- upvalues: u10 (copy)
                        u10:Fire(p12);
                    end,

                    OnClose = function() -- Line: 67, Name: OnClose
                        -- upvalues: u9 (copy), Flamework (ref), BedwarsAppIds (ref)
                        u9:DoCleaning();
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.COLOR_PICKER_APP);
                    end
                });
            end
        };

        for i, v in v8 do
            v13[i] = v;
        end;

        return u3.createElement(Button, v13, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u3.createElement("Frame", {
                BackgroundTransparency = 0.75,
                ZIndex = 3,
                BackgroundColor3 = ColorUtil.BLACK,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.22, 0)
                }), u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    Image = BedwarsImageId.PALETTE_SOLID,
                    ImageColor3 = u7.DefaultColor,
                    Size = UDim2.fromScale(0.65, 0.65),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY
                }) }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                    Text = "Switch Color",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }) });
    end)
};