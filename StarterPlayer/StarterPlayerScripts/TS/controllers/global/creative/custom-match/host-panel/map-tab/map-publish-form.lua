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
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v83 = v15.new(u14)(function(u20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u14
        [4] = u6
        [5] = u9
        [6] = u5
        [7] = u19
        [8] = u8
        [9] = u11
        [10] = u18
        [11] = u17
        [12] = u7
        [13] = u4
        [14] = u12
        [15] = u10
    --]]
    local v22 = p21.useState
    local v23, u24 = v22(false)
    local v25 = {}
    for v26, v27 in u20.MapSaveDisplayInfo do
        v25[v26] = v27
    end
    local u28, u29 = v22(v25)
    local function v31() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u13
            [3] = u20
            [4] = u28
            [5] = u2
        --]]
        u24(true)
        u13.Controllers.CustomMapBrowserController:publishMap(u20.MapSaveDisplayInfo.code, {
            ["mapTitle"] = u28.name,
            ["mapDescription"] = u28.description,
            ["thumbnailImage"] = u28.image,
            ["tags"] = u28.tags
        }):andThen(function(p30) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u2
            --]]
            u24(false)
            if p30 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Succesfully published map"
                })
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Failed to publish map"
                })
            end
        end)
    end
    local v32 = u28.image == nil and true or u28.image == ""
    local v33 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 1000
    }
    local v34 = { u14.createElement(u6, {
            ["AppId"] = "PublishMapModal"
        }) }
    local v35 = #v34
    local v36 = {}
    local v37 = #v36
    local v38 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(900, 600)
    }
    local v39 = { u14.createElement(u9, {
            ["MaximumSize"] = Vector2.new(700, 640),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }) }
    local v40 = #v39
    local v41 = {
        ["AppId"] = "PublishMapModal",
        ["AutomaticContainerSize"] = true,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["Title"] = "Publish Map: <font color=\"" .. u5.richTextColor(u19.mcAqua) .. "\">" .. u20.MapSaveDisplayInfo.name .. "</font>",
        ["OnClose"] = function() --[[ Name: OnClose, Line 84 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PublishMapModal")
        end
    }
    local v46 = {
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
                    ["Text"] = u28.name,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                },
                ["OnFocusLost"] = function(p42) --[[ Name: OnFocusLost, Line 118 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u29
                    --]]
                    local v43 = {}
                    for v44, v45 in u28 do
                        v43[v44] = v45
                    end
                    v43.name = p42
                    return u29(v43)
                end,
                ["MaxCharacters"] = u18.MAP_NAME_MAX_CHARS
            }, { u14.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.05, 0),
                    ["PaddingBottom"] = UDim.new(0.05, 0),
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0)
                }) }) })
    }
    local v47 = #v46
    local v48 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v49 = {}
    local v50 = #v49
    local v51 = {
        ["Size"] = UDim2.new(0.5, 0, 0, 36)
    }
    local v52 = { u14.createElement("TextLabel", {
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
    local v53 = #v52
    local v54 = {}
    local v55 = {
        ["Position"] = UDim2.fromOffset(0, 22),
        ["Size"] = UDim2.fromOffset(140, 28)
    }
    local v56 = u28.image
    if v56 ~= nil then
        v56 = string.gsub(v56, "rbxassetid://", "")
    end
    v55.Text = v56
    v55.PlaceholderText = "14181700012"
    v55.ClearTextOnFocus = false
    v55.TextXAlignment = Enum.TextXAlignment.Left
    v54.TextBox = v55
    function v54.OnFocusLost(p57) --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u29
        --]]
        local v58 = {}
        for v59, v60 in u28 do
            v58[v59] = v60
        end
        v58.image = p57
        return u29(v58)
    end
    v54.MaxCharacters = 20
    v52[v53 + 1] = u14.createElement(u11, v54, { u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }) })
    v49[v50 + 1] = u14.createElement(u8, v51, v52)
    local v61 = {
        ["Size"] = UDim2.new(0.5, 0, 0, 42),
        ["Position"] = UDim2.new(0, 150, 1, 0),
        ["AnchorPoint"] = Vector2.new(0, 1)
    }
    local v62
    if v32 then
        v62 = ""
    else
        local v63 = u28.image
        if v63 ~= nil then
            v63 = string.gsub(v63, "rbxassetid://", "")
        end
        v62 = "rbxassetid://" .. tostring(v63)
    end
    v61.Image = v62
    v61.BackgroundColor3 = u19.backgroundTertiary
    v61.BackgroundTransparency = 0
    v61.BorderSizePixel = 0
    v49[v50 + 2] = u14.createElement("ImageLabel", v61, { u14.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        }), u14.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v46.MapThumbnailField = u14.createElement(u8, v48, v49)
    v46.MapDescriptionField = u14.createElement(u8, {
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
                ["TextWrapped"] = true,
                ["Position"] = UDim2.fromOffset(0, 22),
                ["Size"] = UDim2.new(0.8, 0, 0, 60),
                ["Text"] = u20.MapSaveDisplayInfo.description,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            },
            ["OnFocusLost"] = function(p64) --[[ Name: OnFocusLost, Line 249 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u29
                --]]
                local v65 = {}
                for v66, v67 in u28 do
                    v65[v66] = v67
                end
                v65.description = p64
                return u29(v65)
            end,
            ["MaxCharacters"] = u18.MAP_DESCRIPTION_MAX_CHARS
        }, { u14.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }) }) })
    local v68 = u14.createElement
    local v69 = u8
    local v70 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v71 = {}
    local v72 = u14.createElement
    local v73 = u8
    local v74 = {
        ["Size"] = UDim2.new(0.5, 0, 0, 36)
    }
    local v75 = {}
    local v76 = u14.createElement
    local v77 = {
        ["BackgroundTransparency"] = 1,
        ["RichText"] = true,
        ["TextTransparency"] = 0.1,
        ["TextSize"] = 14,
        ["Size"] = UDim2.new(1, 0, 0, 14)
    }
    local v78 = u18.MAP_MAX_TAGS
    v77.Text = "<b>Tags (Max " .. tostring(v78) .. ")</b>"
    v77.TextXAlignment = Enum.TextXAlignment.Left
    v77.TextColor3 = Color3.new(1, 1, 1)
    v77.Font = Enum.Font.Roboto
    __set_list(v75, 1, {v76("TextLabel", v77)})
    __set_list(v71, 1, {v72(v73, v74, v75), u14.createElement(u17, {
    ["DefaultTags"] = u28.tags or {},
    ["OnChange"] = function(_, _, p79) --[[ Name: OnChange, Line 289 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u29
        --]]
        local v80 = {}
        for v81, v82 in u28 do
            v80[v81] = v82
        end
        v80.tags = p79
        u29(v80)
    end,
    ["FrameProps"] = {
        ["Size"] = UDim2.new(1, 0, 0, 24),
        ["Position"] = UDim2.new(0, 0, 0, 20)
    }
})})
    v46.MapTags = v68(v69, v70, v71)
    v46[v47 + 1] = u14.createElement(u7, {
        ["LayoutOrder"] = 5
    })
    v46.ActionsList = u14.createElement(u8, {
        ["LayoutOrder"] = 6,
        ["Size"] = UDim2.new(1, 0, 0, 50)
    }, { u14.createElement("TextLabel", {
            ["Text"] = "Publishing a map will let other players search and play your map! Published maps are a different copy of your map save.",
            ["TextTransparency"] = 0.3,
            ["TextWrapped"] = true,
            ["TextSize"] = 14,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.7, 0, 0, 44),
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Medium)
        }), u14.createElement(u4, {
            ["Text"] = "Publish Map",
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.new(1, 0, 0.5, 0),
            ["OnClick"] = v31,
            ["BackgroundColor3"] = u19.backgroundSuccess,
            ["Loading"] = v23
        }) })
    v39[v40 + 1] = u14.createElement(u12, v41, v46)
    v36[v37 + 1] = u14.createElement("Frame", v38, v39)
    v34[v35 + 1] = u14.createElement(u10, {}, v36)
    return u14.createElement("ScreenGui", v33, v34)
end)
return {
    ["MapPublishForm"] = v16.connect(function(_, p84) --[[ Line: 336 ]]
        local v85 = {}
        for v86, v87 in p84 do
            v85[v86] = v87
        end
        return v85
    end)(v83)
}