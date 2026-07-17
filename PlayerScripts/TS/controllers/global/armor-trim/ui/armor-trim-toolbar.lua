-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ArmorTrimToolbar = v3.new(u2)(function(u4) -- Line: 10
        -- upvalues: u2 (copy), BedwarsKitMeta (copy), ColorUtil (copy), Button (copy), Theme (copy)
        return u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = u4.Size
        }, {
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }),
            u2.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.6, 1)
            }, { u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 0.8),
                    Text = BedwarsKitMeta[u4.SelectedKit].name .. " Armor Trim",
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.SourceSansBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) }),
            u2.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.4, 1)
            }, {
                ViewAllArmorTrimsButton = u2.createElement(Button, {
                    LayoutOrder = 2,
                    Text = u4.ViewAll and "<b>Return to Selection</b>" or "<b>View All Armor Trims</b>",
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(0.95, 0.5),
                    Size = UDim2.fromScale(0.6, 0.8),
                    BackgroundColor3 = Theme.backgroundPrimary,

                    OnClick = function() -- Line: 51, Name: OnClick
                        -- upvalues: u4 (copy)
                        u4.OnViewAll();
                    end
                })
            })
        });
    end)
};