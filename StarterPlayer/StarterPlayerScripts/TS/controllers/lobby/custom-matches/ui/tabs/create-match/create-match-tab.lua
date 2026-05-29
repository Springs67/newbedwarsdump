local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ButtonComponent
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local v8 = v2.GetTarmacAsset
local u9 = v2.Padding
local u10 = v2.TabComponentVariant
local u11 = v2.TabsComponent
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").Promise
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent, "create-match-game-settings").CreateMatchGameSettings
local u23 = v1.import(script, script.Parent, "custom-matches-classic-maps").CustomMatchesClassicMaps
local u24 = v1.import(script, script.Parent, "custom-matches-map-saves").CustomMatchesMapSaves
local v25 = {}
local u26 = setmetatable({}, {
    ["__index"] = v25
})
u26.OFFICIAL_MAPS = "official_maps"
v25.official_maps = "OFFICIAL_MAPS"
u26.MY_MAPS = "my_maps"
v25.my_maps = "MY_MAPS"
local u27 = {
    {
        ["text"] = "OFFICIAL MAPS",
        ["layoutOrder"] = 1,
        ["value"] = u26.OFFICIAL_MAPS
    },
    {
        ["text"] = "MY MAPS",
        ["layoutOrder"] = 2,
        ["value"] = u26.MY_MAPS
    }
}
local u28 = v8("NoImage")
local u29 = u19.BEDWARS_TO4
local u30 = u18[u29]
local function v70(u31, p32) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u6
        [3] = u16
        [4] = u28
        [5] = u20
        [6] = u29
        [7] = u30
        [8] = u5
        [9] = u14
        [10] = u11
        [11] = u27
        [12] = u10
        [13] = u9
        [14] = u22
        [15] = u23
        [16] = u24
        [17] = u7
        [18] = u3
        [19] = u13
        [20] = u18
        [21] = u19
        [22] = u12
        [23] = u21
        [24] = u4
        [25] = u17
    --]]
    local v33 = p32.useState
    local u34, u35 = v33(u26.OFFICIAL_MAPS)
    local u36, v37 = v33({
        ["title"] = (u6.isHoarceKat() and "My" or u16.LocalPlayer.DisplayName .. "\'s") .. " Game",
        ["thumbnail"] = u28.Image,
        ["visibilityMode"] = u20.DEFAULT_VISIBILITY_MODE
    })
    local u38, u39 = v33(nil)
    local u40, u41 = v33(false)
    local v42, v43 = v33({
        ["queueType"] = u29,
        ["metadata"] = u30
    })
    local function v45(p44) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u39
        --]]
        if u40 then
            return nil
        end
        u39(p44)
    end
    local v46 = {
        ["BackgroundTransparency"] = 0.65,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u5.BLACK
    }
    local v48 = {
        u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 4)
        }),
        ["TabsWrapper"] = u14.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 36),
            ["BackgroundColor3"] = Color3.fromRGB(52, 54, 86)
        }, { u14.createElement(u11, {
                ["Value"] = u34,
                ["Tabs"] = u27,
                ["OnChange"] = function(p47) --[[ Name: OnChange, Line 90 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                    --]]
                    u35(p47.value)
                end,
                ["Variant"] = u10.UNDERLINE,
                ["UIListLayout"] = {
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0.025, 0)
                },
                ["ButtonProps"] = {
                    ["Size"] = UDim2.fromScale(0.2, 1)
                },
                ["FrameProps"] = {
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 1)
                }
            }) })
    }
    local _ = #v48
    local v49 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 1, -48),
        ["Position"] = UDim2.new(0, 0, 0, 40)
    }
    local v50 = {
        u14.createElement(u9, {
            ["Padding"] = {
                ["Horizontal"] = 18,
                ["Vertical"] = 18
            }
        }),
        u14.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 16)
        }),
        ["SettingsSection"] = u14.createElement(u22, {
            ["SubTab"] = u34,
            ["GameInfo"] = u36,
            ["SetGameInfo"] = v37,
            ["SelectedGamemode"] = v42,
            ["SetSelectedGamemode"] = v43,
            ["FrameProps"] = {
                ["LayoutOrder"] = 1
            }
        })
    }
    local _ = #v50
    local v51 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 1, -78)
    }
    local v52 = {}
    local v53 = #v52
    local v54
    if u34 == u26.OFFICIAL_MAPS then
        v54 = u14.createElement(u23, {
            ["setMapInfo"] = v45,
            ["SelectedGamemode"] = v42,
            ["SetSelectedGamemode"] = v43
        })
    else
        v54 = false
    end
    if v54 then
        v52[v53 + 1] = v54
    end
    local v55 = #v52
    local v56
    if u34 == u26.MY_MAPS then
        v56 = u14.createElement(u24, {
            ["setMapInfo"] = v45,
            ["MapSaves"] = u31.MapSaves
        })
    else
        v56 = false
    end
    if v56 then
        v52[v55 + 1] = v56
    end
    v50.MapSection = u14.createElement(u7, v51, v52)
    local v57 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.new(1, 0, 0, 32)
    }
    local v58 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Right",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 4)
        }) }
    local v59 = #v58
    local v60 = {}
    local v61
    if u38 == nil then
        v61 = u38
    else
        v61 = u38.selectedMap
        if v61 ~= nil then
            v61 = v61.name
        end
    end
    v60.Text = v61 == nil and "" or v61
    v60.TextSize = 14
    v60.Font = Enum.Font.GothamBold
    v58[v59 + 1] = u14.createElement(u3, v60)
    local v62 = {}
    local v63
    if u38 == nil then
        v63 = u38
    else
        v63 = u38.selectedMap
    end
    v62.Text = v63 == nil and "Select a Map" or (u40 and "Creating Match..." or "Create Match")
    function v62.OnClick() --[[ Line: 199 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u38
            [3] = u41
            [4] = u13
            [5] = u18
            [6] = u19
            [7] = u31
            [8] = u36
            [9] = u34
            [10] = u26
            [11] = u12
        --]]
        if u40 then
            return nil
        end
        local v64 = u38
        if v64 ~= nil then
            v64 = v64.selectedMap
        end
        if not v64 then
            return nil
        end
        u41(true)
        local v65 = nil
        for v66, v67 in u13.keys(u18) do
            local _ = v66 - 1
            if v67 == u38.queueType == true then
                v65 = v67
                break
            end
        end
        if v65 == nil then
            v65 = u19.BEDWARS_TO4
        end
        u41(true)
        u31.OnCreateMatch(v65, u38.selectedMap.id, {
            ["mapName"] = u38.selectedMap.name,
            ["mapThumbnail"] = u38.selectedMap.thumbnail,
            ["liveServerInfo"] = u36,
            ["isMapSave"] = u34 == u26.MY_MAPS
        }):andThen(function(_) --[[ Line: 239 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41(false)
        end)
        u12.delay(5):andThen(function() --[[ Line: 244 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            return u41(false)
        end)
    end
    local v68
    if u38 == nil then
        v68 = u38
    else
        v68 = u38.selectedMap
    end
    local v69
    if v68 == nil then
        v69 = u21.backgroundError
    else
        v69 = u21.backgroundSuccess
    end
    v62.BackgroundColor3 = v69
    if u38 ~= nil then
        u38 = u38.selectedMap
    end
    v62.Disabled = u38 == nil or u40
    v58[v59 + 2] = u14.createElement(u4, v62, { u14.createElement(u17, {}, { u14.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }) })
    v50.CreateSection = u14.createElement(u7, v57, v58)
    v48.Content = u14.createElement(u7, v49, v50)
    return u14.createFragment({
        ["CreateMatchPage"] = u14.createElement("Frame", v46, v48)
    })
end
return {
    ["CreateMatchTab"] = v15.new(u14)(v70)
}