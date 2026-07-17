-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "SceneManagerController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SceneManagerController";
end;

function u4.KnitStart(u7) -- Line: 32
    -- upvalues: KnitController (copy), default (copy), u2 (copy), WatchPlayerCharacter (copy), Players (copy), WatchCollectionTag (copy), Workspace (copy), ClientSyncEvents (copy), KnitClient (copy)
    KnitController.KnitStart(u7);
    default.Client:WaitFor("SceneStarted"):expect():Connect(function(p8) -- Line: 34
        -- upvalues: u7 (copy), u2 (ref), WatchPlayerCharacter (ref), Players (ref), WatchCollectionTag (ref), Workspace (ref), ClientSyncEvents (ref), KnitClient (ref)
        if u7.activeSceneKey == p8.sceneKey then
            return nil;
        end;

        local u9 = false;
        local u10 = u2.new();
        u10:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(u11) -- Line: 40
            -- upvalues: u9 (ref), u10 (copy)
            if not u11.PrimaryPart then
                u11:GetPropertyChangedSignal("PrimaryPart"):Wait();
            end;

            if u9 then
                return nil;
            end;

            u11.PrimaryPart.Anchored = true;
            u10:GiveTask(function() -- Line: 54
                -- upvalues: u11 (copy)
                if u11.PrimaryPart then
                    u11.PrimaryPart.Anchored = false;
                end;
            end);
        end));
        u10:GiveTask((WatchCollectionTag("S-" .. p8.sceneKey .. tostring(Players.LocalPlayer.UserId), function(p12) -- Line: 62
            -- upvalues: u9 (ref), u10 (copy), Players (ref)
            u9 = true;
            u10:DoCleaning();
            u10:GiveTask(p12);
            p12.CanCollide = true;
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                local PrimaryPart = Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart:PivotTo(p12.CFrame + Vector3.new(0, 4, 0));
                end;
            end;
        end)));
        u7.activeSceneKey = p8.sceneKey;
        u7.loadedAssets = Workspace:WaitForChild(u7.activeSceneKey);
        ClientSyncEvents.SceneStarted:fire(p8.sceneKey, u7.loadedAssets);
        task.delay(1.5, function() -- Line: 84
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.SceneLoadingScreenController:removeLoadingScreen();
        end);
    end);
    default.Client:Get("PromptSceneStarted"):SendToServer();
end;

KnitClient.CreateController(u4.new());

return nil;