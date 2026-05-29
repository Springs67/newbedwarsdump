local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Checkbox
local u5 = v2.ColorUtil
local u6 = v2.DividerComponent
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render")
local u13 = v12.BWPlayerRender
local u14 = v12.PlayerRenderFallbackMode
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").AuditTag
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local function u21() --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
    --]]
    local v17 = u8.values(u15)
    local v18 = {}
    for v19 = 1, #v17 do
        local v20 = v17[v19]
        local _ = v19 - 1
        v18[v20] = true
    end
    return v18
end
local v78 = v10.new(u9)(function(p22, p23) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u15
        [3] = u9
        [4] = u16
        [5] = u8
        [6] = u4
        [7] = u7
        [8] = u6
        [9] = u5
        [10] = u13
        [11] = u14
        [12] = u3
    --]]
    local u24, u25 = p23.useState((u21()))
    local function u27(p26) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        if p26 == u15.COMMAND then
            return Color3.fromRGB(61, 145, 255)
        elseif p26 == u15.HOST_PANEL then
            return Color3.fromRGB(255, 125, 69)
        else
            return Color3.fromRGB(0, 0, 0)
        end
    end
    local v28 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v29 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 6)
        }) }
    local v30 = #v29
    local v31 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.075)
    }
    local v32 = {
        ["TabTitle"] = u9.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["Text"] = "<b>AUDIT LOG</b>",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1),
            ["TextColor3"] = u16.textPrimary
        }, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
    }
    local _ = #v32
    local v33 = u8.values(u15)
    local function v40(u34, p35) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u24
            [4] = u25
        --]]
        return u9.createElement(u4, {
            ["AspectRatio"] = 3,
            ["Size"] = UDim2.fromScale(0.15, 0.75),
            ["Value"] = u24[u34],
            ["SetValue"] = function(p36) --[[ Name: SetValue, Line 90 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u34
                    [3] = u25
                --]]
                local v37 = {}
                for v38, v39 in u24 do
                    v37[v38] = v39
                end
                v37[u34] = p36
                u25(v37)
            end,
            ["Text"] = "<b>" .. string.gsub(string.upper(u34), "_", " ") .. "</b>",
            ["LayoutOrder"] = p35 + 2
        })
    end
    local v41 = table.create(#v33)
    for v42, v43 in v33 do
        v41[v42] = v40(v43, v42 - 1, v33)
    end
    local v44 = {
        ["Position"] = UDim2.fromScale(0.2, 0),
        ["Size"] = UDim2.fromScale(0.8, 1)
    }
    local v45 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Right",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v46 = #v45
    for v47, v48 in v41 do
        v45[v46 + v47] = v48
    end
    v32.TagFilters = u9.createElement(u7, v44, v45)
    v29.Header = u9.createElement(u7, v31, v32)
    v29[v30 + 1] = u9.createElement(u6, {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 0, 1),
        ["BarColor"] = {
            ["Transparency"] = 0.9
        }
    })
    local v49 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 0.925, -12)
    }
    local v50 = {
        u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 2)
        }),
        ["Columns"] = u9.createElement(u7, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.065)
        }, {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            u9.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.025, 0),
                ["PaddingRight"] = UDim.new(0.025, 0)
            }),
            u9.createElement("TextLabel", {
                ["Text"] = "Time",
                ["TextXAlignment"] = "Left",
                ["TextTransparency"] = 0.3,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.075, 0, 0.5, 0),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.WHITE
            }),
            u9.createElement("TextLabel", {
                ["Text"] = "Operation",
                ["TextXAlignment"] = "Left",
                ["TextTransparency"] = 0.3,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0.525, 0, 0.5, 0),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.WHITE
            }),
            u9.createElement("TextLabel", {
                ["Text"] = "Tag",
                ["TextXAlignment"] = "Left",
                ["TextTransparency"] = 0.3,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(0.075, 0, 0.5, 0),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.WHITE
            }),
            u9.createElement("TextLabel", {
                ["Text"] = "Executor",
                ["TextXAlignment"] = "Left",
                ["TextTransparency"] = 0.3,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(0.225, 0, 0.5, 0),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.WHITE
            })
        })
    }
    local v51 = #v50
    local v52 = 0
    local v53 = {}
    for v54, v55 in p22.AuditLog do
        local _ = v54 - 1
        if u24[v55.tag] == true then
            v52 = v52 + 1
            v53[v52] = v55
        end
    end
    local function v69(p56, p57) --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u13
            [3] = u14
            [4] = u5
            [5] = u7
            [6] = u27
        --]]
        local v58 = p56.executor
        if v58 then
            local v59 = {
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(0.225, 1)
            }
            local v60 = { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 4)
                }), u9.createElement(u13, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 20,
                    ["FallbackMode"] = u14.KIT,
                    ["Size"] = UDim2.new(1, 0, 0.6, 0),
                    ["PlayerUserId"] = p56.executor.userId
                }, { u9.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }), u9.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) }
            local _ = #v60
            local v61 = {
                ["Size"] = UDim2.new(0.7, 0, 0.5, 0)
            }
            local v62 = p56.executor
            if v62 ~= nil then
                v62 = v62.displayName
            end
            v61.Text = v62
            v61.TextXAlignment = "Left"
            v61.FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium)
            v61.TextColor3 = u5.WHITE
            v61.TextScaled = true
            v61.BackgroundTransparency = 1
            v61.LayoutOrder = 3
            v60.Executor = u9.createElement("TextLabel", v61)
            v58 = u9.createFragment({
                ["Executor"] = u9.createElement(u7, v59, v60)
            })
        end
        local v63 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, 25),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["BackgroundTransparency"] = p57 % 2 == 0 and 1 or 0.9,
            ["LayoutOrder"] = p56.time
        }
        local v64 = {
            u9.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.025, 0),
                ["PaddingRight"] = UDim.new(0.025, 0)
            }),
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["Time"] = u9.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextTransparency"] = 0.3,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.075, 0, 0.5, 0),
                ["Text"] = DateTime.fromUnixTimestamp(p56.time):FormatLocalTime("LTS", "en-us"),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextColor3"] = u5.WHITE
            }),
            ["Change"] = u9.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0.525, 0, 0.5, 0),
                ["Text"] = p56.message,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextColor3"] = u5.WHITE
            }),
            ["Tag"] = u9.createElement("Frame", {
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(0.075, 0, 0.5, 0),
                ["BackgroundColor3"] = u27(p56.tag)
            }, {
                ["Tag"] = u9.createElement("TextLabel", {
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(0.8, 0, 0.7, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = string.gsub(string.upper(p56.tag), "_", " "),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u5.WHITE
                }),
                u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                })
            })
        }
        local v65 = #v64
        if v58 then
            v64[v65 + 1] = v58
        end
        local v66 = u9.createFragment
        local v67 = {}
        local v68 = p56.time
        v67["AuditEntry_" .. tostring(v68)] = u9.createElement("Frame", v63, v64)
        return v66(v67)
    end
    local v70 = table.create(#v53)
    for v71, v72 in v53 do
        v70[v71] = v69(v72, v71 - 1, v53)
    end
    local v73 = {
        ["ScrollingFrameProps"] = {
            ["LayoutOrder"] = 3,
            ["BackgroundTransparency"] = 0.9,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0.92, -4),
            ["BackgroundColor3"] = u5.BLACK
        }
    }
    local v74 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local v75 = #v74
    for v76, v77 in v70 do
        v74[v75 + v76] = v77
    end
    v50[v51 + 1] = u9.createElement(u3, v73, v74)
    v29.Content = u9.createElement(u7, v49, v50)
    return u9.createElement(u7, v28, v29)
end)
return {
    ["HostPanelAuditLogTab"] = v11.connect(function(p79, p80) --[[ Line: 380 ]]
        local v81 = {}
        for v82, v83 in p80 do
            v81[v82] = v83
        end
        v81.AuditLog = p79.CustomMatch.hostPanelAuditLog
        return v81
    end)(v78)
}