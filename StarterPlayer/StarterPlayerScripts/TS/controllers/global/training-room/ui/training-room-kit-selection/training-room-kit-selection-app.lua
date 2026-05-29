local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.EmptyButton
local u9 = v3.SlideIn
local u10 = v3.SoundManager
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = u1.import(script, script.Parent, "training-room-kit-list").TrainingRoomKitList
local u16 = u1.import(script, script.Parent, "training-room-kit-selection-right-container").TrainingRoomKitSelectionRight
local v17 = u11.Component:extend("TrainingRoomKitSelectionAppBase")
function v17.init(p18, _) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    p18.alive = true
    p18:setState({
        ["selectedBundle"] = u11.None
    })
end
function v17.didMount(u19) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u13
        [4] = u1
        [5] = u2
    --]]
    u10:playSound(u14.UI_OPEN)
    local v20 = u13.LocalPlayer
    if v20 ~= nil then
        v20 = v20.Character
    end
    if v20 then
        local u21 = u13.LocalPlayer.Character:GetPivot().Position
        u1.Promise.defer(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u13
                [3] = u21
                [4] = u2
            --]]
            while true do
                local v22 = task.wait(0.2)
                if v22 ~= 0 and (v22 == v22 and v22) then
                    v22 = u19.alive
                end
                if v22 == 0 or (v22 ~= v22 or not v22) then
                    return
                end
                local v23 = u13.LocalPlayer.Character
                if v23 ~= nil then
                    v23 = v23:GetPivot().Position
                end
                if v23 == nil then
                    v23 = Vector3.new()
                end
                if (v23 - u21).Magnitude > 6 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.props.AppId)
                end
            end
        end)
    end
end
function v17.render(u24) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u5
        [4] = u9
        [5] = u8
        [6] = u7
        [7] = u4
        [8] = u15
        [9] = u16
    --]]
    return u11.createElement("ScreenGui", {
        ["DisplayOrder"] = 1500,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }, { u11.createElement(u5, {
            ["AppId"] = u24.props.AppId
        }), u11.createElement(u9, {}, { u11.createElement(u8, {
                ["Modal"] = true,
                ["Size"] = UDim2.fromScale(u6.isSmallScreen() and 0.85 or 0.75, u6.isSmallScreen() and 0.85 or 0.75),
                ["Position"] = UDim2.fromScale(0.5, u6.isSmallScreen() and 0.02 or 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }, { u11.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1.6386036960985626
                }), u11.createElement(u7, {
                    ["Size"] = UDim2.fromScale(0.73, 1)
                }, { u11.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical"
                    }), u11.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 0.09),
                        ["BackgroundColor3"] = u4.hexColor(3092550)
                    }, { u11.createElement("TextLabel", {
                            ["Text"] = "<b>Choose Any Kit!</b>",
                            ["BackgroundTransparency"] = 1,
                            ["BorderSizePixel"] = 0,
                            ["Font"] = "Roboto",
                            ["TextScaled"] = true,
                            ["RichText"] = true,
                            ["TextXAlignment"] = "Left",
                            ["Size"] = UDim2.fromScale(0.3, 0.5),
                            ["Position"] = UDim2.fromScale(0.03, 0.5),
                            ["AnchorPoint"] = Vector2.new(0, 0.5),
                            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                        }) }), u11.createElement(u15, {
                        ["Size"] = UDim2.fromScale(1, 0.91),
                        ["store"] = u24.props.store,
                        ["SelectedKit"] = u24.state.selectedKit,
                        ["SetSelectedKit"] = function(p25) --[[ Name: SetSelectedKit, Line 108 ]]
                            --[[
                            Upvalues:
                                [1] = u24
                                [2] = u11
                            --]]
                            u24:setState({
                                ["selectedKit"] = p25 or u11.None,
                                ["selectedBundle"] = u11.None
                            })
                        end
                    }) }), u11.createElement(u16, {
                    ["SelectedKit"] = u24.state.selectedKit,
                    ["SelectedBundle"] = u24.state.selectedBundle,
                    ["Size"] = UDim2.fromScale(0.27, 1),
                    ["Position"] = UDim2.fromScale(0.73, 0),
                    ["store"] = u24.props.store
                }) }) }) })
end
function v17.willUnmount(p26) --[[ Line: 127 ]]
    p26.alive = false
end
return {
    ["TrainingRoomKitSelectionApp"] = v12.connect(function(p27, p28) --[[ Line: 131 ]]
        local v29 = {
            ["store"] = p27
        }
        for v30, v31 in p28 do
            v29[v30] = v31
        end
        return v29
    end)(v17)
}