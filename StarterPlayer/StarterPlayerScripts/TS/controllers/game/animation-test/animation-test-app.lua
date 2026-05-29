local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DarkBackground
local u5 = v2.Empty
local u6 = v2.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v62 = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u12
        [4] = u11
        [5] = u3
        [6] = u10
        [7] = u5
        [8] = u6
    --]]
    local v15 = p14.useState
    local v16 = p14.useEffect
    local v17, u18 = v15({})
    local u19, u20 = v15("")
    local v21 = u7.createRef()
    local u22 = ""
    v16(function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u18
            [3] = u13
        --]]
        if u19 == "" then
            u18(u13.AnimationMap)
        end
    end, {})
    local function v24(p23) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22 = p23.Text
    end
    local v25 = { u7.createElement(u4, {
            ["BackgroundTransparency"] = 1,
            ["AppId"] = u13.AppId,
            ["BackgroundColor"] = u12.backgroundSecondary
        }) }
    local v26 = #v25
    local v27 = {}
    local _ = #v27
    local v28 = {
        ["Size"] = UDim2.fromScale(1, 0.8),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5)
    }
    local v29 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0, 1),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v30 = #v29
    local v31 = {
        ["LayoutOrder"] = 10,
        ["Size"] = UDim2.fromScale(0.3, 0.05)
    }
    local v32 = u13.AnimationMap
    local u33 = u22
    local v34 = {}
    local function u44(p35, _) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local v36 = {}
        if p35 == "" then
            return v36
        end
        local v37 = 0
        local v38 = {}
        for v39, v40 in u13.AnimationMap do
            local _ = v39 - 1
            local v41 = string.lower(v40.Key)
            local v42 = string.lower(p35)
            local v43 = string.find(v41, v42)
            if (v43 ~= 0 and (v43 == v43 and v43) and true or nil) == true then
                v37 = v37 + 1
                v38[v37] = v40
            end
        end
        return v38
    end
    local v45 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }
    for v46 = 1, #v32 do
        local v47 = v32[v46]
        local _ = v46 - 1
        local v48 = {
            ["key"] = v47.Key
        }
        table.insert(v34, v48)
    end
    v31.Items = v34
    v31.InputText = ""
    function v31.OnTextChange(p49, p50) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u18
            [3] = u44
        --]]
        u20(p49)
        u18((u44(p49, p50)))
    end
    v31.PlaceHolderText = "Search Animations"
    v29[v30 + 1] = u7.createElement(u11, v31)
    v29[v30 + 2] = u7.createElement("Frame", {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 20,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.3, 0.05),
        ["BackgroundColor3"] = u12.backgroundPrimary
    }, { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), u7.createElement("TextBox", {
            [u7.Ref] = v21,
            ["RichText"] = true,
            ["ClearTextOnFocus"] = false,
            ["TextEditable"] = true,
            ["Text"] = u33,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["TextSize"] = 12,
            ["BackgroundTransparency"] = 0.5,
            ["BackgroundColor3"] = Color3.fromRGB(83, 83, 83),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["ClipsDescendants"] = true,
            [u7.Change.Text] = v24,
            ["LayoutOrder"] = 1
        }), u7.createElement("TextButton", {
            ["Text"] = "Play",
            ["BackgroundTransparency"] = 0,
            ["BackgroundColor3"] = u12.backgroundPrimary,
            ["Font"] = Enum.Font.Arial,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Size"] = UDim2.fromScale(0.19, 1),
            ["TextSize"] = 16,
            ["LayoutOrder"] = 2,
            ["BorderSizePixel"] = 0,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            [u7.Event.MouseButton1Click] = function() --[[ Line: 156 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u10
                    [3] = u33
                --]]
                u3:playAnimation(u10.LocalPlayer, u33)
            end
        }) })
    local function v53(u51, p52) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u3
            [4] = u10
        --]]
        return u7.createElement("TextButton", {
            ["Text"] = u51.Key,
            ["BackgroundTransparency"] = 0,
            ["BackgroundColor3"] = u12.backgroundPrimary,
            ["Font"] = Enum.Font.Arial,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Size"] = UDim2.fromScale(1, 0.05),
            ["TextSize"] = 18,
            ["LayoutOrder"] = p52,
            ["BorderSizePixel"] = 0,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            [u7.Event.MouseButton1Click] = function() --[[ Line: 176 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u10
                    [3] = u51
                --]]
                u3:playAnimation(u10.LocalPlayer, u51.AssetId, {
                    ["looped"] = false
                })
            end
        })
    end
    local v54 = table.create(#v17)
    for v55, v56 in v17 do
        v54[v55] = v53(v56, v55 - 1, v17)
    end
    local v57 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ScrollBarThickness"] = 4,
        ["ScrollBarImageTransparency"] = 0.3,
        ["LayoutOrder"] = 30,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.3, 1),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
        ["AutomaticCanvasSize"] = Enum.AutomaticSize.XY,
        ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
        ["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255)
    }
    local v58 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0, 1),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v59 = #v58
    for v60, v61 in v54 do
        v58[v59 + v60] = v61
    end
    v29[v30 + 3] = u7.createElement("ScrollingFrame", v57, v58)
    v27.Container = u7.createElement(u5, v28, v29)
    v25[v26 + 1] = u7.createElement(u6, {}, v27)
    return u7.createFragment({
        ["AnimationTestScreenGUI"] = u7.createElement("ScreenGui", v45, v25)
    })
end)
return {
    ["AnimationTestApp"] = v9.connect(function(_, p63) --[[ Line: 224 ]]
        local v64 = {}
        for v65, v66 in p63 do
            v64[v65] = v66
        end
        return v64
    end)(v62)
}