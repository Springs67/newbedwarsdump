-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local SeahorseUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "seahorse", "seahorse-util").SeahorseUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = { "rbxassetid://11902486870", "rbxassetid://11902487235", "rbxassetid://11902487139", "rbxassetid://11902486968" };

return {
    SeahorseDisplay = v3.new(u2)(function(p5, p6) -- Line: 12
        -- upvalues: SeahorseUtil (copy), u2 (copy), TooltipContainer (copy), AutoSizedText (copy), Theme (copy), Empty (copy), u4 (copy)
        local _ = p6.useState;
        local v7 = SeahorseUtil:getSeahorseLevelFromStackCount(p5.stacks);

        return u2.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2, 1)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.667
            }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Seahorse",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Limits = Vector2.new(300, 60)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = "Level " .. tostring(v7),
                    Font = Enum.Font.SourceSans,
                    TextColor3 = Theme.mcGold,
                    Limits = Vector2.new(300, 60)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = v7 == SeahorseUtil.MAX_SEAHORSE_LEVEL and "MAX LEVEL" or tostring(SeahorseUtil:getStacksNeededToLevel(p5.stacks)) .. " more stacks to level up",
                    Font = Enum.Font.SourceSans,
                    Limits = Vector2.new(300, 60)
                }) }), u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0, 2)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = u4[SeahorseUtil:getSeahorseLevelFromStackCount(p5.stacks) + 1]
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }), u2.createElement("TextLabel", {
                    Font = "LuckiestGuy",
                    TextScaled = true,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.8),
                    Text = tostring(p5.stacks),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1.3
                    }) }) }) });
    end)
};