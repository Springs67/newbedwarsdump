local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v20 = {}
local v21 = 0
local u22 = {}
for v23, v24 in v9.values(v15.ShopItems) do
    local _ = v23 - 1
    local v25 = v24.itemType
    if table.find(v20, v25) == nil == true then
        v21 = v21 + 1
        u22[v21] = v24
    end
end
table.sort(u22, function(p26, p27) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return u17(p26.itemType).displayName < u17(p27.itemType).displayName
end)
local v28 = 0
local u29 = {}
for v30, v31 in u22 do
    local _ = v30 - 1
    local v32 = v31.customDisplayName
    if v32 == nil then
        v32 = u17(v31.itemType)
        if v32 ~= nil then
            v32 = v32.displayName
        end
    end
    if v32 ~= nil then
        v28 = v28 + 1
        u29[v28] = v32
    end
end
return {
    ["HostPanelItemsTab"] = v11.new(u10)(function(u33, p34) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
            [3] = u8
            [4] = u7
            [5] = u18
            [6] = u10
            [7] = u19
            [8] = u29
            [9] = u17
            [10] = u12
            [11] = u4
            [12] = u6
            [13] = u14
            [14] = u13
            [15] = u16
            [16] = u3
        --]]
        local v35 = p34.useState
        local u36, u37 = v35(false)
        local v38, u39 = v35(u22)
        local v40 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 10)
            }), u10.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Text"] = "<b>PURCHASABLE ITEMS</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["TextColor3"] = u19.textPrimary
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) }) }
        local v41 = #v40
        local v42 = {
            ["Size"] = UDim2.fromScale(1, 0.075)
        }
        local v43 = table.create(#u29)
        for v44, v45 in u29 do
            local _ = v44 - 1
            v43[v44] = {
                ["key"] = v45
            }
        end
        v42.Items = v43
        v42.InputText = ""
        function v42.OnTextChange(_, p46) --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u22
                [3] = u39
            --]]
            local v47 = 0
            local v48 = {}
            for v49, v50 in u22 do
                local _ = v49 - 1
                local v51 = v50.customDisplayName
                if v51 == nil then
                    v51 = u17(v50.itemType)
                    if v51 ~= nil then
                        v51 = v51.displayName
                    end
                end
                if table.find(p46, v51) ~= nil == true then
                    v47 = v47 + 1
                    v48[v47] = v50
                end
            end
            u39(v48)
        end
        v42.PlaceHolderText = "Item Name"
        v40[v41 + 1] = u10.createElement(u12, v42)
        local function v68(p52) --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u19
                [3] = u10
                [4] = u33
                [5] = u5
                [6] = u8
                [7] = u7
                [8] = u18
                [9] = u4
                [10] = u6
                [11] = u14
                [12] = u13
                [13] = u16
            --]]
            local u53 = p52.itemType
            local v54 = u17(u53)
            local v58 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u19.backgroundPrimary,
                ["BorderSizePixel"] = 0,
                ["Text"] = "",
                [u10.Event.Activated] = function() --[[ Line: 158 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u53
                        [3] = u5
                        [4] = u8
                        [5] = u7
                        [6] = u18
                    --]]
                    local v55 = u33.store.CustomMatch.disabledItems[u53]
                    if v55 == nil then
                        v55 = false
                    end
                    local v56 = u53
                    local v57 = not v55
                    if not u5.isHoarceKat() then
                        u8.Controllers.CustomMatchController:setItemDisabled(v56, v57)
                    end
                    u7:playSound(u18.UI_CLICK)
                end
            }
            local v59 = {}
            local v60 = #v59
            local v61 = {
                ["Size"] = UDim2.fromScale(0.9, 0.6),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v62 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder"
                }), u10.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.025, 0),
                    ["PaddingBottom"] = UDim.new(0.025, 0)
                }) }
            local v63 = #v62
            local v64
            if v54.image == nil then
                v64 = false
            else
                v64 = u10.createFragment({
                    ["ItemImage"] = u10.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.5),
                        ["Position"] = UDim2.fromScale(0, 0.05),
                        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                        ["Image"] = v54.image,
                        ["ScaleType"] = Enum.ScaleType.Fit
                    }, { u10.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            end
            if v64 then
                v62[v63 + 1] = v64
            end
            v62[#v62 + 1] = u10.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.75, 1),
                ["Text"] = v54.displayName,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u4.WHITE
            }, { u10.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0),
                    ["PaddingLeft"] = UDim.new(0.1, 0),
                    ["PaddingRight"] = UDim.new(0.1, 0)
                }), u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
            v59.TopSection = u10.createElement(u6, v61, v62)
            v59[v60 + 1] = u10.createElement(u14, {
                ["Value"] = u33.store.CustomMatch.disabledItems[u53] and "off" or "on",
                ["OnChange"] = function(p65) --[[ Name: OnChange, Line 230 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                        [2] = u5
                        [3] = u8
                        [4] = u7
                        [5] = u18
                    --]]
                    local v66 = u53
                    local v67 = p65 == "off"
                    if not u5.isHoarceKat() then
                        u8.Controllers.CustomMatchController:setItemDisabled(v66, v67)
                    end
                    u7:playSound(u18.UI_CLICK)
                end,
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["AnchorPoint"] = Vector2.new(0, 0),
                    ["Position"] = UDim2.fromScale(0, 0.6)
                }
            }, { u10.createElement(u13, {
                    ["Text"] = "On",
                    ["Value"] = u16.ON
                }), u10.createElement(u13, {
                    ["Text"] = "Off",
                    ["Value"] = u16.OFF,
                    ["ActiveColor"] = u19.backgroundError
                }) })
            return u10.createElement("TextButton", v58, v59)
        end
        local v69 = table.create(#v38)
        for v70, v71 in v38 do
            v69[v70] = v68(v71, v70 - 1, v38)
        end
        local v72 = {
            ["AdditionalSpace"] = 40,
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.new(1, 0, 0.825, 0)
            }
        }
        local v74 = { u10.createElement("UIGridLayout", {
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["FillDirectionMaxCells"] = 6,
                ["CellSize"] = UDim2.fromOffset(90, 70)
            }), u10.createElement("TextButton", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u19.backgroundTertiary,
                ["BorderSizePixel"] = 0,
                ["Text"] = "",
                [u10.Event.Activated] = function() --[[ Line: 276 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u5
                        [3] = u8
                        [4] = u7
                        [5] = u18
                        [6] = u37
                    --]]
                    local v73 = not u36
                    if not u5.isHoarceKat() then
                        u8.Controllers.CustomMatchController:setAllItemsDisabled(v73)
                    end
                    u7:playSound(u18.UI_CLICK)
                    u37(not u36)
                end
            }, { u10.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = u36 and "<b>Enable All</b>" or "<b>Disable All</b>",
                    ["TextColor3"] = u4.WHITE
                }, { u10.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.15, 0),
                        ["PaddingBottom"] = UDim.new(0.15, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0),
                        ["PaddingRight"] = UDim.new(0.1, 0)
                    }), u10.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) }) }
        local v75 = #v74
        for v76, v77 in v69 do
            v74[v75 + v76] = v77
        end
        v40[v41 + 2] = u10.createElement(u3, v72, v74)
        return u10.createFragment(v40)
    end)
}