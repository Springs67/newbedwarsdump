local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-kit-shop").ClanKitShop
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "clan-profile-kit-shop-card").ClanProfileKitShopCard
local u15 = v1.import(script, script.Parent, "countdown-component").CountdownComponent
return {
    ["ClanProfileKitShop"] = v8.new(u7)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
            [3] = u11
            [4] = u7
            [5] = u3
            [6] = u12
            [7] = u13
            [8] = u5
            [9] = u15
            [10] = u4
            [11] = u9
            [12] = u14
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local u20, u21 = v18(false)
        local v22, u23 = v18(0)
        local v24 = {}
        for v25, v26 in u16 do
            v24[v25] = v26
        end
        v24.store = nil
        v24.Clan = nil
        local function u29(p27) --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u21
                [3] = u6
            --]]
            if u20 then
                return nil
            end
            u21(true)
            u6.Controllers.ClanController:kitShopPurchase(p27):andThen(function(p28) --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                if p28 then
                    u21(false)
                end
            end)
        end
        v19(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u23
            --]]
            u23((u10.resetTime:getNextWeeklyResetTime()))
        end, { u16.Clan.kitShop.id })
        local u30 = u16.Clan.level >= u11.reqClanLevel
        local function v43() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u3
                [3] = u12
                [4] = u13
                [5] = u11
            --]]
            local v31 = u7.createFragment
            local v32 = {}
            local v33 = u7.createElement
            local v34 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0.4,
                ["ZIndex"] = 100,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v35 = {}
            local v36 = u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })
            local v37 = u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.1, 0)
            })
            local v38 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 100,
                ["Size"] = UDim2.fromScale(1, 0.15),
                ["Image"] = u12.LOCK_SOLID
            })
            local v39 = u7.createElement
            local v40 = {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 100,
                ["Size"] = UDim2.fromScale(1, 0)
            }
            local v41 = u3.richTextColor(u13.mcYellow)
            local v42 = u11.reqClanLevel
            v40.Text = "<b>Unlocked when <font color=\"" .. v41 .. "\">(Clan Lv." .. tostring(v42) .. ")</font> reached</b>"
            v40.TextColor3 = u3.WHITE
            __set_list(v35, 1, {v36, v37, v38, v39("TextLabel", v40, { u7.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 18
    }) })})
            v32.ShopLockedOverlay = v33("Frame", v34, v35)
            return v31(v32)
        end
        local v44 = {}
        for v45, v46 in v24 do
            v44[v45] = v46
        end
        local v47 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0.04, 0)
            }), u7.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 40)
            }, { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 4)
                }), u7.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Text"] = "<b>Unlock kits for your clan to use. Purchased kits last for 1 week.</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["TextColor3"] = u3.WHITE
                }, { u7.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }), u7.createElement(u15, {
                    ["PreText"] = "<font transparency=\"0.3\">New kits in: </font>",
                    ["EndTime"] = v22,
                    ["CountdownOptions"] = {
                        ["days"] = true,
                        ["hours"] = true,
                        ["seperator"] = " : "
                    }
                }) }) }
        local v48 = #v47
        local v49 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.82)
        }
        local v50 = {}
        local v51 = #v50
        local v52 = not u30
        if v52 then
            v52 = u7.createElement(v43)
        end
        if v52 then
            v50[v51 + 1] = v52
        end
        local _ = #v50
        local v53 = u16.Clan.kitShop.kits
        local function v65(p54, p55) --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u16
                [3] = u4
                [4] = u10
                [5] = u9
                [6] = u7
                [7] = u14
                [8] = u30
                [9] = u29
                [10] = u20
            --]]
            local v56 = math
            local v57 = u11
            local v58 = 0
            for _ in u16.Clan.members do
                v58 = v58 + 1
            end
            local v59 = v57.getKitShopKitPrice(v58)
            local v60 = v56.ceil(v59)
            local v61 = u16.Clan.kitShop.unlocks[p54] ~= nil
            local v62 = u16.Clan.coins < v60
            local v63 = p55 + 1 > u16.Clan.kitShop.stock
            local v64
            if u16.store.Clans.myClanMember and not u4.isHoarceKat() then
                v64 = u10.hasClanRank(u16.store.Clans.myClanMember, u9.ADMIN)
            else
                v64 = false
            end
            return u7.createElement(u14, {
                ["Kit"] = p54,
                ["Price"] = v60,
                ["Purchased"] = v61,
                ["CantBuy"] = not u30 or v62,
                ["Disabled"] = not (u30 and v64),
                ["OnPurchase"] = u29,
                ["Locked"] = v63,
                ["Loading"] = u20,
                ["Index"] = p55 + 1
            })
        end
        local v66 = table.create(#v53)
        for v67, v68 in v53 do
            v66[v67] = v65(v68, v67 - 1, v53)
        end
        local v69 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v70 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v71 = #v70
        for v72, v73 in v66 do
            v70[v71 + v72] = v73
        end
        v50.KitShopCards = u7.createElement(u5, v69, v70)
        v47[v48 + 1] = u7.createElement(u5, v49, v50)
        return u7.createFragment({
            ["ClanProfileKitShop"] = u7.createElement(u5, v44, v47)
        })
    end)
}