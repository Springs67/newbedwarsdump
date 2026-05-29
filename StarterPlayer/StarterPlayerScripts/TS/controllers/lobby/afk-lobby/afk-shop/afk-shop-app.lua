local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.ScaleComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent, "afk-navbar", "afk-shop-app-navbar").AfkShopAppNavbar
local u13 = v1.import(script, script.Parent, "afk-shop-component", "afk-shop-component").AfkShopComponent
local v29 = v8.new(u7)(function(p14, p15) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u11
        [4] = u6
        [5] = u12
        [6] = u5
        [7] = u10
        [8] = u13
        [9] = u4
    --]]
    local v16, v17 = p15.useState("shop")
    local v18 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false
    }
    local v19 = { u7.createElement(u3, {
            ["AppId"] = p14.AppId
        }) }
    local _ = #v19
    local v20 = {
        ["BackgroundTransparency"] = 0.05,
        ["Selectable"] = false,
        ["AutoButtonColor"] = false,
        ["Active"] = true,
        ["Modal"] = true,
        ["Size"] = UDim2.fromOffset(690, 480),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = u11.backgroundSecondary,
        ["ScaleType"] = Enum.ScaleType.Crop
    }
    local v21 = {
        u7.createElement(u6, {
            ["MaximumSize"] = Vector2.new(1035, 720),
            ["ScreenPadding"] = Vector2.new(80, 80)
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }),
        u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }),
        u7.createElement(u12, {
            ["AfkDataProfile"] = p14.afkDataProfile,
            ["Page"] = v16,
            ["SetPage"] = v17
        })
    }
    local _ = #v21
    local v22 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.9)
    }
    local v23 = {
        u7.createElement(u5, {
            ["Padding"] = {
                ["Vertical"] = 8,
                ["Horizontal"] = 14
            }
        }),
        u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.02, 0)
        }),
        ["PageDescription"] = u7.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.3,
            ["TextXAlignment"] = "Left",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.04),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1),
            ["Text"] = "Gain " .. u10.currencyName .. " from the AFK Area!",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
    }
    local v24 = #v23
    local v25 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.94)
    }
    local v26 = {}
    local v27 = #v26
    local v28
    if string.lower(v16) == "shop" then
        v28 = u7.createElement(u13, {
            ["ShopItems"] = u10.shop.items,
            ["AfkShopItemsPurchased"] = p14.afkDataProfile.afkCurrency.itemsPurchased
        })
    else
        v28 = false
    end
    if v28 then
        v26[v27 + 1] = v28
    end
    v23[v24 + 1] = u7.createElement(u4, v25, v26)
    v21.Content = u7.createElement(u4, v22, v23)
    v19.AfkShopApp = u7.createElement("ImageButton", v20, v21)
    return u7.createFragment({
        ["AfkShop"] = u7.createElement("ScreenGui", v18, v19)
    })
end)
return {
    ["AfkShopApp"] = v9.connect(function(p30, p31) --[[ Line: 113 ]]
        local v32 = {}
        for v33, v34 in p31 do
            v32[v33] = v34
        end
        v32.afkDataProfile = p30.Afk.profileData
        return v32
    end)(v29)
}