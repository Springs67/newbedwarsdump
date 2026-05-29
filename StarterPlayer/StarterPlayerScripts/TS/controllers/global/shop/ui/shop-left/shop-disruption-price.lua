local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local v9 = u5.Component:extend("ShopDisruptionPrice")
function v9.init(_) --[[ Line: 13 ]] end
function v9.render(p10) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u5
        [4] = u3
        [5] = u8
        [6] = u4
    --]]
    local v11 = u7.getShopItemBase(p10.props.SelectedItem.itemType, u6.LocalPlayer, {
        ["shopId"] = p10.props.ShopID
    })
    local v12
    if v11 then
        v12 = v11.price
    else
        v12 = nil
    end
    local v13 = {
        ["Size"] = UDim2.fromScale(0.9, 0.038),
        ["Position"] = UDim2.fromScale(0.5, 0.894),
        ["AnchorPoint"] = Vector2.new(0.558, 1)
    }
    local v14 = { u5.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0.02, 0)
        }) }
    local v15 = #v14
    local v16
    if v12 == nil then
        v16 = false
    else
        local v17 = u5.createElement
        local v18 = {
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Font"] = "Roboto",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Text"] = "<b>" .. tostring(v12) .. "</b>",
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v19 = {
            ["Strikethrough"] = u5.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 3),
                ["Position"] = UDim2.fromScale(0, 0.35),
                ["BackgroundColor3"] = u3.hexColor(16737380)
            })
        }
        v16 = v17("TextLabel", v18, v19)
    end
    if v16 then
        v14[v15 + 1] = v16
    end
    local v20 = #v14 + 1
    local v21 = u5.createElement
    local v22 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Font"] = "Roboto",
        ["TextScaled"] = true,
        ["RichText"] = true
    }
    local v23 = p10.props.SelectedItem.price
    v22.Text = "<b>" .. tostring(v23) .. " " .. u8.getDisplayName(p10.props.SelectedItem.currency) .. "</b>"
    v22.AutomaticSize = Enum.AutomaticSize.XY
    v22.TextXAlignment = Enum.TextXAlignment.Left
    v22.TextColor3 = u3.hexColor(16737380)
    v14[v20] = v21("TextLabel", v22, { u5.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 1)
        }) })
    return u5.createElement(u4, v13, v14)
end
return {
    ["ShopDisruptionPrice"] = v9
}