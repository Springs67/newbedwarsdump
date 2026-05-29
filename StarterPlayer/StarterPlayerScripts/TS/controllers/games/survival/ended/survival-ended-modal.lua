local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.DarkBackground
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.GameCoreClientConfig
local u10 = v3.ScaleComponent
local u11 = v3.SlideIn
local u12 = v3.SoundManager
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v37 = v14.new(u13)(function(u18, p19) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u13
        [4] = u6
        [5] = u17
        [6] = u10
        [7] = u8
        [8] = u4
        [9] = u5
        [10] = u12
        [11] = u9
        [12] = u16
        [13] = u11
    --]]
    local v20 = p19.useState
    local _ = p19.useEffect
    local v21, u22 = v20(false)
    local v23 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u7.isSmallScreen()
    }
    local v24 = { u13.createElement(u6, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = u18.AppId
        }) }
    local v25 = #v24
    local v26 = {}
    local v27 = #v26
    local v28 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["Modal"] = true,
        ["AutoButtonColor"] = false,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(142.5, 54.5),
        ["BackgroundColor3"] = u17.backgroundTertiary
    }
    local v29 = { u13.createElement(u10, {
            ["MaximumSize"] = Vector2.new(600, 229.5),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }), u13.createElement(u8, {
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.fromScale(1, 0.75)
        }, { u13.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u13.createElement(u4, {
                ["TextSize"] = 12,
                ["Text"] = "You Survived!",
                ["LayoutOrder"] = 0,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }), u13.createElement(u4, {
                ["TextSize"] = 8,
                ["Text"] = "Click \"Continue\" to play endless mode.",
                ["LayoutOrder"] = 0,
                ["Font"] = Enum.Font.SourceSans,
                ["Limits"] = Vector2.new(300, 60)
            }) }) }
    local v30 = #v29
    local v31 = {
        ["Position"] = UDim2.fromScale(0, 0.75),
        ["Size"] = UDim2.fromScale(1, 0.25)
    }
    local v32 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 5)
        }) }
    local v33 = #v32
    local v34 = not v21
    if v34 then
        v34 = u13.createElement(u5, {
            ["Text"] = "<b>Continue</b>",
            ["LayoutOrder"] = 0,
            ["BackgroundColor3"] = u17.mcGreen,
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 100 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u9
                    [3] = u2
                    [4] = u18
                --]]
                u12:playSound(u9.Sounds.UI_CLICK)
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u18.AppId)
            end
        }, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) })
    end
    if v34 then
        v32[v33 + 1] = v34
    end
    local v35 = #v32 + 1
    local v36
    if v21 then
        v36 = u13.createElement(u4, {
            ["TextSize"] = 8,
            ["Text"] = "Returning to lobby...",
            ["LayoutOrder"] = 1,
            ["Font"] = Enum.Font.SourceSans,
            ["Limits"] = Vector2.new(300, 60)
        })
    else
        v36 = u13.createElement(u5, {
            ["Text"] = "<b>Exit to Lobby</b>",
            ["LayoutOrder"] = 1,
            ["BackgroundColor3"] = u17.mcGreen,
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 119 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u12
                    [3] = u9
                    [4] = u7
                    [5] = u16
                --]]
                u22(true)
                u12:playSound(u9.Sounds.UI_CLICK)
                if not u7.isHoarceKat() then
                    u16.Client:Get("TeleportToLobby"):SendToServer()
                end
            end
        }, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) })
    end
    v32[v35] = v36
    v29[v30 + 1] = u13.createElement(u8, v31, v32)
    v26[v27 + 1] = u13.createElement("ImageButton", v28, v29)
    v24[v25 + 1] = u13.createElement(u11, {}, v26)
    return u13.createElement("ScreenGui", v23, v24)
end)
return {
    ["SurvivalEndedModal"] = v15.connect(function(_, p38) --[[ Line: 145 ]]
        local v39 = {}
        for v40, v41 in p38 do
            v39[v40] = v41
        end
        return v39
    end)(v37)
}