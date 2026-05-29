local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.AutoSizedText
local u6 = v3.DarkBackground
local u7 = v3.ScaleComponent
local u8 = v3.SlideIn
local u9 = v3.TabsComponent
local u10 = v3.TooltipContainer
local u11 = v3.WidgetComponent
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v23 = u13.entries(u21)
local u24 = {}
for v25 = 1, #v23 do
    local v26 = v23[v25]
    local _ = v25 - 1
    local _ = v26[1]
    local v27 = v26[2]
    if not v27.removeFromCustoms then
        local v28 = v27.displayName
        table.insert(u24, v28)
    end
end
local v29 = {}
local u30 = setmetatable({}, {
    ["__index"] = v29
})
u30.ALL = "All"
v29.All = "ALL"
u30.BLOCKS = "Blocks"
v29.Blocks = "BLOCKS"
u30.COMBAT = "Combat"
v29.Combat = "COMBAT"
u30.CONSUMABLES = "Consumables"
v29.Consumables = "CONSUMABLES"
u30.TOOLS = "Tools"
v29.Tools = "TOOLS"
u30.GADGETS = "Gadgets"
v29.Gadgets = "GADGETS"
local function v117(u31, p32) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u13
        [3] = u21
        [4] = u14
        [5] = u6
        [6] = u7
        [7] = u2
        [8] = u9
        [9] = u24
        [10] = u17
        [11] = u12
        [12] = u22
        [13] = u18
        [14] = u4
        [15] = u11
        [16] = u20
        [17] = u19
        [18] = u10
        [19] = u5
        [20] = u8
    --]]
    local v33 = p32.useState
    local v34 = p32.useEffect
    local u35, u36 = v33(u30.ALL)
    local _, u37 = v33({})
    local v38, u39 = v33({})
    local v40, u41 = v33("")
    v34(function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u30
            [3] = u13
            [4] = u21
            [5] = u41
            [6] = u37
            [7] = u39
        --]]
        local v42 = {}
        if u35 == u30.BLOCKS then
            local v43 = 0
            v42 = {}
            for v44, v45 in u13.entries(u21) do
                local _ = v44 - 1
                local _ = v45[1]
                local v46 = v45[2]
                local v47
                if v46.block == nil then
                    v47 = false
                else
                    v47 = not v46.removeFromCustoms
                end
                if v47 == true then
                    v43 = v43 + 1
                    v42[v43] = v45
                end
            end
        elseif u35 == u30.COMBAT then
            local v48 = 0
            v42 = {}
            for v49, v50 in u13.entries(u21) do
                local _ = v49 - 1
                local _ = v50[1]
                local v51 = v50[2]
                local v52
                if (v51.sword or v51.projectileSource) == nil then
                    v52 = false
                else
                    v52 = not v51.removeFromCustoms
                end
                if v52 == true then
                    v48 = v48 + 1
                    v42[v48] = v50
                end
            end
        elseif u35 == u30.CONSUMABLES then
            local v53 = 0
            v42 = {}
            for v54, v55 in u13.entries(u21) do
                local _ = v54 - 1
                local _ = v55[1]
                local v56 = v55[2]
                local v57
                if v56.consumable == nil then
                    v57 = false
                else
                    v57 = not v56.removeFromCustoms
                end
                if v57 == true then
                    v53 = v53 + 1
                    v42[v53] = v55
                end
            end
        elseif u35 == u30.TOOLS then
            local v58 = 0
            v42 = {}
            for v59, v60 in u13.entries(u21) do
                local _ = v59 - 1
                local _ = v60[1]
                local v61 = v60[2]
                local v62
                if v61.breakBlock == nil then
                    v62 = false
                else
                    v62 = not v61.removeFromCustoms
                end
                if v62 == true then
                    v58 = v58 + 1
                    v42[v58] = v60
                end
            end
        elseif u35 == u30.GADGETS then
            local v63 = 0
            v42 = {}
            for v64, v65 in u13.entries(u21) do
                local _ = v64 - 1
                local _ = v65[1]
                local v66 = v65[2]
                local v67
                if v66.gadget == true then
                    v67 = not v66.removeFromCustoms
                else
                    v67 = false
                end
                if v67 == true then
                    v63 = v63 + 1
                    v42[v63] = v65
                end
            end
        elseif u35 == u30.ALL then
            local v68 = 0
            v42 = {}
            for v69, v70 in u13.entries(u21) do
                local _ = v69 - 1
                local _ = v70[1]
                if not v70[2].removeFromCustoms == true then
                    v68 = v68 + 1
                    v42[v68] = v70
                end
            end
        end
        table.sort(v42, function(p71, p72) --[[ Line: 182 ]]
            return p71[2].displayName < p72[2].displayName
        end)
        u41("")
        u37(v42)
        u39(v42)
    end, { u35 })
    local function v80(p73, p74) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u30
            [3] = u13
            [4] = u21
            [5] = u39
            [6] = u41
        --]]
        u36(u30.ALL)
        local v75 = 0
        local v76 = {}
        for v77, v78 in u13.entries(u21) do
            local _ = v77 - 1
            local _ = v78[1]
            local v79 = v78[2].displayName
            if table.find(p74, v79) ~= nil == true then
                v75 = v75 + 1
                v76[v75] = v78
            end
        end
        u39(v76)
        u41(p73)
    end
    local v81 = { u14.createElement(u6, {
            ["AppId"] = u31.AppId
        }) }
    local v82 = #v81
    local v83 = {}
    local v84 = #v83
    local v85 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(640, 440)
    }
    local v86 = { u14.createElement(u7, {
            ["MaximumSize"] = Vector2.new(704, 484.00000000000006),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }) }
    local v87 = #v86
    local v88 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "Creative Inventory",
        ["AppId"] = u31.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 244 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u31
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u31.AppId)
        end
    }
    local v89 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v90 = #v89
    local v91 = u13.values(u30)
    local v92 = table.create(#v91)
    local v93 = {
        ["Value"] = u35
    }
    local v94 = {
        ["ResetOnSpawn"] = false
    }
    for v95, v96 in v91 do
        local _ = v95 - 1
        v92[v95] = {
            ["value"] = v96,
            ["text"] = v96
        }
    end
    v93.Tabs = v92
    function v93.OnChange(p97) --[[ Line: 273 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36(p97.value)
    end
    v93.FrameProps = {
        ["LayoutOrder"] = 1
    }
    v89[v90 + 1] = u14.createElement(u9, v93)
    local v98 = {
        ["Size"] = UDim2.new(1, 0, 0, 30)
    }
    local v99 = table.create(#u24)
    for v100, v101 in u24 do
        local _ = v100 - 1
        v99[v100] = {
            ["key"] = v101
        }
    end
    v98.Items = v99
    v98.InputText = v40
    v98.OnTextChange = v80
    v98.PlaceHolderText = "Search All Items"
    v98.LayoutOrder = 2
    v89[v90 + 2] = u14.createElement(u17, v98)
    local function v107(p102) --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u12
            [3] = u22
            [4] = u18
        --]]
        local u103 = p102[1]
        local v104 = p102[2]
        local v105 = u14.createFragment
        local v106 = {
            ["ItemFrame"] = u14.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundTransparency"] = 1,
                [u14.Event.Activated] = function() --[[ Line: 307 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u103
                    --]]
                    u12.Controllers.GamemodeController:requestCreativeItem(u103)
                end
            }, { u14.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Transparency"] = 0.3,
                    ["Color"] = u22.textPrimary
                }), u14.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.75, 0.75),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Image"] = v104.image
                }), u14.createElement(u18, {
                    ["showTechnicalName"] = true,
                    ["item"] = u103
                }) })
        }
        return v105(v106)
    end
    local v108 = table.create(#v38)
    for v109, v110 in v38 do
        v108[v109] = v107(v110, v109 - 1, v38)
    end
    local v111 = {
        ["AdditionalSpace"] = 10,
        ["ScrollingFrameProps"] = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 1, -60)
        }
    }
    local v112 = { u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 4)
        }), u14.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["FillDirectionMaxCells"] = 10,
            ["HorizontalAlignment"] = "Center",
            ["CellSize"] = UDim2.new(0, 48, 0, 48),
            ["CellPadding"] = UDim2.new(0, 8, 0, 8)
        }) }
    local v113 = #v112
    for v114, v115 in v108 do
        v112[v113 + v114] = v115
    end
    v89.CreativeInventory = u14.createElement(u4, v111, v112)
    v86[v87 + 1] = u14.createElement(u11, v88, v89)
    v86.OpenPlayerInventoryBtn = u14.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(0.1, 0.1),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.new(1, 0, 1, 6),
        ["Image"] = u20.ELLIPSIS,
        ["ScaleType"] = "Fit",
        ["BackgroundColor3"] = Color3.fromHex("6b6fbf"),
        ["BorderSizePixel"] = 0,
        ["Active"] = true,
        [u14.Event.Activated] = function() --[[ Line: 371 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u2
                [3] = u19
            --]]
            u12.Controllers.GamemodeController:toggleCreativeInventory()
            local v116 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            if v116:isAppOpen(u19.INVENTORY) then
                v116:closeApp(u19.INVENTORY)
            else
                v116:openApp(u19.INVENTORY, {})
            end
        end
    }, { u14.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }), u14.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }), u14.createElement(u10, {}, { u14.createElement(u5, {
                ["Text"] = "Open Player Inventory",
                ["TextSize"] = 16,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) }) })
    v83[v84 + 1] = u14.createElement("Frame", v85, v86)
    v81[v82 + 1] = u14.createElement(u8, {}, v83)
    return u14.createFragment({
        ["CreativeInventory"] = u14.createElement("ScreenGui", v94, v81)
    })
end
local v118 = v15.new(u14)(v117)
return {
    ["CreativeInventory"] = v16.connect(function(_, p119) --[[ Line: 403 ]]
        local v120 = {}
        for v121, v122 in p119 do
            v120[v121] = v122
        end
        return v120
    end)(v118)
}