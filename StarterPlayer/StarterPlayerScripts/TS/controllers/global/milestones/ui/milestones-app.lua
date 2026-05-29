local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.ScaleComponent
local u7 = v3.SlideIn
local u8 = v3.WidgetComponent
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, script.Parent, "milestones-progress").MilestonesProgress
local u14 = v1.import(script, script.Parent, "milestones-rewards-container").MilestonesRewardsContainer
local v18 = v10.new(u9)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u5
        [4] = u4
        [5] = u7
        [6] = u12
        [7] = u6
        [8] = u8
        [9] = u14
        [10] = u13
    --]]
    local _ = p16.useState
    local function u17() --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u15.AppId)
    end
    return u9.createElement("ScreenGui", {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = not u5.isSmallScreen()
    }, { u9.createElement(u4, {
            ["AppId"] = u15.AppId
        }), u9.createElement(u7, {}, { u9.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = u12.widgetSize
            }, { u9.createElement(u6, {
                    ["MaximumSize"] = u12.widgetScaleComponentMaxSize,
                    ["ScreenPadding"] = u12.widgetScaleComponentScreenPadding
                }), u9.createElement(u8, {
                    ["Title"] = "Milestones",
                    ["AppId"] = u15.AppId,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["OnClose"] = function() --[[ Name: OnClose, Line 46 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                        --]]
                        return u17()
                    end
                }, { u9.createElement("ScrollingFrame", {
                        ["ScrollBarThickness"] = 6,
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["Selectable"] = false,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AutomaticSize"] = Enum.AutomaticSize.Y,
                        ["AutomaticCanvasSize"] = Enum.AutomaticSize.XY,
                        ["ScrollingDirection"] = Enum.ScrollingDirection.X
                    }, { u9.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Vertical,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["Padding"] = UDim.new(0, 10)
                        }), u9.createElement(u14, {
                            ["LayoutOrder"] = 1,
                            ["store"] = u15.store,
                            ["Size"] = UDim2.fromScale(1, 0.7)
                        }), u9.createElement(u13, {
                            ["LayoutOrder"] = 2,
                            ["store"] = u15.store,
                            ["Size"] = UDim2.fromScale(1, 0.1)
                        }) }) }) }) }) })
end)
return {
    ["MilestonesApp"] = v11.connect(function(p19, p20) --[[ Line: 84 ]]
        local v21 = {}
        for v22, v23 in p20 do
            v21[v22] = v23
        end
        v21.store = p19
        return v21
    end)(v18)
}