local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.GamepadAction
local u5 = v2.ScaleComponent
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-camera-exit").EngineerCameraExit
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-camera-switch").EngineerCameraSwitch
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-crosshair").EngineerCrosshair
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = u11.Component:extend("VoidTurretView")
function u19.init(p20, _) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u16
        [4] = u8
        [5] = u17
    --]]
    p20.filmTransparencyMotor = u9.SingleMotor.new(0.9)
    p20.filmMaid = u10.new()
    u16:dispatch({
        ["type"] = "SetSpectatedTurret",
        ["selectedTurret"] = u8.Controllers.TurretController:getBackTurret(u17.VOID_TURRET)
    })
end
function u19.render(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
        [3] = u3
        [4] = u7
        [5] = u14
        [6] = u8
        [7] = u17
        [8] = u16
        [9] = u12
        [10] = u13
        [11] = u4
    --]]
    return u11.createFragment({ u11.createElement(u15), u11.createElement(u3, {
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, u7:getActionBarPosition().Y.Scale),
            ["Size"] = UDim2.fromOffset(350, 100)
        }, { u11.createElement(u14, {
                ["imageId"] = "http://www.roblox.com/asset/?id=7255895763",
                ["anchorPoint"] = Vector2.new(0, 0.5),
                ["position"] = UDim2.fromScale(0, 0.5),
                ["textShift"] = UDim2.fromScale(0.2, 0),
                ["iconShift"] = UDim2.fromScale(-0.2, 0),
                ["clicked"] = function() --[[ Name: clicked, Line 45 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u17
                        [3] = u16
                    --]]
                    u16:dispatch({
                        ["type"] = "SetSpectatedTurret",
                        ["selectedTurret"] = u8.Controllers.TurretController:getBackTurret(u17.VOID_TURRET)
                    })
                end,
                ["inputDisplay"] = #u12:GetConnectedGamepads() == 0 and "D" or "",
                ["inputTypes"] = { Enum.KeyCode.A, Enum.KeyCode.DPadLeft }
            }), u11.createElement(u13, {
                ["inputDisplay"] = "X",
                ["activated"] = function() --[[ Name: activated, Line 56 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    u16:dispatch({
                        ["type"] = "InventorySelectHotbarSlot",
                        ["slot"] = 0
                    })
                end,
                ["inputTypes"] = { Enum.KeyCode.X, u4.Interact }
            }), u11.createElement(u14, {
                ["imageId"] = "http://www.roblox.com/asset/?id=7255896830",
                ["anchorPoint"] = Vector2.new(1, 0.5),
                ["position"] = UDim2.fromScale(1, 0.5),
                ["textShift"] = UDim2.fromScale(-0.2, 0),
                ["iconShift"] = UDim2.fromScale(0.2, 0),
                ["clicked"] = function() --[[ Name: clicked, Line 71 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u17
                        [3] = u16
                    --]]
                    u16:dispatch({
                        ["type"] = "SetSpectatedTurret",
                        ["selectedTurret"] = u8.Controllers.TurretController:getNextTurret(u17.VOID_TURRET)
                    })
                end,
                ["inputDisplay"] = #u12:GetConnectedGamepads() == 0 and "D" or "",
                ["inputTypes"] = { Enum.KeyCode.D, Enum.KeyCode.DPadRight }
            }) }) })
end
function u19.didMount(p21) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
    --]]
    u12.MouseIconEnabled = false
    for _, v22 in p21:applyVoidCameraLighting() do
        p21.filmMaid:GiveTask(v22)
    end
    p21.filmMaid:GiveTask(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u12
        --]]
        u16:dispatch({
            ["type"] = "SetSpectatedTurret",
            ["selectedTurret"] = nil
        })
        u12.MouseIconEnabled = true
    end)
end
function u19.willUnmount(p23) --[[ Line: 98 ]]
    p23.filmMaid:DoCleaning()
end
function u19.willUpdate(u24, p25) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u18
        [3] = u9
    --]]
    if p25.store.Game.selectedTurret ~= u24.props.store.Game.selectedTurret then
        u6:playSound(u18.VOID_PORTAL_TELEPORT, {
            ["volumeMultiplier"] = 0.15
        })
        u24.filmTransparencyMotor:setGoal(u9.Spring.new(0, {
            ["frequency"] = 8,
            ["dampingRatio"] = 0.75
        }))
        task.delay(0.2, function() --[[ Line: 110 ]]
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
function u19.applyVoidCameraLighting(_) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v26 = {}
    local v27 = u8.Controllers.LightingController.lightingModifier:addModifier(20, {
        ["Brightness"] = 0,
        ["ClockTime"] = 6.3,
        ["Ambient"] = Color3.fromRGB(0, 0, 0),
        ["OutdoorAmbient"] = Color3.fromRGB(100, 100, 100)
    })
    table.insert(v26, v27)
    local v28 = u8.Controllers.LightingController.atmosphereModifier
    if v28 ~= nil then
        v28 = v28:addModifier(20, {
            ["Density"] = 0.45,
            ["Offset"] = 0,
            ["Glare"] = 0,
            ["Haze"] = 0,
            ["Color"] = Color3.fromRGB(193, 193, 193)
        })
    end
    if v28 then
        table.insert(v26, v28)
    end
    local v29 = u8.Controllers.LightingController.sunRayModifier:addModifier(20, {
        ["Intensity"] = 0.005
    })
    table.insert(v26, v29)
    local v30 = u8.Controllers.LightingController.skyModifier:addModifier(20, {
        ["SkyboxBk"] = "rbxassetid://9851144466",
        ["SkyboxDn"] = "rbxassetid://9851144249",
        ["SkyboxFt"] = "rbxassetid://9851144099",
        ["SkyboxLf"] = "rbxassetid://9851143942",
        ["SkyboxRt"] = "rbxassetid://9851143761",
        ["SkyboxUp"] = "rbxassetid://9851143257",
        ["CelestialBodiesShown"] = false,
        ["StarCount"] = 3000
    })
    table.insert(v26, v30)
    return v26
end
return {
    ["VoidTurretViewWrapper"] = function(p31) --[[ Name: VoidTurretViewWrapper, Line 159 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u19
        --]]
        return u11.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 5,
            ["IgnoreGuiInset"] = true
        }, { u11.createElement(u5, {
                ["MaximumSize"] = Vector2.new(200, 100)
            }), u11.createElement(u19, {
                ["store"] = p31.store
            }) })
    end,
    ["VoidTurretView"] = u19
}