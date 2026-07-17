-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local LabelledText = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    EquippedRow = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), Theme (copy), BedwarsImageId (copy), LabelledText (copy)
        local _ = p4.useState;
        local createElement = u1.createElement;
        local v5 = {
            BackgroundTransparency = 1,
            Size = p3.Size or UDim2.new(1, 0, 0, 100),
            LayoutOrder = p3.LayoutOrder
        };
        local v6 = { (u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            })) };
        local createElement2 = u1.createElement;
        local v7 = {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.35, 1)
        };
        local v8 = {};
        local createElement3 = u1.createElement;
        local v9 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.9, 0.9),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local v10 = {};
        local createElement4 = u1.createElement;
        local v11 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v12;

        if p3.None then
            v12 = UDim2.fromScale(0.7, 0.7);
        else
            v12 = UDim2.fromScale(0.95, 0.95);
        end;

        v11.Size = v12;
        local v13;

        if p3.None then
            v13 = BedwarsImageId.CANCEL;
        else
            v13 = p3.Image;
        end;

        v11.Image = v13;
        v11.ScaleType = Enum.ScaleType.Fit;
        local v14;

        if p3.None then
            v14 = Theme.textPrimary;
        else
            v14 = nil;
        end;

        v11.ImageColor3 = v14;
        v11.ImageTransparency = p3.None and 0.5 or 0;
        v10.EquipImage = createElement4("ImageLabel", v11);
        v10[1] = u1.createElement("UICorner", {
    CornerRadius = UDim.new(0.1, 0)
});
        v8.EquipImageWrapper = createElement3("Frame", v9, v10);
        v6.EquipImageSide = createElement2("Frame", v7, v8);
        v6.EquipInfoSide = u1.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.6, 0.9),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0.1, 0)
            }),
            u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0)
            }),
            EquipType = u1.createElement(LabelledText, {
                LayoutOrder = 0,
                ImageLeft = true,
                TextScale = 1,
                FrameProps = {
                    Size = UDim2.fromScale(1, 0.22)
                },
                Image = p3.Icon,
                ImageProps = {
                    ImageColor3 = Theme.textPrimary
                },
                Text = "<b>" .. p3.Type .. "</b>",
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                TextProps = {
                    TextColor3 = Theme.textPrimary
                },
                Padding = UDim.new(0, 1)
            }),
            EquipName = u1.createElement("TextLabel", {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.fromScale(1, 0.2),
                Text = p3.Name,
                TextColor3 = Theme.textSecondary,
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });

        return createElement("Frame", v5, v6);
    end)
};