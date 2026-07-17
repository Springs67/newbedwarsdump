-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v12 = v2.new(u1)(function(p4, p5) -- Line: 8
    -- upvalues: u1 (copy), ColorUtil (copy), BedwarsImageId (copy)
    local _ = p5.useState;
    local v8 = {
        Size = UDim2.new(1, 0, 0, p4.Disabled and 0 or 32),
        LayoutOrder = p4.LayoutOrder,
        [u1.Event.Activated] = p4.OnClick,

        [u1.Event.MouseEnter] = function(p6) -- Line: 14
            p6.BackgroundTransparency = 0.7;
        end,

        [u1.Event.MouseLeave] = function(p7) -- Line: 17
            p7.BackgroundTransparency = 1;
        end,

        BorderSizePixel = 0,
        BackgroundColor3 = ColorUtil.WHITE,
        BackgroundTransparency = 1,
        Visible = not p4.Disabled
    };
    local v9 = { u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), u1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8)
        }), u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 8)
        }) };
    local v10 = #v9;
    local v11 = {};
    local Image = p4.Image;

    if Image == nil then
        Image = BedwarsImageId.STAR_ALT_SOLID;
    end;

    v11.Image = Image;
    v11.Size = UDim2.new(0, 16, 0, 16);
    v11.BackgroundTransparency = 1;
    v11.BorderSizePixel = 0;
    v9[v10 + 1] = u1.createElement("ImageLabel", v11);
    v9[v10 + 2] = u1.createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 16,
        Text = tostring(p4.Text),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = ColorUtil.WHITE
    });

    return u1.createElement("ImageButton", v8, v9);
end);

return {
    TopBarDropdownItem = v3.connect(function(p13, p14) -- Line: 64
        local v15 = {};

        for i, v in p14 do
            v15[i] = v;
        end;

        return v15;
    end)(v12)
};