local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.SlideIn
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v54 = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u11
        [4] = u10
        [5] = u6
        [6] = u5
        [7] = u4
    --]]
    local v14 = p13.useState
    local v15 = p13.useEffect
    local v16, u17 = v14({})
    local u18, u19 = v14("")
    v15(function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u17
            [3] = u12
        --]]
        if u18 == "" then
            u17(u12.SoundMap)
        end
    end, {})
    local v20 = { u7.createElement(u3, {
            ["BackgroundTransparency"] = 1,
            ["AppId"] = u12.AppId,
            ["BackgroundColor"] = u11.backgroundSecondary
        }) }
    local v21 = #v20
    local v22 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0, 1),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v23 = #v22
    local v24 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.8, 0.05)
    }
    local v25 = u12.SoundMap
    local v26 = {}
    local function u36(p27, _) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v28 = {}
        if p27 == "" then
            return v28
        end
        local v29 = 0
        local v30 = {}
        for v31, v32 in u12.SoundMap do
            local _ = v31 - 1
            local v33 = string.lower(v32.Key)
            local v34 = string.lower(p27)
            local v35 = string.find(v33, v34)
            if (v35 ~= 0 and (v35 == v35 and v35) and true or nil) == true then
                v29 = v29 + 1
                v30[v29] = v32
            end
        end
        return v30
    end
    local v37 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }
    for v38 = 1, #v25 do
        local v39 = v25[v38]
        local _ = v38 - 1
        local v40 = {
            ["key"] = v39.Key
        }
        table.insert(v26, v40)
    end
    v24.Items = v26
    v24.InputText = ""
    function v24.OnTextChange(p41, p42) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u17
            [3] = u36
        --]]
        u19(p41)
        u17((u36(p41, p42)))
    end
    v24.PlaceHolderText = "Search Sounds"
    v22[v23 + 1] = u7.createElement(u10, v24)
    local function v45(u43, p44) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u6
            [4] = u5
        --]]
        return u7.createElement("TextButton", {
            ["Text"] = u43.Key,
            ["BackgroundTransparency"] = 0,
            ["BackgroundColor3"] = u11.backgroundPrimary,
            ["Font"] = Enum.Font.Arial,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Size"] = UDim2.fromScale(1, 0.05),
            ["TextSize"] = 18,
            ["LayoutOrder"] = p44,
            ["BorderSizePixel"] = 0,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            [u7.Event.MouseButton1Click] = function() --[[ Line: 114 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u43
                --]]
                if u6.Controllers.SoundTestController.playingSound then
                    u6.Controllers.SoundTestController.playingSound:Stop()
                    u6.Controllers.SoundTestController.playingSound:Destroy()
                end
                u6.Controllers.SoundTestController.playingSound = u5:playSound(u43.AssetId)
            end
        })
    end
    local v46 = table.create(#v16)
    for v47, v48 in v16 do
        v46[v47] = v45(v48, v47 - 1, v16)
    end
    local v49 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ScrollBarThickness"] = 4,
        ["ScrollBarImageTransparency"] = 0.3,
        ["LayoutOrder"] = 2,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.8, 1),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
        ["AutomaticCanvasSize"] = Enum.AutomaticSize.XY,
        ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
        ["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255)
    }
    local v50 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0, 1),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v51 = #v50
    for v52, v53 in v46 do
        v50[v51 + v52] = v53
    end
    v22[v23 + 2] = u7.createElement("ScrollingFrame", v49, v50)
    v20[v21 + 1] = u7.createElement(u4, {}, v22)
    return u7.createFragment({
        ["SoundTestScreenGUI"] = u7.createElement("ScreenGui", v37, v20)
    })
end)
return {
    ["SoundTestApp"] = v9.connect(function(_, p55) --[[ Line: 163 ]]
        local v56 = {}
        for v57, v58 in p55 do
            v56[v57] = v58
        end
        return v56
    end)(v54)
}