local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.MarketplaceService
local u11 = v9.Players
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vip", "vip-util").VIPUtil
local v52 = v7.new(u6)(function(u16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u5
        [4] = u4
        [5] = u2
        [6] = u15
        [7] = u11
        [8] = u10
        [9] = u14
        [10] = u13
    --]]
    local _ = p17.useEffect
    local _ = p17.useState
    local v18 = u12.vipMultiplier * 100
    local v19 = u12.premiumMultiplier * 100
    local v20 = u6.createElement
    local v21 = u5
    local v22 = {
        ["Size"] = u16.Size,
        ["Position"] = UDim2.fromScale(0.45, 0.7),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["LayoutOrder"] = u16.LayoutOrder
    }
    local v23 = { (u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 3)
        })) }
    local v24 = u6.createElement
    local v25 = "Frame"
    local v26 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["BackgroundColor3"] = u4.WHITE,
        ["LayoutOrder"] = u16.LayoutOrder
    }
    local v27 = { (u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 20)
        })) }
    local v28 = u6.createElement
    local v29 = {
        ["Size"] = UDim2.fromScale(0.42, 1),
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = Color3.fromRGB(20, 20, 20),
        ["LayoutOrder"] = 4,
        ["ClipsDescendants"] = true,
        ["AutoButtonColor"] = not u16.isVip,
        [u6.Event.Activated] = function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u2
                [3] = u15
                [4] = u11
                [5] = u10
                [6] = u14
            --]]
            if u16.isVip then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "You already have VIP!"
                })
                return nil
            end
            if not u15.isPlayerVIP(u11.LocalPlayer) then
                u10:PromptGamePassPurchase(u11.LocalPlayer, u14.VIP)
            end
        end
    }
    local v30 = { u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }), u6.createElement("UIStroke", {
            ["Color"] = Color3.fromRGB(59, 59, 59)
        }), (u6.createElement("ImageLabel", {
            ["ImageTransparency"] = 0.93,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["Image"] = u13.BED_RED_RENDER,
            ["BackgroundColor3"] = u4.BLACK
        })) }
    local v31 = u6.createElement
    local v32 = u5
    local v33 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v34 = {
        u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }),
        ["Title"] = u6.createElement("TextLabel", {
            ["Text"] = "VIP",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.52),
            ["Position"] = UDim2.fromScale(0, 0.15),
            ["Size"] = UDim2.fromScale(0.6, 0.35),
            ["FontFace"] = Font.fromName(u12.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }),
        ["Subtitle"] = u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = "+" .. tostring(v18) .. "% faster",
            ["AnchorPoint"] = Vector2.new(0, 0.52),
            ["Position"] = UDim2.fromScale(0, 0.375),
            ["Size"] = UDim2.fromScale(0.6, 0.2),
            ["FontFace"] = Font.fromName(u12.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }),
        ["PerkPill"] = u6.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.55, 0.38),
            ["Position"] = UDim2.fromScale(0, 0.57),
            ["BackgroundTransparency"] = u16.isVip and 1 or 0.2,
            ["BackgroundColor3"] = Color3.fromRGB(59, 144, 80)
        }, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u6.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["ZIndex"] = 2,
                ["Text"] = u16.isVip and "PURCHASED" or "PURCHASE",
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.485),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["FontFace"] = Font.fromName(u12.Theme.font.Name, Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(108, 255, 141),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) }),
        u6.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["Image"] = u13.BED_RED_RENDER
        })
    }
    v30.Content = v31(v32, v33, v34)
    v27.VipButton = v28("ImageButton", v29, v30)
    local v35 = u6.createElement
    local v36 = "ImageButton"
    local v37 = {
        ["Size"] = UDim2.fromScale(0.42, 1),
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = Color3.fromRGB(20, 20, 20),
        ["LayoutOrder"] = 5,
        ["ClipsDescendants"] = true,
        ["AutoButtonColor"] = not u16.isPremium,
        [u6.Event.Activated] = function() --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u2
                [3] = u10
                [4] = u11
            --]]
            if u16.isPremium then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "You already have Roblox Premium!"
                })
                return nil
            end
            u10:PromptPremiumPurchase(u11.LocalPlayer)
        end
    }
    local v38 = { u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }), u6.createElement("UIStroke", {
            ["Color"] = Color3.fromRGB(59, 59, 59)
        }), (u6.createElement("ImageLabel", {
            ["Image"] = "rbxasset://textures/ui/PlayerList/PremiumIcon@3x.png",
            ["ImageTransparency"] = 0.93,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["BackgroundColor3"] = u4.BLACK
        })) }
    local v39 = u6.createElement
    local v40 = u5
    local v41 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v42 = {
        u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }),
        ["Title"] = u6.createElement("TextLabel", {
            ["Text"] = "PREMIUM",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.52),
            ["Position"] = UDim2.fromScale(0, 0.15),
            ["Size"] = UDim2.fromScale(0.6, 0.35),
            ["FontFace"] = Font.fromName(u12.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }),
        ["Subtitle"] = u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = "+" .. tostring(v19) .. "% faster",
            ["AnchorPoint"] = Vector2.new(0, 0.52),
            ["Position"] = UDim2.fromScale(0, 0.375),
            ["Size"] = UDim2.fromScale(0.6, 0.2),
            ["FontFace"] = Font.fromName(u12.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
    }
    local v43 = u6.createElement
    local v44 = "Frame"
    local v45 = {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 5,
        ["Size"] = UDim2.fromScale(0.55, 0.38),
        ["Position"] = UDim2.fromScale(0, 0.57),
        ["BackgroundTransparency"] = u16.isVip and 1 or 0.2,
        ["BackgroundColor3"] = Color3.fromRGB(59, 144, 80)
    }
    local v46 = {}
    local v47 = u6.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 6)
    })
    local v48 = u6.createElement
    local v49 = "TextLabel"
    local v50 = {
        ["TextScaled"] = true,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 0,
        ["ZIndex"] = 2,
        ["Text"] = u16.isPremium and "PURCHASED" or "PURCHASE",
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["Position"] = UDim2.fromScale(0.5, 0.485),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["FontFace"] = Font.fromName(u12.Theme.font.Name, Enum.FontWeight.Bold)
    }
    local v51
    if u16.isPremium then
        v51 = Color3.fromRGB(130, 130, 130)
    else
        v51 = Color3.fromRGB(108, 255, 141)
    end
    v50.TextColor3 = v51
    v50.TextXAlignment = Enum.TextXAlignment.Center
    v50.TextYAlignment = Enum.TextYAlignment.Center
    __set_list(v46, 1, {v47, v48(v49, v50)})
    v42.PerkPill = v43(v44, v45, v46)
    __set_list(v42, 2, {u6.createElement("ImageLabel", {
    ["Image"] = "rbxasset://textures/ui/PlayerList/PremiumIcon@3x.png",
    ["SizeConstraint"] = "RelativeYY",
    ["BorderSizePixel"] = 0,
    ["BackgroundTransparency"] = 1,
    ["Size"] = UDim2.fromScale(1, 0.65),
    ["AnchorPoint"] = Vector2.new(1, 0.5),
    ["Position"] = UDim2.fromScale(1, 0.5),
    ["ScaleType"] = Enum.ScaleType.Fit
})})
    v38.Content = v39(v40, v41, v42)
    v27.PremiumButton = v35(v36, v37, v38)
    v23.PerksContainer = v24(v25, v26, v27)
    return v20(v21, v22, v23)
end)
return {
    ["AfkPlacePerksContainer"] = v8.connect(function(_, p53) --[[ Line: 272 ]]
        local v54 = {}
        for v55, v56 in p53 do
            v54[v55] = v56
        end
        return v54
    end)(v52)
}