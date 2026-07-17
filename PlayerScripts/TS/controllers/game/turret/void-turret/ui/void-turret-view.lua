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
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local EngineerCameraExit = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-camera-exit").EngineerCameraExit;
local EngineerCameraSwitch = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-camera-switch").EngineerCameraSwitch;
local EngineerCrosshair = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-crosshair").EngineerCrosshair;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = u4.Component:extend("VoidTurretView");

function u5.init(p6, p7) -- Line: 23
    -- upvalues: u2 (copy), u3 (copy), ClientStore (copy), KnitClient (copy), TurretId (copy)
    p6.filmTransparencyMotor = u2.SingleMotor.new(0.9);
    p6.filmMaid = u3.new();
    ClientStore:dispatch({
        type = "SetSpectatedTurret",
        selectedTurret = KnitClient.Controllers.TurretController:getBackTurret(TurretId.VOID_TURRET)
    });
end;

function u5.render(p8) -- Line: 31
    -- upvalues: u4 (copy), EngineerCrosshair (copy), Empty (copy), UIUtil (copy), EngineerCameraSwitch (copy), KnitClient (copy), TurretId (copy), ClientStore (copy), UserInputService (copy), EngineerCameraExit (copy), GamepadAction (copy)
    return u4.createFragment({ u4.createElement(EngineerCrosshair), u4.createElement(Empty, {
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, UIUtil:getActionBarPosition().Y.Scale),
            Size = UDim2.fromOffset(350, 100)
        }, { u4.createElement(EngineerCameraSwitch, {
                imageId = "http://www.roblox.com/asset/?id=7255895763",
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.fromScale(0, 0.5),
                textShift = UDim2.fromScale(0.2, 0),
                iconShift = UDim2.fromScale(-0.2, 0),

                clicked = function() -- Line: 45, Name: clicked
                    -- upvalues: KnitClient (ref), TurretId (ref), ClientStore (ref)
                    ClientStore:dispatch({
                        type = "SetSpectatedTurret",
                        selectedTurret = KnitClient.Controllers.TurretController:getBackTurret(TurretId.VOID_TURRET)
                    });
                end,

                inputDisplay = #UserInputService:GetConnectedGamepads() == 0 and "D" or "",
                inputTypes = { Enum.KeyCode.A, Enum.KeyCode.DPadLeft }
            }), u4.createElement(EngineerCameraExit, {
                inputDisplay = "X",

                activated = function() -- Line: 56, Name: activated
                    -- upvalues: ClientStore (ref)
                    ClientStore:dispatch({
                        type = "InventorySelectHotbarSlot",
                        slot = 0
                    });
                end,

                inputTypes = { Enum.KeyCode.X, GamepadAction.Interact }
            }), u4.createElement(EngineerCameraSwitch, {
                imageId = "http://www.roblox.com/asset/?id=7255896830",
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.fromScale(1, 0.5),
                textShift = UDim2.fromScale(-0.2, 0),
                iconShift = UDim2.fromScale(0.2, 0),

                clicked = function() -- Line: 71, Name: clicked
                    -- upvalues: KnitClient (ref), TurretId (ref), ClientStore (ref)
                    ClientStore:dispatch({
                        type = "SetSpectatedTurret",
                        selectedTurret = KnitClient.Controllers.TurretController:getNextTurret(TurretId.VOID_TURRET)
                    });
                end,

                inputDisplay = #UserInputService:GetConnectedGamepads() == 0 and "D" or "",
                inputTypes = { Enum.KeyCode.D, Enum.KeyCode.DPadRight }
            }) }) });
end;

function u5.didMount(p9) -- Line: 84
    -- upvalues: UserInputService (copy), ClientStore (copy)
    UserInputService.MouseIconEnabled = false;

    for _, v in p9:applyVoidCameraLighting() do
        p9.filmMaid:GiveTask(v);
    end;

    p9.filmMaid:GiveTask(function() -- Line: 90
        -- upvalues: ClientStore (ref), UserInputService (ref)
        ClientStore:dispatch({
            type = "SetSpectatedTurret",
            selectedTurret = nil
        });
        UserInputService.MouseIconEnabled = true;
    end);
end;

function u5.willUnmount(p10) -- Line: 98
    p10.filmMaid:DoCleaning();
end;

function u5.willUpdate(u11, p12) -- Line: 101
    -- upvalues: SoundManager (copy), GameSound (copy), u2 (copy)
    if p12.store.Game.selectedTurret ~= u11.props.store.Game.selectedTurret then
        SoundManager:playSound(GameSound.VOID_PORTAL_TELEPORT, {
            volumeMultiplier = 0.15
        });
        u11.filmTransparencyMotor:setGoal(u2.Spring.new(0, {
            frequency = 8,
            dampingRatio = 0.75
        }));
        task.delay(0.2, function() -- Line: 110
            -- upvalues: u11 (copy), u2 (ref)
            u11.filmTransparencyMotor:setGoal(u2.Spring.new(0.9, {
                frequency = 4,
                dampingRatio = 0.8
            }));
        end);
    end;
end;

function u5.applyVoidCameraLighting(p13) -- Line: 118
    -- upvalues: KnitClient (copy)
    local v14 = {};
    local v15 = KnitClient.Controllers.LightingController.lightingModifier:addModifier(20, {
        Brightness = 0,
        ClockTime = 6.3,
        Ambient = Color3.fromRGB(0, 0, 0),
        OutdoorAmbient = Color3.fromRGB(100, 100, 100)
    });
    table.insert(v14, v15);
    local atmosphereModifier = KnitClient.Controllers.LightingController.atmosphereModifier;

    if atmosphereModifier ~= nil then
        atmosphereModifier = atmosphereModifier:addModifier(20, {
            Density = 0.45,
            Offset = 0,
            Glare = 0,
            Haze = 0,
            Color = Color3.fromRGB(193, 193, 193)
        });
    end;

    if atmosphereModifier then
        table.insert(v14, atmosphereModifier);
    end;

    local v16 = KnitClient.Controllers.LightingController.sunRayModifier:addModifier(20, {
        Intensity = 0.005
    });
    table.insert(v14, v16);
    local v17 = KnitClient.Controllers.LightingController.skyModifier:addModifier(
        20,
        {
            SkyboxBk = "rbxassetid://9851144466",
            SkyboxDn = "rbxassetid://9851144249",
            SkyboxFt = "rbxassetid://9851144099",
            SkyboxLf = "rbxassetid://9851143942",
            SkyboxRt = "rbxassetid://9851143761",
            SkyboxUp = "rbxassetid://9851143257",
            CelestialBodiesShown = false,
            StarCount = 3000
        }
    );
    table.insert(v14, v17);

    return v14;
end;

return {
    VoidTurretViewWrapper = function(p18) -- Line: 159, Name: VoidTurretViewWrapper
        -- upvalues: u4 (copy), ScaleComponent (copy), u5 (ref)
        return u4.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 5,
            IgnoreGuiInset = true
        }, { u4.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(200, 100)
            }), u4.createElement(u5, {
                store = p18.store
            }) });
    end,

    VoidTurretView = u5
};