local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.ScaleComponent
local u7 = v3.SlideIn
local u8 = v3.SoundManager
local u9 = v3.WidgetComponent
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent, "settings-core").SettingsCore
local v32 = v11.new(u10)(function(u16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u5
        [4] = u10
        [5] = u4
        [6] = u14
        [7] = u6
        [8] = u2
        [9] = u15
        [10] = u9
        [11] = u7
    --]]
    local _ = p17.useState
    p17.useEffect(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
        --]]
        return function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
            --]]
            u8:playSound(u13.UI_CLOSE_2)
        end
    end, {})
    local v18 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 50,
        ["IgnoreGuiInset"] = not u5.isSmallScreen()
    }
    local v19 = { u10.createElement(u4, {
            ["AppId"] = "SettingsApp"
        }) }
    local v20 = #v19
    local v21 = {}
    local v22 = #v21
    local v23 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = u14.widgetSize
    }
    local v24 = { u10.createElement(u6, {
            ["MaximumSize"] = u14.widgetScaleComponentMaxSize,
            ["ScreenPadding"] = u14.widgetScaleComponentScreenPadding
        }) }
    local v25 = #v24
    local v26 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "Settings",
        ["AppId"] = u16.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 58 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u16
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.AppId)
        end
    }
    local v27 = {}
    local v28 = #v27
    local v29 = {}
    for v30, v31 in u16 do
        v29[v30] = v31
    end
    v27[v28 + 1] = u10.createElement(u15, v29)
    v24[v25 + 1] = u10.createElement(u9, v26, v27)
    v21[v22 + 1] = u10.createElement("Frame", v23, v24)
    v19[v20 + 1] = u10.createElement(u7, {}, v21)
    return u10.createFragment({
        ["SettingsAppGui"] = u10.createElement("ScreenGui", v18, v19)
    })
end)
return {
    ["SettingsApp"] = v12.connect(function(p33, p34) --[[ Line: 77 ]]
        local v35 = {}
        for v36, v37 in p34 do
            v35[v36] = v37
        end
        v35.Settings = p33.Settings
        return v35
    end)(v32)
}