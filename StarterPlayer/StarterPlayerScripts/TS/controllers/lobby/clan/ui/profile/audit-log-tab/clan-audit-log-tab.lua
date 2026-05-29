local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ButtonComponent
local u5 = v2.CircularSpinner
local u6 = v2.ColorUtil
local u7 = v2.Empty
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MaxPriorityQueue
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u16 = v1.import(script, script.Parent, "clan-audit-log-row").ClanAuditLogRow
local u17 = {
    {
        ["text"] = "Performed By",
        ["width"] = 0.15
    },
    {
        ["text"] = "Action",
        ["width"] = 0.15
    },
    {
        ["text"] = "Time",
        ["width"] = 0.25
    },
    {
        ["text"] = "Description",
        ["width"] = 0.45
    }
}
local u18 = (#u17 - 1) * 0.05 / #u17
local function u24(p19) --[[ Line: 34 ]]
    local v20 = {}
    for v21, v22 in p19:ReverseIterate() do
        local v23 = ({ v21, v22 })[2].Value
        table.insert(v20, v23)
    end
    return v20
end
return {
    ["ClanAuditLogTab"] = v12.new(u11)(function(u25, p26) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u8
            [3] = u13
            [4] = u9
            [5] = u11
            [6] = u18
            [7] = u6
            [8] = u17
            [9] = u7
            [10] = u5
            [11] = u24
            [12] = u16
            [13] = u4
            [14] = u14
            [15] = u3
            [16] = u15
        --]]
        local v27 = p26.useState
        local v28 = p26.useEffect
        local v29, u30 = v27(false)
        local v31, u32 = v27(u10.new())
        local function u35() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
                [3] = u25
                [4] = u30
                [5] = u9
                [6] = u32
            --]]
            u8:playSound(u13.UI_CLICK)
            local v33 = u25.store.Clans.myClanId
            if v33 == "" or not v33 then
                return nil
            end
            u30(true)
            u9.Controllers.ClanController:loadAuditLogs(u25.store.Clans.myClanId):andThen(function(p34) --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u30
                --]]
                u32(p34)
                u30(false)
            end)
        end
        v28(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            return u35()
        end, {})
        local v36 = {}
        local v37 = #v36
        local v38 = {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v39 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v40 = #v39
        local v41 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.95, 0, 0, 20)
        }
        local v42 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 12)
            }), u11.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }) }
        local v43 = #v42
        local function v45(p44) --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u18
                [3] = u6
            --]]
            return u11.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Bottom",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(p44.width - u18, 0, 1, 0),
                ["Text"] = "<b>" .. p44.text .. "</b>",
                ["TextColor3"] = u6.WHITE
            }, { u11.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        end
        local v46 = table.create(#u17)
        local v47 = {
            ["Title"] = "AUDIT LOG"
        }
        for v48, v49 in u17 do
            v46[v48] = v45(v49, v48 - 1, u17)
        end
        local v50 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v51 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Bottom",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v52 = #v51
        for v53, v54 in v46 do
            v51[v52 + v53] = v54
        end
        v42[v43 + 1] = u11.createElement(u7, v50, v51)
        v39.TableColumnHeaders = u11.createElement(u7, v41, v42)
        local v55
        if v29 then
            v55 = u11.createElement(u7, {
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.88, 0)
            }, { u11.createElement(u5, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.15, 0.15),
                    ["Position"] = UDim2.new(0.5, 0, 0.375, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u11.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        elseif v31:IsEmpty() then
            v55 = u11.createFragment({
                ["NoResultsFoundContainer"] = u11.createElement(u7, {
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0.88, 0)
                }, { u11.createElement("TextLabel", {
                        ["Text"] = "Audit Logs currently disabled. Logs are still being recorded, but temporarily will not be viewable.",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.75, 0.1),
                        ["Position"] = UDim2.new(0.5, 0, 0.375, 0),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["TextColor3"] = u6.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }) })
            })
        else
            local v56 = {}
            local v57 = #v56
            local v58 = u24(v31)
            local v59 = table.create(#v58)
            for v60, v61 in v58 do
                local v62 = v60 - 1
                v59[v60] = u11.createElement(u16, {
                    ["AuditLog"] = v61,
                    ["ColumnData"] = u17,
                    ["Index"] = 3 + v62,
                    ["store"] = u25.store
                })
            end
            local v63 = {
                ["ScrollingFrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0.81, 0)
                }
            }
            local v64 = { u11.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 2),
                    ["PaddingLeft"] = UDim.new(0, 2)
                }), u11.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 4)
                }) }
            local v65 = #v64
            for v66, v67 in v59 do
                v64[v65 + v66] = v67
            end
            v64[#v64 + 1] = u11.createElement(u4, {
                ["Text"] = "<b>Load More</b>",
                ["Size"] = UDim2.new(0.25, 0, 0, 30),
                ["BackgroundColor3"] = u14.buttonPrimary,
                ["OnClick"] = v29 and function() --[[ Line: 225 ]] end or u35,
                ["Loading"] = v29,
                ["LayoutOrder"] = 4 + v31.Length
            })
            v56[v57 + 1] = u11.createElement(u3, v63, v64)
            v55 = u11.createFragment(v56)
        end
        v39[v40 + 1] = v55
        v36[v37 + 1] = u11.createElement(u7, v38, v39)
        return u11.createElement(u15, v47, v36)
    end)
}