-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local GamepadAction = v1.GamepadAction;
local ScaleComponent = v1.ScaleComponent;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EngineerCameraExit = RuntimeLib.import(script, script.Parent, "engineer-camera-exit").EngineerCameraExit;
local EngineerCameraSwitch = RuntimeLib.import(script, script.Parent, "engineer-camera-switch").EngineerCameraSwitch;
local EngineerCrosshair = RuntimeLib.import(script, script.Parent, "engineer-crosshair").EngineerCrosshair;
local EngineerFilmEffect = RuntimeLib.import(script, script.Parent, "engineer-film-effect").EngineerFilmEffect;
local u4 = u3.Component:extend("EngineerCameraView");

function u4.init(p5, p6) -- Line: 23
    -- upvalues: u2 (copy), u3 (copy), ClientStore (copy), KnitClient (copy), TurretId (copy)
    p5.filmTransparencyMotor = u2.SingleMotor.new(0.9);
    local v7, v8 = u3.createBinding(0.9);
    p5.filmTransparency = v7;
    p5.setFilmTransparency = v8;
    p5.filmTransparencyMotor:onStep(p5.setFilmTransparency);
    ClientStore:dispatch({
        type = "SetSpectatedTurret",
        selectedTurret = KnitClient.Controllers.TurretController:getBackTurret(TurretId.VULCAN_TURRET)
    });
end;

function u4.render(p9) -- Line: 32
    -- upvalues: u3 (copy), EngineerFilmEffect (copy), EngineerCrosshair (copy), Empty (copy), UIUtil (copy), EngineerCameraSwitch (copy), KnitClient (copy), TurretId (copy), ClientStore (copy), GamepadAction (copy), EngineerCameraExit (copy)
    return u3.createFragment({ u3.createElement(EngineerFilmEffect, {
            transparency = p9.filmTransparency
        }), u3.createElement(EngineerCrosshair), u3.createElement(Empty, {
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, UIUtil:getActionBarPosition().Y.Scale),
            Size = UDim2.fromOffset(350, 100)
        }, { u3.createElement(EngineerCameraSwitch, {
                imageId = "http://www.roblox.com/asset/?id=7255895763",
                inputDisplay = "A",
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.fromScale(0, 0.5),
                textShift = UDim2.fromScale(0.2, 0),
                iconShift = UDim2.fromScale(-0.2, 0),

                clicked = function() -- Line: 49, Name: clicked
                    -- upvalues: KnitClient (ref), TurretId (ref), ClientStore (ref)
                    ClientStore:dispatch({
                        type = "SetSpectatedTurret",
                        selectedTurret = KnitClient.Controllers.TurretController:getBackTurret(TurretId.VULCAN_TURRET)
                    });
                end,

                inputTypes = { Enum.KeyCode.A, GamepadAction.HotbarLeft }
            }), u3.createElement(EngineerCameraExit, {
                inputDisplay = "X",

                activated = function() -- Line: 60, Name: activated
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.EngineerTabletController:closeTurretCameraView();
                end,

                inputTypes = { Enum.KeyCode.X, GamepadAction.Interact }
            }), u3.createElement(EngineerCameraSwitch, {
                imageId = "http://www.roblox.com/asset/?id=7255896830",
                inputDisplay = "D",
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.fromScale(1, 0.5),
                textShift = UDim2.fromScale(-0.2, 0),
                iconShift = UDim2.fromScale(0.2, 0),

                clicked = function() -- Line: 72, Name: clicked
                    -- upvalues: KnitClient (ref), TurretId (ref), ClientStore (ref)
                    ClientStore:dispatch({
                        type = "SetSpectatedTurret",
                        selectedTurret = KnitClient.Controllers.TurretController:getNextTurret(TurretId.VULCAN_TURRET)
                    });
                end,

                inputTypes = { Enum.KeyCode.D, GamepadAction.HotbarRight }
            }) }) });
end;

function u4.didMount(p10) -- Line: 85
    -- upvalues: UserInputService (copy)
    UserInputService.MouseIconEnabled = false;
end;

function u4.willUnmount(p11) -- Line: 88
    -- upvalues: ClientStore (copy), UserInputService (copy)
    ClientStore:dispatch({
        type = "SetSpectatedTurret",
        selectedTurret = nil
    });
    UserInputService.MouseIconEnabled = true;
end;

function u4.willUpdate(u12, p13) -- Line: 95
    -- upvalues: SoundManager (copy), GameSound (copy), u2 (copy)
    if p13.store.Game.selectedTurret ~= u12.props.store.Game.selectedTurret then
        SoundManager:playSound(GameSound.TV_STATIC);
        u12.filmTransparencyMotor:setGoal(u2.Spring.new(0, {
            frequency = 8,
            dampingRatio = 0.75
        }));
        task.delay(0.2, function() -- Line: 102
            -- upvalues: u12 (copy), u2 (ref)
            u12.filmTransparencyMotor:setGoal(u2.Spring.new(0.9, {
                frequency = 4,
                dampingRatio = 0.8
            }));
        end);
    end;
end;

return {
    EngineerCameraViewWrapper = function(p14) -- Line: 111, Name: EngineerCameraViewWrapper
        -- upvalues: u3 (copy), ScaleComponent (copy), u4 (ref)
        return u3.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 5,
            IgnoreGuiInset = true
        }, { u3.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(200, 100)
            }), u3.createElement(u4, {
                store = p14.store
            }) });
    end,

    EngineerCameraView = u4
};