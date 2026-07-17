-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u4 = { "LEATHER", "IRON", "DIAMOND", "EMERALD" };

return {
    ArmorTrimSwitchArmorTypeButton = v3.new(u2)(function(u5) -- Line: 12
        -- upvalues: u4 (copy), u2 (copy), Button (copy), ColorUtil (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy)
        local v6 = {};

        for i, v in u5 do
            v6[i] = v;
        end;

        v6.OnSwitchArmorSet = nil;
        v6.CurrentArmorSet = nil;
        local v7 = type(u5.ZIndex) ~= "number" and 1 or u5.ZIndex;
        local v9 = {
            OnClick = function() -- Line: 23, Name: OnClick
                -- upvalues: u5 (copy), u4 (ref)
                local v8 = (table.find(u4, u5.CurrentArmorSet or "LEATHER") or 0) - 1;
                u5.OnSwitchArmorSet(u4[((v8 < 0 and 0 or v8) + 1) % #u4 + 1]);
            end
        };

        for i, v in v6 do
            v9[i] = v;
        end;

        return u2.createElement(Button, v9, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("Frame", {
                BackgroundTransparency = 0.75,
                BackgroundColor3 = ColorUtil.BLACK,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ZIndex = v7 + 1
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.22, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = BedwarsImageId.SHIELD,
                    Size = UDim2.fromScale(0.65, 0.65),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    ZIndex = v7 + 2
                }) }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Switch Armor Type",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }) });
    end)
};