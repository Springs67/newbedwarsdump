local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.CircularSpinner
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "map-tab", "map-save-card").MapSaveCard
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomMatchesMapSaves"] = v10.new(u9)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
            [3] = u13
            [4] = u5
            [5] = u6
            [6] = u8
            [7] = u4
            [8] = u11
            [9] = u3
            [10] = u7
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18, u19 = v16(not u14.MapSaves)
        local v20
        if u14.MapSaves then
            v20 = u14.MapSaves[1]
        else
            v20 = nil
        end
        local u21, u22 = v16(v20)
        local function v31() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u14
                [3] = u9
                [4] = u13
                [5] = u5
            --]]
            local v23 = u12.MAX_MAP_SAVES
            local v24 = u14.MapSaves
            local v25 = v24 ~= nil and #v24 or v24
            local v26 = v23 - (v25 == nil and 0 or v25)
            local v27 = false
            local v28 = 0
            local v29 = {}
            while true do
                if v27 then
                    v28 = v28 + 1
                else
                    v27 = true
                end
                if v28 >= v26 then
                    return v29
                end
                local v30 = u9.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundColor3"] = u13.backgroundTertiary,
                    ["LayoutOrder"] = os.time() + 1
                }, { u9.createElement("TextLabel", {
                        ["Text"] = "<b>EMPTY SAVE SLOT</b>",
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["TextTransparency"] = 0.5,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.75, 0.3),
                        ["TextColor3"] = u5.hexColor(9541119)
                    }) })
                table.insert(v29, v30)
            end
        end
        v17(function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u8
                [3] = u19
                [4] = u14
            --]]
            if not u6.isHoarceKat() then
                u8.Controllers.CustomMatchController:getMySavedMaps():andThen(function() --[[ Line: 70 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    u19(false)
                end)
            end
            local v32 = u14.MapSaves
            if v32 ~= nil then
                v32 = v32[1]
            end
            if v32 then
                local v33 = u14.setMapInfo
                local v34 = {
                    ["queueType"] = v32.queueType
                }
                local v35 = {
                    ["id"] = v32.code,
                    ["name"] = v32.name
                }
                local v36 = v32.image
                v35.thumbnail = "rbxassetid://" .. tostring(v36)
                v34.selectedMap = v35
                v33(v34)
            else
                u14.setMapInfo(nil)
            end
        end, {})
        local v37 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v38 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v39 = #v38
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 14)
        }
        local v41 = u14.MapSaves
        local v42 = v41 ~= nil and #v41 or v41
        local v43 = v42 == nil and 0 or v42
        local v44 = tostring(v43)
        local v45 = u12.MAX_MAP_SAVES
        v40.Text = "<b>SELECT MAP SAVE (" .. v44 .. "/" .. tostring(v45) .. ")</b>"
        v40.TextXAlignment = Enum.TextXAlignment.Left
        v40.RichText = true
        v40.TextColor3 = Color3.new(1, 1, 1)
        v40.Font = Enum.Font.Roboto
        v40.TextTransparency = 0.1
        v40.TextSize = 14
        v38[v39 + 1] = u9.createElement("TextLabel", v40)
        local v46
        if v18 then
            v46 = u9.createElement(u4, {
                ["Size"] = UDim2.fromScale(0.5, 0.5)
            }, { u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        else
            local v47 = u14.MapSaves
            local v48
            if v47 == nil then
                v48 = v47
            else
                local function v66(u49, p50) --[[ Line: 136 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u9
                        [3] = u11
                        [4] = u22
                        [5] = u14
                        [6] = u13
                        [7] = u5
                    --]]
                    local u51 = u21
                    if u51 then
                        u51 = u21.code == u49.code
                    end
                    local v52 = u9.createElement
                    local v53 = u11
                    local v60 = {
                        ["MapSave"] = u49,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 140 ]]
                            --[[
                            Upvalues:
                                [1] = u22
                                [2] = u49
                                [3] = u14
                            --]]
                            u22(u49)
                            local v54 = u14.setMapInfo
                            local v55 = {
                                ["queueType"] = u49.queueType,
                                ["selectedMap"] = {
                                    ["id"] = u49.code,
                                    ["name"] = u49.name
                                }
                            }
                            v54(v55)
                        end,
                        ["OnHover"] = function(p56) --[[ Name: OnHover, Line 150 ]]
                            --[[
                            Upvalues:
                                [1] = u51
                            --]]
                            if u51 then
                                return nil
                            end
                            local v57 = p56:FindFirstChildWhichIsA("UIStroke")
                            if v57 then
                                v57.Enabled = true
                            end
                        end,
                        ["OnHoverOut"] = function(p58) --[[ Name: OnHoverOut, Line 159 ]]
                            --[[
                            Upvalues:
                                [1] = u51
                            --]]
                            if u51 then
                                return nil
                            end
                            local v59 = p58:FindFirstChildWhichIsA("UIStroke")
                            if v59 then
                                v59.Enabled = false
                            end
                        end,
                        ["FrameProps"] = {
                            ["LayoutOrder"] = p50
                        }
                    }
                    local v61 = {}
                    local v62 = u9.createElement
                    local v63 = "UIStroke"
                    local v64 = {}
                    local v65
                    if u51 then
                        v65 = u13.textPrimary
                    else
                        v65 = u5.WHITE
                    end
                    v64.Color = v65
                    v64.Thickness = u51 and 2 or 1
                    v64.Enabled = u51 and true or false
                    __set_list(v61, 1, {v62(v63, v64)})
                    return v52(v53, v60, v61)
                end
                v48 = table.create(#v47)
                for v67, v68 in v47 do
                    v48[v67] = v66(v68, v67 - 1, v47)
                end
            end
            local v69 = {
                ["WaitForAbsoluteSize"] = true,
                ["ScrollingFrameProps"] = {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                }
            }
            local v70 = { u9.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 2),
                    ["PaddingLeft"] = UDim.new(0, 4)
                }), u9.createElement("UIGridLayout", {
                    ["FillDirectionMaxCells"] = 4,
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["CellPadding"] = UDim2.new(0, 6, 0, 6),
                    ["CellSize"] = UDim2.new(0.24, -7, 0, 205),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v71 = #v70
            if v48 then
                for v72, v73 in v48 do
                    v70[v71 + v72] = v73
                end
            end
            local v74 = #v70
            for v75, v76 in v31() do
                v70[v74 + v75] = v76
            end
            v46 = u9.createElement(u3, v69, v70)
        end
        local v77 = {
            ["Size"] = UDim2.new(1, 0, 1, -22)
        }
        local v78 = {
            [#v78 + 1] = v46
        }
        v38[v39 + 2] = u9.createElement(u7, v77, v78)
        return u9.createFragment({
            ["CustomMatchesMapSaves"] = u9.createElement(u7, v37, v38)
        })
    end)
}