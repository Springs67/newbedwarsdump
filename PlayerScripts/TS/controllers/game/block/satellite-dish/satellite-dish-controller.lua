-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local TweenService = v3.TweenService;
local GamepadUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "controls", "gamepad-util").GamepadUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local SatelliteDishBillboard = RuntimeLib.import(script, script.Parent, "ui", "satellite-dish-billboard").SatelliteDishBillboard;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "SatelliteDishController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy), GameSound (copy)
    KnitController.constructor(p6);
    p6.Name = "SatelliteDishController";
    p6.activateSound = GameSound.SATELLITE_ACTIVATE;
    p6.deactivateSound = GameSound.SATELLITE_DEACTIVATE;
    p6.changeTargetSound = GameSound.SATELLITE_INTERACT;
    p6.ambientSound = GameSound.SATELLITE_LOOP;
    p6.ambientMap = {};
    p6.tweenMap = {};
    p6.billboardMap = {};
end;

function u4.KnitStart(u7) -- Line: 45
    -- upvalues: KnitController (copy), CollectionService (copy), SoundManager (copy), TweenService (copy), Players (copy), isUsingKit (copy), BedwarsKit (copy), u2 (copy), SatelliteDishBillboard (copy), KnitClient2 (copy), GamepadUtil (copy), default (copy), BlockEngine (copy)
    KnitController.KnitStart(u7);
    CollectionService:GetInstanceAddedSignal("satellite-dish"):Connect(function(u8) -- Line: 47
        -- upvalues: SoundManager (ref), u7 (copy), TweenService (ref), Players (ref), isUsingKit (ref), BedwarsKit (ref), u2 (ref), SatelliteDishBillboard (ref), KnitClient2 (ref), GamepadUtil (ref), default (ref), BlockEngine (ref)
        local v9 = SoundManager:playModifiableSound(u7.ambientSound, {
            looped = true,
            position = u8.Position
        });

        if v9 then
            v9:Pause();
            u7.ambientMap[u8] = v9;
        end;

        local Dish = u8:WaitForChild("Dish");
        local v10 = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false);
        u7.tweenMap[u8] = { TweenService:Create(Dish, v10, {
                Orientation = Vector3.new(0, 360, 0)
            }) };

        if Players.LocalPlayer.UserId ~= u8:GetAttribute("PlacedByUserId") then
            return nil;
        end;

        if not isUsingKit(Players.LocalPlayer, BedwarsKit.DISRUPTOR) then
            return nil;
        end;

        local v11 = Players:GetPlayerByUserId(u8:GetAttribute("PlacedByUserId"));
        local v12 = u2.mount(u2.createElement(SatelliteDishBillboard, {
            satelliteInstance = u8,
            player = Players.LocalPlayer
        }), u8);
        u7.billboardMap[u8] = v12;
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "ActivatePrompt",
            HoldDuration = 1,
            RequiresLineOfSight = false,
            MaxActivationDistance = 8,
            ClickablePrompt = false,
            GamepadKeyCode = GamepadUtil.getGamepadKeybind("Interact"),
            ActionText = u7:getActivation(v11),
            Parent = u8
        }).Triggered:Connect(function(p13) -- Line: 95
            -- upvalues: default (ref), BlockEngine (ref), u8 (copy), Players (ref), SoundManager (ref), u7 (ref)
            default.Client:Get("DisruptionActivate"):SendToServer({
                blockPos = BlockEngine:getBlockPosition(u8.Position),
                device = u8
            });

            if p13 == Players.LocalPlayer then
                if p13:GetAttribute("DisruptorActivation") then
                    SoundManager:playSound(u7.deactivateSound);

                    return;
                end;

                SoundManager:playSound(u7.activateSound);
            end;
        end);
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "ChangeTargetPrompt",
            HoldDuration = 1,
            RequiresLineOfSight = false,
            MaxActivationDistance = 8,
            ActionText = "Change Target",
            ClickablePrompt = false,
            KeyboardKeyCode = Enum.KeyCode.X,
            GamepadKeyCode = GamepadUtil.getGamepadKeybind("Ping"),
            ObjectText = u7:getTarget(v11),
            UIOffset = Vector2.new(0, -80),
            Parent = u8
        }).Triggered:Connect(function(p14) -- Line: 122
            -- upvalues: default (ref), BlockEngine (ref), u8 (copy), Players (ref), SoundManager (ref), u7 (ref)
            default.Client:Get("DisruptionChangeTarget"):SendToServer({
                blockPos = BlockEngine:getBlockPosition(u8.Position),
                device = u8
            });

            if p14 == Players.LocalPlayer then
                SoundManager:playSound(u7.changeTargetSound);
            end;
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("satellite-dish"):Connect(function(p15) -- Line: 133
        -- upvalues: u7 (copy), u2 (ref)
        local v16 = u7.ambientMap[p15];

        if v16 ~= nil then
            v16:Destroy();
        end;

        u7.ambientMap[p15] = nil;
        local v17 = u7.tweenMap[p15];

        if v17 then
            if v17[1] then
                v17[1]:Destroy();
            end;

            if v17[2] then
                v17[2]:Destroy();
            end;
        end;

        u7.tweenMap[p15] = nil;
        local v18 = u7.billboardMap[p15];

        if v18 then
            u2.unmount(v18);
            u7.billboardMap[p15] = nil;
        end;
    end);
    default.Client:OnEvent("DisruptionUpdate", function(u19) -- Line: 158
        -- upvalues: u7 (copy)
        if not u19.device then
            return nil;
        end;

        local u20 = u7.ambientMap[u19.device];
        local v21 = u7.tweenMap[u19.device];

        if u19.active then
            local v22;

            if u20 == nil then
                v22 = u20;
            else
                v22 = u20.IsPlaying;
            end;

            if not v22 then
                task.delay(1.5, function() -- Line: 188
                    -- upvalues: u19 (copy), u20 (copy)
                    if u19.device then
                        local v23 = u20;

                        if v23 ~= nil then
                            v23:Play();
                        end;
                    end;
                end);
            end;

            if v21 then
                if v21[1] then
                    v21[1]:Play();
                end;

                if v21[2] then
                    v21[2]:Play();
                end;
            end;
        else
            if u20 ~= nil then
                u20:Stop();
            end;

            if v21 then
                if v21[1] then
                    v21[1]:Pause();
                end;

                if v21[2] then
                    v21[2]:Pause();
                end;
            end;
        end;

        if u19.player.UserId ~= u19.device:GetAttribute("PlacedByUserId") then
            return nil;
        end;

        if u19.device:FindFirstChild("ActivatePrompt") then
            u19.device.ActivatePrompt.ActionText = u7:getActivation(u19.player);
        end;

        if u19.device:FindFirstChild("ChangeTargetPrompt") then
            u19.device.ChangeTargetPrompt.ObjectText = u7:getTarget(u19.player);
        end;
    end);
end;

function u4.getActivation(p24, p25) -- Line: 218
    if p25 ~= nil then
        p25 = p25:GetAttribute("DisruptorActivation");
    end;

    return p25 and "Deactivate" or "Activate";
end;

function u4.getTarget(p26, p27) -- Line: 225
    if p27 ~= nil then
        p27 = p27:GetAttribute("DisruptorTarget");
    end;

    return "Current Target: " .. tostring(p27);
end;

KnitClient.CreateController(u4.new());

return nil;