-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CreateMatchHud = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: u2 (copy), TweenService (copy), DeviceUtil (copy), ColorUtil (copy), Empty (copy), Theme (copy), CircularSpinner (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local mapImage = p4.mapImage;
        local message = p4.message;
        useEffect(function() -- Line: 23
            -- upvalues: TweenService (ref), u6 (copy), DeviceUtil (ref)
            TweenService:Create(u6:getValue(), TweenInfo.new(0.12), {
                Size = UDim2.new(0.4, 0, DeviceUtil.isSmallScreen() and 0.09 or 0.065, 0)
            }):Play();
        end, {});

        return u2.createFragment({
            CreateMatchHud = u2.createElement("ScreenGui", {
                DisplayOrder = 1000
            }, { u2.createElement("Frame", {
                    [u2.Ref] = u6,
                    Size = UDim2.fromScale(0.4, 0),
                    Position = UDim2.fromScale(0.5, 0.01),
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundColor3 = ColorUtil.hexColor(6580135),
                    BorderSizePixel = 0
                }, {
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 7.372093023255814,
                        DominantAxis = "Height"
                    }),
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 5)
                    }),
                    u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.04, 0),
                        PaddingRight = UDim.new(0.04, 0)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.1, 0)
                    }),
                    LeftSection = u2.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.7, 1)
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Left",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.04, 0)
                        }), u2.createElement("ImageLabel", {
                            SizeConstraint = "RelativeYY",
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            ScaleType = "Crop",
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(0.7, 0.7),
                            Image = mapImage
                        }), u2.createElement("Frame", {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.8, 0.8)
                        }, {
                            u2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0.06, 0),
                                PaddingTop = UDim.new(0.08, 0),
                                PaddingBottom = UDim.new(0.08, 0)
                            }),
                            u2.createElement("UIListLayout", {
                                FillDirection = "Vertical",
                                VerticalAlignment = "Center"
                            }),
                            u2.createElement("TextLabel", {
                                Font = "Roboto",
                                RichText = true,
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                TextXAlignment = "Left",
                                Text = message == nil and "Creating Custom Match" or message,
                                TextColor3 = Color3.fromRGB(255, 255, 255),
                                Size = UDim2.fromScale(1, 0.6)
                            }),
                            u2.createElement("TextLabel", {
                                Font = "Roboto",
                                RichText = true,
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                TextXAlignment = "Left",
                                Text = "<b>" .. p4.mapName .. "</b>",
                                TextColor3 = Theme.mcAqua,
                                Size = UDim2.fromScale(1, 0.4)
                            })
                        }) }),
                    u2.createElement(CircularSpinner, {
                        SizeConstraint = "RelativeYY",
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.5, 0.5)
                    })
                }) })
        });
    end)
};