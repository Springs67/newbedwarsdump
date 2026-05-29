local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Checkbox
local u4 = v2.DropdownComponent
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = {}
local v11 = {
    ["text"] = "Fighter"
}
local v12 = v8.FIGHTER
v11.value = tostring(v12)
local v13 = {
    ["text"] = "Movement"
}
local v14 = v8.MOVEMENT
v13.value = tostring(v14)
local v15 = {
    ["text"] = "Economy"
}
local v16 = v8.ECONOMY
v15.value = tostring(v16)
local v17 = {
    ["text"] = "Ranged"
}
local v18 = v8.RANGED
v17.value = tostring(v18)
local v19 = {
    ["text"] = "Support"
}
local v20 = v8.SUPPORT
v19.value = tostring(v20)
local v21 = {
    ["text"] = "Destroyer"
}
local v22 = v8.DESTROYER
v21.value = tostring(v22)
local v23 = {
    ["text"] = "Tank"
}
local v24 = v8.TANK
v23.value = tostring(v24)
local v25 = {
    ["text"] = "Defender"
}
local v26 = v8.DEFENDER
v25.value = tostring(v26)
__set_list(u10, 1, {{
    ["text"] = "Any Class",
    ["value"] = ""
}, v11, v13, v15, v17, v19, v21, v23, v25})
local u27 = {
    {
        ["text"] = "Default Sort",
        ["value"] = ""
    },
    {
        ["text"] = "A \226\134\146 Z",
        ["value"] = "A \226\134\146 Z"
    },
    {
        ["text"] = "Z \226\134\146 A",
        ["value"] = "Z \226\134\146 A"
    }
}
return {
    ["KitShopFilters"] = v7.new(u6)(function(p28, p29) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u3
            [4] = u9
            [5] = u4
            [6] = u10
            [7] = u27
        --]]
        local _ = p29.useEffect
        local _ = p29.useState
        return u6.createElement(u5, {
            ["Size"] = p28.Size,
            ["LayoutOrder"] = p28.LayoutOrder,
            ["Visible"] = p28.Visible
        }, {
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0.03, 0),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u6.createElement(u3, {
                ["Text"] = "<b>Kit Unlocked</b>",
                ["AspectRatio"] = 4.866666666666666,
                ["LayoutOrder"] = 0,
                ["Value"] = p28.KitUnlockedToggle,
                ["SetValue"] = p28.SetKitUnlockedToggle,
                ["Size"] = UDim2.fromScale(0.16, 1),
                ["BoxColor"] = u9.backgroundSecondary
            }),
            u6.createElement(u3, {
                ["Text"] = "<b>Battlepass</b>",
                ["AspectRatio"] = 4.866666666666666,
                ["LayoutOrder"] = 1,
                ["Value"] = p28.BattlePassKitsToggle,
                ["SetValue"] = p28.SetBattlePassKitsToggle,
                ["Size"] = UDim2.fromScale(0.16, 1),
                ["BoxColor"] = u9.backgroundSecondary
            }),
            u6.createElement(u3, {
                ["Text"] = "<b>Favorited</b>",
                ["AspectRatio"] = 4.866666666666666,
                ["LayoutOrder"] = 2,
                ["Value"] = p28.FavoritedToggle,
                ["SetValue"] = p28.SetFavoritedToggle,
                ["Size"] = UDim2.fromScale(0.16, 1),
                ["BoxColor"] = u9.backgroundSecondary
            }),
            u6.createElement(u4, {
                ["LayoutOrder"] = 3,
                ["DefaultItem"] = u10[1],
                ["Items"] = u10,
                ["OnItemSelected"] = p28.SetKitClassFilter,
                ["Size"] = UDim2.fromScale(0.2, 1)
            }),
            u6.createElement(u4, {
                ["LayoutOrder"] = 4,
                ["DefaultItem"] = u27[1],
                ["Items"] = u27,
                ["OnItemSelected"] = p28.SetKitSortAlgorithm,
                ["Size"] = UDim2.fromScale(0.2, 1)
            })
        })
    end)
}