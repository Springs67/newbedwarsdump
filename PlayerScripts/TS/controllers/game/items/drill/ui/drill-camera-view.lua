-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local EngineerCameraSwitch = RuntimeLib.import(script, script.Parent, "drill-camera-switch").EngineerCameraSwitch;
local u4 = u3.Component:extend("DrillCameraView");

function u4.init(p5, p6) -- Line: 15
    -- upvalues: u2 (copy)
    p5.filmTransparencyMotor = u2.SingleMotor.new(0.9);
end;

function u4.render(p7) -- Line: 18
    -- upvalues: u3 (copy), Empty (copy), UIUtil (copy), EngineerCameraSwitch (copy), ClientSyncEvents (copy), UserInputService (copy)
    return u3.createFragment({ u3.createElement(Empty, {
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, UIUtil:getActionBarPosition().Y.Scale),
            Size = UDim2.fromOffset(350, 100)
        }, { u3.createElement(EngineerCameraSwitch, {
                imageId = "http://www.roblox.com/asset/?id=7255895763",
                anchorPoint = Vector2.new(0, 0.25),
                position = UDim2.fromScale(0, 0.5),
                textShift = UDim2.fromScale(0.2, 0),
                iconShift = UDim2.fromScale(-0.2, 0),

                clicked = function() -- Line: 31, Name: clicked
                    -- upvalues: ClientSyncEvents (ref)
                    ClientSyncEvents.SwitchDrill:fire(-1);
                end,

                inputDisplay = #UserInputService:GetConnectedGamepads() == 0 and "A" or "",
                inputTypes = { Enum.KeyCode.A, Enum.KeyCode.DPadLeft }
            }), u3.createElement(EngineerCameraSwitch, {
                imageId = "http://www.roblox.com/asset/?id=7255896830",
                anchorPoint = Vector2.new(1, 0.25),
                position = UDim2.fromScale(1, 0.5),
                textShift = UDim2.fromScale(-0.2, 0),
                iconShift = UDim2.fromScale(0.2, 0),

                clicked = function() -- Line: 43, Name: clicked
                    -- upvalues: ClientSyncEvents (ref)
                    ClientSyncEvents.SwitchDrill:fire(1);
                end,

                inputDisplay = #UserInputService:GetConnectedGamepads() == 0 and "D" or "",
                inputTypes = { Enum.KeyCode.D, Enum.KeyCode.DPadRight }
            }) }) });
end;

return {
    DrillCameraViewWrapper = function(p8) -- Line: 53, Name: DrillCameraViewWrapper
        -- upvalues: u3 (copy), ScaleComponent (copy), u4 (ref)
        return u3.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 5,
            IgnoreGuiInset = true
        }, { u3.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(200, 100)
            }), u3.createElement(u4, {
                store = p8.store
            }) });
    end,

    DrillCameraView = u4
};