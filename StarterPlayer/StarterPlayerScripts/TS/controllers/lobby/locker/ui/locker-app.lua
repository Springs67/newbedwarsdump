local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.UILayers
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u12 = v1.import(script, script.Parent, "locker-core").LockerCore
local v37 = v8.new(u7)(function(p13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u6
        [4] = u4
        [5] = u11
        [6] = u7
        [7] = u10
        [8] = u12
    --]]
    local v15 = p14.useState
    local v16 = p14.useEffect
    local u17, u18 = v15(0)
    local v19, v20 = v15(false)
    local function v21() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u6
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u5.MAIN)
        u6.Controllers.LockerPreviewController:closePreview()
    end
    if not (u4.isHoarceKat() or u6.Controllers.LockerPreviewController:isPreviewOpen()) then
        u6.Controllers.LockerPreviewController:openPreview()
    end
    v16(function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6.Controllers.LockerPreviewController:closeFullscreenPreview()
            u6.Controllers.LockerPreviewController:closePreview()
        end
    end, {})
    local v22 = {
        ["ContainerSize"] = UDim2.fromScale(1, 1)
    }
    local v23 = {}
    for v24, v25 in u11.GENERIC_BW_IMAGE_PRESET do
        v23[v24] = v25
    end
    local v26 = {}
    local v27 = u11.GENERIC_BW_IMAGE_PRESET.BackgroundImageProps
    if type(v27) == "table" then
        for v28, v29 in v27 do
            v26[v28] = v29
        end
    end
    v26.BackgroundTransparency = 1
    v23.BackgroundImageProps = v26
    v22.Background = v23
    v22.ExitButton = {
        ["OnClick"] = v21
    }
    v22.BackButton = {
        ["ShouldShow"] = v19,
        ["OnClick"] = function() --[[ Name: OnClick, Line 55 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u17
            --]]
            u18(u17 + 1)
        end
    }
    v22.EnableButtonBackgroundPanel = true
    v22.DisableScaleComponent = true
    v22.ScreenGuiProps = {
        ["ClipToDeviceSafeArea"] = false
    }
    v22.UseFrame = true
    local v30 = u7.createElement
    local v31 = u10
    local v32 = {}
    local v33 = u7.createElement
    local v34 = u12
    local v35 = {
        ["AppId"] = p13.AppId,
        ["InitialTab"] = p13.InitialTab,
        ["LockerDto"] = {
            ["selectedKillEffect"] = p13.selectedKillEffect,
            ["killEffects"] = p13.killEffects,
            ["selectedEmotes"] = p13.selectedEmotes,
            ["emotes"] = p13.emotes,
            ["selectedTitle"] = p13.selectedTitle,
            ["titles"] = p13.titles,
            ["selectedLobbyGadget"] = p13.selectedLobbyGadget,
            ["lobbyGadgets"] = p13.lobbyGadgets,
            ["selectedWinEffect"] = p13.selectedWinEffect,
            ["winEffects"] = p13.winEffects,
            ["selectedBreakBedEffect"] = p13.selectedBreakBedEffect,
            ["breakBedEffects"] = p13.breakBedEffects,
            ["featuredBadges"] = p13.featuredBadges,
            ["badges"] = p13.badges,
            ["bedSkin"] = p13.bedSkin,
            ["bedSkins"] = p13.bedSkins,
            ["itemSkins"] = p13.itemSkins,
            ["selectedItemSkins"] = p13.selectedItemSkins
        },
        ["ConsumableInventory"] = p13.consumableInventory
    }
    local v36 = {
        ["BackButton"] = {
            ["ShouldShowBackButton"] = v19,
            ["SetShouldShowBackButton"] = v20,
            ["BackButtonClickCount"] = u17
        }
    }
    v35.FullScreenData = v36
    __set_list(v32, 1, {v33(v34, v35)})
    return v30(v31, v22, v32)
end)
return {
    ["LockerApp"] = v9.connect(function(p38, p39) --[[ Line: 101 ]]
        local v40 = {
            ["selectedKillEffect"] = p38.Locker.selectedKillEffect,
            ["killEffects"] = p38.Locker.killEffects,
            ["selectedEmotes"] = p38.Locker.selectedEmotes,
            ["emotes"] = p38.Locker.emotes,
            ["selectedTitle"] = p38.Locker.selectedTitle,
            ["titles"] = p38.Locker.titles,
            ["selectedLobbyGadget"] = p38.Locker.selectedLobbyGadget,
            ["lobbyGadgets"] = p38.Locker.lobbyGadgets,
            ["selectedWinEffect"] = p38.Locker.selectedWinEffect,
            ["winEffects"] = p38.Locker.winEffects,
            ["selectedBreakBedEffect"] = p38.Locker.selectedBreakBedEffect,
            ["breakBedEffects"] = p38.Locker.breakBedEffects,
            ["featuredBadges"] = p38.Locker.featuredBadges,
            ["badges"] = p38.Locker.badges,
            ["bedSkin"] = p38.Locker.bedSkin,
            ["bedSkins"] = p38.Locker.bedSkins,
            ["itemSkins"] = p38.Locker.itemSkins,
            ["selectedItemSkins"] = p38.Locker.selectedItemSkins,
            ["consumableInventory"] = p38.Consumable.inventory
        }
        for v41, v42 in p39 do
            v40[v41] = v42
        end
        return v40
    end)(v37)
}