local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-tags").MapBrowserTags
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["MapBrowserTagsGrid"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u7
            [4] = u3
            [5] = u11
            [6] = u10
            [7] = u5
            [8] = u4
        --]]
        local v14 = p13.useState
        local u15, u16 = v14(u12.DefaultTags or {})
        local u17, u18 = v14(false)
        local v19 = {
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 100,
            ["Size"] = UDim2.new(1, 0, 0.35, 0)
        }
        local v20 = u12.FrameProps
        if v20 then
            for v21, v22 in v20 do
                v19[v21] = v22
            end
        end
        local v23 = u6.values(u9)
        table.sort(v23, function(p24, p25) --[[ Line: 29 ]]
            return p24 < p25
        end)
        local function v48(u26, p27) --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u7
                [3] = u3
                [4] = u11
                [5] = u16
                [6] = u12
                [7] = u10
                [8] = u5
            --]]
            local u28 = table.find(u15, u26) ~= nil
            local v29 = u7.createFragment
            local v30 = {}
            local v31 = u7.createElement
            local v32 = "TextButton"
            local v33 = {
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = "X",
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = string.upper(u26),
                ["TextSize"] = 9,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
            }
            local v34
            if u28 then
                v34 = u11.mcGold
            else
                v34 = u3.BLACK
            end
            v33.BackgroundColor3 = v34
            v33.BackgroundTransparency = 0.3
            v33.BorderSizePixel = 0
            v33[u7.Event.MouseEnter] = function(_) --[[ Line: 49 ]] end
            v33[u7.Event.MouseLeave] = function(_) --[[ Line: 50 ]] end
            v33[u7.Event.Activated] = function(_) --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u26
                    [3] = u15
                    [4] = u16
                    [5] = u12
                    [6] = u10
                --]]
                if not u28 then
                    local v35 = #u15
                    local v36 = u12.MaxTags
                    if v36 == nil then
                        v36 = u10.MAP_MAX_TAGS
                    end
                    if v36 <= v35 then
                        return nil
                    end
                    local v37 = {}
                    local v38 = #v37
                    local v39 = #u15
                    table.move(u15, 1, v39, v38 + 1, v37)
                    v37[v38 + v39 + 1] = u26
                    u16(v37)
                    local v40 = u12
                    local v41 = u26
                    local v42 = {}
                    local v43 = #v42
                    local v44 = #u15
                    table.move(u15, 1, v44, v43 + 1, v42)
                    v42[v43 + v44 + 1] = u26
                    v40.OnChange(v41, true, v42)
                    return
                end
                local v45 = -1
                for v46, v47 in u15 do
                    local _ = v46 - 1
                    if v47 == u26 == true then
                        v45 = v46 - 1
                        break
                    end
                end
                table.remove(u15, v45 + 1)
                u16(u15)
                u12.OnChange(u26, false, u15)
            end
            v33.LayoutOrder = p27
            v30.TagPill = v31(v32, v33, { u7.createElement(u5, {
                    ["Padding"] = {
                        ["Horizontal"] = 8,
                        ["Vertical"] = 4
                    }
                }), u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) })
            return v29(v30)
        end
        local v49 = table.create(#v23)
        for v50, v51 in v23 do
            v49[v50] = v48(v51, v50 - 1, v23)
        end
        local v52 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v53 = #v52
        for v54, v55 in v49 do
            v52[v53 + v54] = v55
        end
        local v56 = #v52
        local v57 = u12.Featured
        if v57 then
            local v58 = u7.createFragment
            local v59 = {}
            local v60 = u7.createElement
            local v61 = "TextButton"
            local v62 = {
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = "X",
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = "\226\173\144 FEATURED",
                ["TextSize"] = 9,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
            }
            local v63
            if u17 then
                v63 = u11.mcGold
            else
                v63 = u3.BLACK
            end
            v62.BackgroundColor3 = v63
            v62.BackgroundTransparency = 0.3
            v62.BorderSizePixel = 0
            v62[u7.Event.Activated] = function(_) --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u18
                    [3] = u12
                --]]
                if u17 then
                    u18(false)
                    if u12.OnSelectFeatured then
                        u12.OnSelectFeatured(false)
                        return
                    end
                else
                    u18(true)
                    if u12.OnSelectFeatured then
                        u12.OnSelectFeatured(true)
                    end
                end
            end
            v62.LayoutOrder = #u6.values(u9) + 1
            v59.FeaturedTagPill = v60(v61, v62, { u7.createElement(u5, {
                    ["Padding"] = {
                        ["Horizontal"] = 8,
                        ["Vertical"] = 4
                    }
                }), u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) })
            v57 = v58(v59)
        end
        if v57 then
            v52[v56 + 1] = v57
        end
        return u7.createFragment({
            ["TagsContainer"] = u7.createElement(u4, v19, v52)
        })
    end)
}