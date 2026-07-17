-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Promise = v1.Promise;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KeybindDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults;
local ProfileDataKeybindLoader = RuntimeLib.import(script, script.Parent, "profile-data-keybind-loader").ProfileDataKeybindLoader;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "KeybindLoadController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 26
    -- upvalues: KnitController (copy), ProfileDataKeybindLoader (copy), u3 (copy)
    KnitController.constructor(p6);
    p6.Name = "KeybindLoadController";
    p6.keybindLoaders = { ProfileDataKeybindLoader.new() };
    p6.loadedKeybindsSignal = u3.new();
end;

function u4.KnitStart(p7) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
    p7:loadKeybinds();
end;

function u4.getKeybinds(p8) -- Line: 36
    return p8.loadedKeybinds;
end;

function u4.waitForKeybinds(p9) -- Line: 39
    if p9.loadedKeybinds then
        return p9.loadedKeybinds;
    end;

    return p9.loadedKeybindsSignal:Wait();
end;

function u4.loadKeybinds(u10) -- Line: 45
    -- upvalues: Promise (copy), u2 (copy), KeybindDefaults (copy)
    local u14 = Promise.new(function(p11, p12) -- Line: 46
        -- upvalues: u10 (copy), u2 (ref), KeybindDefaults (ref)
        local v13 = u10.loadedKeybinds or {
            keyboard = u2.deepCopy(KeybindDefaults.KEYBOARD_KEYBINDS),
            gamepad = u2.deepCopy(KeybindDefaults.GAMEPAD_KEYBINDS)
        };

        if not v13.gamepad then
            p12("Initially loaded keybinds must provide gamepad keybinds");
        end;

        p11(v13);
    end);

    local function _(u15) -- Line: 59
        -- upvalues: u14 (ref)
        u14 = u14:andThen(function(p16) -- Line: 60
            -- upvalues: u15 (copy)
            local v17 = u15:loadKeybinds();

            if not v17 then
                return p16;
            end;

            p16.keyboard = v17.keyboard or p16.keyboard;
            p16.gamepad = v17.gamepad or p16.gamepad;

            return p16;
        end);
    end;

    for i, v in u10.keybindLoaders do
        local _ = i - 1;
        u14 = u14:andThen(function(p18) -- Line: 60
            -- upvalues: v (copy)
            local v19 = v:loadKeybinds();

            if not v19 then
                return p18;
            end;

            p18.keyboard = v19.keyboard or p18.keyboard;
            p18.gamepad = v19.gamepad or p18.gamepad;

            return p18;
        end);
    end;

    u14:andThen(function(p20) -- Line: 73
        -- upvalues: u10 (copy)
        local v21 = u10:registerKeybinds(p20);

        if not v21.success then
            error(v21.errorMessage);
        end;

        u10.loadedKeybindsSignal:Fire(p20);
        u10.loadedKeybinds = p20;
    end):catch(function(p22) -- Line: 80
        if p22 ~= "" and p22 then
            warn(p22);
        end;
    end);
end;

function u4.registerKeybinds(u23, u24) -- Line: 86
    -- upvalues: RuntimeLib (copy), Flamework (copy)
    local v26, v27 = RuntimeLib.try(function() -- Line: 87
        -- upvalues: Flamework (ref), u24 (copy), u23 (copy), RuntimeLib (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):registerKeybindDefinitions(u24.keyboard, u24.gamepad);
        u23.loadedKeybinds = u24;

        return RuntimeLib.TRY_RETURN, { {
                success = true
            } };
    end, function(p25) -- Line: 93
        -- upvalues: RuntimeLib (ref)
        return RuntimeLib.TRY_RETURN, {
            {
                success = false,
                errorMessage = "Failed to register keybinds with error " .. tostring(p25)
            }
        };
    end);

    if v26 then
        return unpack(v27);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;