local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.GamepadAction
local u5 = v2.ScaleComponent
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent, "engineer-camera-exit").EngineerCameraExit
local u16 = v1.import(script, script.Parent, "engineer-camera-switch").EngineerCameraSwitch
local u17 = v1.import(script, script.Parent, "engineer-crosshair").EngineerCrosshair
local u18 = v1.import(script, script.Parent, "engineer-film-effect").EngineerFilmEffect
local u19 = u10.Component:extend("EngineerCameraView")
function u19.init(p20, _) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u12
        [4] = u8
        [5] = u13
    --]]
    p20.filmTransparencyMotor = u9.SingleMotor.new(0.9)
    local v21, v22 = u10.createBinding(0.9)
    p20.filmTransparency = v21
    p20.setFilmTransparency = v22
    p20.filmTransparencyMotor:onStep(p20.setFilmTransparency)
    u12:dispatch({
        ["type"] = "SetSpectatedTurret",
        ["selectedTurret"] = u8.Controllers.TurretController:getBackTurret(u13.VULCAN_TURRET)
    })
end
function u19.render(p23) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u18
        [3] = u17
        [4] = u3
        [5] = u7
        [6] = u16
        [7] = u8
        [8] = u13
        [9] = u12
        [10] = u4
        [11] = u15
    --]]
    return u10.createFragment({ u10.createElement(u18, {
            ["transparency"] = p23.filmTransparency
        }), u10.createElement(u17), u10.createElement(u3, {
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, u7:getActionBarPosition().Y.Scale),
            ["Size"] = UDim2.fromOffset(350, 100)
        }, { u10.createElement(u16, {
                ["imageId"] = "http://www.roblox.com/asset/?id=7255895763",
                ["inputDisplay"] = "A",
                ["anchorPoint"] = Vector2.new(0, 0.5),
                ["position"] = UDim2.fromScale(0, 0.5),
                ["textShift"] = UDim2.fromScale(0.2, 0),
                ["iconShift"] = UDim2.fromScale(-0.2, 0),
                ["clicked"] = function() --[[ Name: clicked, Line 49 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u13
                        [3] = u12
                    --]]
                    u12:dispatch({
                        ["type"] = "SetSpectatedTurret",
                        ["selectedTurret"] = u8.Controllers.TurretController:getBackTurret(u13.VULCAN_TURRET)
                    })
                end,
                ["inputTypes"] = { Enum.KeyCode.A, u4.HotbarLeft }
            }), u10.createElement(u15, {
                ["inputDisplay"] = "X",
                ["activated"] = function() --[[ Name: activated, Line 60 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8.Controllers.EngineerTabletController:closeTurretCameraView()
                end,
                ["inputTypes"] = { Enum.KeyCode.X, u4.Interact }
            }), u10.createElement(u16, {
                ["imageId"] = "http://www.roblox.com/asset/?id=7255896830",
                ["inputDisplay"] = "D",
                ["anchorPoint"] = Vector2.new(1, 0.5),
                ["position"] = UDim2.fromScale(1, 0.5),
                ["textShift"] = UDim2.fromScale(-0.2, 0),
                ["iconShift"] = UDim2.fromScale(0.2, 0),
                ["clicked"] = function() --[[ Name: clicked, Line 72 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u13
                        [3] = u12
                    --]]
                    u12:dispatch({
                        ["type"] = "SetSpectatedTurret",
                        ["selectedTurret"] = u8.Controllers.TurretController:getNextTurret(u13.VULCAN_TURRET)
                    })
                end,
                ["inputTypes"] = { Enum.KeyCode.D, u4.HotbarRight }
            }) }) })
end
function u19.didMount(_) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.MouseIconEnabled = false
end
function u19.willUnmount(_) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
    --]]
    u12:dispatch({
        ["type"] = "SetSpectatedTurret",
        ["selectedTurret"] = nil
    })
    u11.MouseIconEnabled = true
end
function u19.willUpdate(u24, p25) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u9
    --]]
    if p25.store.Game.selectedTurret ~= u24.props.store.Game.selectedTurret then
        u6:playSound(u14.TV_STATIC)
        u24.filmTransparencyMotor:setGoal(u9.Spring.new(0, {
            ["frequency"] = 8,
            ["dampingRatio"] = 0.75
        }))
        task.delay(0.2, function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u9
            --]]
            u24.filmTransparencyMotor:setGoal(u9.Spring.new(0.9, {
                ["frequency"] = 4,
                ["dampingRatio"] = 0.8
            }))
        end)
    end
end
return {
    ["EngineerCameraViewWrapper"] = function(p26) --[[ Name: EngineerCameraViewWrapper, Line 111 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
            [3] = u19
        --]]
        return u10.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 5,
            ["IgnoreGuiInset"] = true
        }, { u10.createElement(u5, {
                ["MaximumSize"] = Vector2.new(200, 100)
            }), u10.createElement(u19, {
                ["store"] = p26.store
            }) })
    end,
    ["EngineerCameraView"] = u19
}