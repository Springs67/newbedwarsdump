local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.DropdownComponent
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
return {
    ["KitDetailsSkinVariantSelect"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u4
            [4] = u6
            [5] = u3
            [6] = u12
            [7] = u10
            [8] = u8
            [9] = u5
        --]]
        local _ = p14.useState
        local u15 = u13.SelectedKitSkin
        local v16 = u11[u15].variantOfSkin
        if v16 ~= nil then
            v16 = v16.parentSkin
        end
        if v16 ~= nil then
            u15 = v16
        end
        local v17 = 0
        local v18 = {}
        for v19, v20 in u7.entries(u11) do
            local _ = v19 - 1
            local _ = v20[1]
            local v21 = v20[2].variantOfSkin
            if v21 ~= nil then
                v21 = v21.parentSkin
            end
            if v21 == u15 == true then
                v17 = v17 + 1
                v18[v17] = v20
            end
        end
        table.sort(v18, function(p22, p23) --[[ Line: 46 ]]
            local v24 = p22[2].variantOfSkin.variantValue
            local v25 = v24 == nil and 0 or v24
            local v26 = p23[2].variantOfSkin.variantValue
            return v25 < (v26 == nil and 0 or v26)
        end)
        local function v32(p27) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u4
                [3] = u13
                [4] = u6
            --]]
            local v28 = p27[1]
            local v29 = p27[2]
            local v30 = v29.variantOfSkin
            if v30 ~= nil then
                v30 = v30.parentSkin
            end
            if v30 == u15 then
                local v31
                if u4.isHoarceKat() then
                    v31 = table.find(u13.store.Bedwars.ownedKitSkins, v28) ~= nil
                else
                    v31 = u6.Controllers.UnlockController:isKitSkinUnlocked(v28)
                end
                return {
                    ["text"] = v29.variantOfSkin.variantName,
                    ["icon"] = v29.variantOfSkin.variantIconColor,
                    ["value"] = v28,
                    ["locked"] = not v31
                }
            end
        end
        local v33 = 0
        local v34 = {}
        for v35, v36 in v18 do
            local v37 = v32(v36, v35 - 1, v18)
            if v37 ~= nil then
                v33 = v33 + 1
                v34[v33] = v37
            end
        end
        local v38 = nil
        for v39, v40 in v34 do
            local _ = v39 - 1
            if v40.value == u13.SelectedKitSkin == true then
                v38 = v40
                break
            end
        end
        if not v38 then
            v38 = nil
            for v41, v42 in v34 do
                local _ = v41 - 1
                if v42.value == u15 == true then
                    v38 = v42
                    break
                end
            end
        end
        local v43 = {
            ["ButtonTransparency"] = 0.5,
            ["Size"] = u13.Size,
            ["ButtonColor"] = u3.BLACK,
            ["DefaultItem"] = v38
        }
        if v38 ~= nil then
            v38 = v38.text
        end
        v43.PlaceholderText = v38
        v43.Items = v34
        function v43.OnItemSelected(p44) --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u12
                [4] = u4
                [5] = u6
                [6] = u10
            --]]
            u13.SetSelectedSkin(p44)
            local v45 = u11[p44]
            if not v45.kit then
                return nil
            end
            local v46
            if u13.store.Bedwars.equippedKitSkins then
                v46 = p44 == u13.store.Bedwars.equippedKitSkins[v45.kit or u12.NONE]
            else
                v46 = false
            end
            local v47
            if u4.isHoarceKat() then
                local v48 = u13.store.Bedwars.ownedKitSkins
                v47 = table.find(v48, p44) ~= nil
            else
                v47 = u6.Controllers.UnlockController:isKitSkinUnlocked(p44)
            end
            if v47 and not v46 then
                if u4.isHoarceKat() then
                    u10:dispatch({
                        ["type"] = "EquipKitSkin",
                        ["kit"] = v45.kit,
                        ["kitSkin"] = p44
                    })
                    return
                end
                u6.Controllers.KitSkinController:equipKitSkin(v45.kit, p44)
            end
        end
        v43.LayoutOrder = u13.LayoutOrder
        return u8.createFragment({
            ["KitShopVariantSelectDropdownComponent"] = u8.createElement(u5, v43, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }), u8.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = u3.WHITE
                }) })
        })
    end)
}