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
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v20 = {
    v15.NONE,
    v15.INFECTED,
    v15.SUPER_INFECTED,
    v15.INFECTED_TANK,
    v15.INFECTED_RUSH,
    v15.INFECTED_DISRUPTOR,
    v15.INFECTED_PROWLER
}
local v21 = 0
local u22 = {}
for v23, v24 in v9.values(v15) do
    local _ = v23 - 1
    if table.find(v20, v24) == nil == true then
        v21 = v21 + 1
        u22[v21] = v24
    end
end
table.sort(u22, function(p25, p26) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    return u16(p25).name < u16(p26).name
end)
local v27 = 0
local u28 = {}
for v29, v30 in u22 do
    local _ = v29 - 1
    local v31 = u16(v30).name
    if v31 ~= nil then
        v27 = v27 + 1
        u28[v27] = v31
    end
end
return {
    ["HostPanelKitsTab"] = v11.new(u10)(function(u32, p33) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
            [3] = u8
            [4] = u7
            [5] = u18
            [6] = u10
            [7] = u19
            [8] = u28
            [9] = u16
            [10] = u12
            [11] = u4
            [12] = u6
            [13] = u14
            [14] = u13
            [15] = u17
            [16] = u3
        --]]
        local v34 = p33.useState
        local u35, u36 = v34(true)
        local v37, u38 = v34(u22)
        local v39 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 10)
            }), u10.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Text"] = "<b>ALLOWED KITS</b>",
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
        local v40 = #v39
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 0.075)
        }
        local v42 = table.create(#u28)
        for v43, v44 in u28 do
            local _ = v43 - 1
            v42[v43] = {
                ["key"] = v44
            }
        end
        v41.Items = v42
        v41.InputText = ""
        function v41.OnTextChange(_, p45) --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u22
                [3] = u38
            --]]
            local v46 = 0
            local v47 = {}
            for v48, v49 in u22 do
                local _ = v48 - 1
                local v50 = u16(v49).name
                if table.find(p45, v50) ~= nil == true then
                    v46 = v46 + 1
                    v47[v46] = v49
                end
            end
            u38(v47)
        end
        v41.PlaceHolderText = "Kit Name"
        v39[v40 + 1] = u10.createElement(u12, v41)
        local function v66(u51) --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u19
                [3] = u10
                [4] = u32
                [5] = u5
                [6] = u8
                [7] = u7
                [8] = u18
                [9] = u4
                [10] = u6
                [11] = u14
                [12] = u13
                [13] = u17
            --]]
            local v52 = u16(u51)
            local v56 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u19.backgroundPrimary,
                ["BorderSizePixel"] = 0,
                ["Text"] = "",
                [u10.Event.Activated] = function() --[[ Line: 142 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                        [2] = u51
                        [3] = u5
                        [4] = u8
                        [5] = u7
                        [6] = u18
                    --]]
                    local v53 = u32.store.CustomMatch.disabledKits[u51]
                    if v53 == nil then
                        v53 = false
                    end
                    local v54 = u51
                    local v55 = not v53
                    if not u5.isHoarceKat() then
                        u8.Controllers.CustomMatchController:setKitDisabled(v54, v55)
                    end
                    u7:playSound(u18.UI_CLICK)
                end
            }
            local v57 = {}
            local v58 = #v57
            local v59 = {
                ["Size"] = UDim2.fromScale(0.9, 0.6),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v60 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder"
                }), u10.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.025, 0),
                    ["PaddingBottom"] = UDim.new(0.025, 0)
                }) }
            local v61 = #v60
            local v62
            if v52.renderImage == nil then
                v62 = false
            else
                v62 = u10.createFragment({
                    ["KitImage"] = u10.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.75),
                        ["Position"] = UDim2.fromScale(0, 0.05),
                        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                        ["Image"] = v52.renderImage,
                        ["ScaleType"] = Enum.ScaleType.Fit
                    }, { u10.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            end
            if v62 then
                v60[v61 + 1] = v62
            end
            v60[#v60 + 1] = u10.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.75, 1),
                ["Text"] = v52.name,
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
            v57.TopSection = u10.createElement(u6, v59, v60)
            v57[v58 + 1] = u10.createElement(u14, {
                ["Value"] = u32.store.CustomMatch.disabledKits[u51] and "off" or "on",
                ["OnChange"] = function(p63) --[[ Name: OnChange, Line 214 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u5
                        [3] = u8
                        [4] = u7
                        [5] = u18
                    --]]
                    local v64 = u51
                    local v65 = p63 == "off"
                    if not u5.isHoarceKat() then
                        u8.Controllers.CustomMatchController:setKitDisabled(v64, v65)
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
                    ["Value"] = u17.ON
                }), u10.createElement(u13, {
                    ["Text"] = "Off",
                    ["Value"] = u17.OFF,
                    ["ActiveColor"] = u19.backgroundError
                }) })
            return u10.createElement("TextButton", v56, v57)
        end
        local v67 = table.create(#v37)
        for v68, v69 in v37 do
            v67[v68] = v66(v69, v68 - 1, v37)
        end
        local v70 = {
            ["AdditionalSpace"] = 40,
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.new(1, 0, 0.825, 0)
            }
        }
        local v72 = { u10.createElement("UIGridLayout", {
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
                [u10.Event.Activated] = function() --[[ Line: 260 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u5
                        [3] = u8
                        [4] = u7
                        [5] = u18
                        [6] = u36
                    --]]
                    local v71 = u35
                    if not u5.isHoarceKat() then
                        u8.Controllers.CustomMatchController:setAllKitsDisabled(v71)
                    end
                    u7:playSound(u18.UI_CLICK)
                    u36(not u35)
                end
            }, { u10.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = u35 and "<b>Disable All</b>" or "<b>Enable All</b>",
                    ["TextColor3"] = u4.WHITE
                }, { u10.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.15, 0),
                        ["PaddingBottom"] = UDim.new(0.15, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0),
                        ["PaddingRight"] = UDim.new(0.1, 0)
                    }), u10.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) }) }
        local v73 = #v72
        for v74, v75 in v67 do
            v72[v73 + v74] = v75
        end
        v39[v40 + 2] = u10.createElement(u3, v70, v72)
        return u10.createFragment(v39)
    end)
}