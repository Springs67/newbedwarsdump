-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneLoadingScreen = RuntimeLib.import(script, script.Parent, "ui", "scene-loading-screen").SceneLoadingScreen;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SceneLoadingScreenController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SceneLoadingScreenController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("DisplayLoadingScreen"):Connect(function(p6) -- Line: 32
        -- upvalues: u5 (copy)
        u5:displayLoadingScreen(p6.sceneKey, p6.loadingScreen);
    end);
    default.Client:Get("RemoveLoadingScreen"):Connect(function() -- Line: 35
        -- upvalues: u5 (copy)
        u5:removeLoadingScreen();
    end);
end;

function u2.displayLoadingScreen(u7, p8, p9) -- Line: 39
    -- upvalues: u1 (copy), SceneLoadingScreen (copy), Players (copy), ClientSyncEvents (copy)
    local activeLoadingScreen = u7.activeLoadingScreen;

    if activeLoadingScreen ~= nil then
        activeLoadingScreen = activeLoadingScreen.sceneKey;
    end;

    if activeLoadingScreen == p8 then
        return nil;
    end;

    local u10 = os.time();
    local v11 = {};
    local v12 = {
        sceneKey = p8
    };

    for i, v in p9 do
        v11[i] = v;
    end;

    v12.tree = u1.mount(u1.createElement(SceneLoadingScreen, v11), Players.LocalPlayer:WaitForChild("PlayerGui"));
    v12.props = p9;
    v12.time = u10;
    u7.activeLoadingScreen = v12;
    local MaxDisplayTime = p9.MaxDisplayTime;
    local v13 = MaxDisplayTime == nil and 15 or MaxDisplayTime;

    if v13 ~= 0 and (v13 == v13 and v13) then
        task.delay(v13, function() -- Line: 67
            -- upvalues: u7 (copy), u10 (copy)
            local activeLoadingScreen2 = u7.activeLoadingScreen;

            if activeLoadingScreen2 ~= nil then
                activeLoadingScreen2 = activeLoadingScreen2.time;
            end;

            if activeLoadingScreen2 ~= u10 then
                return nil;
            end;

            u7:removeLoadingScreen();
        end);
    end;

    ClientSyncEvents.SceneLoadingScreenStart:fire({
        props = u7.activeLoadingScreen.props,
        time = u7.activeLoadingScreen.time
    }, u7.activeLoadingScreen.sceneKey);
end;

function u2.removeLoadingScreen(u14) -- Line: 83
    -- upvalues: ClientSyncEvents (copy), u1 (copy)
    if not u14.activeLoadingScreen then
        return nil;
    end;

    local MinDisplayTime = u14.activeLoadingScreen.props.MinDisplayTime;
    local v15 = MinDisplayTime == nil and 6 or MinDisplayTime;

    if v15 ~= 0 and (v15 == v15 and v15) then
        local v16 = os.time() - u14.activeLoadingScreen.time;

        if v16 < v15 then
            task.delay(v16 + 0.1, function() -- Line: 96
                -- upvalues: u14 (copy)
                u14:removeLoadingScreen();
            end);

            return nil;
        end;
    end;

    local v17 = ClientSyncEvents.SceneLoadingScreenEnd:fire({
        props = u14.activeLoadingScreen.props,
        time = u14.activeLoadingScreen.time
    }, u14.activeLoadingScreen.sceneKey);
    task.delay(v17.endAnimationSec, function() -- Line: 107
        -- upvalues: u14 (copy), u1 (ref)
        if not u14.activeLoadingScreen then
            return nil;
        end;

        u1.unmount(u14.activeLoadingScreen.tree);
        u14.activeLoadingScreen = nil;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;