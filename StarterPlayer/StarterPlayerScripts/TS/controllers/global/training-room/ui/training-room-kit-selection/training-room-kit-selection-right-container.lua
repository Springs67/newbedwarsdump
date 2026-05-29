local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.MarketplaceService
local u12 = v10.Players
local u13 = v10.UserInputService
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-shop-buttons", "kit-shop-kit-skin-toggle").KitShopKitSkinToggle
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-shop-buttons", "kit-shop-variant-select").KitShopVariantSelect
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-shop-showcase", "kit-shop-showcase").KitShopShowcase
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-skin-carousel", "kit-skin-list").KitSkinList
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta")
local u25 = v24.BedwarsKitSkinMeta
local u26 = v24.getSkinsForKit
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitPriceRobuxAsync
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil
local u35 = v1.import(script, script.Parent, "training-room-kit-selection-equip-button").TrainingRoomKitSelectionEquipButton
local v36 = u9.Component:extend("TrainingRoomKitSelectionRight")
function v36.init(u37, p38) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u33
        [3] = u21
        [4] = u34
        [5] = u9
    --]]
    u37.maid = u8.new()
    function u37.updateItemPrice() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u33
            [3] = u21
            [4] = u34
        --]]
        if u37.props.SelectedKit then
            u33(u37.props.SelectedKit):andThen(function(p39) --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                if p39 == nil then
                    return nil
                end
                u37:setState({
                    ["priceRobux"] = p39
                })
            end):catch(function(_) --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                u37:setState({
                    ["priceRobux"] = -1
                })
            end)
        elseif u37.props.SelectedBundle then
            local v40 = u21[u37.props.SelectedBundle]
            local v41 = v40.gamepassId
            if v41 ~= 0 and (v41 == v41 and v41) then
                u34.getGamePassProductInfoAsync(v40.gamepassId):andThen(function(p42) --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                    --]]
                    local v43
                    if p42 == nil then
                        v43 = p42
                    else
                        v43 = p42.PriceInRobux
                    end
                    if v43 == nil then
                        return nil
                    end
                    u37:setState({
                        ["priceRobux"] = p42.PriceInRobux
                    })
                end):catch(function() --[[ Line: 75 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                    --]]
                    u37:setState({
                        ["priceRobux"] = -1
                    })
                end)
            end
        end
    end
    u37:setState({
        ["purchased"] = false
    })
    if p38.SelectedKit and p38.store.Bedwars.equippedKitSkins then
        u37:setState({
            ["selectedSkin"] = p38.store.Bedwars.equippedKitSkins[p38.SelectedKit] or u9.None
        })
    end
end
function v36.didUpdate(p44, p45, _) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p45.SelectedKit ~= p44.props.SelectedKit then
        p44:setState({
            ["purchased"] = false
        })
        if p44.props.SelectedKit and p44.props.store.Bedwars.equippedKitSkins then
            p44:setState({
                ["selectedSkin"] = p44.props.store.Bedwars.equippedKitSkins[p44.props.SelectedKit] or u9.None
            })
        end
        p44.updateItemPrice()
    end
end
function v36.didMount(u46) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u29
        [3] = u4
        [4] = u6
        [5] = u2
        [6] = u31
        [7] = u18
    --]]
    if u13.GamepadEnabled and not u13.MouseEnabled then
        u46.maid:GiveTask(u13.InputBegan:Connect(function(p47, _) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u29
                [3] = u4
                [4] = u6
            --]]
            if p47.KeyCode == Enum.KeyCode.ButtonA then
                local v48 = false
                if u46.props.SelectedKit then
                    local v49 = u46.props.store.Bedwars.ownedKits
                    local v50 = u46.props.SelectedKit
                    local v51 = table.find(v49, v50) ~= nil and true or (u29.FreeKitRotation.kitAvailableThisWeek(u46.props.SelectedKit, u46.props.store.Bedwars.freeKitLevel) and true or v48)
                    v48 = not u4.isHoarceKat() and u6.Controllers.UnlockController.allKitsUnlocked and true or v51
                end
                if v48 then
                    u46:confirmKitSelection()
                    return
                end
                u46:purchase()
            end
        end))
    end
    u46.updateItemPrice()
    u46.maid:GiveTask(function() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u46
            [3] = u31
            [4] = u18
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            ["actionId"] = "toggle-skin-gamepad",
            ["action"] = "Interact",
            ["boundFunction"] = function(_, p52, _) --[[ Name: boundFunction, Line 135 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u31
                    [3] = u18
                --]]
                if p52 ~= Enum.UserInputState.Begin then
                    return nil
                end
                local v53 = not u46.props.store.Bedwars.useKitSkin
                u31.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                    ["useKitSkin"] = v53
                }):andThen(function() --[[ Line: 143 ]] end):catch(function(p54) --[[ Line: 144 ]]
                    warn(p54)
                end)
                u18:dispatch({
                    ["type"] = "SetUseKitSkin",
                    ["useKitSkin"] = v53
                })
            end,
            ["priority"] = Enum.ContextActionPriority.High.Value + 10
        })
    end)
end
function v36.willUnmount(p55) --[[ Line: 156 ]]
    p55.maid:DoCleaning()
end
function v36.rentKit(p56) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u6
    --]]
    if p56.props.SelectedKit then
        local v57 = p56.props.SelectedKit
        if v57 then
            local v58 = p56.props.store.Bedwars.ownedKits
            local v59 = p56.props.SelectedKit
            v57 = table.find(v58, v59) ~= nil
        end
        if p56.props.SelectedKit == u27.NONE or v57 then
            return false
        else
            return u6.Controllers.KitRentalController:rentKit(p56.props.SelectedKit)
        end
    else
        return false
    end
end
function v36.confirmKitSelection(p60) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u2
        [3] = u19
    --]]
    if not p60.props.SelectedKit then
        return nil
    end
    u31.Client:Get("TrainingRoomQueue"):SendToServer({})
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.TRAINING_ROOM_KIT_SELECTION_APP)
end
function v36.purchase(p61) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u28
        [3] = u11
        [4] = u12
        [5] = u6
    --]]
    if p61.props.SelectedKit and p61.props.SelectedKit ~= u27.NONE then
        local v62 = u28(p61.props.SelectedKit)
        if v62.gamepassId ~= nil then
            u11:PromptGamePassPurchase(u12.LocalPlayer, v62.gamepassId)
            return
        end
        if v62.devProductId ~= nil then
            u11:PromptProductPurchase(u12.LocalPlayer, v62.devProductId)
            return
        end
    elseif p61.props.SelectedBundle then
        u6.Controllers.LobbyBundleController:purchaseBundle(p61.props.SelectedBundle)
    end
end
function v36.render(u63) --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u27
        [3] = u30
        [4] = u4
        [5] = u6
        [6] = u29
        [7] = u7
        [8] = u22
        [9] = u20
        [10] = u12
        [11] = u25
        [12] = u23
        [13] = u21
        [14] = u26
        [15] = u32
        [16] = u9
        [17] = u16
        [18] = u5
        [19] = u17
        [20] = u15
        [21] = u14
        [22] = u35
    --]]
    local v64
    if u63.props.SelectedKit then
        v64 = u28(u63.props.SelectedKit)
    else
        v64 = nil
    end
    local v65 = false
    local v66 = false
    local v67 = u63.props.store.Bedwars.kit == u63.props.SelectedKit
    local _ = u63.props.SelectedKit == u27.NONE
    local v68 = u63.props.SelectedKit ~= u27.NONE
    local v69 = false
    local v70 = true
    local v71 = u63.props.SelectedKit
    if v71 then
        if u63.props.SelectedKit == u27.NONE then
            v71 = false
        else
            v71 = u30[u63.props.SelectedKit] ~= nil
        end
    end
    if u63.props.SelectedKit == u27.NONE then
        v66 = true
    else
        local v72 = u63.props.SelectedKit
        if v72 then
            local v73 = u63.props.store.Bedwars.ownedKits
            local v74 = u63.props.SelectedKit
            v72 = table.find(v73, v74) ~= nil
        end
        if v72 then
            v65 = true
            v66 = true
        end
    end
    local v75 = u63.props.store.Clans.myClan
    local v76 = u63.props.SelectedKit and (v75 and v75.kitShop.unlocks[u63.props.SelectedKit] ~= nil) and true or v66
    local v77 = not u4.isHoarceKat() and u6.Controllers.UnlockController.allKitsUnlocked and true or v76
    local v78 = not (u63.props.store.Bedwars.kit or u63.props.SelectedKit) and true or v67
    if u63.props.SelectedKit then
        u29.FreeKitRotation.kitAvailableThisWeek(u63.props.SelectedKit, u63.props.store.Bedwars.freeKitLevel)
    end
    local v79 = nil
    for v80, v81 in u7.entries(u63.props.store.Consumable.record) do
        local _ = v80 - 1
        local _ = v81[1]
        local v82 = v81[2]
        local v83 = v82.status == u22.ACTIVE
        if v83 then
            local v84 = v82.extraData
            if v84 ~= nil then
                v84 = v84.rentedKit
            end
            v83 = v84 == u63.props.SelectedKit
        end
        if v83 == true then
            v79 = v81
            break
        end
    end
    if v79 ~= nil then
        v79 = v79[2]
    end
    local v85 = v79 ~= nil
    if not u63.props.SelectedKit or u63.props.SelectedKit == u27.NONE then
        v70 = false
    end
    if u63.props.SelectedKit ~= u27.NONE and (v85 or v65) then
        v70 = false
    end
    local v86
    if v64 == nil then
        v86 = v64
    else
        v86 = v64.unlockedInBattlePass
    end
    if v86 then
        v86 = v64.battlepassSeason == u20.BATTLE_PASS_SEASON
    end
    if v86 then
        v70 = false
    end
    local v87 = u12.LocalPlayer
    if v87 ~= nil then
        v87 = v87.DisplayName
    end
    local v88 = v87 == nil and "SnickTrix" or v87
    local v89
    if u63.props.SelectedKit and u63.props.SelectedKit ~= u27.NONE then
        local v90 = u28(u63.props.SelectedKit)
        v88 = v90.name
        v89 = v90.description
        local v91 = u63.state.priceRobux
        local v92 = v90.unlockedInBattlePass
        if v92 == nil then
            v92 = false
        end
        local v93 = not (v92 or v90.notGiftable)
        if v93 then
            v93 = v90.devProductId ~= nil and true or v90.gamepassId ~= nil
        end
        v69 = not v90.forceSkin
        if v91 == nil or (v91 == -1 or (v92 or v77)) then
            v68 = false
        end
        local _ = v90.lore
    else
        v89 = "No current kit selected"
    end
    local v94
    if u63.state.selectedSkin and v69 then
        v94 = u25[u63.state.selectedSkin]
    else
        v94 = nil
    end
    if u63.state.selectedSkin and u63.state.selectedSkin ~= u23.DEFAULT then
        v88 = u25[u63.state.selectedSkin].name
    end
    if u63.props.SelectedBundle then
        local v95 = u21[u63.props.SelectedBundle]
        if v95.kitShopBundle then
            v88 = v95.kitShopBundle.name
            v89 = v95.kitShopBundle.description
            local _ = u63.state.priceRobux
            v68 = true
            v78 = false
        end
        local v96 = 0
        local v97 = {}
        for v98, v99 in v95.rewards do
            local _ = v98 - 1
            local v100
            if v99.kit then
                v100 = v99.kit
            else
                v100 = nil
            end
            if v100 ~= nil then
                v96 = v96 + 1
                v97[v96] = v100
            end
        end
        if v97 ~= nil then
            v97 = true
            for v101, v102 in v97 do
                local _ = v101 - 1
                local v103 = u63.props.store.Bedwars.ownedKits
                if table.find(v103, v102) == nil then
                    v97 = false
                    break
                end
            end
        end
        if v97 then
            v68 = false
        end
    end
    local v104 = not u63.props.SelectedKit and {} or u26(u63.props.SelectedKit)
    local v105 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = u63.props.Size,
        ["Position"] = u63.props.Position,
        ["BackgroundColor3"] = u32.backgroundSecondary
    }
    local v106 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder"
        }) }
    local v107 = #v106
    local v108 = {
        ["Size"] = UDim2.fromScale(1, 0.3),
        ["SelectedKit"] = u63.props.SelectedKit or nil,
        ["SelectedSkin"] = u63.state.selectedSkin
    }
    local v109
    if u63.props.SelectedBundle then
        v109 = u21[u63.props.SelectedBundle].kitShopBundle
        if v109 ~= nil then
            v109 = v109.image
        end
    else
        v109 = nil
    end
    v108.ItemImage = v109
    v108.store = u63.props.store
    v106[v107 + 1] = u9.createElement(u16, v108)
    local v110 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.7)
    }
    local v111 = {
        u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.02, 0),
            ["PaddingBottom"] = UDim.new(0.03, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }),
        u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }),
        ["KitInfo"] = u9.createElement(u5, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.375)
        }, { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["Padding"] = UDim.new(0.03, 0)
            }), u9.createElement("TextLabel", {
                ["SizeConstraint"] = "RelativeXX",
                ["BackgroundTransparency"] = 1,
                ["Font"] = "Roboto",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextXAlignment"] = "Left",
                ["Text"] = "<b>" .. v88 .. "</b>",
                ["Size"] = UDim2.fromScale(1, 0.15),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["AutoLocalize"] = u63.props.SelectedKit ~= u27.NONE
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 20 or 28
                }) }), u9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Font"] = "Roboto",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextTransparency"] = 0.3,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["Text"] = v89,
                ["Size"] = UDim2.fromScale(1, 0.77),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 14 or 22
                }) }) })
    }
    local _ = #v111
    local v112 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.595)
    }
    local v113 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Bottom",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v114 = #v113
    local v115 = v104 and u63.props.SelectedKit
    if v115 then
        v115 = u9.createElement(u17, {
            ["Size"] = UDim2.fromScale(1, 0.42000000000000004),
            ["Kit"] = u63.props.SelectedKit,
            ["Skins"] = v104,
            ["SelectedSkin"] = u63.state.selectedSkin,
            ["SetSelectedSkin"] = function(p116) --[[ Name: SetSelectedSkin, Line 519 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                u63:setState({
                    ["selectedSkin"] = p116
                })
            end,
            ["store"] = u63.props.store
        })
    end
    if v115 then
        v113[v114 + 1] = v115
    end
    local v117 = #v113
    if u63.props.SelectedKit == u27.NONE then
        v69 = false
    end
    if v69 then
        local v118 = u63.state.selectedSkin
        if v118 then
            if v94 ~= nil then
                v94 = v94.variantOfSkin
            end
            if v94 then
                v94 = u9.createElement(u15, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.55, 1),
                    ["SelectedSkin"] = u63.state.selectedSkin,
                    ["SetSelectedSkin"] = function(p119) --[[ Name: SetSelectedSkin, Line 544 ]]
                        --[[
                        Upvalues:
                            [1] = u63
                        --]]
                        u63:setState({
                            ["selectedSkin"] = p119
                        })
                    end,
                    ["store"] = u63.props.store
                })
            end
        else
            v94 = v118
        end
        local v120 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.075)
        }
        local v121 = { u9.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.05, 0)
            }), u9.createElement(u14, {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["UseKitSkin"] = u63.props.store.Bedwars.useKitSkin
            }) }
        local v122 = #v121
        if v94 then
            v121[v122 + 1] = v94
        end
        v69 = u9.createElement(u5, v120, v121)
    end
    if v69 then
        v113[v117 + 1] = v69
    end
    local v123 = #v113
    v113.EquipButtonContainer = u9.createElement(u5, {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.145)
    }, { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        }), u9.createElement(u35, {
            ["Size"] = UDim2.fromScale(v70 and 0.8 or 1, 1),
            ["Equipped"] = v78,
            ["EquipKit"] = function() --[[ Name: EquipKit, Line 594 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                u63:confirmKitSelection()
            end,
            ["ActiveRental"] = v79
        }) })
    if v68 then
        v68 = u9.createElement(u5, {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.145)
        }, { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.04, 0)
            }) })
    end
    if v68 then
        v113[v123 + 1] = v68
    end
    local _ = #v113
    v111.KitActions = u9.createElement(u5, v112, v113)
    v106.BottomSection = u9.createElement(u5, v110, v111)
    return u9.createFragment({
        ["TrainingRoomKitSelectionRight"] = u9.createElement("Frame", v105, v106)
    })
end
return {
    ["TrainingRoomKitSelectionRight"] = v36
}