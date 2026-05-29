local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.ImageId
local u9 = v3.TooltipContainer
local u10 = v3.UILayers
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport
return {
    ["KitShopGiftButton"] = v12.new(u11)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u11
            [3] = u16
            [4] = u14
            [5] = u5
            [6] = u2
            [7] = u13
            [8] = u17
            [9] = u10
            [10] = u6
            [11] = u7
            [12] = u8
            [13] = u9
            [14] = u4
        --]]
        local _ = p19.useState
        if not u15[u18.GiftType] then
            return u11.createFragment()
        end
        local u20 = u16.isKitGift(u18.GiftType)
        local u21 = u18.GiftType == u14.NONE
        if u20 and u21 then
            return u11.createFragment()
        end
        local v22 = u11.createFragment
        local v27 = {
            ["GiftKitButton"] = u11.createElement(u5, {
                ["BackgroundTransparency"] = 1,
                ["Selectable"] = true,
                ["Size"] = u18.Size,
                ["OnClick"] = function() --[[ Name: OnClick, Line 37 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u13
                        [3] = u18
                        [4] = u20
                        [5] = u21
                        [6] = u11
                        [7] = u17
                        [8] = u10
                    --]]
                    local v23 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                    local v24 = u13.GIFTING
                    local v25 = {
                        ["GiftType"] = u18.GiftType
                    }
                    local v26
                    if u20 and not u21 then
                        v26 = u11.createElement(u17, {
                            ["SizeConstraint"] = "RelativeYY",
                            ["Kit"] = u18.GiftType,
                            ["Size"] = UDim2.fromScale(1, 1)
                        })
                    else
                        v26 = nil
                    end
                    v25.CustomImage = v26
                    v23:openApp(v24, v25, u10.OVERLAY)
                end,
                ["LayoutOrder"] = u18.LayoutOrder
            }, {
                u11.createElement("UIStroke", {
                    ["Color"] = u6.hexColor(13934614),
                    ["Thickness"] = u7.isSmallScreen() and 1 or 2
                }),
                u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1000, 0)
                }),
                u11.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["Image"] = u8.GIFTS_SOLID,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.65, 0.65),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }),
                u11.createElement(u9, {}, { u11.createElement(u4, {
                        ["Text"] = "Gift Item",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u11.createElement(u4, {
                        ["TextSize"] = 14,
                        ["Text"] = u15[u18.GiftType].name,
                        ["Font"] = Enum.Font.SourceSansSemibold,
                        ["Limits"] = Vector2.new(300, 500)
                    }) })
            })
        }
        return v22(v27)
    end)
}