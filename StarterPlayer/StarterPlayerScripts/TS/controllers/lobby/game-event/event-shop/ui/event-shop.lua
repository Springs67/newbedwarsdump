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
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-meta").EventShopItemMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, script.Parent, "event-shop-item-tile").EventShopItemTile
return {
    ["EventShop"] = v12.new(u11)(function(u22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
            [3] = u15
            [4] = u8
            [5] = u19
            [6] = u13
            [7] = u2
            [8] = u14
            [9] = u5
            [10] = u18
            [11] = u20
            [12] = u10
            [13] = u9
            [14] = u11
            [15] = u21
            [16] = u7
            [17] = u4
            [18] = u6
        --]]
        local _ = p23.useState
        local function u39(u24) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u16
                [3] = u22
                [4] = u15
                [5] = u8
                [6] = u19
                [7] = u13
                [8] = u2
                [9] = u14
                [10] = u5
                [11] = u18
                [12] = u20
                [13] = u10
                [14] = u9
            --]]
            local v25 = u17[u24]
            local v26 = v25.currency or u16[u22.EventType].currencies[1]
            local v27 = u15[v25.currency or u16[u22.EventType].currencies[1]]
            u8:playSound(u19.UI_OPEN)
            local v28 = u13:getState().Event.profileData.currencies[v26]
            if v28 ~= nil then
                v28 = v28.currAmount
            end
            local u29 = (v28 == nil and 0 or v28) >= v25.price
            local v30 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v31 = u14.CONFIRMATION_MODAL
            local v32 = {
                ["Title"] = "Purchase " .. v25.name .. "?"
            }
            local v33 = u5.richTextColor(u18.getItemColorRarity(v25.price))
            local v34 = v25.name
            local v35 = u5.richTextColor(u20.mcGold)
            local v36 = v25.price
            v32.Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. v33 .. "\"><b>[" .. v34 .. "]</b></font> for <font color=\"" .. v35 .. "\"><b>" .. tostring(v36) .. " " .. v27.name .. "</b></font>?"
            local v37 = {
                ["Text"] = u29 and "Purchase" or "Can\'t Afford"
            }
            local v38
            if u29 then
                v38 = u20.backgroundSuccess
            else
                v38 = u20.backgroundError
            end
            v37.BackgroundColor3 = v38
            v32.PrimaryBtnProps = v37
            v32.SecondaryBtnProps = {
                ["Text"] = "Cancel"
            }
            function v32.OnPrimaryBtnClick(_) --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u10
                    [3] = u24
                    [4] = u22
                    [5] = u8
                    [6] = u19
                --]]
                if u29 then
                    if u10.Controllers.EventShopContoller:purchaseItem(u24, u22.EventType) then
                        u8:playSound(u19.BEDWARS_UPGRADE_SUCCESS)
                    else
                        u8:playSound(u19.ERROR_NOTIFICATION)
                    end
                else
                    return nil
                end
            end
            function v32.OnSecondaryBtnClick() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u9
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u9.OVERLAY)
            end
            v30:openApp(v31, v32)
        end
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v41 = {}
        local _ = #v41
        local v42 = u22.Shop.items
        local function v45(p43, p44) --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            return u17[p43].name > u17[p44].name
        end
        table.sort(v42, v45)
        local function v48(p46, p47) --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            return u17[p46].price > u17[p47].price
        end
        table.sort(v42, v48)
        local function v54(p49, p50) --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            local v51 = u17[p49].shopDisplayOrder
            local v52 = v51 == nil and 0 or v51
            local v53 = u17[p50].shopDisplayOrder
            return v52 < (v53 == nil and 0 or v53)
        end
        table.sort(v42, v54)
        local function v68(p55, p56) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u17
                [3] = u11
                [4] = u21
                [5] = u39
            --]]
            local v57 = u22.EventShopItemsPurchased
            local v58 = 0
            for v59 = 1, #v57 do
                local v60 = v57[v59]
                local _ = v59 - 1
                if v60.item == p55 then
                    v58 = v58 + 1
                end
            end
            local v61 = u17[p55]
            local v62 = v61.maxPurchasesPerEvent
            local v63 = v62 == nil and 1 or v62
            local v64 = v63 <= v58
            if v61.maxPurchasesPerEvent == nil then
                local v65 = nil
                for v66, v67 in u22.AllTimeItemsPurchased do
                    local _ = v66 - 1
                    if v67.item == p55 == true then
                        v65 = v67
                        break
                    end
                end
                if v65 then
                    v64 = true
                end
            end
            return u11.createElement(u21, {
                ["Item"] = p55,
                ["SoldOut"] = v64,
                ["MaxPurchases"] = v63,
                ["TimesPurchased"] = v58,
                ["PromptPurchase"] = u39,
                ["EventType"] = u22.EventType,
                ["LayoutOrder"] = p56
            })
        end
        local v69 = table.create(#v42)
        for v70, v71 in v42 do
            v69[v70] = v68(v71, v70 - 1, v42)
        end
        local v72 = {
            ["AdditionalSpace"] = 200,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Selectable"] = false,
                ["Size"] = UDim2.fromScale(1, 1)
            }
        }
        local v73 = { u11.createElement(u7, {
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
        local v74 = #v73
        for v75, v76 in v69 do
            v73[v74 + v75] = v76
        end
        v41.ShopList = u11.createElement(u4, v72, v73)
        return u11.createFragment({
            ["EventShop"] = u11.createElement(u6, v40, v41)
        })
    end)
}