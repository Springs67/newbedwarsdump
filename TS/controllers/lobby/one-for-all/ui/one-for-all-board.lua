-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;

return {
    OneForAllBoard = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: u2 (copy), ColorUtil (copy), getBedwarsKitMeta (copy), Empty (copy), Countdown (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = {
            StudsOffsetWorldSpace = Vector3.new(0, -6, -4.5),
            ResetOnSpawn = false,
            MaxDistance = 200,
            Adornee = p4.Adornee,
            Size = UDim2.fromScale(6, 3)
        };
        local v7 = {};
        local _ = #v7;
        local v8 = {
            BorderSizePixel = 1,
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(26, 26, 31)
        };
        local v9 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIStroke", {
                Thickness = 3,
                Color = Color3.fromRGB(6, 6, 6)
            }) };
        local v10 = #v9;
        local v11;

        if p4.BedwarsKit == nil then
            v11 = false;
        else
            v11 = u2.createFragment({
                ActiveKitContainer = u2.createElement("Frame", {
                    LayoutOrder = 1,
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    Size = UDim2.fromScale(1, 0.5),
                    BackgroundColor3 = ColorUtil.WHITE
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }),
                    u2.createElement("UIGradient", {
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 208, 88)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 219, 126)) })
                    }),
                    KitImage = u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(-0.15, 0.4),
                        Size = UDim2.fromScale(3, 3),
                        ScaleType = Enum.ScaleType.Fit,
                        Image = getBedwarsKitMeta(p4.BedwarsKit).renderImage
                    }),
                    KitName = u2.createElement("TextLabel", {
                        TextScaled = true,
                        TextXAlignment = "Right",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.fromScale(0.925, 0.5),
                        Size = UDim2.fromScale(0.85, 0.8),
                        Text = getBedwarsKitMeta(p4.BedwarsKit).name,
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                    }, { u2.createElement("UIStroke", {
                            Transparency = 0.3,
                            Thickness = 2,
                            Color = ColorUtil.BLACK
                        }) })
                })
            });
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        local v12 = #v9;
        local v13;

        if p4.EndTime == 0 then
            v13 = false;
        else
            v13 = u2.createFragment({
                CountdownContainer = u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.75, 0.45),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.1, 0),
                        PaddingBottom = UDim.new(0.1, 0),
                        PaddingLeft = UDim.new(0.075, 0),
                        PaddingRight = UDim.new(0.075, 0)
                    }),
                    u2.createElement(
                        "UIListLayout",
                        {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Right",
                            SortOrder = "LayoutOrder"
                        }
                    ),
                    HelperLabel = u2.createElement("TextLabel", {
                        Text = "NEXT KIT IN",
                        TextScaled = true,
                        TextXAlignment = "Right",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.4),
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromRGB(255, 208, 88)
                    }),
                    u2.createElement(Countdown, {
                        EndTime = p4.EndTime,
                        TextLabel = {
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.6),
                            TextXAlignment = Enum.TextXAlignment.Right
                        },
                        CountdownConfig = {
                            seconds = true,
                            minutes = true,
                            hours = true
                        }
                    }, { u2.createElement("UIStroke", {
                            Thickness = 3,
                            Color = Color3.fromRGB(6, 6, 6)
                        }) })
                })
            });
        end;

        if v13 then
            v9[v12 + 1] = v13;
        end;

        v7.Container = u2.createElement("Frame", v8, v9);

        return u2.createFragment({
            OneForAllBoard = u2.createElement("BillboardGui", v6, v7)
        });
    end)
};