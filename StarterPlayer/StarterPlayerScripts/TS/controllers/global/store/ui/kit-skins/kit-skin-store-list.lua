local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar")
local u10 = v9.AutoCompleteSearchbar
local u11 = v9.SearchbarShowImageFunc
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta")
local u14 = v13.BedwarsKitSkinMeta
local u15 = v13.MAX_NEW_SKIN_AGE
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType
local u17 = v1.import(script, script.Parent.Parent, "robux-store-item-showcase-card").RobuxStoreItemShowcaseCard
local v87 = v7.new(u6)(function(u18, p19) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u14
        [3] = u15
        [4] = u4
        [5] = u2
        [6] = u12
        [7] = u6
        [8] = u10
        [9] = u11
        [10] = u17
        [11] = u16
        [12] = u3
    --]]
    local v20 = p19.useState
    local _ = p19.useEffect
    local v21 = p19.useValue
    local v22, u23 = v20(u5.entries(u14))
    local v24 = os.time()
    local v25 = table.create(#v22)
    for v26, v27 in v22 do
        local _ = v26 - 1
        local _ = v27[1]
        local v28 = v27[2]
        v25[v26] = {
            ["key"] = v28.name,
            ["image"] = v28.renderImage
        }
    end
    local v29 = v21(v25)
    local v30 = 0
    local u31 = {}
    for v32, v33 in v22 do
        local _ = v32 - 1
        local v34 = v33[2].releaseTime
        if v24 - (v34 == nil and 0 or v34) <= u15 == true then
            v30 = v30 + 1
            u31[v30] = v33
        end
    end
    table.sort(u31, function(p35, p36) --[[ Line: 59 ]]
        return (p35[2].kit or "") < (p36[2].kit or "")
    end)
    local v37 = 0
    local v38 = {}
    for v39, v40 in v22 do
        local _ = v39 - 1
        local v41 = v40[2].releaseTime
        if u15 < v24 - (v41 == nil and 0 or v41) == true then
            v37 = v37 + 1
            v38[v37] = v40
        end
    end
    table.sort(v38, function(p42, p43) --[[ Line: 82 ]]
        return (p42[2].kit or "") < (p43[2].kit or "")
    end)
    local function u46(p44) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u12
        --]]
        local v45 = {
            ["onOpen"] = function() --[[ Name: onOpen, Line 91 ]]
                --[[
                Upvalues:
                    [1] = u4
                --]]
                u4.Controllers.LobbyHudController:unmountLobbyHud()
                u4.Controllers.HotbarController:unmountHotbar()
            end,
            ["onClose"] = function() --[[ Name: onClose, Line 95 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                    [3] = u4
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.STORE_MENU_APP, {
                    ["DefaultPageId"] = "KitSkins",
                    ["AppId"] = u12.STORE_MENU_APP
                })
                u4.Controllers.LobbyHudController:unmountLobbyHud()
                u4.Controllers.HotbarController:unmountHotbar()
                u4.Controllers.LockerPreviewController:closePreview()
            end
        }
        u4.Controllers.LockerPreviewController:openFullscreenPreview({
            ["kitSkin"] = p44
        }, v45)
    end
    local v47 = {
        ["Size"] = UDim2.new(1, -16, 1, 0)
    }
    local v54 = { u6.createElement(u10, {
            ["InputText"] = "",
            ["PlaceHolderText"] = "Kit Skin Name",
            ["Size"] = UDim2.fromScale(0.55, 0.08),
            ["Items"] = v29.value,
            ["OnTextChange"] = function(_, p48) --[[ Name: OnTextChange, Line 115 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u14
                    [3] = u23
                --]]
                local v49 = 0
                local v50 = {}
                for v51, v52 in u5.entries(u14) do
                    local _ = v51 - 1
                    local _ = v52[1]
                    local v53 = v52[2].name
                    if table.find(p48, v53) ~= nil == true then
                        v49 = v49 + 1
                        v50[v49] = v52
                    end
                end
                u23(v50)
            end,
            ["ShowImage"] = u11.MANUAL,
            ["BackgroundColor3"] = Color3.fromRGB(22, 22, 22)
        }) }
    local _ = #v54
    local function v59(p55, p56) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u17
            [3] = u16
            [4] = u18
            [5] = u46
        --]]
        local u57 = p55[1]
        local v58 = p55[2]
        if v58.product then
            return u6.createElement(u17, {
                ["AspectRatio"] = 0.74,
                ["New"] = true,
                ["Title"] = v58.name,
                ["Image"] = v58.renderImage,
                ["Product"] = {
                    ["Price"] = v58.product.priceRobux,
                    ["ProductId"] = v58.product.devProductId,
                    ["GiftType"] = u57,
                    ["ProductType"] = u16.DevProduct
                },
                ["IsOwned"] = table.find(u18.OwnedKitSkins, u57) ~= nil,
                ["GamepadShouldAutoSelect"] = p56 == 0,
                ["OnClick"] = function() --[[ Name: OnClick, Line 160 ]]
                    --[[
                    Upvalues:
                        [1] = u46
                        [2] = u57
                    --]]
                    return u46(u57)
                end
            })
        else
            return nil
        end
    end
    local v60 = 0
    local v61 = {}
    for v62, v63 in u31 do
        local v64 = v59(v63, v62 - 1, u31)
        if v64 ~= nil then
            v60 = v60 + 1
            v61[v60] = v64
        end
    end
    local v65 = {
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["Position"] = UDim2.fromScale(0, 0.1)
    }
    local v66 = { u6.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["FillDirectionMaxCells"] = 4,
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.new(0.25, -9, 0, 200),
            ["CellPadding"] = UDim2.new(0, 12, 0, 10)
        }) }
    local v67 = #v66
    for v68, v69 in v61 do
        v66[v67 + v68] = v69
    end
    local v70 = #v66
    local function v79(p71, p72) --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u17
            [3] = u16
            [4] = u18
            [5] = u31
            [6] = u46
        --]]
        local u73 = p71[1]
        local v74 = p71[2]
        if not v74.product then
            return nil
        end
        local v75 = u6.createElement
        local v76 = u17
        local v77 = {
            ["AspectRatio"] = 0.74,
            ["Title"] = v74.name,
            ["Image"] = v74.renderImage,
            ["Product"] = {
                ["Price"] = v74.product.priceRobux,
                ["ProductId"] = v74.product.devProductId,
                ["GiftType"] = u73,
                ["ProductType"] = u16.DevProduct
            },
            ["IsOwned"] = table.find(u18.OwnedKitSkins, u73) ~= nil
        }
        local v78
        if #u31 > 0 then
            v78 = false
        else
            v78 = p72 == 0
        end
        v77.GamepadShouldAutoSelect = v78
        function v77.OnClick() --[[ Line: 212 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u73
            --]]
            return u46(u73)
        end
        return v75(v76, v77)
    end
    local v80 = 0
    local v81 = {}
    for v82, v83 in v38 do
        local v84 = v79(v83, v82 - 1, v38)
        if v84 ~= nil then
            v80 = v80 + 1
            v81[v80] = v84
        end
    end
    for v85, v86 in v81 do
        v66[v70 + v85] = v86
    end
    v54.ListContainer = u6.createElement(u3, v65, v66)
    return u6.createFragment({
        ["KitSkinList"] = u6.createElement(u3, v47, v54)
    })
end)
return {
    ["KitSkinStoreList"] = v8.connect(function(p88, p89) --[[ Line: 237 ]]
        local v90 = {}
        for v91, v92 in p89 do
            v90[v91] = v92
        end
        v90.OwnedKitSkins = p88.Bedwars.ownedKitSkins
        return v90
    end)(v87)
}