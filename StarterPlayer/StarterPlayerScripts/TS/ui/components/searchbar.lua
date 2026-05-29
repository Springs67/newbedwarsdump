local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["Searchbar"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u10
            [4] = u5
            [5] = u4
            [6] = u9
            [7] = u3
        --]]
        local _ = p12.useState
        local v13 = p12.useEffect
        local v14 = {}
        for v15, v16 in u11 do
            v14[v15] = v16
        end
        local v17 = v14.MaxCharLength
        local u18 = v17 == nil and 50 or v17
        local u19 = u7.createRef()
        local function v23(p20) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u11
            --]]
            if u18 < #p20.Text then
                local v21 = p20.Text
                p20.Text = string.sub(v21, 0, 50)
                return nil
            end
            local v22 = u11.OnTextChange
            if v22 ~= nil then
                v22(p20.Text)
            end
        end
        v13(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u11
            --]]
            local v24 = u19
            if v24 ~= nil then
                v24 = v24:getValue()
            end
            local v25
            if v24 then
                v25 = u11.InputText
            else
                v25 = v24
            end
            if v25 ~= "" and v25 then
                v24.Text = u11.InputText
            end
        end, { u11.InputText })
        local v26 = {}
        for v27, v28 in u11 do
            v26[v27] = v28
        end
        v26.MaxCharLength = nil
        v26.InputText = nil
        v26.OnTextChange = nil
        v26.OnFocusLost = nil
        v26.PlaceHolderText = nil
        v26.DisplaySearchButton = nil
        v26.HideSearchIcon = nil
        v26.DisableEditing = nil
        v26.BarColor = nil
        v26.BarTransparency = nil
        v26.CornerRadius = nil
        v26[u7.Children] = nil
        local v29
        if u11[u7.Children] then
            v29 = u6.values(u11[u7.Children])
        else
            v29 = nil
        end
        local v30 = {
            ["Size"] = UDim2.new(1, 0, 1, -26)
        }
        local v31
        if u11.DisableEditing then
            v31 = 0.45
        else
            local v32 = u11.BarTransparency
            v31 = v32 == nil and 0 or v32
        end
        v30.BackgroundTransparency = v31
        v30.BorderSizePixel = 0
        v30.BackgroundColor3 = u11.BarColor or u10.backgroundTertiary
        v30.LayoutOrder = 1
        for v33, v34 in v26 do
            v30[v33] = v34
        end
        if v29 ~= nil then
            v29 = nil
            for v35, v36 in v29 do
                local _ = v35 - 1
                if string.lower(v36.component) == "uipadding" == true then
                    v29 = v36
                    break
                end
            end
        end
        local v37 = not v29
        if v37 then
            v37 = u7.createElement(u5, {
                ["Padding"] = {
                    ["Vertical"] = 5,
                    ["Horizontal"] = 8,
                    ["Left"] = u11.HideSearchIcon and 10 or 0
                }
            })
        end
        local v38 = { u7.createElement("UICorner", {
                ["CornerRadius"] = u11.CornerRadius or UDim.new(0.1, 0)
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v39 = #v38
        if v37 then
            v38[v39 + 1] = v37
        end
        local v40 = #v38
        local v41 = not u11.HideSearchIcon
        if v41 then
            v41 = u7.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["ImageTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.8 or 0.6),
                ["Image"] = u9.SEARCH_SOLID
            })
        end
        if v41 then
            v38[v40 + 1] = v41
        end
        local v42 = #v38
        local v43 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.99 - ((u11.DisplaySearchButton and 0.05 or 0) + (u11.HideSearchIcon and 0 or 0.05)), -((u11.DisplaySearchButton and 6 or 0) + (u11.HideSearchIcon and 0 or 6)), 1, 0)
        }
        local v44 = {}
        local v45 = #v44
        local v46 = {
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["Size"] = UDim2.fromScale(1, 0.7),
            ["Text"] = "",
            ["PlaceholderText"] = u11.PlaceHolderText,
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v47
        if u11.DisableEditing then
            v47 = Color3.fromRGB(89, 92, 117)
        else
            v47 = Color3.fromRGB(107, 110, 136)
        end
        v46.PlaceholderColor3 = v47
        v46.TextTransparency = u11.DisableEditing and 0.4 or 0
        v46.TextScaled = true
        v46.Font = Enum.Font.Roboto
        v46.ClearTextOnFocus = false
        v46[u7.Ref] = u19
        v46.AutoLocalize = false
        v46[u7.Change.Text] = v23
        v46[u7.Event.FocusLost] = function(p48, p49, p50) --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            local v51 = u11.OnFocusLost
            if v51 ~= nil then
                v51(p48.Text, p49, p50)
            end
        end
        v46.TextEditable = not u11.DisableEditing
        v46.Selectable = not u11.DisableEditing
        local v52 = {}
        local v53 = #v52
        local v54 = {}
        local v55 = u11.MaxTextSize
        if v55 == nil then
            v55 = nil
        end
        v54.MaxTextSize = v55
        v52[v53 + 1] = u7.createElement("UITextSizeConstraint", v54)
        v44[v45 + 1] = u7.createElement("TextBox", v46, v52)
        v38.SearchInput = u7.createElement("Frame", v43, v44)
        local v56 = u11.DisplaySearchButton
        if v56 then
            local v59 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundColor3"] = Color3.fromRGB(72, 168, 120),
                ["BorderSizePixel"] = 1,
                ["LayoutOrder"] = 3,
                [u7.Event.Activated] = function() --[[ Line: 196 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u11
                    --]]
                    local v57 = u19
                    if v57 ~= nil then
                        v57 = v57:getValue()
                        if v57 ~= nil then
                            v57 = v57.Text
                        end
                    end
                    if v57 ~= nil then
                        local v58 = u11.OnFocusLost
                        if v58 ~= nil then
                            v58(v57, true)
                        end
                    end
                end
            }
            local v60 = { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) }
            local _ = #v60
            local v61 = {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v62 = u11.CustomSearchIcon
            if v62 == nil then
                v62 = u9.SEARCH_SOLID
            end
            v61.Image = v62
            v61.ImageColor3 = Color3.fromRGB(95, 224, 159)
            v61.BackgroundTransparency = 1
            v60.SearchIcon = u7.createElement("ImageLabel", v61)
            v56 = u7.createFragment({
                ["SearchButton"] = u7.createElement("ImageButton", v59, v60)
            })
        end
        if v56 then
            v38[v42 + 1] = v56
        end
        local v63 = #v38
        local v64 = u11[u7.Children]
        if v64 then
            for v65, v66 in v64 do
                if type(v65) == "number" then
                    v38[v63 + v65] = v66
                else
                    v38[v65] = v66
                end
            end
        end
        return u7.createFragment({
            ["Searchbar"] = u7.createElement("Frame", v30, v38)
        })
    end)
}