local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ScaleComponent
local u6 = v3.SoundManager
local u7 = v3.WidgetComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "training-room", "training-room-commands-meta").TrainingRoomCommandsMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v52 = v10.new(u9)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u8
        [4] = u12
        [5] = u9
        [6] = u4
        [7] = u5
        [8] = u2
        [9] = u14
        [10] = u7
    --]]
    local _ = p16.useState
    p16.useEffect(function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
        --]]
        u6:playSound(u13.UI_OPEN_2)
        return function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
            --]]
            u6:playSound(u13.UI_CLOSE_2)
        end
    end, {})
    local u17 = {}
    local v18 = u8.values(u12)
    local function v22(p19, _) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u9
            [3] = u4
        --]]
        local v20 = u17
        local v21 = u9.createElement(u4, {
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.65, 0.085),
            ["Text"] = p19.commandName,
            ["TextColor3"] = Color3.fromRGB(242, 242, 242),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Font"] = Enum.Font.FredokaOne,
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        })
        table.insert(v20, v21)
    end
    for v23, v24 in v18 do
        v22(v24, v23 - 1, v18)
    end
    local u25 = {}
    local v26 = u8.values(u12)
    local function v30(p27, _) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u9
            [3] = u4
        --]]
        local v28 = u25
        local v29 = u9.createElement(u4, {
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.65, 0.085),
            ["Text"] = p27.commandDescription,
            ["TextColor3"] = Color3.fromRGB(242, 242, 242),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Font"] = Enum.Font.FredokaOne,
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        })
        table.insert(v28, v29)
    end
    for v31, v32 in v26 do
        v30(v32, v31 - 1, v26)
    end
    local v33 = {}
    local v34 = #v33
    local v35 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(750, 350)
    }
    local v36 = { u9.createElement(u5, {
            ["MaximumSize"] = Vector2.new(1050, 489.99999999999994),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }) }
    local v37 = #v36
    local v38 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "Commands Panel               NOTE: Most custom match commands work here too",
        ["AppId"] = u15.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 93 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u15
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u15.AppId)
        end,
        ["ContentUIPadding"] = u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 0),
            ["PaddingRight"] = UDim.new(0, 0)
        })
    }
    local v39 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder"
        }) }
    local v40 = #v39
    local v41 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.2, 1),
        ["BackgroundColor3"] = u14.backgroundTertiary
    }
    local v42 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 20)
        }), u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 15)
        }) }
    local v43 = #v42
    local v44 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 1001
    }
    for v45, v46 in u17 do
        v42[v43 + v45] = v46
    end
    v39[v40 + 1] = u9.createElement("Frame", v41, v42)
    local v47 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(0.8, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = u14.backgroundSecondary
    }
    local v48 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 20)
        }), u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 15)
        }) }
    local v49 = #v48
    for v50, v51 in u25 do
        v48[v49 + v50] = v51
    end
    v39[v40 + 2] = u9.createElement("Frame", v47, v48)
    v36[v37 + 1] = u9.createElement(u7, v38, v39)
    v33[v34 + 1] = u9.createElement("Frame", v35, v36)
    return u9.createFragment({
        ["TrainingRoomCommandsGui"] = u9.createElement("ScreenGui", v44, v33)
    })
end)
return {
    ["TrainingRoomCommandsList"] = v11.connect(function(_, p53) --[[ Line: 163 ]]
        local v54 = {}
        for v55, v56 in p53 do
            v54[v55] = v56
        end
        return v54
    end)(v52)
}