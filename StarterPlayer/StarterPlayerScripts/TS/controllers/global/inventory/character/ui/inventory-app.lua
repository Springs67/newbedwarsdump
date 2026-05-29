local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ColorUtil
local u6 = v3.DarkBackground
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.EmptyButton
local u10 = v3.RandomUtil
local u11 = v3.SlideIn
local u12 = v3.SoundManager
local u13 = v3.TooltipContainer
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u24 = u1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader
local u25 = u1.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile
local v26 = u15.Component:extend("InventoryAppBase")
function v26.init(_) --[[ Line: 31 ]] end
function v26.render(p27) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u25
        [4] = u1
        [5] = u21
        [6] = u18
        [7] = u12
        [8] = u10
        [9] = u22
        [10] = u6
        [11] = u7
        [12] = u24
        [13] = u5
        [14] = u9
        [15] = u17
        [16] = u23
        [17] = u14
        [18] = u20
        [19] = u2
        [20] = u19
        [21] = u13
        [22] = u4
        [23] = u11
    --]]
    local v28 = false
    local v29 = 0
    local v30 = {}
    local v31 = {}
    while true do
        if true then
            if v28 then
                v29 = v29 + 1
            else
                v28 = true
            end
        end
        if v29 >= 32 then
            table.sort(v30, function(p32, p33) --[[ Line: 77 ]]
                return p32.addedToBackpackTime < p33.addedToBackpackTime
            end)
            local v34 = false
            local v35 = 0
            while true do
                if v34 then
                    v35 = v35 + 1
                else
                    v34 = true
                end
                if v35 >= 24 then
                    break
                end
                local u36
                if v35 < #v30 then
                    u36 = v30[v35 + 1]
                else
                    u36 = nil
                end
                local v42 = u15.createElement(u8, {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["LayoutOrder"] = v35
                }, { u15.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.025),
                        ["PaddingBottom"] = UDim.new(0.025),
                        ["PaddingLeft"] = UDim.new(0.025),
                        ["PaddingRight"] = UDim.new(0.025)
                    }), u15.createElement(u25, {
                        ["InvItem"] = u36,
                        ["AutoSelect"] = v35 == 0,
                        ["LayoutOrder"] = v35,
                        ["OnClick"] = u1.async(function() --[[ Line: 112 ]]
                            --[[
                            Upvalues:
                                [1] = u36
                                [2] = u21
                                [3] = u18
                                [4] = u12
                                [5] = u10
                                [6] = u22
                            --]]
                            if not u36 then
                                return
                            end
                            local v37 = u21(u36.itemType)
                            if v37.armor and u18:getState().Inventory.observedInventory.inventory.armor[v37.armor.slot + 1] == "empty" then
                                u18:dispatch({
                                    ["type"] = "InventorySetArmorItem",
                                    ["item"] = u36,
                                    ["armorSlot"] = v37.armor.slot
                                })
                                u12:playSound(u10.fromList(u22.ARMOR_EQUIP))
                            end
                            if v37.backpack and u18:getState().Inventory.observedInventory.inventory.backpack == nil then
                                u18:dispatch({
                                    ["type"] = "InventorySetBackpack",
                                    ["item"] = u36
                                })
                                u12:playSound(u10.fromList(u22.ARMOR_EQUIP))
                            end
                            local v38 = -1
                            for v39, v40 in u18:getState().Inventory.observedInventory.hotbar do
                                local _ = v39 - 1
                                if v40.item == nil == true then
                                    v38 = v39 - 1
                                    break
                                end
                            end
                            if v38 > -1 and not (v37.backpack or v37.armor) then
                                u18:dispatch({
                                    ["type"] = "InventoryAddToHotbar",
                                    ["slot"] = v38,
                                    ["item"] = u36
                                })
                            end
                            return true
                        end),
                        ["SendToHotbarSlot"] = function(p41) --[[ Name: SendToHotbarSlot, Line 159 ]]
                            --[[
                            Upvalues:
                                [1] = u36
                                [2] = u18
                            --]]
                            if u36 then
                                u18:dispatch({
                                    ["type"] = "InventoryAddToHotbar",
                                    ["slot"] = p41,
                                    ["item"] = u36
                                })
                            end
                        end
                    }) })
                table.insert(v31, v42)
            end
            local u43 = 0
            local v44 = false
            local v45 = {}
            while true do
                if v44 then
                    u43 = u43 + 1
                else
                    v44 = true
                end
                if u43 >= 3 then
                    local u46 = p27.props.Inventory.observedInventory.inventory.backpack or nil
                    local v47 = u15.createElement(u8, {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }, { u15.createElement("UIPadding", {
                            ["PaddingTop"] = UDim.new(0.025),
                            ["PaddingBottom"] = UDim.new(0.025),
                            ["PaddingLeft"] = UDim.new(0.025),
                            ["PaddingRight"] = UDim.new(0.025)
                        }), u15.createElement(u25, {
                            ["LayoutOrder"] = 0,
                            ["InvItem"] = u46,
                            ["OnClick"] = u1.async(function() --[[ Line: 250 ]]
                                --[[
                                Upvalues:
                                    [1] = u46
                                    [2] = u18
                                    [3] = u12
                                    [4] = u10
                                    [5] = u22
                                --]]
                                if u46 then
                                    u18:dispatch({
                                        ["type"] = "InventorySetBackpack",
                                        ["item"] = nil
                                    })
                                    u12:playSound(u10.fromList(u22.ARMOR_UNEQUIP))
                                    return true
                                end
                            end),
                            ["SendToHotbarSlot"] = function() --[[ Name: SendToHotbarSlot, Line 260 ]]
                                --[[
                                Upvalues:
                                    [1] = u46
                                    [2] = u18
                                    [3] = u12
                                    [4] = u10
                                    [5] = u22
                                --]]
                                if u46 then
                                    u18:dispatch({
                                        ["type"] = "InventorySetBackpack",
                                        ["item"] = nil
                                    })
                                    u12:playSound(u10.fromList(u22.ARMOR_UNEQUIP))
                                end
                            end
                        }) })
                    local v48 = { u15.createElement(u6, {
                            ["Transparent"] = false,
                            ["AppId"] = p27.props.AppId
                        }) }
                    local v49 = #v48
                    local v50 = {}
                    local v51 = #v50
                    local v52 = {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u7.isSmallScreen() and 0.45 or 0.5, u7.isSmallScreen() and 0.5 or 0.38),
                        ["Position"] = UDim2.fromScale(0.5, u7.isSmallScreen() and 0.68 or 0.72),
                        ["AnchorPoint"] = Vector2.new(0.5, 1)
                    }
                    local v53 = { u15.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1.5
                        }), u15.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Center",
                            ["VerticalAlignment"] = "Center"
                        }) }
                    local v54 = #v53
                    local v55 = {
                        ["Size"] = UDim2.fromScale(0.3333333333333333, 0.75)
                    }
                    local v56 = { u15.createElement("UIListLayout", {
                            ["FillDirection"] = "Vertical"
                        }), u15.createElement(u24, {
                            ["Title"] = "Armor"
                        }), u15.createElement(u8, {
                            ["Size"] = UDim2.fromScale(0, 0.01)
                        }) }
                    local v57 = #v56
                    local v58 = {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 0.25,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(1, 0),
                        ["BackgroundColor3"] = u5.hexColor(1713718)
                    }
                    local v59 = { u15.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["VerticalAlignment"] = "Center"
                        }), u15.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.025, 0)
                        }), u15.createElement("Frame", {
                            ["BorderSizePixel"] = 0,
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(0.5, 1)
                        }, { u15.createElement("UIGridLayout", {
                                ["FillDirection"] = "Vertical",
                                ["SortOrder"] = "LayoutOrder",
                                ["VerticalAlignment"] = "Center",
                                ["HorizontalAlignment"] = "Center",
                                ["CellSize"] = UDim2.fromScale(0.96, 0.32),
                                ["CellPadding"] = UDim2.fromScale(0, 0)
                            }), v47 }) }
                    local v60 = #v59
                    local v61 = {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.5, 1)
                    }
                    local v62 = { u15.createElement("UIGridLayout", {
                            ["FillDirection"] = "Vertical",
                            ["SortOrder"] = "LayoutOrder",
                            ["VerticalAlignment"] = "Center",
                            ["HorizontalAlignment"] = "Center",
                            ["CellSize"] = UDim2.fromScale(0.96, 0.32),
                            ["CellPadding"] = UDim2.fromScale(0, 0)
                        }) }
                    local v63 = #v62
                    local v64 = {
                        ["DisplayOrder"] = 1
                    }
                    for v65, v66 in v45 do
                        v62[v63 + v65] = v66
                    end
                    v59[v60 + 1] = u15.createElement("Frame", v61, v62)
                    v56[v57 + 1] = u15.createElement(u9, v58, v59)
                    v53[v54 + 1] = u15.createElement(u8, v55, v56)
                    v53[v54 + 2] = u15.createElement(u8, {
                        ["Size"] = UDim2.fromScale(0.08, 0)
                    })
                    local v67 = {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v68 = { u15.createElement("UIListLayout", {
                            ["FillDirection"] = "Vertical",
                            ["HorizontalAlignment"] = "Right",
                            ["Padding"] = UDim.new(0, 6)
                        }) }
                    local v69 = #v68
                    local v70 = {
                        ["Size"] = UDim2.new(1, 0, 0, 0.03 * u17.CurrentCamera.ViewportSize.Y)
                    }
                    local v71 = { u15.createElement(u8, {
                            ["Size"] = UDim2.fromScale(1, 1)
                        }, { u15.createElement("TextLabel", {
                                ["Text"] = "Inventory",
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["TextXAlignment"] = "Left",
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                            }) }) }
                    local v72 = #v71
                    local v73 = {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v74 = { u15.createElement("UIListLayout", {
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
                        }) }
                    local v75 = #v74
                    local v76 = u23.isGameServer() and u14.Controllers.GamemodeController:isLocalPlayerInCreativeMode()
                    if v76 then
                        v76 = u15.createFragment({
                            ["OpenCreativeInventoryBtn"] = u15.createElement("ImageButton", {
                                ["Size"] = UDim2.fromScale(1.5, 1.5),
                                ["Image"] = u20.ELLIPSIS,
                                ["ScaleType"] = "Fit",
                                ["BackgroundColor3"] = Color3.fromHex("6b6fbf"),
                                ["BorderSizePixel"] = 0,
                                ["Active"] = true,
                                [u15.Event.Activated] = function() --[[ Line: 422 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u2
                                        [2] = u19
                                        [3] = u14
                                    --]]
                                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.INVENTORY)
                                    u14.Controllers.GamemodeController:toggleCreativeInventory()
                                end
                            }, { u15.createElement("UICorner", {
                                    ["CornerRadius"] = UDim.new(0.1, 0)
                                }), u15.createElement("UIAspectRatioConstraint", {
                                    ["AspectRatio"] = 1
                                }), u15.createElement(u13, {}, { u15.createElement(u4, {
                                        ["Text"] = "Open Creative Inventory",
                                        ["TextSize"] = 16,
                                        ["Font"] = Enum.Font.SourceSansBold,
                                        ["Limits"] = Vector2.new(300, 60)
                                    }), u15.createElement(u4, {
                                        ["Text"] = "[C] Hotkey",
                                        ["TextSize"] = 14,
                                        ["Font"] = Enum.Font.SourceSansSemibold,
                                        ["Limits"] = Vector2.new(300, 500)
                                    }) }) })
                        })
                    end
                    if v76 then
                        v74[v75 + 1] = v76
                    end
                    v71[v72 + 1] = u15.createElement(u8, v73, v74)
                    v68[v69 + 1] = u15.createElement(u8, v70, v71)
                    v68[v69 + 2] = u15.createElement(u8, {
                        ["Size"] = UDim2.fromScale(0, 0.01)
                    })
                    local v77 = {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v78 = { u15.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal"
                        }) }
                    local v79 = #v78
                    local v80 = {
                        ["BackgroundTransparency"] = 0,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["BackgroundColor3"] = u5.hexColor(1713718)
                    }
                    local v81 = { u15.createElement("UIGridLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["SortOrder"] = "LayoutOrder",
                            ["CellSize"] = UDim2.fromScale(0.16666666666666666, 0.25),
                            ["CellPadding"] = UDim2.fromScale(0, 0)
                        }) }
                    local v82 = #v81
                    for v83, v84 in v31 do
                        v81[v82 + v83] = v84
                    end
                    v78[v79 + 1] = u15.createElement("Frame", v80, v81)
                    v68[v69 + 3] = u15.createElement(u9, v77, v78)
                    v53[v54 + 3] = u15.createElement(u8, v67, v68)
                    v50[v51 + 1] = u15.createElement("Frame", v52, v53)
                    v48[v49 + 1] = u15.createElement(u11, {}, v50)
                    return u15.createElement("ScreenGui", v64, v48)
                end
                local v85 = nil
                local u86
                if u43 < #p27.props.Inventory.observedInventory.inventory.armor then
                    u86 = p27.props.Inventory.observedInventory.inventory.armor[u43 + 1]
                    if u86 == "empty" then
                        u86 = v85
                    end
                else
                    u86 = v85
                end
                local v87 = u15.createElement(u8, {
                    ["Size"] = UDim2.fromScale(1, 1)
                }, { u15.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.025),
                        ["PaddingBottom"] = UDim.new(0.025),
                        ["PaddingLeft"] = UDim.new(0.025),
                        ["PaddingRight"] = UDim.new(0.025)
                    }), u15.createElement(u25, {
                        ["InvItem"] = u86,
                        ["LayoutOrder"] = u43,
                        ["OnClick"] = u1.async(function() --[[ Line: 206 ]]
                            --[[
                            Upvalues:
                                [1] = u86
                                [2] = u18
                                [3] = u43
                                [4] = u12
                                [5] = u10
                                [6] = u22
                            --]]
                            if u86 then
                                u18:dispatch({
                                    ["type"] = "InventorySetArmorItem",
                                    ["item"] = nil,
                                    ["armorSlot"] = u43
                                })
                                u12:playSound(u10.fromList(u22.ARMOR_UNEQUIP))
                                return true
                            end
                        end),
                        ["SendToHotbarSlot"] = function() --[[ Name: SendToHotbarSlot, Line 217 ]]
                            --[[
                            Upvalues:
                                [1] = u86
                                [2] = u18
                                [3] = u43
                                [4] = u12
                                [5] = u10
                                [6] = u22
                            --]]
                            if u86 then
                                u18:dispatch({
                                    ["type"] = "InventorySetArmorItem",
                                    ["item"] = nil,
                                    ["armorSlot"] = u43
                                })
                                u12:playSound(u10.fromList(u22.ARMOR_UNEQUIP))
                            end
                        end
                    }) })
                table.insert(v45, v87)
            end
        end
        local v88
        if v29 < #p27.props.Inventory.observedInventory.inventory.items then
            v88 = p27.props.Inventory.observedInventory.inventory.items[v29 + 1]
            local v89 = nil
            for v90, v91 in p27.props.Inventory.observedInventory.hotbar do
                local _ = v90 - 1
                if v91.item == v88 == true then
                    v89 = v91
                    break
                end
            end
            if v89 then
                v88 = nil
            end
        else
            v88 = nil
        end
        if v88 then
            local v92 = v88
            table.insert(v30, v92)
        end
    end
end
return {
    ["InventoryApp"] = v16.connect(function(p93, p94) --[[ Line: 492 ]]
        local v95 = {
            ["Inventory"] = p93.Inventory
        }
        for v96, v97 in p94 do
            v95[v96] = v97
        end
        return v95
    end)(v26)
}