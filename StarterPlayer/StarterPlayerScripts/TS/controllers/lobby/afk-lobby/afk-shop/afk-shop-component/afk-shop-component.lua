local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.Empty
local u7 = v3.Padding
local u8 = v3.SoundManager
local u9 = v3.UILayers
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-item-meta").AfkShopItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent, "afk-shop-item-tile").AfkShopItemTile
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").getItemColorRarity
return {
    ["AfkShopComponent"] = v12.new(u11)(function(u20, p21) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u8
            [3] = u16
            [4] = u13
            [5] = u2
            [6] = u14
            [7] = u5
            [8] = u19
            [9] = u17
            [10] = u10
            [11] = u9
            [12] = u11
            [13] = u18
            [14] = u7
            [15] = u4
            [16] = u6
        --]]
        local _ = p21.useState
        local function u34(u22) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u8
                [3] = u16
                [4] = u13
                [5] = u2
                [6] = u14
                [7] = u5
                [8] = u19
                [9] = u17
                [10] = u10
                [11] = u9
            --]]
            local v23 = u15[u22]
            u8:playSound(u16.UI_OPEN)
            local u24 = u13:getState().Afk.profileData.afkCurrency.currAmount >= v23.price
            local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v26 = u14.CONFIRMATION_MODAL
            local v27 = {
                ["Title"] = "Purchase " .. v23.name .. "?"
            }
            local v28 = u5.richTextColor(u19(v23.price))
            local v29 = v23.name
            local v30 = u5.richTextColor(u17.mcGold)
            local v31 = v23.price
            v27.Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. v28 .. "\"><b>[" .. v29 .. "]</b></font> for <font color=\"" .. v30 .. "\"><b>" .. tostring(v31) .. " Afk Coins</b></font>?"
            local v32 = {
                ["Text"] = u24 and "Purchase" or "Can\'t Afford"
            }
            local v33
            if u24 then
                v33 = u17.backgroundSuccess
            else
                v33 = u17.backgroundError
            end
            v32.BackgroundColor3 = v33
            v27.PrimaryBtnProps = v32
            v27.SecondaryBtnProps = {
                ["Text"] = "Cancel"
            }
            function v27.OnPrimaryBtnClick(_) --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u10
                    [3] = u22
                    [4] = u8
                    [5] = u16
                --]]
                if u24 then
                    if u10.Controllers.AfkShopController:purchaseItem(u22) then
                        u8:playSound(u16.BEDWARS_UPGRADE_SUCCESS)
                    else
                        u8:playSound(u16.ERROR_NOTIFICATION)
                    end
                else
                    return nil
                end
            end
            function v27.OnSecondaryBtnClick() --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u9
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u9.OVERLAY)
            end
            v25:openApp(v26, v27)
        end
        local v35 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v36 = {}
        local _ = #v36
        local v37 = u20.ShopItems
        local function v47(p38, p39) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u15
                [3] = u11
                [4] = u18
                [5] = u34
            --]]
            local v40 = u20.AfkShopItemsPurchased
            local v41 = 0
            for v42 = 1, #v40 do
                local v43 = v40[v42]
                local _ = v42 - 1
                if v43.item == p38 then
                    v41 = v41 + 1
                end
            end
            local v44 = u15[p38].maxPurchases
            local v45 = v44 == nil and 1 or v44
            local v46 = {
                ["Item"] = p38,
                ["SoldOut"] = v45 <= v41,
                ["MaxPurchases"] = v45,
                ["TimesPurchased"] = v41,
                ["PromptPurchase"] = u34,
                ["LayoutOrder"] = p39
            }
            return u11.createElement(u18, v46)
        end
        local v48 = table.create(#v37)
        for v49, v50 in v37 do
            v48[v49] = v47(v50, v49 - 1, v37)
        end
        local v51 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Selectable"] = false,
                ["Size"] = UDim2.fromScale(1, 1)
            }
        }
        local v52 = { u11.createElement(u7, {
                ["Padding"] = {
                    ["Vertical"] = 2,
                    ["Horizontal"] = 2
                }
            }), u11.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["FillDirectionMaxCells"] = 4,
                ["SortOrder"] = "LayoutOrder",
                ["CellSize"] = UDim2.new(0, 136, 0, 162),
                ["CellPadding"] = UDim2.fromOffset(8, 8)
            }) }
        local v53 = #v52
        for v54, v55 in v48 do
            v52[v53 + v54] = v55
        end
        v36.ShopList = u11.createElement(u4, v51, v52)
        return u11.createFragment({
            ["EventShop"] = u11.createElement(u6, v35, v36)
        })
    end)
}