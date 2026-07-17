-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = UDim2.fromScale(0.22, 0.2);
local u5 = UDim2.fromScale(0.8, 0.46);
local u6 = Vector2.new(0.5, 0.5);

return {
    FinalKillPopup = v3.new(u2)(function(p7, p8) -- Line: 18
        -- upvalues: u2 (copy), DeviceUtil (copy), SlideIn (copy), u4 (copy), u5 (copy), u6 (copy), Theme (copy), Empty (copy), IconButton (copy), BedwarsImageId (copy), KnitClient (copy), SoundManager (copy), GameSound (copy)
        local _ = p8.useState;
        local _ = p8.useEffect;

        return u2.createElement("ScreenGui", {
            DisplayOrder = 20,
            IgnoreGuiInset = DeviceUtil.isSmallScreen()
        }, { u2.createElement(SlideIn, {}, { u2.createElement("Frame", {
                    LayoutOrder = 1,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    Size = u4,
                    Position = u5,
                    AnchorPoint = u6,
                    BackgroundColor3 = Theme.backgroundSecondary
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }), u2.createElement(Empty, {
                        Size = UDim2.fromScale(0.99, 0.99),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 0),
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }),
                        Header = u2.createElement(Empty, {
                            LayoutOrder = 0,
                            Size = UDim2.new(1, 0, 0.12, 0)
                        }, { u2.createElement(IconButton, {
                                Size = UDim2.fromScale(1, 1),
                                Image = BedwarsImageId.X,
                                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                                Position = UDim2.fromScale(0.925, 0.9),
                                AnchorPoint = Vector2.new(0.5, 0.5),

                                OnClick = function() -- Line: 60, Name: OnClick
                                    -- upvalues: KnitClient (ref), SoundManager (ref), GameSound (ref)
                                    KnitClient.Controllers.FinalKillPopupController:hidePopup();
                                    SoundManager:playSound(GameSound.UI_CLOSE_2);
                                end
                            }) }),
                        u2.createElement(Empty, {
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0.89)
                        }, {
                            Textbox = u2.createElement("Frame", {
                                Size = UDim2.fromScale(0.95, 0.75),
                                BackgroundColor3 = Theme.backgroundPrimary,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5)
                            }, {
                                u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0.1, 0)
                                }),
                                TextWrapper = u2.createElement("Frame", {
                                    BackgroundTransparency = 1,
                                    BorderSizePixel = 0,
                                    Size = UDim2.fromScale(0.9, 0.9),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5)
                                }, { u2.createElement("TextLabel", {
                                        Text = "You have been eliminated but your team is still alive!\n\nYou can click <b>Play Again</b> now or wait for your team to finish the game to see what rewards you’ve earned.\n\nYou won’t lose any rewards by leaving the game early.",
                                        RichText = true,
                                        LineHeight = 1.05,
                                        TextScaled = true,
                                        BackgroundTransparency = 1,
                                        LayoutOrder = 1,
                                        Size = UDim2.fromScale(1, 1),
                                        TextColor3 = Color3.fromRGB(255, 255, 255),
                                        Font = Enum.Font.Arial,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                        TextYAlignment = Enum.TextYAlignment.Center
                                    }) })
                            })
                        })
                    }) }) }) });
    end)
};