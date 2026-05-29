local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.SoundManager
local u10 = v3.TooltipContainer
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.MarketplaceService
local u17 = v15.Players
local u18 = v15.UserInputService
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta")
local u27 = v26.BedwarsKitSkinMeta
local u28 = v26.getSkinsForKit
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util")
local u37 = v36.getKitPriceBedCoins
local u38 = v36.getKitPriceRobuxAsync
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u41 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-armor-trim-button").KitShopArmorTrimButton
local u42 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-battlepass-button").KitShopBattlePassButton
local u43 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-contract-button").KitShopContractButton
local u44 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-equip-button").KitShopEquipButton
local u45 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-gift-button").KitShopGiftButton
local u46 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-kit-skin-toggle").KitShopKitSkinToggle
local u47 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-purchase-button").KitShopPurchaseButton
local u48 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-read-lore-button").KitShopReadLoreButton
local u49 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-rent-kit-bedcoins-button").KitShopRentKitBedCoinsButton
local u50 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-rent-kit-button").KitShopRentKitButton
local u51 = v1.import(script, script.Parent, "kit-shop-buttons", "kit-shop-variant-select").KitShopVariantSelect
local u52 = v1.import(script, script.Parent, "kit-shop-showcase", "kit-shop-showcase").KitShopShowcase
local u53 = v1.import(script, script.Parent, "kit-skin-carousel", "kit-skin-list").KitSkinList
local v54 = u14.Component:extend("KitShopRight")
function v54.init(u55, p56) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u38
        [3] = u23
        [4] = u39
        [5] = u14
    --]]
    u55.maid = u13.new()
    function u55.updateItemPrice() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u38
            [3] = u23
            [4] = u39
        --]]
        if u55.props.SelectedKit then
            u38(u55.props.SelectedKit):andThen(function(p57) --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u55
                --]]
                if p57 == nil then
                    return nil
                end
                u55:setState({
                    ["priceRobux"] = p57
                })
            end):catch(function(_) --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u55
                --]]
                u55:setState({
                    ["priceRobux"] = -1
                })
            end)
        elseif u55.props.SelectedBundle then
            local v58 = u23[u55.props.SelectedBundle]
            local v59 = v58.gamepassId
            if v59 ~= 0 and (v59 == v59 and v59) then
                u39.getGamePassProductInfoAsync(v58.gamepassId):andThen(function(p60) --[[ Line: 81 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                    --]]
                    local v61
                    if p60 == nil then
                        v61 = p60
                    else
                        v61 = p60.PriceInRobux
                    end
                    if v61 == nil then
                        return nil
                    end
                    u55:setState({
                        ["priceRobux"] = p60.PriceInRobux
                    })
                end):catch(function() --[[ Line: 93 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                    --]]
                    u55:setState({
                        ["priceRobux"] = -1
                    })
                end)
                return
            end
            local v62 = v58.devProductId
            if v62 ~= 0 and (v62 == v62 and v62) then
                u39.getDevProductInfoAsync(v58.devProductId):andThen(function(p63) --[[ Line: 102 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                    --]]
                    local v64
                    if p63 == nil then
                        v64 = p63
                    else
                        v64 = p63.PriceInRobux
                    end
                    if v64 == nil then
                        return nil
                    end
                    u55:setState({
                        ["priceRobux"] = p63.PriceInRobux
                    })
                end):catch(function() --[[ Line: 114 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                    --]]
                    u55:setState({
                        ["priceRobux"] = -1
                    })
                end)
            end
        end
    end
    u55:setState({
        ["purchased"] = false
    })
    if p56.SelectedKit and p56.store.Bedwars.equippedKitSkins then
        u55:setState({
            ["selectedSkin"] = p56.store.Bedwars.equippedKitSkins[p56.SelectedKit] or u14.None
        })
    end
end
function v54.didUpdate(p65, p66, _) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p66.SelectedKit ~= p65.props.SelectedKit or p66.SelectedBundle ~= p65.props.SelectedBundle then
        p65:setState({
            ["purchased"] = false
        })
        if p65.props.SelectedKit and p65.props.store.Bedwars.equippedKitSkins then
            p65:setState({
                ["selectedSkin"] = p65.props.store.Bedwars.equippedKitSkins[p65.props.SelectedKit] or u14.None
            })
        end
        p65.updateItemPrice()
    end
end
function v54.didMount(u67) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u31
        [3] = u6
        [4] = u11
        [5] = u2
        [6] = u33
        [7] = u19
    --]]
    if #u18:GetConnectedGamepads() ~= 0 then
        u67.maid:GiveTask(u18.InputBegan:Connect(function(p68, _) --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u31
                [3] = u6
                [4] = u11
            --]]
            if p68.KeyCode == Enum.KeyCode.ButtonA then
                local v69 = false
                if u67.props.SelectedKit then
                    local v70 = u67.props.store.Bedwars.ownedKits
                    local v71 = u67.props.SelectedKit
                    local v72 = table.find(v70, v71) ~= nil and true or (u31.FreeKitRotation.kitAvailableThisWeek(u67.props.SelectedKit, u67.props.store.Bedwars.freeKitLevel) and true or v69)
                    v69 = not u6.isHoarceKat() and u11.Controllers.UnlockController.allKitsUnlocked and true or v72
                end
                if v69 then
                    u67:equipKit()
                    return
                end
                u67:purchaseWithRobux()
            end
        end))
        if not u6.isHoarceKat() then
            u67.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
                ["actionId"] = "toggle-skin-gamepad",
                ["action"] = "Interact",
                ["boundFunction"] = function(_, p73, _) --[[ Name: boundFunction, Line 174 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u33
                        [3] = u19
                    --]]
                    if p73 ~= Enum.UserInputState.Begin then
                        return nil
                    end
                    local v74 = not u67.props.store.Bedwars.useKitSkin
                    u33.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                        ["useKitSkin"] = v74
                    }):andThen(function() --[[ Line: 182 ]] end):catch(function(p75) --[[ Line: 183 ]]
                        warn(p75)
                    end)
                    u19:dispatch({
                        ["type"] = "SetUseKitSkin",
                        ["useKitSkin"] = v74
                    })
                end,
                ["priority"] = Enum.ContextActionPriority.High.Value + 10
            }))
        end
    end
    u67.updateItemPrice()
end
function v54.willUnmount(p76) --[[ Line: 197 ]]
    p76.maid:DoCleaning()
end
function v54.rentKit(p77) --[[ Line: 200 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u11
    --]]
    if p77.props.SelectedKit then
        local v78 = p77.props.SelectedKit
        if v78 then
            local v79 = p77.props.store.Bedwars.ownedKits
            local v80 = p77.props.SelectedKit
            v78 = table.find(v79, v80) ~= nil
        end
        if p77.props.SelectedKit == u29.NONE or v78 then
            return false
        else
            return u11.Controllers.KitRentalController:rentKit(p77.props.SelectedKit)
        end
    else
        return false
    end
end
function v54.equipKit(p81) --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u9
        [3] = u34
        [4] = u19
    --]]
    local u82 = p81.props.SelectedKit
    if not u82 then
        return nil
    end
    u33.Client:Get("BedwarsActivateKit"):CallServerAsync({
        ["kit"] = u82
    }):andThen(function(p83) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u34
            [3] = u19
            [4] = u82
        --]]
        if p83 then
            u9:playSound(u34.ARMOR_UNEQUIP)
            u19:dispatch({
                ["type"] = "SetBedwarsKit",
                ["kit"] = u82
            })
        end
    end)
end
function v54.purchaseWithRobux(p84) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u30
        [3] = u16
        [4] = u17
        [5] = u11
    --]]
    if p84.props.SelectedKit and p84.props.SelectedKit ~= u29.NONE then
        local v85 = u30(p84.props.SelectedKit)
        if v85.gamepassId ~= nil then
            u16:PromptGamePassPurchase(u17.LocalPlayer, v85.gamepassId)
            return
        end
        if v85.devProductId ~= nil then
            u16:PromptProductPurchase(u17.LocalPlayer, v85.devProductId)
            return
        end
    elseif p84.props.SelectedBundle then
        u11.Controllers.LobbyBundleController:purchaseBundle(p84.props.SelectedBundle)
    end
end
function v54.render(u86) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u29
        [3] = u6
        [4] = u11
        [5] = u20
        [6] = u32
        [7] = u12
        [8] = u24
        [9] = u17
        [10] = u22
        [11] = u28
        [12] = u25
        [13] = u27
        [14] = u23
        [15] = u35
        [16] = u14
        [17] = u52
        [18] = u21
        [19] = u8
        [20] = u10
        [21] = u4
        [22] = u7
        [23] = u53
        [24] = u46
        [25] = u51
        [26] = u44
        [27] = u42
        [28] = u5
        [29] = u47
        [30] = u37
        [31] = u50
        [32] = u40
        [33] = u49
        [34] = u45
        [35] = u43
        [36] = u48
        [37] = u41
    --]]
    local v87
    if u86.props.SelectedKit then
        v87 = u30(u86.props.SelectedKit)
    else
        v87 = nil
    end
    local v88 = false
    local v89 = false
    local v90 = u86.props.store.Bedwars.kit == u86.props.SelectedKit
    local v91 = false
    local v92 = u86.props.SelectedKit ~= u29.NONE
    local v93 = u86.props.SelectedKit ~= u29.NONE
    local v94
    if u6.isHoarceKat() or u86.props.SelectedBundle then
        v94 = false
    else
        v94 = u11.Controllers.UnlockController:isKitUnlocked(u86.props.SelectedKit or u29.NONE)
        if v94 then
            local v95 = u20.BLACK_LISTED_ARMOR_TRIM_KITS
            local v96 = u86.props.SelectedKit or u29.NONE
            local v97 = table.find(v95, v96) ~= nil
            v94 = not v97
        end
    end
    local v98 = false
    local v99 = false
    local v100 = false
    local v101 = u86.props.SelectedKit
    if v101 then
        if u86.props.SelectedKit == u29.NONE then
            v101 = false
        else
            v101 = u32[u86.props.SelectedKit] ~= nil
        end
    end
    if v101 then
        local v102 = u32[u86.props.SelectedKit]
        if v102 ~= nil then
            v102 = v102.disabled
        end
        v101 = not v102
    end
    local v103 = v101 or (v93 or (v100 or v94))
    local v104
    if u6.isHoarceKat() then
        v104 = true
    else
        local v105 = u86.props.SelectedKit
        if v105 then
            v105 = u11.Controllers.UnlockController:isKitUnlocked(u86.props.SelectedKit)
        end
        if not v105 then
            local v106 = u11.Controllers.MatchController
            if v106 ~= nil then
                v106 = v106:getQueueMeta()
                if v106 ~= nil then
                    v106 = v106.allowUnownedKits
                end
            end
            v105 = v106 == true
        end
        v104 = v105 and true or v89
    end
    local v107 = not u6.isHoarceKat() and (u86.props.SelectedKit and u11.Controllers.UnlockController:isKitOwned(u86.props.SelectedKit)) and true or v88
    local v108 = not (u86.props.store.Bedwars.kit or u86.props.SelectedKit) and true or v90
    local v109 = nil
    for v110, v111 in u12.entries(u86.props.store.Consumable.record) do
        local _ = v110 - 1
        local _ = v111[1]
        local v112 = v111[2]
        local v113 = v112.status == u24.ACTIVE
        if v113 then
            local v114 = v112.extraData
            if v114 ~= nil then
                v114 = v114.rentedKit
            end
            v113 = v114 == u86.props.SelectedKit
        end
        if v113 == true then
            v109 = v111
            break
        end
    end
    if v109 ~= nil then
        v109 = v109[2]
    end
    local v115 = v109 == nil
    if v115 then
        v115 = not v107
    end
    if v115 then
        if v87 ~= nil then
            v87 = v87.disableKitRenting
        end
        v115 = not v87
    end
    local v116 = v115 and true or v99
    local v117 = u17.LocalPlayer
    if v117 ~= nil then
        v117 = v117.DisplayName
    end
    local v118 = v117 == nil and "SnickTrix" or v117
    local v119, v120, v121
    if u86.props.SelectedKit and u86.props.SelectedKit ~= u29.NONE then
        v119 = u30(u86.props.SelectedKit)
        v118 = v119.name
        v120 = v119.description
        v121 = u86.state.priceRobux
        v91 = v119.battlepassSeason == u22.BATTLE_PASS_SEASON
        v92 = not v119.notGiftable
        if v92 then
            v92 = v119.devProductId ~= nil and true or v119.gamepassId ~= nil
        end
        v98 = not v119.forceSkin
        if v121 == nil or (v121 == -1 or v107) then
            v93 = false
        end
        if v119.lore then
            v100 = true
        end
    else
        v119 = nil
        v121 = nil
        v120 = "Opt out of using a kit and play as yourself!"
    end
    local v122 = not u86.props.SelectedKit and {} or u28(u86.props.SelectedKit)
    local v123 = nil
    local v124
    if u86.props.SelectedKit and u86.state.selectedSkin then
        local v125
        if v122 == nil then
            v125 = v122
        else
            local v126 = u86.state.selectedSkin
            v125 = table.find(v122, v126) ~= nil
        end
        if v125 then
            v124 = u86.state.selectedSkin
        else
            v124 = u86.props.store.Bedwars.equippedKitSkins
            if v124 ~= nil then
                v124 = v124[u86.props.SelectedKit]
            end
        end
        local v127
        if v124 then
            if v122 == nil then
                v127 = v122
            else
                v127 = table.find(v122, v124) ~= nil
            end
            if v127 then
                v127 = v124 ~= u25.DEFAULT
            end
        else
            v127 = v124
        end
        if v127 then
            v123 = u27[v124]
            v118 = u27[v124].name
        end
    else
        v124 = nil
    end
    if u86.props.SelectedBundle then
        local v128 = u23[u86.props.SelectedBundle]
        if v128.kitShopBundle then
            v118 = v128.kitShopBundle.name
            v120 = v128.kitShopBundle.description
            v121 = u86.state.priceRobux
            v92 = true
            v108 = false
            v104 = false
            v93 = true
        end
        local v129 = 0
        local v130 = {}
        for v131, v132 in v128.rewards do
            local _ = v131 - 1
            local v133
            if v132.kit then
                v133 = v132.kit
            else
                v133 = nil
            end
            if v133 ~= nil then
                v129 = v129 + 1
                v130[v129] = v133
            end
        end
        local v134 = true
        for v135, v136 in v130 do
            local _ = v135 - 1
            local v137 = u86.props.store.Bedwars.ownedKits
            if table.find(v137, v136) == nil then
                v134 = false
                break
            end
        end
        if v134 then
            v93 = false
        end
    end
    local v138 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = u86.props.Size,
        ["Position"] = u86.props.Position,
        ["BackgroundColor3"] = u35.backgroundSecondary
    }
    local v139 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder"
        }) }
    local v140 = #v139
    local v141 = {
        ["Size"] = UDim2.fromScale(1, 0.3),
        ["SelectedKit"] = u86.props.SelectedKit or nil,
        ["SelectedSkin"] = v124
    }
    local v142
    if u86.props.SelectedBundle then
        v142 = u23[u86.props.SelectedBundle].kitShopBundle
        if v142 ~= nil then
            v142 = v142.image
        end
    else
        v142 = nil
    end
    v141.ItemImage = v142
    v141.store = u86.props.store
    v139[v140 + 1] = u14.createElement(u52, v141)
    local v143 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.7)
    }
    local v144 = { u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.02, 0),
            ["PaddingBottom"] = UDim.new(0.03, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }), u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local _ = #v144
    local v145 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.4)
    }
    local v146 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Top",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v147 = #v146
    local v148 = {
        ["SizeConstraint"] = "RelativeXX",
        ["Size"] = UDim2.fromScale(1, 0.15)
    }
    local v149 = { u14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["Text"] = v118,
            ["Size"] = UDim2.fromScale(0.75, 1),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["AutoLocalize"] = u86.props.SelectedKit ~= u29.NONE
        }, { u14.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u6.isSmallScreen() and 20 or 28
            }) }) }
    local v150 = #v149
    local v151
    if v119 == nil or v119.battlepassSeason == nil then
        v151 = false
    else
        local v152 = u14.createElement
        local v153 = {
            ["Size"] = UDim2.fromScale(0.25, 0.75),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["BackgroundColor3"] = u35.backgroundPrimary
        }
        local v154 = {}
        local v155 = u14.createElement
        local v156 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["AutoLocalize"] = true
        }
        local v157 = u21(v119.battlepassSeason).seasonNumber
        v156.Text = "S" .. tostring(v157)
        v156.Size = UDim2.fromScale(0.5, 1)
        v156.AnchorPoint = Vector2.new(0, 0.5)
        v156.Position = UDim2.fromScale(0.1, 0.5)
        v156.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v156.TextColor3 = Color3.fromRGB(255, 255, 255)
        v156.TextXAlignment = Enum.TextXAlignment.Left
        local v158 = v155("TextLabel", v156)
        local v159 = u14.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Image"] = u21(v119.battlepassSeason).icon
        }, { u14.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u14.createElement(u8, {
                ["Padding"] = UDim.new(0.05, 0)
            }) })
        local v160 = u14.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.2, 0)
        })
        local v161 = u14.createElement
        local v162 = u10
        local v163 = {}
        local v164 = u14.createElement
        local v165 = u4
        local v166 = {
            ["TextSize"] = 26
        }
        local v167 = u21(v119.battlepassSeason).seasonNumber
        v166.Text = "Season " .. tostring(v167)
        v166.Font = Enum.Font.SourceSansBold
        v166.Limits = Vector2.new(300, 60)
        __set_list(v163, 1, {v164(v165, v166)})
        __set_list(v154, 1, {v158, v159, v160, v161(v162, {}, v163)})
        v151 = v152("Frame", v153, v154)
    end
    if v151 then
        v149[v150 + 1] = v151
    end
    v146[v147 + 1] = u14.createElement(u7, v148, v149)
    v146[v147 + 2] = u14.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Font"] = "Roboto",
        ["TextScaled"] = true,
        ["RichText"] = true,
        ["TextTransparency"] = 0.3,
        ["TextXAlignment"] = "Left",
        ["TextYAlignment"] = "Top",
        ["Text"] = v120,
        ["Size"] = UDim2.fromScale(1, 0.77),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
    }, { u14.createElement("UITextSizeConstraint", {
            ["MinTextSize"] = 12,
            ["MaxTextSize"] = u6.isSmallScreen() and 14 or 22
        }) })
    v144.KitInfo = u14.createElement(u7, v145, v146)
    local v168 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.57)
    }
    local v169 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Bottom",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v170 = #v169
    local v171 = v122 and u86.props.SelectedKit
    if v171 then
        v171 = u14.createElement(u53, {
            ["Size"] = UDim2.fromScale(1, 0.42000000000000004),
            ["Kit"] = u86.props.SelectedKit,
            ["Skins"] = v122,
            ["SelectedSkin"] = v124,
            ["SetSelectedSkin"] = function(p172) --[[ Name: SetSelectedSkin, Line 647 ]]
                --[[
                Upvalues:
                    [1] = u86
                --]]
                u86:setState({
                    ["selectedSkin"] = p172
                })
            end,
            ["store"] = u86.props.store
        })
    end
    if v171 then
        v169[v170 + 1] = v171
    end
    local v173 = #v169
    local v174 = u86.props.SelectedKit ~= u29.NONE
    if v174 then
        local v175 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.075)
        }
        local v176 = { u14.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v177 = #v176
        if v98 then
            v98 = u14.createElement(u46, {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["UseKitSkin"] = u86.props.store.Bedwars.useKitSkin
            })
        end
        if v98 then
            v176[v177 + 1] = v98
        end
        local v178 = #v176
        local v179 = u86.state.selectedSkin and v124
        if v179 then
            if v123 ~= nil then
                v123 = v123.variantOfSkin
            end
            if v123 then
                v123 = u14.createElement(u51, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.55, 1),
                    ["SelectedSkin"] = v124,
                    ["SetSelectedSkin"] = function(p180) --[[ Name: SetSelectedSkin, Line 694 ]]
                        --[[
                        Upvalues:
                            [1] = u86
                        --]]
                        u86:setState({
                            ["selectedSkin"] = p180
                        })
                    end,
                    ["store"] = u86.props.store
                })
            end
        else
            v123 = v179
        end
        if v123 then
            v176[v178 + 1] = v123
        end
        v174 = u14.createElement(u7, v175, v176)
    end
    if v174 then
        v169[v173 + 1] = v174
    end
    local v181 = #v169
    local v182
    if v104 then
        v182 = u14.createElement(u44, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Equipped"] = v108,
            ["EquipKit"] = function() --[[ Name: EquipKit, Line 717 ]]
                --[[
                Upvalues:
                    [1] = u86
                --]]
                u86:equipKit()
            end,
            ["ActiveRental"] = v109
        })
    elseif v91 then
        v182 = u14.createElement(u42, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 1)
        })
    else
        local v183
        if v119 == nil then
            v183 = false
        else
            v183 = v119.battlepassSeason ~= nil
        end
        if v183 then
            local v184 = u21(v119.battlepassSeason).seasonNumber
            v183 = (v184 == nil and (1 / 0) or v184) < 10
        end
        if v183 then
            v182 = u14.createElement(u5, {
                ["Text"] = "Unobtainable",
                ["BackgroundColor3"] = u35.Gray,
                ["OnClick"] = function() --[[ Name: OnClick, Line 741 ]] end,
                ["Size"] = UDim2.fromScale(0.8, 1)
            })
        else
            v182 = u14.createElement(u7, {
                ["Size"] = UDim2.fromScale(0.8, 1)
            })
        end
    end
    local v185 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.145)
    }
    local v186 = {
        u14.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = v104 and "Left" or "Right",
            ["Padding"] = UDim.new(0.05, 0)
        }),
        [#v186 + 1] = v182
    }
    v169.EquipButtonContainer = u14.createElement(u7, v185, v186)
    if v93 then
        local v187 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.145)
        }
        local v188 = { u14.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.04, 0)
            }) }
        local v189 = #v188
        local v190
        if v93 then
            if v121 == nil then
                v190 = false
            else
                v190 = u14.createElement(u47, {
                    ["LayoutOrder"] = 1,
                    ["PurchaseButtonType"] = "Robux",
                    ["Size"] = UDim2.fromScale(0.48, 1),
                    ["Purchase"] = function() --[[ Name: Purchase, Line 784 ]]
                        --[[
                        Upvalues:
                            [1] = u86
                        --]]
                        u86:purchaseWithRobux()
                    end,
                    ["Price"] = v121
                })
            end
        else
            v190 = v93
        end
        if v190 then
            v188[v189 + 1] = v190
        end
        local v191 = #v188
        local v192 = u86.props.SelectedKit
        if v192 then
            if u86.props.SelectedKit == u29.NONE then
                v93 = false
            elseif v93 then
                v93 = v121 ~= nil
            end
        else
            v93 = v192
        end
        if v93 then
            local v195 = {
                ["LayoutOrder"] = 1,
                ["PurchaseButtonType"] = "BedCoin",
                ["Size"] = UDim2.fromScale(0.48, 1),
                ["Purchase"] = function() --[[ Name: Purchase, Line 799 ]]
                    --[[
                    Upvalues:
                        [1] = u86
                        [2] = u29
                        [3] = u30
                        [4] = u11
                    --]]
                    if u86.props.SelectedKit and u86.props.SelectedKit ~= u29.NONE then
                        local v193 = u30(u86.props.SelectedKit)
                        local v194 = v193.bedCoinProduct
                        if v194 ~= nil then
                            v194 = v194.bedCoinProductId
                        end
                        if v194 ~= 0 and (v194 == v194 and v194) then
                            u11.Controllers.BedCoinProductPurchaseController:purchase({
                                ["productId"] = v193.bedCoinProduct.bedCoinProductId
                            })
                        end
                    end
                end
            }
            local v196 = u37(u86.props.SelectedKit)
            v195.Price = v196 == nil and 0 or v196
            v93 = u14.createElement(u47, v195)
        end
        if v93 then
            v188[v191 + 1] = v93
        end
        v93 = u14.createElement(u7, v187, v188)
    end
    if v93 then
        v169[v181 + 1] = v93
    end
    local v197 = #v169
    if v103 then
        local v198 = {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(1, 0.145)
        }
        local v199 = { u14.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.04, 0)
            }) }
        local v200 = #v199
        local v201 = u86.props.SelectedKit
        if v201 then
            if v116 then
                v201 = u14.createElement(u50, {
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.fromScale(0.15, 0.9),
                    ["SelectedKit"] = u86.props.SelectedKit,
                    ["RentKit"] = function() --[[ Name: RentKit, Line 853 ]]
                        --[[
                        Upvalues:
                            [1] = u86
                        --]]
                        return u86:rentKit()
                    end
                })
            else
                v201 = v116
            end
        end
        if v201 then
            v199[v200 + 1] = v201
        end
        local v202 = #v199
        local v203 = u40.isLobbyServer() and u86.props.SelectedKit
        if v203 then
            if v116 then
                v116 = u14.createElement(u49, {
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.fromScale(0.15, 0.9),
                    ["SelectedKit"] = u86.props.SelectedKit,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 865 ]]
                        --[[
                        Upvalues:
                            [1] = u86
                            [2] = u11
                        --]]
                        if u86.props.SelectedKit then
                            u11.Controllers.KitRentalController:promptBedCoinPurchaseKitRental(u86.props.SelectedKit)
                        end
                    end
                })
            end
        else
            v116 = v203
        end
        if v116 then
            v199[v202 + 1] = v116
        end
        local v204 = #v199
        if v92 then
            local v205 = u14.createElement
            local v206 = u45
            local v207 = {
                ["LayoutOrder"] = 100,
                ["Size"] = UDim2.fromScale(0.15, 0.9)
            }
            local v208
            if u86.props.SelectedKit and u86.props.SelectedKit ~= u29.NONE then
                v208 = u86.props.SelectedKit
            else
                v208 = u86.props.SelectedBundle or u29.NONE
            end
            v207.GiftType = v208
            v92 = v205(v206, v207)
        end
        if v92 then
            v199[v204 + 1] = v92
        end
        local v209 = #v199
        local v210 = u86.props.SelectedKit
        if v210 then
            if v101 then
                v101 = u14.createElement(u43, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.15, 0.9),
                    ["SelectedKit"] = u86.props.SelectedKit
                })
            end
        else
            v101 = v210
        end
        if v101 then
            v199[v209 + 1] = v101
        end
        local v211 = #v199
        local v212 = u86.props.SelectedKit
        if v212 then
            if v100 then
                v100 = u14.createElement(u48, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.15, 0.9),
                    ["SelectedKit"] = u86.props.SelectedKit
                })
            end
        else
            v100 = v212
        end
        if v100 then
            v199[v211 + 1] = v100
        end
        local v213 = #v199
        local v214 = u40.isLobbyServer()
        if v214 then
            if v94 then
                v94 = u14.createElement(u41, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.15, 0.9),
                    ["SelectedKit"] = u86.props.SelectedKit or u29.NONE
                })
            end
        else
            v94 = v214
        end
        if v94 then
            v199[v213 + 1] = v94
        end
        v103 = u14.createElement(u7, v198, v199)
    end
    if v103 then
        v169[v197 + 1] = v103
    end
    v144.KitActions = u14.createElement(u7, v168, v169)
    v139.BottomSection = u14.createElement(u7, v143, v144)
    return u14.createFragment({
        ["KitShopRight"] = u14.createElement("Frame", v138, v139)
    })
end
return {
    ["KitShopRight"] = v54
}