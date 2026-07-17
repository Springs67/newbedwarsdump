-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local HalloweenAbilityTreeChoices = RuntimeLib.import(script, script.Parent, "halloween-ability-tree-choices").HalloweenAbilityTreeChoices;

return {
    HalloweenAbilityTreeChoiceArea = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), SlideIn (copy), DeviceUtil (copy), BedwarsImageId (copy), ColorUtil (copy), HalloweenAbilityTreeChoices (copy)
        local _ = p5.useState;
        local createElement = u2.createElement;
        local v6 = {};
        local v7 = {};
        local createElement2 = u2.createElement;
        local v8 = {
            BackgroundTransparency = 0.05,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.fromScale(0.5, 1)
        };
        local v9;

        if DeviceUtil.isMobileControls() then
            v9 = UDim2.fromScale(0.6, -2);
        else
            v9 = UDim2.fromScale(1.2, -0.2);
        end;

        v8.Position = v9;
        v8.BackgroundColor3 = Color3.fromHex("#1a1c1e");
        v7.HalloweenChoiceArea = createElement2("Frame", v8, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }),
            u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ImageTransparency = 0.92,
                Image = "rbxassetid://13667765121",
                Size = UDim2.fromScale(1, 1)
            }),
            u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ImageTransparency = 0,
                Size = UDim2.fromScale(0.08, 0.18),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 1),
                ImageColor3 = Color3.fromHex("#2f2f2d"),
                Image = BedwarsImageId.TRIANGLE_DOWN
            }),
            HalloweenChoiceTitle = u2.createElement("Frame", {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0, 0),
                Size = UDim2.fromScale(1, 0.35),
                Position = UDim2.fromScale(0, 0),
                BackgroundColor3 = Color3.fromHex("#2f2f2d")
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), u2.createElement("TextLabel", {
                    Text = "Select an Upgrade",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextStrokeTransparency = 1,
                    TextScaled = true,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.8, 0.8),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Font = Enum.Font.ArialBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new(Color3.fromHex("#F2F3F2"), Color3.fromHex("#C9CaC9"))
                    }) }) }),
            u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0, 0),
                Size = UDim2.fromScale(1, 0.65),
                Position = UDim2.fromScale(0, 0.35)
            }, {
                u2.createElement(HalloweenAbilityTreeChoices, {
                    Size = UDim2.fromScale(0.48, 1),
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    onSelected = p4.onSelected,
                    halloweenAbilityType = p4.halloweenAbilityOne,
                    level = p4.level,
                    Hotkeys = {
                        Display = "RIGHT",
                        PC = Enum.KeyCode.X
                    }
                }),
                u2.createElement(HalloweenAbilityTreeChoices, {
                    Rotation = 180,
                    Size = UDim2.fromScale(0.48, 1),
                    Position = UDim2.fromScale(0, 0),
                    AnchorPoint = Vector2.new(0, 0),
                    onSelected = p4.onSelected,
                    halloweenAbilityType = p4.halloweenAbilityTwo,
                    level = p4.level,
                    Hotkeys = {
                        Display = "LEFT",
                        PC = Enum.KeyCode.Z
                    }
                }),
                HalloweenLevelCircleBackground = u2.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.12, 0.8),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Color3.fromHex("#aa7c47")
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), u2.createElement("UIStroke", {
                        Thickness = 1,
                        Color = Color3.fromHex("#1d1a1e")
                    }) }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0,
                    ZIndex = 2,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.3, 1.6),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = BedwarsImageId.MISSION_TICKET_GLOW
                }),
                HalloweenLevelCircle = u2.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 4,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.1, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Color3.fromHex("#1d1a1e")
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextStrokeTransparency = 0,
                        TextScaled = true,
                        ZIndex = 5,
                        Text = tostring(p4.level),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.7, 0.7),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Font = Enum.Font.ArialBold,
                        TextStrokeColor3 = Color3.fromHex("#aa7c47"),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextColor3 = Color3.fromHex("#f6cd8e")
                    }) })
            })
        });

        return createElement(SlideIn, v6, v7);
    end)
};