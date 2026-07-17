-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Checkbox = v1.Checkbox;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsClass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = {
    {
        text = "Any Class",
        value = ""
    },
    {
        text = "Fighter",
        value = tostring(BedwarsClass.FIGHTER)
    },
    {
        text = "Movement",
        value = tostring(BedwarsClass.MOVEMENT)
    },
    {
        text = "Economy",
        value = tostring(BedwarsClass.ECONOMY)
    },
    {
        text = "Ranged",
        value = tostring(BedwarsClass.RANGED)
    },
    {
        text = "Support",
        value = tostring(BedwarsClass.SUPPORT)
    },
    {
        text = "Destroyer",
        value = tostring(BedwarsClass.DESTROYER)
    },
    {
        text = "Tank",
        value = tostring(BedwarsClass.TANK)
    },
    {
        text = "Defender",
        value = tostring(BedwarsClass.DEFENDER)
    }
};
local u5 = { {
        text = "Default Sort",
        value = ""
    }, {
        text = "A → Z",
        value = "A → Z"
    }, {
        text = "Z → A",
        value = "Z → A"
    } };

return {
    KitShopFilters = v3.new(u2)(function(p6, p7) -- Line: 49
        -- upvalues: u2 (copy), Empty (copy), Checkbox (copy), Theme (copy), DropdownComponent (copy), u4 (copy), u5 (copy)
        local _ = p7.useEffect;
        local _ = p7.useState;

        return u2.createElement(Empty, {
            Size = p6.Size,
            LayoutOrder = p6.LayoutOrder,
            Visible = p6.Visible
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0.03, 0),
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u2.createElement(Checkbox, {
                Text = "<b>Kit Unlocked</b>",
                AspectRatio = 4.866666666666666,
                LayoutOrder = 0,
                Value = p6.KitUnlockedToggle,
                SetValue = p6.SetKitUnlockedToggle,
                Size = UDim2.fromScale(0.16, 1),
                BoxColor = Theme.backgroundSecondary
            }),
            u2.createElement(Checkbox, {
                Text = "<b>Battlepass</b>",
                AspectRatio = 4.866666666666666,
                LayoutOrder = 1,
                Value = p6.BattlePassKitsToggle,
                SetValue = p6.SetBattlePassKitsToggle,
                Size = UDim2.fromScale(0.16, 1),
                BoxColor = Theme.backgroundSecondary
            }),
            u2.createElement(Checkbox, {
                Text = "<b>Favorited</b>",
                AspectRatio = 4.866666666666666,
                LayoutOrder = 2,
                Value = p6.FavoritedToggle,
                SetValue = p6.SetFavoritedToggle,
                Size = UDim2.fromScale(0.16, 1),
                BoxColor = Theme.backgroundSecondary
            }),
            u2.createElement(DropdownComponent, {
                LayoutOrder = 3,
                DefaultItem = u4[1],
                Items = u4,
                OnItemSelected = p6.SetKitClassFilter,
                Size = UDim2.fromScale(0.2, 1)
            }),
            u2.createElement(DropdownComponent, {
                LayoutOrder = 4,
                DefaultItem = u5[1],
                Items = u5,
                OnItemSelected = p6.SetKitSortAlgorithm,
                Size = UDim2.fromScale(0.2, 1)
            })
        });
    end)
};