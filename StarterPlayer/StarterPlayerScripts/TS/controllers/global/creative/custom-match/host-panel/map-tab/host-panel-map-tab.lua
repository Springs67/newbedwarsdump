local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto")
local u17 = v16.HostPanelToggle
local u18 = v16.HostPanelToggleValue
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u23 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting
local u24 = v1.import(script, script.Parent, "map-save-card").MapSaveCard
return {
    ["HostPanelMapTab"] = v10.new(u9)(function(p25, p26) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u12
            [3] = u8
            [4] = u13
            [5] = u7
            [6] = u2
            [7] = u4
            [8] = u22
            [9] = u9
            [10] = u5
            [11] = u24
            [12] = u6
            [13] = u21
            [14] = u19
            [15] = u23
            [16] = u15
            [17] = u17
            [18] = u14
            [19] = u18
        --]]
        local v27 = p26.useState
        local v28 = p26.useEffect
        local u29, u30 = v27(false)
        local v31, u32 = v27(not p25.store.CustomMatch.mapSaves)
        local v33, u34 = v27(0)
        local v35 = p25.store.CustomMatch.mapSaveData
        if v35 then
            local v36 = u20
            local v37 = u12.LocalPlayer
            local v38 = p25.store.CustomMatch.mapSaveData
            if v38 ~= nil then
                v38 = v38.creatorUserId
            end
            v35 = v36:canBypassCopylock(v37, v38)
        end
        v28(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
                [3] = u34
                [4] = u7
                [5] = u32
            --]]
            local u39 = u8.new()
            local v40 = u13:FindFirstChild("Map")
            if v40 ~= nil then
                v40 = v40:FindFirstChild("Worlds")
                if v40 ~= nil then
                    v40 = v40:FindFirstChildWhichIsA("Folder")
                end
            end
            if v40 == nil then
                u39:GiveTask(u13.ChildAdded:Connect(function(p41) --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u34
                    --]]
                    if p41.Name == "Map" then
                        local v42 = u13:FindFirstChild("Map")
                        if v42 ~= nil then
                            v42 = v42:FindFirstChild("Worlds")
                            if v42 ~= nil then
                                v42 = v42:FindFirstChildWhichIsA("Folder")
                            end
                        end
                        if not v42 then
                            return nil
                        end
                        u34(#v42.Blocks:GetChildren() + #v42.BreakableBlocks:GetChildren())
                    end
                end))
            else
                u34(#v40.Blocks:GetChildren() + #v40.BreakableBlocks:GetChildren())
            end
            local u43 = u7.Controllers.CustomMatchController:getMySavedMaps()
            u43:andThen(function() --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                u32(false)
            end)
            return function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u43
                --]]
                u39:DoCleaning()
                u43:cancel()
            end
        end, {})
        local v44 = p25.store.CustomMatch.mapSaveData
        if v44 ~= nil then
            v44 = v44.copylocked
        end
        local v45 = v44 == true
        if v45 then
            v45 = not v35
        end
        local v46
        if v45 then
            local v47 = {
                ["Size"] = UDim2.fromScale(1, 0.6)
            }
            local v48 = {}
            local v49 = #v48
            local v50 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v51 = u4.richTextColor(u4.WHITE)
            local v52 = p25.store.CustomMatch.mapSaveData
            if v52 ~= nil then
                v52 = v52.mapTitle
            end
            local v53 = p25.store.CustomMatch.mapSaveData.creatorUserId
            v50.Text = "<b>Copying this map<font color=\"" .. v51 .. "\">(" .. v52 .. ")</font> has been disabled by the creator (" .. tostring(v53) .. ")</b>"
            v50.TextScaled = true
            v50.RichText = true
            v50.Font = "Roboto"
            v50.TextColor3 = u22.backgroundError
            v50.TextXAlignment = "Center"
            v50.TextYAlignment = "Center"
            v50.BackgroundTransparency = 1
            v50.LayoutOrder = 0
            v48[v49 + 1] = u9.createElement("TextLabel", v50, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
            v46 = u9.createElement(u5, v47, v48)
        else
            local v54 = {}
            local v55 = #v54
            local v56 = {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Size"] = UDim2.fromScale(1, 0)
            }
            local v57 = p25.store.CustomMatch.mapSaves
            local v58 = v57 ~= nil and #v57 or v57
            local v59 = v58 == nil and 0 or v58
            local v60 = tostring(v59)
            local v61 = u20.MAX_MAP_SAVES
            v56.Text = "<b>MAP (" .. v60 .. "/" .. tostring(v61) .. ")</b>"
            v56.TextScaled = true
            v56.RichText = true
            v56.Font = "Roboto"
            v56.TextColor3 = u22.textPrimary
            v56.TextXAlignment = "Left"
            v56.TextYAlignment = "Bottom"
            v56.BackgroundTransparency = 1
            v56.LayoutOrder = 0
            v54[v55 + 1] = u9.createElement("TextLabel", v56, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
            local v62
            if v31 then
                v62 = u9.createElement("TextLabel", {
                    ["Text"] = "LOADING MAP SAVES",
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.75),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u22.textPrimary
                }, { u9.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 20
                    }) })
            else
                local v63 = p25.store.CustomMatch.mapSaves
                local v64
                if v63 == nil then
                    v64 = v63
                else
                    local function v70(p65, p66) --[[ Line: 189 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u24
                        --]]
                        local v67 = u9.createFragment
                        local v68 = {}
                        local v69 = {
                            ["MapSave"] = p65,
                            ["ContainerProps"] = {
                                ["LayoutOrder"] = p66
                            }
                        }
                        v68[p65.code] = u9.createElement(u24, v69)
                        return v67(v68)
                    end
                    v64 = table.create(#v63)
                    for v71, v72 in v63 do
                        v64[v71] = v70(v72, v71 - 1, v63)
                    end
                end
                local v73 = {}
                local v74 = #v73
                if v64 then
                    for v75, v76 in v64 do
                        v73[v74 + v75] = v76
                    end
                end
                local v77 = #v73
                local v78 = p25.store.CustomMatch.mapSaves
                local v79 = v78 ~= nil and #v78 or v78
                local v80 = (v79 == nil and 0 or v79) < u20.MAX_MAP_SAVES
                if v80 then
                    local v81 = u9.createFragment
                    local v82 = {}
                    local v83 = u9.createElement
                    local v84 = "ImageButton"
                    local v86 = {
                        ["Size"] = UDim2.fromScale(0.3, 1),
                        ["BackgroundColor3"] = u22.backgroundTertiary,
                        ["BorderSizePixel"] = 0,
                        ["LayoutOrder"] = u20.MAX_MAP_SAVES,
                        [u9.Event.Activated] = function() --[[ Line: 231 ]]
                            --[[
                            Upvalues:
                                [1] = u29
                                [2] = u6
                                [3] = u21
                                [4] = u30
                                [5] = u7
                                [6] = u2
                            --]]
                            if u29 then
                                return nil
                            end
                            u6:playSound(u21.UI_CLICK)
                            u30(true)
                            u7.Controllers.CustomMatchController:saveMap():andThen(function(p85) --[[ Line: 90 ]]
                                --[[
                                Upvalues:
                                    [1] = u30
                                    [2] = u2
                                --]]
                                u30(false)
                                if not p85 then
                                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                                        ["message"] = "Error: Could not save the map."
                                    })
                                end
                            end)
                        end,
                        ["AutoButtonColor"] = not u29
                    }
                    local v87 = {}
                    local v88 = u9.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Center",
                        ["HorizontalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.075, 0)
                    })
                    local v89
                    if u29 then
                        v89 = u9.createElement("TextLabel", {
                            ["Text"] = "<b>SAVING...</b>",
                            ["RichText"] = true,
                            ["TextScaled"] = true,
                            ["TextTransparency"] = 0.5,
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.fromScale(0.75, 0.25),
                            ["TextColor3"] = u4.hexColor(9541119)
                        })
                    else
                        v89 = u9.createFragment({ u9.createElement("ImageLabel", {
                                ["ScaleType"] = "Fit",
                                ["BackgroundTransparency"] = 1,
                                ["LayoutOrder"] = 1,
                                ["Size"] = UDim2.fromScale(0.25, 0.25),
                                ["Image"] = u19.PLUS
                            }), u9.createElement("TextLabel", {
                                ["Text"] = "<b>SAVE MAP</b>",
                                ["RichText"] = true,
                                ["TextScaled"] = true,
                                ["TextTransparency"] = 0.5,
                                ["BackgroundTransparency"] = 1,
                                ["LayoutOrder"] = 2,
                                ["Size"] = UDim2.fromScale(0.75, 0.25),
                                ["TextColor3"] = u4.hexColor(9541119)
                            }) })
                    end
                    __set_list(v87, 1, {v88, v89})
                    v82.SaveMap = v83(v84, v86, v87)
                    v80 = v81(v82)
                end
                if v80 then
                    v73[v77 + 1] = v80
                end
                v62 = u9.createFragment(v73)
            end
            local v90 = {
                ["ScrollBarThickness"] = 6,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.6),
                ["CanvasSize"] = UDim2.fromScale(0, 0),
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.X,
                ["ScrollingDirection"] = Enum.ScrollingDirection.X
            }
            local v91 = {
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.03, 0)
                }),
                [#v91 + 1] = v62
            }
            v54[v55 + 2] = u9.createElement("ScrollingFrame", v90, v91)
            v46 = u9.createFragment(v54)
        end
        local v92 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v93 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0, 10)
            }),
            [#v93 + 1] = v46
        }
        local v94 = #v93
        v93[v94 + 1] = u9.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["SizeConstraint"] = "RelativeXX",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Bottom",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0),
            ["Text"] = "<b>" .. tostring(v33) .. " blocks in the map</b>",
            ["TextColor3"] = u22.textPrimary
        }, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        v93[v94 + 2] = u9.createElement(u23, {
            ["Name"] = "Ignore Build Restricted Regions",
            ["Hint"] = "(ex. Allows block placing near spawn points and outside the map)",
            ["Size"] = UDim2.new(0.95, 0, 0, 50)
        }, { u9.createElement(u15, {
                ["Value"] = p25.store.CustomMatch.generalToggles[u17.IgnoreBuildRestrictedRegions],
                ["OnChange"] = function(p95) --[[ Name: OnChange, Line 343 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u17
                    --]]
                    u7.Controllers.CustomMatchController:setToggle(u17.IgnoreBuildRestrictedRegions, p95)
                end
            }, { u9.createElement(u14, {
                    ["Text"] = "On",
                    ["Value"] = u18.ON
                }), u9.createElement(u14, {
                    ["Text"] = "Off",
                    ["Value"] = u18.OFF,
                    ["ActiveColor"] = u22.backgroundError
                }), u9.createElement(u14, {
                    ["Text"] = "Host Only",
                    ["Value"] = u18.HOST_ONLY
                }) }) })
        v93[v94 + 3] = u9.createElement(u23, {
            ["Name"] = "Out of bounds damage",
            ["Hint"] = "Apply damage when players go outside of the map borders",
            ["Size"] = UDim2.new(0.95, 0, 0, 50)
        }, { u9.createElement(u15, {
                ["Value"] = p25.store.CustomMatch.generalToggles[u17.MapBorderDamage],
                ["OnChange"] = function(p96) --[[ Name: OnChange, Line 369 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u17
                    --]]
                    u7.Controllers.CustomMatchController:setToggle(u17.MapBorderDamage, p96)
                end
            }, { u9.createElement(u14, {
                    ["Text"] = "On",
                    ["Value"] = u18.ON
                }), u9.createElement(u14, {
                    ["Text"] = "Off",
                    ["Value"] = u18.OFF,
                    ["ActiveColor"] = u22.backgroundError
                }) }) })
        return u9.createElement(u5, v92, v93)
    end)
}