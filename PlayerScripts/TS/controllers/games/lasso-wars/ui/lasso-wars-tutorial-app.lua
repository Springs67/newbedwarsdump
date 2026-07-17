-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local LassoWarsTutorialBulletText = RuntimeLib.import(script, script.Parent, "lasso-wars-tutorial-bullet-text").LassoWarsTutorialBulletText;
local v7 = v3.new(u2)(function(p5, p6) -- Line: 13
    -- upvalues: u2 (copy), DarkBackground (copy), Flamework (copy), BedwarsAppIds (copy), SlideIn (copy), ColorUtil (copy), LassoWarsTutorialBulletText (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;

    return u2.createFragment({
        LassoWarsTutorialApp = u2.createElement("ScreenGui", {
            DisplayOrder = 11
        }, { u2.createElement(DarkBackground, {
                AppId = p5.AppId,
                ImageButtonProps = {
                    ZIndex = -99
                },

                OnClick = function() -- Line: 25, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.LASSO_WARS_TUTORIAL_APP);

                    return false;
                end
            }), u2.createElement(SlideIn, {}, { u2.createElement("ImageButton", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.5, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, {
                    OuterBackground = u2.createElement("Frame", {
                        BackgroundTransparency = 0,
                        LayoutOrder = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromHex("#AC714A"),
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        u2.createElement("UIStroke", {
                            Thickness = 3,
                            Color = Color3.fromHex("#3A160E")
                        }),
                        u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 10)
                        }),
                        InnerBackground = u2.createElement("Frame", {
                            LayoutOrder = 1,
                            BorderSizePixel = 0,
                            BackgroundTransparency = 0,
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = Color3.fromHex("#C3976A"),
                            Size = UDim2.fromScale(0.95, 0.95)
                        }, {
                            u2.createElement("UIStroke", {
                                Thickness = 3,
                                Color = Color3.fromHex("#924A36")
                            }),
                            u2.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 10)
                            }),
                            u2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical,
                                VerticalAlignment = Enum.VerticalAlignment.Top,
                                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }),
                            u2.createElement("TextLabel", {
                                BackgroundTransparency = 1,
                                Text = "Lasso Wars Info",
                                TextScaled = true,
                                TextStrokeTransparency = 0.2,
                                LayoutOrder = 0,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.1),
                                Size = UDim2.fromScale(1, 0.2),
                                TextColor3 = ColorUtil.WHITE,
                                Font = Enum.Font.SourceSansBold,
                                TextXAlignment = Enum.TextXAlignment.Center,
                                TextYAlignment = Enum.TextYAlignment.Center
                            }),
                            u2.createElement(LassoWarsTutorialBulletText, {
                                text = "First team to 30 kills wins"
                            }),
                            u2.createElement(LassoWarsTutorialBulletText, {
                                text = "You can lasso your teammates"
                            }),
                            u2.createElement(LassoWarsTutorialBulletText, {
                                text = "Grapple to hooks with your lasso"
                            }),
                            u2.createElement(LassoWarsTutorialBulletText, {
                                text = "If you and a teammate pull an enemy from opposite sides simultaneously something cool will happen"
                            })
                        })
                    })
                }) }) })
    });
end);

return {
    LassoWarsTutorialApp = v4.connect(function(p8, p9) -- Line: 109
        local v10 = {};

        for i, v in p9 do
            v10[i] = v;
        end;

        return v10;
    end)(v7)
};