-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CustomKitCreation_MainGUI = RuntimeLib.import(script, script.Parent, "ui", "custom-kit-creation-main-gui").CustomKitCreation_MainGUI;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "CustomKitCreationController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 29
    -- upvalues: GameKnitController (copy), GameType (copy), u2 (copy)
    GameKnitController.constructor(p6, { GameType.CUSTOM_KIT_CREATOR });
    p6.Name = "CustomKitCreationController";
    p6.maid = u2.new();
    p6.loadedKits = false;
    p6.customKits = {};
end;

function u4.KnitStart(p7) -- Line: 36
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 39
    -- upvalues: default (copy), KnitClient2 (copy), MatchState (copy), ClientSyncEvents (copy)
    default.Client:Get("CustomKitCreation_SendProfileDataToClient"):Connect(function(p9) -- Line: 41
        -- upvalues: u8 (copy), KnitClient2 (ref), MatchState (ref), ClientSyncEvents (ref)
        u8.customKits = p9.customKits;
        u8.loadedKits = true;

        if KnitClient2.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
            u8:mountGui();

            return;
        end;

        ClientSyncEvents.MatchStateChange:connect(function(p10) -- Line: 49
            -- upvalues: MatchState (ref), u8 (ref)
            if p10.matchState == MatchState.RUNNING then
                u8:mountGui();
            end;
        end);
    end);
    default.Client:Get("CustomKit_ClientGameInitialized"):SendToServer({});
end;

function u4.requestKitChanges(p11) -- Line: 58
    -- upvalues: default (copy)
    if p11.loadedKits then
        return default.Client:Get("CustomKitCreation_RequestKitChanges"):CallServer({
            customKits = p11.customKits
        }) and true or false;
    end;

    return false;
end;

function u4.mountGui(u12) -- Line: 71
    -- upvalues: Players (copy), u3 (copy), CustomKitCreation_MainGUI (copy)
    task.spawn(function() -- Line: 72
        -- upvalues: u12 (copy), Players (ref), u3 (ref), CustomKitCreation_MainGUI (ref)
        while not u12.loadedKits do
            task.wait(0.1);
        end;

        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
        local u13 = u3.mount(u3.createElement(CustomKitCreation_MainGUI, {
            CustomKits = u12.customKits,

            OnSave = function() -- Line: 79, Name: OnSave
                -- upvalues: u12 (ref)
                return u12:requestKitChanges();
            end
        }), PlayerGui, "CustomKitCreationMainGUI");
        u12.maid:GiveTask(function() -- Line: 83
            -- upvalues: u3 (ref), u13 (copy)
            u3.unmount(u13);
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;