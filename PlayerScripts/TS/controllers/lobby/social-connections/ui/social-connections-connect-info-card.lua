-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local CornerFiller = v1.CornerFiller;
local ImageId = v1.ImageId;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SocialConnectionsConnectInfoCard = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: Theme (copy), u2 (copy), CornerFiller (copy), ColorUtil (copy), ImageId (copy), ButtonComponent (copy)
        local _ = p5.useState;
        local Size = p4.Size;

        if Size == nil then
            Size = UDim2.new(1, 0, 0, 46);
        end;

        local v6 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 1,
            Size = Size,
            BackgroundColor3 = Theme.backgroundTertiary,
            LayoutOrder = p4.LayoutOrder
        };
        local v7 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }) };
        local v8 = #v7;
        local v9 = p4.CornerFill and u2.createElement(CornerFiller, {
            BottomLeft = true,
            BottomRight = true
        });

        if v9 then
            v7[v8 + 1] = v9;
        end;

        local v10 = #v7;
        local v11 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v12 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }), u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.75, 0.75),
                Image = p4.ImageId,
                ImageColor3 = Theme.textPrimary
            }) };
        local v13 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v14 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }), u2.createElement("TextLabel", {
                RichText = true,
                TextSize = 15,
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                Text = p4.Text,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                Font = Enum.Font.Roboto
            }) };
        local v15 = #v14;
        local v16 = p4.MiddleElementEmbed and u2.createElement("Frame", {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 5)
            }), u2.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(18, 12.5)
            }, { u2.createElement("ImageLabel", {
                    Rotation = 47,
                    ScaleType = "Fit",
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(18, 12.5),
                    Image = ImageId.WIFI_SOLID,
                    ImageColor3 = ColorUtil.hexColor(16752398)
                }) }), u2.createElement("TextLabel", {
                RichText = true,
                TextSize = 15,
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                Text = p4.MiddleElementEmbed.rightText,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                Font = Enum.Font.Roboto
            }) });

        if v16 then
            v14[v15 + 1] = v16;
        end;

        v12[#v12 + 1] = u2.createElement("Frame", v13, v14);
        v7[v10 + 1] = u2.createElement("Frame", v11, v12);
        local v17 = p4[u2.Children];

        if v17 then
            for i, v in v17 do
                if type(i) == "number" then
                    v7[v10 + 1 + i] = v;
                else
                    v7[i] = v;
                end;
            end;
        end;

        local v18 = #v7;
        local v19 = p4.Button and not p4.ButtonHidden and u2.createElement(ButtonComponent, {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -10, 0.5, 0),
            Size = UDim2.new(0.25, -10, 0.5, 0),
            Text = p4.Button.text,
            OnClick = p4.Button.onClick
        });

        if v19 then
            v7[v18 + 1] = v19;
        end;

        return u2.createElement("Frame", v6, v7);
    end)
};