-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = {
    time = {
        color = Theme.mcRed,
        icon = BedwarsImageId.HUD_TIMER_ICON,
        textColor = ColorUtil.WHITE
    },
    bids = {
        color = Theme.mcYellow,
        textColor = ColorUtil.BLACK
    },
    outbid = {
        color = Theme.mcRed,
        textColor = ColorUtil.WHITE
    },
    bidding = {
        color = ColorUtil.darken(Theme.mcGreen, 0.8),
        textColor = ColorUtil.WHITE
    }
};

return {
    ClanAuctionItemTagBanner = v2.new(u1)(function(p4) -- Line: 27
        -- upvalues: u3 (copy), u1 (copy)
        local v5 = {
            BorderSizePixel = 0,
            BackgroundColor3 = u3[p4.Type].color,
            AutomaticSize = Enum.AutomaticSize.XY,
            LayoutOrder = p4.LayoutOrder
        };
        local v6 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }), u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1),
                PaddingLeft = UDim.new(0, 4),
                PaddingRight = UDim.new(0, 4)
            }) };
        local v7 = #v6;
        local v8;

        if u3[p4.Type].icon == nil then
            v8 = false;
        else
            v8 = u1.createElement("ImageLabel", {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                Image = u3[p4.Type].icon,
                Size = UDim2.fromOffset(14, 14),
                ScaleType = Enum.ScaleType.Fit
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v8 then
            v6[v7 + 1] = v8;
        end;

        v6[#v6 + 1] = u1.createElement("TextLabel", {
            LayoutOrder = 2,
            TextSize = 12,
            TextWrapped = true,
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Text = p4.Text,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = u3[p4.Type].textColor
        });

        return u1.createFragment({
            ClanAuctionItemTagBanner = u1.createElement("Frame", v5, v6)
        });
    end)
};