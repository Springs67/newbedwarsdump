local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularSpinner
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.Padding
local v7 = v2.StringUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "custom-matches", "ui", "tabs", "map-browser", "pagination", "pagination").Pagination
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "dropdown-searchbar").DropdownSearchbar
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "requests", "search-clans-request").SearchClansField
local u16 = v1.import(script, script.Parent.Parent, "dummy-clan-search-list").HoarcekatDummyClanSearchList
local u17 = v1.import(script, script.Parent, "clan-menu-search-clan-list").ClanMenuSearchClanList
local u18 = v1.import(script, script.Parent, "clan-search-inspect-card").ClanSearchInspectCard
local v19 = v9.entries(u15)
local u20 = table.create(#v19)
for v21, v22 in v19 do
    local _ = v21 - 1
    local _ = v22[1]
    local v23 = v22[2]
    u20[v21] = {
        ["text"] = v7.capitalizeFirstLetter(v23),
        ["value"] = v23
    }
end
return {
    ["ClanMenuSearchTab"] = v11.new(u10)(function(_, p24) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u4
            [3] = u16
            [4] = u8
            [5] = u10
            [6] = u3
            [7] = u17
            [8] = u12
            [9] = u13
            [10] = u20
            [11] = u14
            [12] = u5
            [13] = u6
            [14] = u18
        --]]
        local v25 = p24.useState
        local v26 = p24.useEffect
        local u27, u28 = v25("")
        local u29, u30 = v25(u15.Name)
        local v31, u32 = v25(1)
        local v33, u34 = v25(not u4.isHoarceKat() and {} or u16)
        local v35, u36 = v25(false)
        local v37, u38 = v25(nil)
        local u39 = nil
        local function u50(p40, p41) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u8
                [3] = u29
                [4] = u34
                [5] = u32
                [6] = u38
                [7] = u39
            --]]
            local u42 = p41 == nil and 1 or p41
            if p40 == "" or not p40 then
                u39()
            else
                u36(true)
                local v43 = u8.Controllers.ClanSearchController
                local v44 = {
                    ["keyword"] = p40,
                    ["searchField"] = u29
                }
                local v45 = u42 - 1
                v44.page = math.max(v45, 0)
                v43:searchClan(v44):andThen(function(p46) --[[ Line: 60 ]]
                    --[[
                    Upvalues:
                        [1] = u34
                        [2] = u32
                        [3] = u42
                        [4] = u38
                        [5] = u36
                    --]]
                    local v47 = {}
                    local v48 = #v47
                    local v49 = p46.clans
                    table.move(v49, 1, #v49, v48 + 1, v47)
                    u34(v47)
                    u32(u42)
                    if #v47 ~= 0 then
                        u38(v47[1])
                    end
                    u36(false)
                end)
            end
        end
        u39 = function(u51) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u8
                [3] = u34
                [4] = u38
            --]]
            if u51 then
                u36(true)
            end
            u8.Controllers.ClanSearchController:getRecommenedClans():andThen(function(p52) --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u38
                    [3] = u51
                    [4] = u36
                --]]
                local v53 = {}
                local v54 = #v53
                local v55 = p52.clans
                table.move(v55, 1, #v55, v54 + 1, v53)
                u34(v53)
                if #v53 ~= 0 then
                    u38(v53[1])
                end
                if u51 then
                    u36(false)
                end
            end):catch(function(_) --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u36
                --]]
                if u51 then
                    u36(false)
                end
            end)
        end
        local function u61(u56) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u8
                [3] = u34
                [4] = u38
            --]]
            if u56 then
                u36(true)
            end
            return u8.Controllers.ClanSearchController:getRandomClans():andThen(function(p57) --[[ Line: 108 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u38
                    [3] = u56
                    [4] = u36
                --]]
                local v58 = {}
                local v59 = #v58
                local v60 = p57.clans
                table.move(v60, 1, #v60, v59 + 1, v58)
                u34(v58)
                if #v58 ~= 0 then
                    u38(v58[1])
                end
                if u56 then
                    u36(false)
                end
            end):catch(function(_) --[[ Line: 122 ]]
                --[[
                Upvalues:
                    [1] = u56
                    [2] = u36
                --]]
                if u56 then
                    u36(false)
                end
            end)
        end
        v26(function() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u61
            --]]
            if not u4.isHoarceKat() then
                u61(true)
            end
        end, {})
        local v62 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v63 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v64 = #v63
        local v65
        if v35 then
            v65 = u10.createElement(u3, {
                ["LayoutOrder"] = 10,
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        else
            local v66
            if #v33 == 0 then
                v66 = u10.createElement("TextLabel", {
                    ["Text"] = "No clans found from search",
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["TextSize"] = 16,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(0.33, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            else
                local v67 = {}
                local v68 = #v67
                local v69 = {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(1, 0, 0.76, 0),
                    ["Clans"] = v33
                }
                local v70
                if v37 == nil then
                    v70 = v37
                else
                    v70 = v37.clanId
                end
                v69.SelectedClanId = v70
                v69.SetSelectedClan = u38
                v67[v68 + 1] = u10.createElement(u17, v69)
                local v71
                if u27 == nil then
                    v71 = false
                else
                    v71 = u10.createElement(u12, {
                        ["NumPagesAroundCurr"] = 0,
                        ["Page"] = v31,
                        ["OnPageChage"] = function(p72) --[[ Name: OnPageChage, Line 181 ]]
                            --[[
                            Upvalues:
                                [1] = u32
                                [2] = u50
                                [3] = u27
                            --]]
                            u32(p72)
                            u50(u27, p72)
                        end,
                        ["FrameProps"] = {
                            ["LayoutOrder"] = 4,
                            ["Size"] = UDim2.new(1, 0, 0.06, 0)
                        }
                    })
                end
                if v71 then
                    v67[v68 + 2] = v71
                end
                v66 = u10.createFragment(v67)
            end
            local v73 = {
                [#v73 + 1] = v66
            }
            v65 = u10.createFragment(v73)
        end
        local v74 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v78 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            }),
            u10.createElement(u13, {
                ["Size"] = UDim2.fromScale(1, 0.08),
                ["DropdownItems"] = u20,
                ["OnFocusLost"] = function(p75, p76) --[[ Name: OnFocusLost, Line 230 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u50
                    --]]
                    if not p76 then
                        return nil
                    end
                    u28(p75)
                    u50(p75)
                end,
                ["OnDropdownValueChange"] = function(p77) --[[ Name: OnDropdownValueChange, Line 237 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                    --]]
                    u30(p77)
                end,
                ["Searchbar"] = {
                    ["HideSearchIcon"] = true,
                    ["DisplaySearchButton"] = true,
                    ["Size"] = UDim2.fromScale(0.85, 1),
                    ["PlaceHolderText"] = "Search clan " .. u29,
                    ["MaxCharLength"] = u14.CLAN_TAG_MAX_CHAR_LIMIT
                },
                ["DropdownProps"] = {
                    ["Size"] = UDim2.fromScale(0.15, 1)
                }
            }),
            ["TableHeadersWrapper"] = u10.createElement(u5, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.05),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(1, 0)
            }, {
                ["TableHeaders"] = u10.createElement(u5, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0)
                }, {
                    u10.createElement(u6, {
                        ["Padding"] = {
                            ["Horizontal"] = 8
                        }
                    }),
                    u10.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["VerticalAlignment"] = "Bottom",
                        ["HorizontalAlignment"] = "Right",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.03, 0)
                    }),
                    ["TableHeaderLevel"] = u10.createElement("TextLabel", {
                        ["Text"] = "Lv.",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Bottom",
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0.33, 1),
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }),
                    ["TableHeaderMembers"] = u10.createElement("TextLabel", {
                        ["Text"] = "Members",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Bottom",
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 3,
                        ["Size"] = UDim2.fromScale(0.33, 1),
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                })
            }),
            [#v78 + 1] = v65
        }
        v63.LeftContainer = u10.createElement(u5, v74, v78)
        local v79
        if v37 == nil then
            v79 = false
        else
            v79 = u10.createElement(u18, {
                ["Clan"] = v37
            })
        end
        if v79 then
            v63[v64 + 1] = v79
        end
        return u10.createElement(u5, v62, v63)
    end)
}