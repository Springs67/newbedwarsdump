local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.TextInputComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent, "pagination-page-button").PaginationPageButton
return {
    ["Pagination"] = v8.new(u7)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u3
            [4] = u5
            [5] = u6
            [6] = u4
        --]]
        local _ = p11.useState
        local v12 = u10.NumPagesAroundCurr
        local v13 = v12 == nil and 2 or v12
        local v14 = false
        local v15 = 1
        local function v17(p16) --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.OnPageChage(p16)
        end
        local v18 = {}
        while true do
            if v14 then
                v15 = v15 + 1
            else
                v14 = true
            end
            local v19 = u10.Page - 1
            if v15 > math.min(v19, v13) then
                break
            end
            local v20 = u7.createElement(u9, {
                ["Page"] = u10.Page - v15,
                ["CurrentPage"] = u10.Page,
                ["SetPage"] = v17
            })
            table.insert(v18, v20)
        end
        local v21 = false
        local v22 = 1
        local v23 = {}
        while true do
            if v21 then
                v22 = v22 + 1
            else
                v21 = true
            end
            local v24 = math
            local v25 = u10.TotalPages
            local v26
            if v25 == 0 or (v25 ~= v25 or not v25) then
                v26 = v13
            else
                v26 = u10.TotalPages - u10.Page
            end
            if v22 > v24.min(v26, v13) then
                local v27 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v28 = u10.FrameProps
                if v28 then
                    for v29, v30 in v28 do
                        v27[v29] = v30
                    end
                end
                local v31 = { u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Right",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 4)
                    }) }
                local v32 = #v31
                local v33
                if v13 < u10.Page - 1 then
                    local v34 = u7.createFragment
                    local v36 = {
                        ["PREV"] = u7.createFragment({
                            ["PREV"] = u7.createElement("TextButton", {
                                ["Text"] = "PREV",
                                ["Size"] = UDim2.new(0.1, 0, 1, 0),
                                ["TextColor3"] = u3.WHITE,
                                ["TextScaled"] = true,
                                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                ["BackgroundColor3"] = Color3.fromRGB(21, 21, 38),
                                ["BorderSizePixel"] = 0,
                                [u7.Event.Activated] = function() --[[ Line: 98 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u10
                                    --]]
                                    if u10.Page == 1 then
                                        return nil
                                    end
                                    local v35 = u10.Page - 1
                                    u10.OnPageChage(v35)
                                end,
                                ["LayoutOrder"] = 1
                            }, { u7.createElement(u5, {
                                    ["Padding"] = {
                                        ["Horizontal"] = 6,
                                        ["Vertical"] = 6
                                    }
                                }), u7.createElement("UICorner", {
                                    ["CornerRadius"] = UDim.new(0.2, 0)
                                }) })
                        })
                    }
                    local v37 = u7.createElement(u9, {
                        ["Page"] = 1,
                        ["CurrentPage"] = u10.Page,
                        ["SetPage"] = v17
                    })
                    local v38 = u7.createElement
                    local v39 = u6
                    local v44 = {
                        ["ClearTextOnEnter"] = true,
                        ["OnFocusLost"] = function(p40) --[[ Name: OnFocusLost, Line 123 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                            --]]
                            local v41 = tonumber(p40)
                            if v41 ~= 0 and (v41 == v41 and v41) then
                                local v42 = u10.TotalPages
                                if v42 ~= 0 and (v42 == v42 and v42) then
                                    local v43 = u10.TotalPages
                                    v41 = math.clamp(v41, 1, v43)
                                end
                                u10.OnPageChage(v41)
                            end
                        end,
                        ["TextBox"] = {
                            ["PlaceholderText"] = "...",
                            ["ClearTextOnFocus"] = true,
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.new(0.125, 0, 1, 0)
                        }
                    }
                    local v45 = u10.TotalPages
                    v44.MaxCharacters = #tostring(v45)
                    __set_list(v36, 1, {v37, v38(v39, v44, { u7.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.75
    }) })})
                    v33 = v34(v36)
                else
                    v33 = false
                end
                if v33 then
                    v31[v32 + 1] = v33
                end
                local v46 = #v31
                for v47, v48 in v18 do
                    v31[v46 + v47] = v48
                end
                local v49 = #v31
                v31[v49 + 1] = u7.createElement(u9, {
                    ["Page"] = u10.Page,
                    ["CurrentPage"] = u10.Page,
                    ["SetPage"] = v17
                })
                for v50, v51 in v23 do
                    v31[v49 + 1 + v50] = v51
                end
                local v52 = #v31
                local v53
                if u10.TotalPages == nil or v13 > u10.TotalPages - u10.Page then
                    v53 = false
                else
                    local v54 = u7.createFragment
                    local v55 = {}
                    local v56 = u7.createElement
                    local v57 = u6
                    local v62 = {
                        ["ClearTextOnEnter"] = true,
                        ["OnFocusLost"] = function(p58) --[[ Name: OnFocusLost, Line 163 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                            --]]
                            local v59 = tonumber(p58)
                            if v59 ~= 0 and (v59 == v59 and v59) then
                                local v60 = u10.TotalPages
                                local v61 = math.clamp(v59, 1, v60)
                                u10.OnPageChage(v61)
                            end
                        end,
                        ["TextBox"] = {
                            ["PlaceholderText"] = "...",
                            ["ClearTextOnFocus"] = true,
                            ["Size"] = UDim2.new(0.125, 0, 1, 0),
                            ["LayoutOrder"] = u10.Page + 3
                        }
                    }
                    local v63 = u10.TotalPages
                    v62.MaxCharacters = #tostring(v63)
                    __set_list(v55, 1, {v56(v57, v62, { u7.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.75
    }) }), u7.createElement(u9, {
    ["Page"] = u10.TotalPages,
    ["CurrentPage"] = u10.Page,
    ["SetPage"] = v17
})})
                    v53 = v54(v55)
                end
                if v53 then
                    v31[v52 + 1] = v53
                end
                local _ = #v31
                local v65 = {
                    ["Text"] = "NEXT",
                    ["Size"] = UDim2.new(0.1, 0, 1, 0),
                    ["TextColor3"] = u3.WHITE,
                    ["TextScaled"] = true,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["BackgroundColor3"] = Color3.fromRGB(21, 21, 38),
                    ["BorderSizePixel"] = 0,
                    [u7.Event.Activated] = function() --[[ Line: 200 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                        --]]
                        if u10.Page == u10.TotalPages then
                            return nil
                        end
                        local v64 = u10.Page + 1
                        u10.OnPageChage(v64)
                    end
                }
                local v66 = u10.TotalPages
                if v66 == nil then
                    v66 = u10.Page + 1
                end
                v65.LayoutOrder = v66
                v31.NEXT = u7.createElement("TextButton", v65, { u7.createElement(u5, {
                        ["Padding"] = {
                            ["Horizontal"] = 6,
                            ["Vertical"] = 6
                        }
                    }), u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.2, 0)
                    }) })
                return u7.createFragment({
                    ["Pagination"] = u7.createElement(u4, v27, v31)
                })
            end
            local v67 = u7.createElement(u9, {
                ["Page"] = u10.Page + v22,
                ["CurrentPage"] = u10.Page,
                ["SetPage"] = v17
            })
            table.insert(v23, v67)
        end
    end)
}