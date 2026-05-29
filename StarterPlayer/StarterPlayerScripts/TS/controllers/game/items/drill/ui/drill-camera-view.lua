local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.ScaleComponent
local u5 = v2.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent, "drill-camera-switch").EngineerCameraSwitch
local u11 = u7.Component:extend("DrillCameraView")
function u11.init(p12, _) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p12.filmTransparencyMotor = u6.SingleMotor.new(0.9)
end
function u11.render(_) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u5
        [4] = u10
        [5] = u9
        [6] = u8
    --]]
    return u7.createFragment({ u7.createElement(u3, {
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, u5:getActionBarPosition().Y.Scale),
            ["Size"] = UDim2.fromOffset(350, 100)
        }, { u7.createElement(u10, {
                ["imageId"] = "http://www.roblox.com/asset/?id=7255895763",
                ["anchorPoint"] = Vector2.new(0, 0.25),
                ["position"] = UDim2.fromScale(0, 0.5),
                ["textShift"] = UDim2.fromScale(0.2, 0),
                ["iconShift"] = UDim2.fromScale(-0.2, 0),
                ["clicked"] = function() --[[ Name: clicked, Line 31 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    u9.SwitchDrill:fire(-1)
                end,
                ["inputDisplay"] = #u8:GetConnectedGamepads() == 0 and "A" or "",
                ["inputTypes"] = { Enum.KeyCode.A, Enum.KeyCode.DPadLeft }
            }), u7.createElement(u10, {
                ["imageId"] = "http://www.roblox.com/asset/?id=7255896830",
                ["anchorPoint"] = Vector2.new(1, 0.25),
                ["position"] = UDim2.fromScale(1, 0.5),
                ["textShift"] = UDim2.fromScale(-0.2, 0),
                ["iconShift"] = UDim2.fromScale(0.2, 0),
                ["clicked"] = function() --[[ Name: clicked, Line 43 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    u9.SwitchDrill:fire(1)
                end,
                ["inputDisplay"] = #u8:GetConnectedGamepads() == 0 and "D" or "",
                ["inputTypes"] = { Enum.KeyCode.D, Enum.KeyCode.DPadRight }
            }) }) })
end
return {
    ["DrillCameraViewWrapper"] = function(p13) --[[ Name: DrillCameraViewWrapper, Line 53 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u11
        --]]
        return u7.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 5,
            ["IgnoreGuiInset"] = true
        }, { u7.createElement(u4, {
                ["MaximumSize"] = Vector2.new(200, 100)
            }), u7.createElement(u11, {
                ["store"] = p13.store
            }) })
    end,
    ["DrillCameraView"] = u11
}