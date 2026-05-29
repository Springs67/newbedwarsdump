local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.DropdownComponent
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
return {
    ["KitShopVariantSelect"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u3
            [4] = u5
            [5] = u11
            [6] = u9
            [7] = u7
            [8] = u4
        --]]
        local _ = p13.useState
        local u14 = u12.SelectedSkin
        local v15 = u10[u14].variantOfSkin
        if v15 ~= nil then
            v15 = v15.parentSkin
        end
        if v15 ~= nil then
            u14 = v15
        end
        local v16 = 0
        local v17 = {}
        for v18, v19 in u6.entries(u10) do
            local _ = v18 - 1
            local _ = v19[1]
            local v20 = v19[2].variantOfSkin
            if v20 ~= nil then
                v20 = v20.parentSkin
            end
            if v20 == u14 == true then
                v16 = v16 + 1
                v17[v16] = v19
            end
        end
        table.sort(v17, function(p21, p22) --[[ Line: 45 ]]
            local v23 = p21[2].variantOfSkin.variantValue
            local v24 = v23 == nil and 0 or v23
            local v25 = p22[2].variantOfSkin.variantValue
            return v24 < (v25 == nil and 0 or v25)
        end)
        local function v31(p26) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u3
                [3] = u12
                [4] = u5
            --]]
            local v27 = p26[1]
            local v28 = p26[2]
            local v29 = v28.variantOfSkin
            if v29 ~= nil then
                v29 = v29.parentSkin
            end
            if v29 == u14 then
                local v30
                if u3.isHoarceKat() then
                    v30 = table.find(u12.store.Bedwars.ownedKitSkins, v27) ~= nil
                else
                    v30 = u5.Controllers.UnlockController:isKitSkinUnlocked(v27)
                end
                return {
                    ["text"] = v28.variantOfSkin.variantName,
                    ["icon"] = v28.variantOfSkin.variantIconColor,
                    ["value"] = v27,
                    ["locked"] = not v30
                }
            end
        end
        local v32 = 0
        local v33 = {}
        for v34, v35 in v17 do
            local v36 = v31(v35, v34 - 1, v17)
            if v36 ~= nil then
                v32 = v32 + 1
                v33[v32] = v36
            end
        end
        local v37 = nil
        for v38, v39 in v33 do
            local _ = v38 - 1
            if v39.value == u12.SelectedSkin == true then
                v37 = v39
                break
            end
        end
        if not v37 then
            v37 = nil
            for v40, v41 in v33 do
                local _ = v40 - 1
                if v41.value == u14 == true then
                    v37 = v41
                    break
                end
            end
        end
        local v42 = {
            ["Size"] = u12.Size,
            ["DefaultItem"] = v37
        }
        if v37 ~= nil then
            v37 = v37.text
        end
        v42.PlaceholderText = v37
        v42.Items = v33
        function v42.OnItemSelected(p43) --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u10
                [3] = u11
                [4] = u3
                [5] = u5
                [6] = u9
            --]]
            u12.SetSelectedSkin(p43)
            local v44 = u10[p43]
            if not v44.kit then
                return nil
            end
            local v45
            if u12.store.Bedwars.equippedKitSkins then
                v45 = p43 == u12.store.Bedwars.equippedKitSkins[v44.kit or u11.NONE]
            else
                v45 = false
            end
            local v46
            if u3.isHoarceKat() then
                local v47 = u12.store.Bedwars.ownedKitSkins
                v46 = table.find(v47, p43) ~= nil
            else
                v46 = u5.Controllers.UnlockController:isKitSkinUnlocked(p43)
            end
            if v46 and not v45 then
                if u3.isHoarceKat() then
                    u9:dispatch({
                        ["type"] = "EquipKitSkin",
                        ["kit"] = v44.kit,
                        ["kitSkin"] = p43
                    })
                    return
                end
                u5.Controllers.KitSkinController:equipKitSkin(v44.kit, p43)
            end
        end
        v42.LayoutOrder = u12.LayoutOrder
        return u7.createFragment({
            ["KitShopVariantSelectDropdownComponent"] = u7.createElement(u4, v42)
        })
    end)
}