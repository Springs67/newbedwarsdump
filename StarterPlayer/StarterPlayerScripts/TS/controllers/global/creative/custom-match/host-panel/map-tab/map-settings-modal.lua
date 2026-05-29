local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DarkBackground
local u7 = v3.DividerComponent
local u8 = v3.Empty
local u9 = v3.ScaleComponent
local u10 = v3.SlideIn
local u11 = v3.TextInputComponent
local u12 = v3.WidgetComponent
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "custom-matches", "ui", "tabs", "map-browser", "map-browser-tags-grid").MapBrowserTagsGrid
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v89 = v15.new(u14)(function(u22, p23) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u14
        [4] = u6
        [5] = u9
        [6] = u5
        [7] = u21
        [8] = u8
        [9] = u11
        [10] = u20
        [11] = u17
        [12] = u19
        [13] = u18
        [14] = u7
        [15] = u4
        [16] = u12
        [17] = u10
    --]]
    local v24 = p23.useState
    local v25, u26 = v24(false)
    local v27 = {}
    for v28, v29 in u22.MapSaveDisplayInfo do
        v27[v28] = v29
    end
    local u30, u31 = v24(v27)
    local function v33() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u13
            [3] = u22
            [4] = u30
            [5] = u2
        --]]
        u26(true)
        u13.Controllers.CustomMatchController:updateMapSaveSettings(u22.MapSaveDisplayInfo.code, u30):andThen(function(p32) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u2
            --]]
            u26(false)
            if p32.success then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Succesfully saved map settings"
                })
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Failed to save map settings"
                })
            end
        end)
    end
    local v34 = u30.image == nil and true or u30.image == ""
    local v35 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 1000
    }
    local v36 = { u14.createElement(u6, {
            ["AppId"] = "MapSettingsModal"
        }) }
    local v37 = #v36
    local v38 = {}
    local v39 = #v38
    local v40 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(500, 0)
    }
    local v41 = { u14.createElement(u9, {
            ["MaximumSize"] = Vector2.new(700, 840),
            ["ScreenPadding"] = Vector2.new(12, 12)
        }) }
    local v42 = #v41
    local v43 = {
        ["AppId"] = "MapSettingsModal",
        ["AutomaticContainerSize"] = true,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["Title"] = "Map Settings: <font color=\"" .. u5.richTextColor(u21.mcAqua) .. "\">" .. u22.MapSaveDisplayInfo.name .. "</font>",
        ["OnClose"] = function() --[[ Name: OnClose, Line 81 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MapSettingsModal")
        end
    }
    local v48 = {
        u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 12)
        }),
        ["MapNameField"] = u14.createElement(u8, {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0)
        }, { u14.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "<b>Map Name</b>",
                ["RichText"] = true,
                ["TextTransparency"] = 0.1,
                ["TextSize"] = 14,
                ["Size"] = UDim2.new(1, 0, 0, 14),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.Roboto
            }), u14.createElement(u11, {
                ["TextBox"] = {
                    ["ClearTextOnFocus"] = false,
                    ["Position"] = UDim2.fromOffset(0, 17),
                    ["Size"] = UDim2.fromOffset(140, 28),
                    ["Text"] = u30.name,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                },
                ["OnFocusLost"] = function(p44) --[[ Name: OnFocusLost, Line 115 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u31
                    --]]
                    local v45 = {}
                    for v46, v47 in u30 do
                        v45[v46] = v47
                    end
                    v45.name = p44
                    return u31(v45)
                end,
                ["MaxCharacters"] = u20.MAP_NAME_MAX_CHARS
            }, { u14.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.05, 0),
                    ["PaddingBottom"] = UDim.new(0.05, 0),
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0)
                }) }) })
    }
    local v49 = #v48
    local v50 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v51 = {}
    local v52 = #v51
    local v53 = {
        ["Size"] = UDim2.new(0.5, 0, 0, 36)
    }
    local v54 = { u14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Text"] = "<b>Thumbnail Asset Id</b>",
            ["RichText"] = true,
            ["TextTransparency"] = 0.1,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 14),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.Roboto
        }) }
    local v55 = #v54
    local v56 = {}
    local v57 = {
        ["Position"] = UDim2.fromOffset(0, 22),
        ["Size"] = UDim2.fromOffset(140, 28)
    }
    local v58 = u30.image
    if v58 ~= nil then
        v58 = string.gsub(v58, "rbxassetid://", "")
    end
    v57.Text = v58
    v57.PlaceholderText = "14181700012"
    v57.ClearTextOnFocus = false
    v57.TextXAlignment = Enum.TextXAlignment.Left
    v56.TextBox = v57
    function v56.OnFocusLost(p59) --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
        --]]
        local v60 = {}
        for v61, v62 in u30 do
            v60[v61] = v62
        end
        v60.image = p59
        return u31(v60)
    end
    v56.MaxCharacters = 20
    v54[v55 + 1] = u14.createElement(u11, v56, { u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }) })
    v51[v52 + 1] = u14.createElement(u8, v53, v54)
    local v63 = {
        ["Size"] = UDim2.new(0.5, 0, 0, 42),
        ["Position"] = UDim2.new(0, 150, 1, 0),
        ["AnchorPoint"] = Vector2.new(0, 1)
    }
    local v64
    if v34 then
        v64 = ""
    else
        local v65 = u30.image
        if v65 ~= nil then
            v65 = string.gsub(v65, "rbxassetid://", "")
        end
        v64 = "rbxassetid://" .. tostring(v65)
    end
    v63.Image = v64
    v63.BackgroundColor3 = u21.backgroundTertiary
    v63.BackgroundTransparency = 0
    v63.BorderSizePixel = 0
    v51[v52 + 2] = u14.createElement("ImageLabel", v63, { u14.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        }), u14.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v48.MapThumbnailField = u14.createElement(u8, v50, v51)
    v48.MapDescriptionField = u14.createElement(u8, {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0)
    }, { u14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Text"] = "<b>Description</b>",
            ["RichText"] = true,
            ["TextTransparency"] = 0.1,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 14),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.Roboto
        }), u14.createElement(u11, {
            ["TextBox"] = {
                ["PlaceholderText"] = "Introduce your map to the public!",
                ["ClearTextOnFocus"] = false,
                ["TextWrapped"] = true,
                ["Position"] = UDim2.fromOffset(0, 22),
                ["Size"] = UDim2.new(0.8, 0, 0, 60),
                ["Text"] = u22.MapSaveDisplayInfo.description,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            },
            ["OnFocusLost"] = function(p66) --[[ Name: OnFocusLost, Line 247 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u31
                --]]
                local v67 = {}
                for v68, v69 in u30 do
                    v67[v68] = v69
                end
                v67.description = p66
                return u31(v67)
            end,
            ["MaxCharacters"] = u20.MAP_DESCRIPTION_MAX_CHARS
        }, { u14.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }) }) })
    local v70 = u14.createElement
    local v71 = u8
    local v72 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v73 = {}
    local v74 = u14.createElement
    local v75 = u8
    local v76 = {
        ["Size"] = UDim2.new(0.5, 0, 0, 36)
    }
    local v77 = {}
    local v78 = u14.createElement
    local v79 = {
        ["BackgroundTransparency"] = 1,
        ["RichText"] = true,
        ["TextTransparency"] = 0.1,
        ["TextSize"] = 14,
        ["Size"] = UDim2.new(1, 0, 0, 14)
    }
    local v80 = u20.MAP_MAX_TAGS
    v79.Text = "<b>Tags</b> <font transparency=\".3\">(Max " .. tostring(v80) .. ")</font>"
    v79.TextXAlignment = Enum.TextXAlignment.Left
    v79.TextColor3 = Color3.new(1, 1, 1)
    v79.Font = Enum.Font.Roboto
    __set_list(v77, 1, {v78("TextLabel", v79)})
    __set_list(v73, 1, {v74(v75, v76, v77), u14.createElement(u17, {
    ["DefaultTags"] = u30.tags or {},
    ["OnChange"] = function(_, _, p81) --[[ Name: OnChange, Line 287 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
        --]]
        local v82 = {}
        for v83, v84 in u30 do
            v82[v83] = v84
        end
        v82.tags = p81
        u31(v82)
    end,
    ["FrameProps"] = {
        ["Size"] = UDim2.new(1, 0, 0, 24),
        ["Position"] = UDim2.new(0, 0, 0, 20)
    }
})})
    v48.MapTags = v70(v71, v72, v73)
    v48[v49 + 1] = u14.createElement(u8, {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 5,
        ["Size"] = UDim2.fromScale(1, 0)
    }, { u14.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Text"] = "<b>Copylock Map</b> <font transparency=\".3\">(Locking the map will prevent players from copying the map)</font>",
            ["RichText"] = true,
            ["TextWrapped"] = true,
            ["TextTransparency"] = 0.1,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 14),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["Font"] = Enum.Font.Roboto
        }), u14.createElement(u19, {
            ["Value"] = u30.copylock and "locked" or "copyable",
            ["OnChange"] = function(p85) --[[ Name: OnChange, Line 320 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u31
                --]]
                local v86 = {}
                for v87, v88 in u30 do
                    v86[v87] = v88
                end
                v86.copylock = p85 == "locked"
                u31(v86)
            end,
            ["FrameProps"] = {
                ["Size"] = UDim2.fromOffset(130, 28),
                ["Position"] = UDim2.fromOffset(0, 22)
            }
        }, { u14.createElement(u18, {
                ["Value"] = "copyable",
                ["Text"] = "Copyable"
            }), u14.createElement(u18, {
                ["Value"] = "locked",
                ["Text"] = "Locked"
            }) }) })
    v48[v49 + 2] = u14.createElement(u7, {
        ["LayoutOrder"] = 6
    })
    v48.ActionsList = u14.createElement(u8, {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 7,
        ["Size"] = UDim2.new(1, 0, 0, 0)
    }, { u14.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }), u14.createElement(u4, {
            ["Text"] = "Save Settings",
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.new(1, 0, 0, 22),
            ["OnClick"] = v33,
            ["Loading"] = v25
        }) })
    v41[v42 + 1] = u14.createElement(u12, v43, v48)
    v38[v39 + 1] = u14.createElement("Frame", v40, v41)
    v36[v37 + 1] = u14.createElement(u10, {}, v38)
    return u14.createElement("ScreenGui", v35, v36)
end)
return {
    ["MapSettingsModal"] = v16.connect(function(_, p90) --[[ Line: 372 ]]
        local v91 = {}
        for v92, v93 in p90 do
            v91[v92] = v93
        end
        return v91
    end)(v89)
}