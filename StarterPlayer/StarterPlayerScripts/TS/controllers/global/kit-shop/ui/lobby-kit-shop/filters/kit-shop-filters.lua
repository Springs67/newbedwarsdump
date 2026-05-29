local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DropdownComponent
local u5 = v2.Empty
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-check-box-text-button").SquareCheckBoxTextButton
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").BedwarsClassMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v12 = v6.entries(v10)
table.sort(v12, function(p13, p14) --[[ Line: 18 ]]
    return p13[2].display < p14[2].display
end)
local u15 = {
    {
        ["text"] = "All Classes",
        ["value"] = ""
    }
}
for v16, v17 in v12 do
    local _ = v16 - 1
    local v18 = v17[1]
    local v19 = v17[2]
    local v20 = {
        ["text"] = v19.display,
        ["value"] = tostring(v18),
        ["icon"] = v19.imageId
    }
    table.insert(u15, v20)
end
local v21 = {}
local v22 = setmetatable({}, {
    ["__index"] = v21
})
v22.ALL = 0
v21[0] = "ALL"
v22.OWNED = 1
v21[1] = "OWNED"
v22.UNLOCKED = 2
v21[2] = "UNLOCKED"
v22.NOT_OWNED = 3
v21[3] = "NOT_OWNED"
local u23 = {}
local v24 = {
    ["text"] = "All"
}
local v25 = v22.ALL
v24.value = tostring(v25)
local v26 = {
    ["text"] = "Owned"
}
local v27 = v22.OWNED
v26.value = tostring(v27)
v26.icon = v11.UNLOCK_SOLID
local v28 = {
    ["text"] = "Not Owned"
}
local v29 = v22.NOT_OWNED
v28.value = tostring(v29)
v28.icon = v11.BED_COIN_ICON
__set_list(u23, 1, {v24, v26, v28})
return {
    ["OwnedFilter"] = v22,
    ["KitShopFilters"] = v8.new(u7)(function(p30, p31) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u15
            [4] = u4
            [5] = u23
            [6] = u9
            [7] = u5
        --]]
        local _ = p31.useState
        local v32 = {}
        for v33, v34 in p30 do
            v32[v33] = v34
        end
        v32.SetKitClassFilter = nil
        v32.SetOwnedFilter = nil
        v32.SetFavoritedToggle = nil
        v32.KitClassFilter = nil
        v32.OwnedFilter = nil
        v32.FavoritedToggle = nil
        local v35 = {}
        for v36, v37 in v32 do
            v35[v36] = v37
        end
        local v38 = { u7.createElement("UIListLayout", {
                ["HorizontalFlex"] = "SpaceBetween",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.25, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0)
            }) }
        local v39 = #v38
        local v40 = {
            ["ButtonTransparency"] = 0.5,
            ["Size"] = UDim2.fromScale(0.33, 1),
            ["ButtonColor"] = u3.BLACK
        }
        local v41 = nil
        for v42, v43 in u15 do
            local _ = v42 - 1
            if v43.value == p30.KitClassFilter == true then
                v41 = v43
                break
            end
        end
        if v41 == nil then
            v41 = u15[1]
        end
        v40.DefaultItem = v41
        v40.Items = u15
        v40.OnItemSelected = p30.SetKitClassFilter
        v40.LayoutOrder = 0
        v38[v39 + 1] = u7.createElement(u4, v40, { u7.createElement("UIStroke", {
                ["Transparency"] = 0.5,
                ["Thickness"] = 1,
                ["Color"] = u3.WHITE
            }) })
        local v44 = {
            ["ButtonTransparency"] = 0.5,
            ["Size"] = UDim2.fromScale(0.33, 1),
            ["ButtonColor"] = u3.BLACK
        }
        local v45 = nil
        for v46, v47 in u23 do
            local _ = v46 - 1
            if v47.value == p30.OwnedFilter == true then
                v45 = v47
                break
            end
        end
        if v45 == nil then
            v45 = u23[1]
        end
        v44.DefaultItem = v45
        v44.Items = u23
        v44.OnItemSelected = p30.SetOwnedFilter
        v44.LayoutOrder = 1
        v38[v39 + 2] = u7.createElement(u4, v44, { u7.createElement("UIStroke", {
                ["Transparency"] = 0.5,
                ["Thickness"] = 1,
                ["Color"] = u3.WHITE
            }) })
        v38[v39 + 3] = u7.createElement(u9, {
            ["Selectable"] = true,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.3, 0.8),
            ["Text"] = {
                ["Text"] = "Favorited",
                ["Bold"] = false
            },
            ["OnChecked"] = p30.SetFavoritedToggle,
            ["Checked"] = p30.FavoritedToggle
        })
        return u7.createElement(u5, v35, v38)
    end)
}