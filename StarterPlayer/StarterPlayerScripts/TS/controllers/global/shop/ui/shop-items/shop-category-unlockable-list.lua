local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u10 = v1.import(script, script.Parent, "shop-category-unlockable").ShopCategoryUnlockable
return {
    ["ShopCategoryUnlockableList"] = v5.new(u4)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
            [3] = u8
            [4] = u6
            [5] = u7
            [6] = u4
            [7] = u10
            [8] = u2
        --]]
        local _ = p12.useState
        local v13 = 0
        local u14 = {}
        for v15, v18 in u3.values(u9) do
            local _ = v15 - 1
            local v17 = u8[v18]
            local v18
            if v17.disabled or not v17.unlockable and v17.UIDisplayType ~= "purchase" then
                v18 = nil
            else
                local v19 = v17.unlockable
                if v19 ~= nil then
                    v19 = v19.disableTillUnlocked
                end
                local v20 = v19 == true
                if v20 then
                    local v21 = u6:getState().Game.unlockedShopCategories[v18] ~= nil
                    v20 = not v21
                end
                if v20 then
                    v18 = nil
                end
            end
            if v18 ~= nil then
                v13 = v13 + 1
                u14[v13] = v18
            end
        end
        local v22 = #u14 / 2
        local u23 = math.ceil(v22)
        local function v63() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u14
                [3] = u8
                [4] = u11
                [5] = u7
                [6] = u4
                [7] = u10
                [8] = u2
            --]]
            -- block 24
            local v24 = false
            local v25 = 0
            local v26 = {}
            ::l23::
            if v24 then
                v25 = v25 + 1
            else
                v24 = true
            end
            if v25 >= u23 then
                return v26
            end
            local v27 = false
            local v28 = 0
            local v29 = {}
            while true do
                if true then
                    if v27 then
                        v28 = v28 + 1
                    else
                        v27 = true
                    end
                end
                if v28 >= 2 then
                    break
                end
                local v30 = #u14
                local v31 = u14[v30]
                u14[v30] = nil
                if v31 then
                    table.insert(v29, v31)
                end
            end
            ::l10::
            if #v29 ~= 0 then
                local function v51(p32, p33) --[[ Line: 94 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u11
                        [3] = u7
                        [4] = u4
                        [5] = u10
                    --]]
                    local v34 = u8[p32]
                    local v35 = 0
                    local v36 = {}
                    for v37, v38 in u11.ShopItems do
                        local _ = v37 - 1
                        if v38.category == p32 == true then
                            v35 = v35 + 1
                            v36[v35] = v38
                        end
                    end
                    local v39 = u11.QueueType
                    if v39 then
                        local v40 = false
                        for v41, v42 in v36 do
                            local _ = v41 - 1
                            local v43 = v42.disabledInQueue
                            if v43 ~= nil then
                                v43 = table.find(v43, v39) ~= nil
                            end
                            local v44 = not v43
                            if v44 then
                                v44 = not v42.disabled
                            end
                            if v44 then
                                v40 = true
                                break
                            end
                        end
                        if not v40 then
                            return nil
                        end
                        local v45 = u7(v39)
                        if v45.rankCategory or v45.disableLimitedTimeItems then
                            local v46 = false
                            for v47, v48 in v36 do
                                local _ = v47 - 1
                                if not v48.limitedTimeItem then
                                    v46 = true
                                    break
                                end
                            end
                            if not v46 then
                                return nil
                            end
                        end
                    end
                    local v49 = {
                        ["AppId"] = "ShopCategoryUnlockable_" .. p32,
                        ["Size"] = UDim2.new(0.5, -6, 0, 0),
                        ["Category"] = p32,
                        ["ShopItems"] = v36,
                        ["SelectedItem"] = u11.SelectedItem,
                        ["SetSelectedShopItem"] = u11.SetSelectedShopItem,
                        ["ShopID"] = u11.ShopID
                    }
                    local v50 = v34.layoutOrder
                    if v50 ~= nil then
                        p33 = v50
                    end
                    v49.LayoutOrder = p33
                    v49.ObservedInventory = u11.ObservedInventory
                    v49.IsHomeBase = u11.IsHomeBase
                    return u4.createElement(u10, v49)
                end
                local v52 = 0
                local v53 = {}
                for v54, v55 in v29 do
                    local v56 = v51(v55, v54 - 1, v29)
                    if v56 ~= nil then
                        v52 = v52 + 1
                        v53[v52] = v56
                    end
                end
                local v57 = {
                    ["AutomaticSize"] = "Y",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["LayoutOrder"] = v25
                }
                local v58 = { u4.createElement("UIListLayout", {
                        ["VerticalAlignment"] = "Top",
                        ["HorizontalAlignment"] = "Left",
                        ["FillDirection"] = "Horizontal",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 12)
                    }) }
                local v59 = #v58
                for v60, v61 in v53 do
                    v58[v59 + v60] = v61
                end
                local v62 = u4.createElement(u2, v57, v58)
                table.insert(v26, v62)
            end
            goto l23
        end
        local v64 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v65 = { u4.createElement("UIListLayout", {
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Left",
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 18)
            }) }
        local v66 = #v65
        for v67, v68 in v63() do
            v65[v66 + v67] = v68
        end
        return u4.createFragment({
            ["ShopCategoryUnlockableList"] = u4.createElement(u2, v64, v65)
        })
    end)
}