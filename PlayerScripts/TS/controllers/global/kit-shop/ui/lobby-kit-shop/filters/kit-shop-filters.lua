-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local SquareCheckBoxTextButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-check-box-text-button").SquareCheckBoxTextButton;
local BedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").BedwarsClassMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u5 = { {
        text = "All Classes",
        value = ""
    } };
local v6 = v2.entries(BedwarsClassMeta);
table.sort(v6, function(p7, p8) -- Line: 18
    return p7[2].display < p8[2].display;
end);

local function _(p9) -- Line: 22
    -- upvalues: u5 (copy)
    local v10 = p9[2];
    local v11 = {
        text = v10.display,
        value = tostring(p9[1]),
        icon = v10.imageId
    };
    table.insert(u5, v11);
end;

for i, v in v6 do
    local _ = i - 1;
    local v12 = v[2];
    local v13 = {
        text = v12.display,
        value = tostring(v[1]),
        icon = v12.imageId
    };
    table.insert(u5, v13);
end;

local v14 = {};
local v15 = setmetatable({}, {
    __index = v14
});
v15.ALL = 0;
v14[0] = "ALL";
v15.OWNED = 1;
v14[1] = "OWNED";
v15.UNLOCKED = 2;
v14[2] = "UNLOCKED";
v15.NOT_OWNED = 3;
v14[3] = "NOT_OWNED";
local u16 = {
    {
        text = "All",
        value = tostring(v15.ALL)
    },
    {
        text = "Owned",
        value = tostring(v15.OWNED),
        icon = BedwarsImageId.UNLOCK_SOLID
    },
    {
        text = "Not Owned",
        value = tostring(v15.NOT_OWNED),
        icon = BedwarsImageId.BED_COIN_ICON
    }
};

return {
    OwnedFilter = v15,
    KitShopFilters = v4.new(u3)(function(u17, p18) -- Line: 62
        -- upvalues: u3 (copy), ColorUtil (copy), u5 (copy), DropdownComponent (copy), u16 (copy), SquareCheckBoxTextButton (copy), Empty (copy)
        local _ = p18.useState;
        local v19 = {};

        for i, v in u17 do
            v19[i] = v;
        end;

        v19.SetKitClassFilter = nil;
        v19.SetOwnedFilter = nil;
        v19.SetFavoritedToggle = nil;
        v19.KitClassFilter = nil;
        v19.OwnedFilter = nil;
        v19.FavoritedToggle = nil;
        local v20 = {};

        for i, v in v19 do
            v20[i] = v;
        end;

        local v21 = { u3.createElement("UIListLayout", {
                HorizontalFlex = "SpaceBetween",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.25, 0),
                PaddingBottom = UDim.new(0.15, 0)
            }) };
        local v22 = #v21;
        local v23 = {
            ButtonTransparency = 0.5,
            Size = UDim2.fromScale(0.33, 1),
            ButtonColor = ColorUtil.BLACK
        };

        local function _(p24) -- Line: 98
            -- upvalues: u17 (copy)
            return p24.value == u17.KitClassFilter;
        end;

        local v25 = nil;

        for i, v in u5 do
            local _ = i - 1;

            if v.value == u17.KitClassFilter == true then
                v25 = v;
                break;
            end;
        end;

        if v25 == nil then
            v25 = u5[1];
        end;

        v23.DefaultItem = v25;
        v23.Items = u5;
        v23.OnItemSelected = u17.SetKitClassFilter;
        v23.LayoutOrder = 0;
        v21[v22 + 1] = u3.createElement(DropdownComponent, v23, { u3.createElement("UIStroke", {
                Transparency = 0.5,
                Thickness = 1,
                Color = ColorUtil.WHITE
            }) });
        local v26 = {
            ButtonTransparency = 0.5,
            Size = UDim2.fromScale(0.33, 1),
            ButtonColor = ColorUtil.BLACK
        };

        local function _(p27) -- Line: 130
            -- upvalues: u17 (copy)
            return p27.value == u17.OwnedFilter;
        end;

        local v28 = nil;

        for i, v in u16 do
            local _ = i - 1;

            if v.value == u17.OwnedFilter == true then
                v28 = v;
                break;
            end;
        end;

        if v28 == nil then
            v28 = u16[1];
        end;

        v26.DefaultItem = v28;
        v26.Items = u16;
        v26.OnItemSelected = u17.SetOwnedFilter;
        v26.LayoutOrder = 1;
        v21[v22 + 2] = u3.createElement(DropdownComponent, v26, { u3.createElement("UIStroke", {
                Transparency = 0.5,
                Thickness = 1,
                Color = ColorUtil.WHITE
            }) });
        v21[v22 + 3] = u3.createElement(SquareCheckBoxTextButton, {
            Selectable = true,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.3, 0.8),
            Text = {
                Text = "Favorited",
                Bold = false
            },
            OnChecked = u17.SetFavoritedToggle,
            Checked = u17.FavoritedToggle
        });

        return u3.createElement(Empty, v20, v21);
    end)
};