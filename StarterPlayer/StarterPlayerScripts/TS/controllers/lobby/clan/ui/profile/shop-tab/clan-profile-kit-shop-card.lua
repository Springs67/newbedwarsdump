local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanProfileKitShopCard"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u4
            [4] = u11
            [5] = u12
            [6] = u3
            [7] = u6
            [8] = u9
            [9] = u5
        --]]
        local _ = p14.useState
        local v15 = u10[u13.Kit]
        local function v33() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u7
                [3] = u4
                [4] = u11
                [5] = u12
                [6] = u3
                [7] = u6
            --]]
            if not u13.Locked then
                if u13.Purchased then
                    return u7.createElement(u3, {
                        ["Text"] = "Purchased",
                        ["Disabled"] = true,
                        ["Position"] = UDim2.fromScale(0.5, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 1),
                        ["Size"] = UDim2.fromScale(0.9, 0.4),
                        ["BackgroundColor3"] = u12.backgroundPrimary,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 95 ]] end
                    })
                end
                local v16 = u7.createElement
                local v17 = u3
                local v18 = {
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["Size"] = UDim2.fromScale(0.9, 0.4)
                }
                local v19
                if u13.CantBuy then
                    v19 = u12.backgroundError
                else
                    v19 = u12.backgroundSuccess
                end
                v18.BackgroundColor3 = v19
                v18.Text = u6.formatNumberWithCommas(u13.Price) .. " Coins"
                function v18.OnClick() --[[ Line: 78 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                    --]]
                    if u13.CantBuy or u13.Disabled then
                        return nil
                    end
                    u13.OnPurchase(u13.Kit)
                end
                v18.Disabled = u13.Disabled
                v18.Loading = u13.Loading
                return v16(v17, v18)
            end
            local v20 = u7.createFragment
            local v21 = {}
            local v22 = u7.createElement
            local v23 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0.4,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = u4.BLACK
            }
            local v24 = {}
            local v25 = u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })
            local v26 = u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            })
            local v27 = u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.1, 0)
            })
            local v28 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Image"] = u11.LOCK_SOLID
            })
            local v29 = u7.createElement
            local v30 = {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.6)
            }
            local v31 = u4.richTextColor(u12.mcYellow)
            local v32 = u13.Index - 1
            v30.Text = "<b>Unlocked when <font color=\"" .. v31 .. "\">(Kit Shop Lv." .. tostring(v32) .. ")</font> reached</b>"
            v30.TextColor3 = u4.WHITE
            __set_list(v24, 1, {v25, v26, v27, v28, v29("TextLabel", v30, { u7.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 14
    }) })})
            v21.ShopLockedOverlay = v22("Frame", v23, v24)
            return v20(v21)
        end
        local v34 = u7.createFragment
        local v35 = {
            ["ClanKitCard"] = u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["BackgroundColor3"] = u12.backgroundTertiary
            }, {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0.1, 0)
                }),
                u7.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.05, 0),
                    ["PaddingBottom"] = UDim.new(0.05, 0),
                    ["PaddingLeft"] = UDim.new(0.1, 0),
                    ["PaddingRight"] = UDim.new(0.1, 0)
                }),
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u7.createElement(u9, {
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["Kit"] = u13.Kit
                }),
                u7.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 0.3)
                }, { u7.createElement("TextLabel", {
                        ["AutomaticSize"] = "Y",
                        ["SizeConstraint"] = "RelativeXX",
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0),
                        ["Text"] = "<b>" .. v15.name .. "</b>",
                        ["TextColor3"] = u4.WHITE
                    }, { u7.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) }), v33() })
            })
        }
        return v34(v35)
    end)
}