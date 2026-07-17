-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local EnchantMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    EnchantItemFrame = v3.new(u2)(function(p4, p5) -- Line: 13
        -- upvalues: EnchantMeta (copy), ColorUtil (copy), u2 (copy), BedwarsImageId (copy), TweenService (copy), Theme (copy), TooltipContainer (copy), AutoSizedText (copy)
        local _ = p5.useState;
        local u6 = EnchantMeta[p4.Enchant];
        local BLACK = ColorUtil.BLACK;

        local function v7() -- Line: 17
            -- upvalues: u2 (ref), u6 (copy)
            return u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 10,
                Size = UDim2.fromScale(0.8, 0.8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = u6.image
            });
        end;

        local createElement = u2.createElement;
        local v10 = {
            Size = UDim2.fromScale(1, 1),
            Image = BedwarsImageId.STATUS_EFFECT_FRAME_2,
            ImageColor3 = BLACK,
            ImageTransparency = 0.3,
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            SizeConstraint = "RelativeYY",
            ZIndex = 10,

            [u2.Event.MouseEnter] = function(p8) -- Line: 37
                -- upvalues: TweenService (ref), Theme (ref)
                TweenService:Create(p8, TweenInfo.new(0.15), {
                    ImageColor3 = Theme.textPrimary
                }):Play();
            end,

            [u2.Event.MouseLeave] = function(p9) -- Line: 42
                -- upvalues: TweenService (ref), ColorUtil (ref)
                TweenService:Create(p9, TweenInfo.new(0.15), {
                    ImageColor3 = ColorUtil.BLACK
                }):Play();
            end
        };
        local v11 = {};
        local v12;

        if u6 then
            v12 = v7();
        else
            v12 = u6;
        end;

        v11[1], v11[2] = v12, u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
        TextSize = 26,
        Text = u6.name,
        Font = Enum.Font.SourceSansBold,
        Limits = Vector2.new(300, 60)
    }), u2.createElement(AutoSizedText, {
        TextSize = 24,
        Text = u6.description,
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(191, 191, 191),
        TextXAlignment = Enum.TextXAlignment.Left,
        Limits = Vector2.new(300, 150)
    }) });

        return createElement("ImageButton", v10, v11);
    end)
};