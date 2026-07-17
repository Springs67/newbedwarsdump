-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GameUpdateCard = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: Theme (copy), u2 (copy), DeviceUtil (copy), BedwarsImageId (copy), ColorUtil (copy), DividerComponent (copy)
        local _ = p5.useState;
        local v6 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            AutomaticSize = "Y",
            BackgroundColor3 = Theme.backgroundTertiary,
            Size = p4.Size,
            LayoutOrder = p4.LayoutOrder
        };
        local v7 = {};
        local v8 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement = u2.createElement;
        local v9 = {
            PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 10 or 16),
            PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 10 or 16)
        };
        local new = UDim.new;
        DeviceUtil.isSmallScreen();
        v9.PaddingLeft = new(0.04, 0);
        local new2 = UDim.new;
        DeviceUtil.isSmallScreen();
        v9.PaddingRight = new2(0.04, 0);
        v7[1], v7[2], v7[3] = v8, createElement("UIPadding", v9), u2.createElement("UIListLayout", {
    FillDirection = Enum.FillDirection.Vertical,
    VerticalAlignment = Enum.VerticalAlignment.Top,
    HorizontalAlignment = Enum.HorizontalAlignment.Left,
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 16)
});
        local v10 = #v7;
        local v11 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 40)
        };
        local v12 = {};
        local v13 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(0.75, 0, 0, 28)
        };
        local v14 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }),
            UpdateTitle = u2.createElement("TextLabel", {
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
                TextScaled = true,
                TextYAlignment = "Top",
                TextXAlignment = "Left",
                LayoutOrder = 1,
                Size = UDim2.new(0, 0, 0, 0),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Theme.textPrimary,
                Text = p4.GameUpdate.title
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 20 or 28
                }) })
        };
        local v15 = #v14;
        local v16 = p4.GameUpdate.pinned and u2.createFragment({
            PinnedIcon = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.5, 1),
                Image = BedwarsImageId.THUMB_TACK_SOLID,
                ImageColor3 = Theme.backgroundSuccess
            })
        });

        if v16 then
            v14[v15 + 1] = v16;
        end;

        v12.UpdateTitleRow = u2.createElement("Frame", v13, v14);
        v12.UpdateDate = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextYAlignment = "Bottom",
            TextXAlignment = "Right",
            TextTransparency = 0.6,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 0, 0, 21),
            Size = UDim2.new(0.25, 0, 0, 16),
            Font = Enum.Font.Roboto,
            TextColor3 = ColorUtil.WHITE,
            Text = p4.GameUpdate.date
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 12 or 16
            }) });
        v12[#v12 + 1] = u2.createElement(DividerComponent, {
            Margin = 0,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 1, 0),
            BarPosition = {
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.new(0, 0, 0, 0)
            }
        });
        v7.UpdateHeader = u2.createElement("Frame", v11, v12);
        v7.UpdateBody = u2.createElement("TextLabel", {
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            RichText = true,
            TextWrapped = true,
            TextYAlignment = "Top",
            TextXAlignment = "Left",
            LayoutOrder = 4,
            Size = UDim2.fromScale(0.95, 0),
            Font = Enum.Font.Roboto,
            TextSize = DeviceUtil.isSmallScreen() and 14 or 18,
            TextColor3 = ColorUtil.WHITE,
            Text = p4.GameUpdate.body
        });
        local image = p4.GameUpdate.image;

        if image then
            local v17 = {};
            local height = p4.GameUpdate.image.height;
            v17.Size = UDim2.new(1, 0, 0, height == nil and 125 or height);
            v17.BackgroundTransparency = 1;
            v17.Image = p4.GameUpdate.image.assetId;
            v17.ScaleType = "Fit";
            v17.SizeConstraint = "RelativeXX";
            v17.LayoutOrder = 3;
            local v18 = {};
            local v19 = #v18;
            local v20;

            if p4.GameUpdate.image.aspectRatio == nil then
                v20 = false;
            else
                v20 = u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = p4.GameUpdate.image.aspectRatio
                });
            end;

            if v20 then
                v18[v19 + 1] = v20;
            end;

            image = u2.createFragment({
                UpdateImage = u2.createElement("ImageLabel", v17, v18)
            });
        end;

        if image then
            v7[v10 + 1] = image;
        end;

        return u2.createFragment({
            UpdateNotesCard = u2.createElement("Frame", v6, v7)
        });
    end)
};