local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.DropdownComponent
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v8 = v7.deepCopy
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "dropdown-searchbar").DropdownSearchbar
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-constants").MapBrowser
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-types")
local u14 = v13.MapBrowserQueryFields
local v15 = v13.MapBrowserSortFields
local u16 = v13.SortPreference
local u17 = v1.import(script, script.Parent, "map-browser-tags-grid").MapBrowserTagsGrid
local u18 = {
    {
        ["text"] = "ALL",
        ["value"] = "all"
    },
    {
        ["text"] = "MAP TITLE",
        ["value"] = u14["0" + 1]
    },
    {
        ["text"] = "MAP DESCRIPTION",
        ["value"] = u14["1" + 1]
    },
    {
        ["text"] = "CREATOR",
        ["value"] = u14["2" + 1]
    },
    {
        ["text"] = "MAP CODE",
        ["value"] = u14["3" + 1]
    }
}
local v19 = { "dislikes" }
local v20 = 0
local v21 = {}
for v22, v23 in v8(v15) do
    local _ = v22 - 1
    if table.find(v19, v23) == nil == true then
        v20 = v20 + 1
        v21[v20] = v23
    end
end
local u24 = table.create(#v21)
for v25, v26 in v21 do
    local _ = v25 - 1
    u24[v25] = {
        ["text"] = "SORT: " .. string.upper(v26),
        ["value"] = v26
    }
end
local v27 = v7.entries(u16)
local u28 = table.create(#v27)
for v29, v30 in v27 do
    local _ = v29 - 1
    local v31 = v30[1]
    local v32 = v30[2]
    u28[v29] = {
        ["text"] = "SORT: " .. string.upper(v31),
        ["value"] = tostring(v32)
    }
end
return {
    ["CustomMapsBrowserSearch"] = v10.new(u9)(function(u33, p34) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u28
            [3] = u16
            [4] = u14
            [5] = u6
            [6] = u3
            [7] = u12
            [8] = u9
            [9] = u5
            [10] = u11
            [11] = u18
            [12] = u4
            [13] = u17
        --]]
        local v35 = p34.useState
        local v36 = p34.useBinding
        local v37 = p34.useEffect
        local u38, u39 = v35(u24[1].value)
        local v40 = u28[2].value
        local v41 = tonumber(v40)
        if v41 == nil then
            v41 = u16.DESCENDING
        end
        local u42, u43 = v35(v41)
        local u44, u45 = v35("")
        local u46, u47 = v35(false)
        local u48, u49 = v36({})
        local u50, u51 = v36(0)
        local function u66(p52, _, p53) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u45
                [3] = u33
                [4] = u38
                [5] = u42
                [6] = u48
                [7] = u46
                [8] = u6
            --]]
            local v54 = {}
            local v55
            if p53 == nil then
                v55 = p53
            else
                v55 = p53.queryField
            end
            if v55 ~= "" and v55 then
                local v56 = nil
                for v57, v58 in u14 do
                    local _ = v57 - 1
                    local v59
                    if p53 == nil then
                        v59 = p53
                    else
                        v59 = p53.queryField
                    end
                    if v58 == v59 == true then
                        v56 = v58
                        break
                    end
                end
                if v56 then
                    table.insert(v54, v56)
                end
            end
            u45(p52)
            u33.SetLoading(true)
            local u60 = {
                ["search"] = p52
            }
            if #v54 == 0 then
                v54 = nil
            end
            u60.queryFields = v54
            u60.sortBy = u38
            u60.sortPreference = u42
            u60.filterTags = u48:getValue()
            if p53 ~= nil then
                p53 = p53.skip
            end
            u60.skip = p53
            u60.featured = u46
            local v61 = u6.Controllers.CustomMapBrowserController
            local v62 = {}
            for v63, v64 in u60 do
                v62[v63] = v64
            end
            v61:searchMap(v62):andThen(function(p65) --[[ Line: 149 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u60
                --]]
                u33.onSearchComplete(u60, p65)
                u33.SetLoading(false)
            end)
        end
        v37(function() --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u33
                [3] = u3
                [4] = u66
                [5] = u44
                [6] = u12
                [7] = u51
            --]]
            if u50:getValue() == u33.Page then
                return nil
            end
            if not u3.isHoarceKat() then
                u66(u44, false, {
                    ["skip"] = (u33.Page - 1) * u12.MAPS_PER_PAGE
                })
            end
            u51(u33.Page)
        end, { u33.Page })
        local v67 = u9.createFragment
        local v68 = {}
        local v69 = u9.createElement
        local v70 = u5
        local v71 = {
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 100,
            ["Size"] = u33.Size or UDim2.fromScale(1, 0.12)
        }
        local v80 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            }),
            ["SearchContainer"] = u9.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 100,
                ["Size"] = UDim2.new(1, 0, 0.625, 0)
            }, {
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.01, 0)
                }),
                u9.createElement(u11, {
                    ["Size"] = UDim2.new(0.68, 0, 1, 0),
                    ["DropdownItems"] = u18,
                    ["OnFocusLost"] = function(p72, p73, p74, _) --[[ Name: OnFocusLost, Line 194 ]]
                        --[[
                        Upvalues:
                            [1] = u66
                        --]]
                        if p73 then
                            u66(p72, p73, {
                                ["queryField"] = p74
                            })
                        end
                    end,
                    ["Searchbar"] = {
                        ["PlaceHolderText"] = "SEARCH",
                        ["HideSearchIcon"] = true,
                        ["DisplaySearchButton"] = true,
                        ["Size"] = UDim2.fromScale(0.81, 1)
                    },
                    ["FrameProps"] = {
                        ["LayoutOrder"] = 1,
                        ["ZIndex"] = 100
                    }
                }),
                ["SortByDropdown"] = u9.createElement(u4, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0.125, 0, 0.825, 0),
                    ["DefaultItem"] = u24[1],
                    ["Items"] = u24,
                    ["OnItemSelected"] = function(p75) --[[ Name: OnItemSelected, Line 216 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        u39(p75)
                    end
                }),
                ["SortPreferenceDropdown"] = u9.createElement(u4, {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(0.175, 0, 0.825, 0),
                    ["DefaultItem"] = u28[2],
                    ["Items"] = u28,
                    ["OnItemSelected"] = function(p76) --[[ Name: OnItemSelected, Line 225 ]]
                        --[[
                        Upvalues:
                            [1] = u43
                        --]]
                        local v77 = tonumber(p76)
                        if v77 ~= 0 and (v77 == v77 and v77) then
                            u43(v77)
                        end
                    end
                })
            }),
            u9.createElement(u17, {
                ["Featured"] = true,
                ["OnChange"] = function(_, _, p78) --[[ Name: OnChange, Line 235 ]]
                    --[[
                    Upvalues:
                        [1] = u49
                    --]]
                    u49(p78)
                end,
                ["OnSelectFeatured"] = function(p79) --[[ Name: OnSelectFeatured, Line 238 ]]
                    --[[
                    Upvalues:
                        [1] = u47
                    --]]
                    u47(p79)
                end,
                ["FrameProps"] = {
                    ["Size"] = UDim2.new(1, 0, 0.35, 0)
                }
            })
        }
        v68.CustomMapsBrowserSearch = v69(v70, v71, v80)
        return v67(v68)
    end)
}