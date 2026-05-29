local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.IconButton
local u7 = v3.Padding
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u16 = v1.import(script, script.Parent, "afk-shop-app-currency-pill").AfkShopAppCurrencyPill
local u17 = v1.import(script, script.Parent, "afk-shop-app-navlink").AfkShopAppNavlink
return {
    ["AfkShopAppNavbar"] = v10.new(u9)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u9
            [4] = u12
            [5] = u15
            [6] = u4
            [7] = u5
            [8] = u7
            [9] = u17
            [10] = u13
            [11] = u16
            [12] = u6
            [13] = u2
            [14] = u11
        --]]
        local _ = p19.useState
        local _ = p19.useEffect
        local v20 = u9.createFragment
        local v21 = {}
        local v22 = u9.createElement
        local v23 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["Image"] = u12.navbarImage,
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["BackgroundColor3"] = u15.backgroundTertiary
        }
        local v24 = { (u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            })) }
        local v25 = u9.createElement
        local v26 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.WHITE
        }
        local v27 = { u9.createElement("UIGradient", {
                ["Rotation"] = 45,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5659A4")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5659A4")) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4) })
            }), (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0)
            })) }
        local v28 = u9.createElement
        local v29 = u5
        local v30 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }
        local v31 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 2)
            }),
            u9.createElement(u7, {
                ["Padding"] = {
                    ["Left"] = 14,
                    ["Top"] = 8,
                    ["Bottom"] = 8
                }
            }),
            ["Title"] = u9.createElement("TextLabel", {
                ["Text"] = "<b>AFK Shop</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "GothamBlack",
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Left",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.65),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        v27.TitleContainer = v28(v29, v30, v31)
        v27.NavLinks = u9.createElement(u5, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }, { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Bottom"
            }), u9.createElement(u17, {
                ["Text"] = "Shop",
                ["Page"] = "shop",
                ["Icon"] = u13.SHOPPING_CART_SOLID,
                ["ActivePage"] = u18.Page,
                ["OnClick"] = function() --[[ Name: OnClick, Line 100 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u14
                        [3] = u18
                    --]]
                    u8:playSound(u14.UI_CLICK)
                    if u18.Page ~= "shop" then
                        u18.SetPage("shop")
                    end
                end,
                ["ThemeColor"] = Color3.fromRGB(255, 214, 36)
            }) })
        local v32 = u9.createElement
        local v33 = u5
        local v34 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }
        local v35 = {
            u9.createElement(u7, {
                ["Padding"] = {
                    ["Right"] = 14,
                    ["Top"] = 10,
                    ["Bottom"] = 10
                }
            }),
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 6)
            }),
            ["CurrencyList"] = u9.createElement(u5, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0.85, -6, 0.9, 0)
            }, { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Right",
                    ["Padding"] = UDim.new(0.03, 0)
                }), u9.createElement(u16, {
                    ["CurrAmount"] = u18.AfkDataProfile.afkCurrency.currAmount
                }) }),
            ["CloseAppButton"] = u9.createElement(u6, {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.15, 1),
                ["Image"] = u13.X,
                ["OnClick"] = function() --[[ Name: OnClick, Line 140 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u11.AFK_APP)
                end
            }, { u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        v27.HeaderRightSide = v32(v33, v34, v35)
        v24.Wrapper = v25("Frame", v26, v27)
        v21.NavBar = v22("ImageLabel", v23, v24)
        return v20(v21)
    end)
}