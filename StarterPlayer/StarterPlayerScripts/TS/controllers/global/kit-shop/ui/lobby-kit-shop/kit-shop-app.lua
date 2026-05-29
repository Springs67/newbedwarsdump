local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local u6 = v3.UILayers
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent, "kit-shop-item-list").KitShopItemList
local v27 = v9.new(u8)(function(p15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u2
        [4] = u6
        [5] = u12
        [6] = u8
        [7] = u4
        [8] = u7
        [9] = u14
        [10] = u11
    --]]
    p16.useEffect(function() --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u13
        --]]
        u5:playSound(u13.UI_OPEN_2)
        return function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u13
            --]]
            u5:playSound(u13.UI_CLOSE_2)
        end
    end, {})
    local function v17() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u6.MAIN)
    end
    local v18 = {}
    local v19 = {}
    for v20, v21 in u12.GENERIC_BW_IMAGE_PRESET do
        v18[v20] = v21
    end
    v18.OnClick = v17
    v19.Background = v18
    v19.ExitButton = {
        ["OnClick"] = v17
    }
    v19.EnableButtonBackgroundPanel = true
    local v22 = { u8.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(u4.isSmallScreen() and 0.175 or 0.025, 0)
        }) }
    local v23 = #v22
    local v24 = {
        ["Size"] = UDim2.fromScale(0.7, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["store"] = p15.store,
        ["SelectedKit"] = p15.SelectedKit,
        ["InitialState"] = p15.SaveInitialState and {
            ["CanvasPositionY"] = p15.store.Lobby.kitShop.CanvasPositionY,
            ["KitClassFilter"] = p15.store.Lobby.kitShop.KitClassFilter,
            ["OwnedFilter"] = p15.store.Lobby.kitShop.OwnedFilter,
            ["FavoritedToggle"] = p15.store.Lobby.kitShop.FavoritedToggle,
            ["SearchText"] = p15.store.Lobby.kitShop.SearchText
        } or nil
    }
    local v25
    if u4.isHoarceKat() then
        v25 = false
    else
        local v26 = u7.Controllers.MatchController
        if v26 ~= nil then
            v26 = v26:getQueueMeta()
            if v26 ~= nil then
                v26 = v26.allowUnownedKits
            end
        end
        v25 = v26 == true
    end
    v24.ShowAllKits = v25
    v22[v23 + 1] = u8.createElement(u14, v24)
    return u8.createElement(u11, v19, v22)
end)
return {
    ["KitShopApp"] = v10.connect(function(p28, p29) --[[ Line: 76 ]]
        local v30 = {
            ["store"] = p28
        }
        for v31, v32 in p29 do
            v30[v31] = v32
        end
        return v30
    end)(v27)
}