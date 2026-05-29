local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.MarketplaceService
local u7 = v5.Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitPriceRobuxAsync
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil
local u16 = v1.import(script, script.Parent, "promo-card", "game-update-promo-card").GameUpdatePromoCard
return {
    ["GameUpdatePromoCardsList"] = v4.new(u3)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u14
            [3] = u11
            [4] = u9
            [5] = u12
            [6] = u15
            [7] = u6
            [8] = u7
            [9] = u13
            [10] = u3
            [11] = u8
            [12] = u16
            [13] = u2
        --]]
        local v19 = p18.useState
        local v20 = p18.useEffect
        local _, u21 = v19(0)
        local v22, u23 = v19(0)
        local u24, u25 = v19(nil)
        v20(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u10
                [3] = u25
                [4] = u14
                [5] = u23
                [6] = u11
                [7] = u9
                [8] = u12
                [9] = u15
                [10] = u21
            --]]
            if u17.store.GameUpdates.newestKit then
                u25((u10(u17.store.GameUpdates.newestKit)))
                u14(u17.store.GameUpdates.newestKit):andThen(function(p26) --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    if p26 == nil then
                        return nil
                    end
                    u23(p26)
                end):catch(function() --[[ Line: 35 ]] end)
            end
            local v27 = u11(u9.BATTLE_PASS_SEASON)
            local v28 = v27.paidTrackProduct
            if v28 ~= nil then
                v28 = v28.productType
            end
            if v28 == u12.GamePass then
                u15.getGamePassProductInfoAsync(v27.paidTrackProduct.productId):andThen(function(p29) --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    local v30
                    if p29 == nil then
                        v30 = p29
                    else
                        v30 = p29.PriceInRobux
                    end
                    if v30 == nil then
                        return nil
                    end
                    u21(p29.PriceInRobux)
                end):catch(function() --[[ Line: 54 ]] end)
            end
        end, {})
        local function u41() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u24
                [3] = u6
                [4] = u7
            --]]
            local v31 = u17.store.Bedwars.ownedKits
            local v32 = u17.store.GameUpdates.newestKit
            if table.find(v31, v32) == nil then
                local v33 = u24
                if v33 ~= nil then
                    v33 = v33.gamepassId
                end
                if v33 == nil then
                    local v34 = u24
                    if v34 ~= nil then
                        v34 = v34.devProductId
                    end
                    if v34 ~= nil then
                        local v35 = u6
                        local v36 = u7.LocalPlayer
                        local v37 = u24
                        if v37 ~= nil then
                            v37 = v37.devProductId
                        end
                        v35:PromptProductPurchase(v36, v37)
                    end
                else
                    local v38 = u6
                    local v39 = u7.LocalPlayer
                    local v40 = u24
                    if v40 ~= nil then
                        v40 = v40.gamepassId
                    end
                    v38:PromptGamePassPurchase(v39, v40)
                end
            else
                return nil
            end
        end
        local v42
        if u17.store.GameUpdates.newestKit == nil then
            v42 = false
        else
            v42 = u24
        end
        if v42 then
            local v43 = {
                ["store"] = u17.store
            }
            local v44 = {
                ["ItemType"] = "NEWEST KIT",
                ["BannerImage"] = u13.newestKitBG,
                ["PromoItemImageElement"] = u3.createElement(u8, {
                    ["ZIndex"] = 4,
                    ["Kit"] = u17.store.GameUpdates.newestKit,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }),
                ["Name"] = u24.name,
                ["Price"] = v22,
                ["Description"] = u24.description,
                ["OnClick"] = function() --[[ Name: OnClick, Line 108 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                    --]]
                    u41()
                end
            }
            local v45 = u17.store.Bedwars.ownedKits
            local v46 = u17.store.GameUpdates.newestKit
            v44.isOwned = table.find(v45, v46) ~= nil
            v43.PromoCard = v44
            v43.LayoutOrder = 2
            v42 = u3.createElement(u16, v43)
        end
        local v47 = {
            ["ScrollingFrameProps"] = {
                ["Size"] = u17.Size,
                ["LayoutOrder"] = u17.LayoutOrder
            }
        }
        local v48 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v49 = #v48
        if v42 then
            v48[v49 + 1] = v42
        end
        return u3.createFragment({
            ["UpdateActionButtons"] = u3.createElement(u2, v47, v48)
        })
    end)
}