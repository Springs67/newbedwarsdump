local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.SlideIn
local u7 = v3.SoundManager
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent, "kit-details-center-container").KitDetailsCenterContainer
local u18 = v1.import(script, script.Parent, "kit-details-left-container", "kit-details-left-container").KitDetailsLeftContainer
local u19 = v1.import(script, script.Parent, "kit-details-right-container", "kit-details-right-container").KitDetailsRightContainer
local v43 = v10.new(u9)(function(u20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u2
        [4] = u8
        [5] = u14
        [6] = u13
        [7] = u9
        [8] = u4
        [9] = u18
        [10] = u15
        [11] = u17
        [12] = u19
        [13] = u5
        [14] = u6
        [15] = u12
    --]]
    local v22 = p21.useState
    local v23 = p21.useEffect
    local v24 = u20.SelectedKitSkin
    if not v24 then
        if u20.SelectedKit and u20.store.Bedwars.equippedKitSkins then
            v24 = u20.store.Bedwars.equippedKitSkins[u20.SelectedKit]
        else
            v24 = nil
        end
    end
    local v25, u26 = v22(v24)
    v23(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
        --]]
        u7:playSound(u16.UI_OPEN_2)
        return function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
            --]]
            u7:playSound(u16.UI_CLOSE_2)
        end
    end, {})
    local function v27() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.MAIN)
    end
    local function v28() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u14
            [4] = u20
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.MAIN)
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.KIT_SHOP_APP, {
            ["SaveInitialState"] = true,
            ["SelectedKit"] = u20.store.Bedwars.kit
        })
    end
    local v29 = {}
    local v30 = {}
    for v31, v32 in u13.GENERIC_BW_IMAGE_PRESET do
        v29[v31] = v32
    end
    v30.Background = v29
    v30.ExitButton = {
        ["OnClick"] = v27
    }
    v30.BackButton = {
        ["OnClick"] = v28
    }
    local v33 = {}
    local v34 = #v33
    local v35 = { u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(u4.isSmallScreen() and 0.175 or 0.025, 0),
            ["PaddingLeft"] = UDim.new(0.025, 0),
            ["PaddingRight"] = UDim.new(0.025, 0)
        }) }
    local v36 = #v35
    local v37 = {
        ["Size"] = UDim2.fromScale(1, 0.9)
    }
    local v39 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), u9.createElement(u18, {
            ["store"] = u20.store,
            ["Size"] = UDim2.fromScale(0.3, 1),
            ["SelectedKit"] = u20.SelectedKit,
            ["SelectedKitSkin"] = v25,
            ["SetSelectedKitSkin"] = function(p38) --[[ Name: SetSelectedKitSkin, Line 78 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26(p38)
            end,
            ["SelectedKitBundle"] = u20.SelectedBundle
        }) }
    local v40 = #v39
    local v41 = {
        ["Size"] = UDim2.fromScale(0.4, 1),
        ["SelectedKit"] = u20.SelectedKit,
        ["SelectedKitSkin"] = v25
    }
    local v42
    if u20.SelectedBundle then
        v42 = u15[u20.SelectedBundle].kitShopBundle
        if v42 ~= nil then
            v42 = v42.image
        end
    else
        v42 = nil
    end
    v41.ItemImage = v42
    v39[v40 + 1] = u9.createElement(u17, v41)
    v39[v40 + 2] = u9.createElement(u19, {
        ["Size"] = UDim2.fromScale(0.3, 1),
        ["SelectedKit"] = u20.SelectedKit,
        ["SelectedKitSkin"] = v25,
        ["SelectedKitBundle"] = u20.SelectedBundle,
        ["store"] = u20.store
    })
    v35[v36 + 1] = u9.createElement(u5, v37, v39)
    v33[v34 + 1] = u9.createElement(u6, {}, v35)
    return u9.createElement(u12, v30, v33)
end)
return {
    ["KitDetailsApp"] = v11.connect(function(p44, p45) --[[ Line: 114 ]]
        local v46 = {
            ["store"] = p44
        }
        for v47, v48 in p45 do
            v46[v47] = v48
        end
        return v46
    end)(v43)
}