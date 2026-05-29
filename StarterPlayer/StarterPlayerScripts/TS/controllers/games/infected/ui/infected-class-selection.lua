local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.ScaleComponent
local u9 = v3.SlideIn
local u10 = v3.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-meta").InfectedVariantMeta
local u17 = v1.import(script, script.Parent, "infected-class-select-button").InfectedClassSelectButton
local v44 = v13.new(u12)(function(u18, p19) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u5
        [4] = u15
        [5] = u8
        [6] = u2
        [7] = u4
        [8] = u11
        [9] = u16
        [10] = u17
        [11] = u7
        [12] = u10
        [13] = u9
    --]]
    local _ = p19.useState
    local v20 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v21 = { u12.createElement(u5, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = u18.AppId
        }) }
    local v22 = #v21
    local v23 = {}
    local _ = #v23
    local v24 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromOffset(1102, 805),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v25 = {}
    local v26 = #v25
    local v27 = {
        ["MaximumSize"] = Vector2.new(1102, 805)
    }
    local v28 = u15.CurrentCamera.ViewportSize
    local v29 = Vector2.new(1, 0)
    local v30 = Vector2.new(20, 20)
    v27.ScreenPadding = v28 * v29 / 2 + v30
    v25[v26 + 1] = u12.createElement(u8, v27)
    local v31 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "Class Selection",
        ["AppId"] = u18.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 59 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u18
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u18.AppId)
        end,
        ["ContentUIPadding"] = u12.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 5),
            ["PaddingRight"] = UDim.new(0, 5)
        })
    }
    local v32 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.01, 0),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }),
        ["Title"] = u12.createElement("TextLabel", {
            ["Text"] = "Select a Variant",
            ["TextScaled"] = true,
            ["TextYAlignment"] = "Center",
            ["TextStrokeTransparency"] = 1,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.1),
            ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            ["TextColor3"] = u4.WHITE
        })
    }
    local _ = #v32
    local v33 = u11.entries(u16)
    local v34 = table.create(#v33)
    for v35, v36 in v33 do
        local v37 = v35 - 1
        local v38 = {
            ["VariantType"] = v36[1],
            ["Metadata"] = v36[2],
            ["LayoutOrder"] = v37
        }
        v34[v35] = u12.createElement(u17, v38)
    end
    local v39 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.8)
    }
    local v40 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v41 = #v40
    for v42, v43 in v34 do
        v40[v41 + v42] = v43
    end
    v32.SelectionButons = u12.createElement(u7, v39, v40)
    v25[v26 + 2] = u12.createElement(u10, v31, v32)
    v23[u18.AppId] = u12.createElement("Frame", v24, v25)
    v21[v22 + 1] = u12.createElement(u9, {}, v23)
    return u12.createFragment({
        ["InfectedClassSelectionGUI"] = u12.createElement("ScreenGui", v20, v21)
    })
end)
return {
    ["InfectedClassSelection"] = v14.connect(function(_, p45) --[[ Line: 132 ]]
        local v46 = {}
        for v47, v48 in p45 do
            v46[v47] = v48
        end
        return v46
    end)(v44)
}