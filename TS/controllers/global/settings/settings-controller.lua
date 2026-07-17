-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SettingsController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 25
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "SettingsController";
    p4.getSettingsEvent = u1.new();
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u5);
    default.Client:WaitFor("GetSettings"):andThen(function(p6) -- Line: 33
        -- upvalues: ClientStore (ref), u5 (copy)
        local v7 = p6:CallServer();

        if v7 then
            ClientStore:dispatch({
                type = "SettingsUpdateAll",
                settings = v7
            });
            u5.settings = v7;
            u5.getSettingsEvent:Fire(v7);
        end;
    end);
end;

function u2.getSetting(p8, p9) -- Line: 46
    local settings = p8.settings;

    if settings ~= nil then
        settings = settings[p9];
    end;

    return settings;
end;

function u2.getSettings(p10) -- Line: 53
    return p10.settings;
end;

function u2.waitForSettings(p11) -- Line: 56
    if p11.settings then
        return p11.settings;
    end;

    return p11.getSettingsEvent:Wait();
end;

function u2.waitForSettingsAsync(u12) -- Line: 64
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.Promise.new(function(p13) -- Line: 65
        -- upvalues: u12 (copy)
        if u12.settings then
            p13(u12.settings);

            return;
        end;

        p13((u12.getSettingsEvent:Wait()));
    end);
end;

function u2.setSetting(p14, p15, p16) -- Line: 74
    -- upvalues: ClientStore (copy), ClientSyncEvents (copy), default (copy)
    local u17 = p14:waitForSettings();
    u17[p15] = p16;
    ClientStore:dispatch({
        type = "SettingsUpdateSome",
        settings = {
            [p15] = p16
        }
    });
    ClientSyncEvents.SettingChanged:fire(p15, p16);
    p14:onSettingChange(p15, p16);
    default.Client:WaitFor("SetSettings"):andThen(function(p18) -- Line: 90
        -- upvalues: u17 (copy)
        p18:SendToServer(u17);
    end);
end;

function u2.onSettingChange(p19, p20, p21) -- Line: 95
    -- upvalues: Setting (copy), Flamework (copy)
    if p20 ~= Setting.FRIEND_NOTIFICATIONS then
        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):setShowNotifications(p21);
end;

KnitClient.CreateController(u2.new());

return nil;