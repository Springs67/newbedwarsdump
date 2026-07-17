-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local GamepadKeycodes = v1.GamepadKeycodes;
local KeyboardKeycodes = v1.KeyboardKeycodes;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KeybindDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "ProximityPromptController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ProximityPromptController";
    p6.proximityPromptDefinitions = {};
end;

function u4.KnitStart(u7) -- Line: 35
    -- upvalues: KnitController (copy), GameCoreClientSyncEvents (copy), KnitClient (copy), KeybindDefaults (copy), KeyboardKeycodes (copy), GamepadKeycodes (copy), CollectionService (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u7);
    GameCoreClientSyncEvents.KeybindsRegistered:connect(function(p8) -- Line: 38
        -- upvalues: KnitClient (ref), KeybindDefaults (ref), KeyboardKeycodes (ref), GamepadKeycodes (ref), CollectionService (ref), u7 (copy)
        local v9 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
        local Interact = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.Interact;
        local Interact2 = KeybindDefaults.GAMEPAD_KEYBINDS.controlActions.Interact;
        local Interact3 = p8.actionKeybindDefinitions.Interact;

        if Interact3 ~= nil then
            local function v11(p10) -- Line: 46
                -- upvalues: KeyboardKeycodes (ref), Interact (ref), GamepadKeycodes (ref), Interact2 (ref)
                if not p10:IsA("KeyCode") then
                    return nil;
                end;

                if table.find(KeyboardKeycodes, p10) == nil then
                    if table.find(GamepadKeycodes, p10) ~= nil then
                        Interact2 = p10;
                    end;

                    return;
                end;

                Interact = p10;
            end;

            for i, v in Interact3 do
                v11(v, i - 1, Interact3);
            end;
        end;

        local v12;

        if v9 then
            local keyboard = v9.keyboard;

            if keyboard ~= nil then
                keyboard = keyboard.controlActions.Interact;
            end;

            v12 = keyboard == Interact;

            if v12 then
                local gamepad = v9.gamepad;

                if gamepad ~= nil then
                    gamepad = gamepad.controlActions.Interact;
                end;

                v12 = gamepad == Interact2;
            end;
        else
            v12 = v9;
        end;

        if v12 then
            return nil;
        end;

        local function _(p13) -- Line: 85
            -- upvalues: u7 (ref), Interact (ref), Interact2 (ref)
            if not p13:IsA("ProximityPrompt") then
                return nil;
            end;

            if not u7:isCustomKeyboardKeybind(p13) then
                p13.KeyboardKeyCode = Interact;
            end;

            if not u7:isCustomGamepadKeybind(p13) then
                p13.GamepadKeyCode = Interact2;
            end;
        end;

        for i, v in CollectionService:GetTagged("ProximityPrompt") do
            local _ = i - 1;

            if v:IsA("ProximityPrompt") then
                if not u7:isCustomKeyboardKeybind(v) then
                    v.KeyboardKeyCode = Interact;
                end;

                if not u7:isCustomGamepadKeybind(v) then
                    v.GamepadKeyCode = Interact2;
                end;
            end;
        end;
    end);
    WatchCollectionTag("ProximityPrompt", function(p14) -- Line: 103
        -- upvalues: u7 (copy)
        if not p14:IsA("ProximityPrompt") then
            return nil;
        end;

        u7:setupProximityPromptKeybind(p14);
    end);
end;

function u4.createProximityPrompt(p15, p16) -- Line: 110
    -- upvalues: DeviceUtil (copy), u3 (copy), CollectionService (copy)
    local v17 = {
        HoldDuration = 0,
        RequiresLineOfSight = false,
        MaxActivationDistance = 7.5,
        ClickablePrompt = DeviceUtil.isMobileControls()
    };

    for i, v in p16 do
        v17[i] = v;
    end;

    local v18 = u3("ProximityPrompt", v17);

    if p16.KeyboardKeyCode then
        v18:SetAttribute("CustomKeyboardKeyCode", true);
    end;

    if p16.GamepadKeyCode then
        v18:SetAttribute("CustomGamepadKeyCode", true);
    end;

    CollectionService:AddTag(v18, "ProximityPrompt");

    return v18;
end;

function u4.isCustomKeyboardKeybind(p19, p20) -- Line: 131
    return p20:GetAttribute("CustomKeyboardKeyCode") == true;
end;

function u4.isCustomGamepadKeybind(p21, p22) -- Line: 134
    return p22:GetAttribute("CustomGamepadKeyCode") == true;
end;

function u4.setupProximityPromptKeybind(p23, p24) -- Line: 137
    -- upvalues: KnitClient2 (copy)
    local v25 = KnitClient2.Controllers.KeybindLoadController:waitForKeybinds();
    local v26 = not p23:isCustomKeyboardKeybind(p24);

    if v26 then
        v26 = v25.keyboard;

        if v26 ~= nil then
            v26 = v26.controlActions.Interact;
        end;
    end;

    if v26 then
        local keyboard = v25.keyboard;

        if keyboard ~= nil then
            keyboard = keyboard.controlActions.Interact;
        end;

        p24.KeyboardKeyCode = keyboard;
    end;

    local v27 = not p23:isCustomGamepadKeybind(p24);

    if v27 then
        v27 = v25.gamepad;

        if v27 ~= nil then
            v27 = v27.controlActions.Interact;
        end;
    end;

    if v27 then
        local gamepad = v25.gamepad;

        if gamepad ~= nil then
            gamepad = gamepad.controlActions.Interact;
        end;

        p24.GamepadKeyCode = gamepad;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;