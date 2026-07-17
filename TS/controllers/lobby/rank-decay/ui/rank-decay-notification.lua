-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    RankDecayNotification = function(u3) -- Line: 11, Name: RankDecayNotification
        -- upvalues: DeviceUtil (copy), RankMeta (copy), Theme (copy), u2 (copy), Empty (copy), Button (copy), SlideIn (copy)
        local v4 = DeviceUtil.isSmallScreen();
        local v5;

        if u3.rankDivision == nil then
            v5 = nil;
        else
            v5 = RankMeta[u3.rankDivision].image;
        end;

        local v6 = {
            DisplayOrder = 1600,
            ResetOnSpawn = false,
            IgnoreGuiInset = DeviceUtil.isSmallScreen()
        };
        local v7 = {};
        local v8 = {};
        local v9 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            Size = UDim2.fromScale(v4 and 0.85 or 0.6, v4 and 0.7 or 0.6),
            Position = UDim2.fromScale(0.5, 0.46),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local v10 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v11 = {
            Size = UDim2.fromScale(1, 0.9),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v12 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.015, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }) };
        local v13 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.38, 0.42)
        };
        local v14 = {};
        local v15 = #v14;
        local v16;

        if v5 == "" or not v5 then
            v16 = nil;
        else
            v16 = u2.createFragment({
                RankImage = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Image = v5,
                    ScaleType = Enum.ScaleType.Fit
                })
            });
        end;

        if v16 then
            v14[v15 + 1] = v16;
        end;

        v12.ImageWrapper = u2.createElement("Frame", v13, v14);
        v12.Textbox = u2.createElement("Frame", {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.8, 0.25),
            BackgroundColor3 = Theme.backgroundPrimary
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            TextWrapper = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.92, 0.92),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), u2.createElement("TextLabel", {
                    RichText = true,
                    LineHeight = 1.05,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 0.4),
                    Text = u3.title,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.Arial,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }), u2.createElement("TextLabel", {
                    RichText = true,
                    LineHeight = 1.05,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.9, 0.4),
                    Text = u3.body,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.Arial,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) })
        });
        v12[#v12 + 1] = u2.createElement(Empty, {
            LayoutOrder = 3,
            ZIndex = 2,
            Size = UDim2.fromScale(0.6, 0.1)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.015, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }),
            CloseRankDecay = u2.createElement(Button, {
                Text = "Close",
                ZIndex = 3,
                LayoutOrder = 1,
                CornerRadius = UDim.new(0.2, 0),
                Size = UDim2.fromScale(0.5, 0.9),
                TextLabel = {
                    ZIndex = 4,
                    Font = Enum.Font.ArialBold,
                    Size = UDim2.fromScale(0.9, 0.65),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                },
                BackgroundColor3 = Theme.backgroundError,

                OnClick = function() -- Line: 147, Name: OnClick
                    -- upvalues: u3 (copy)
                    local onClose = u3.onClose;

                    if onClose ~= nil then
                        onClose = onClose();
                    end;

                    return onClose;
                end
            })
        });
        v10[#v10 + 1] = u2.createElement(Empty, v11, v12);
        v8[#v8 + 1] = u2.createElement("Frame", v9, v10);
        v7[#v7 + 1] = u2.createElement(SlideIn, {}, v8);

        return u2.createElement("ScreenGui", v6, v7);
    end
};