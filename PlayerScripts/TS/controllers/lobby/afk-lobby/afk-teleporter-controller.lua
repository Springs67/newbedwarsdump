-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local TeleportService = v1.TeleportService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AfkPlaceLoadingScreen = RuntimeLib.import(script, script.Parent, "ui", "afk-place-loading-screen").AfkPlaceLoadingScreen;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "AfkTeleporterController";
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
    p4.Name = "AfkTeleporterController";
    p4.teleportTime = 0;
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), TeleportService (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag("AfkLobby", function(p6) -- Line: 33
        -- upvalues: u5 (copy)
        u5:hookAfkTeleporter(p6);
    end);
    TeleportService.TeleportInitFailed:Connect(function(p7, p8, p9, p10, p11) -- Line: 36
        -- upvalues: u5 (copy)
        if p8 == Enum.TeleportResult.IsTeleporting or p8 == Enum.TeleportResult.Success then
            return nil;
        end;

        local PrimaryPart = p7.Character.PrimaryPart;

        if PrimaryPart then
            PrimaryPart.Anchored = false;
        end;

        u5:teleportToSpawnLocation(p7);
        u5:unMountTeleportToAfkHud();
    end);
end;

function u2.hookAfkTeleporter(u12, p13) -- Line: 48
    -- upvalues: Players (copy), u2 (ref), default (copy)
    if p13 then
        p13.Touched:Connect(function(p14) -- Line: 50
            -- upvalues: Players (ref), u12 (copy), u2 (ref), default (ref)
            local Parent = p14.Parent;

            if Parent ~= nil then
                Parent = Parent.Name;
            end;

            if Parent == "elk" then
                local Parent2 = p14.Parent.Parent;

                if Parent2 ~= nil then
                    Parent2 = Parent2.Name;
                end;

                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character.Name;
                end;

                if Parent2 == Character and tick() - u12.teleportTime >= u2.TELEPORT_COOLDOWN then
                    u12.teleportTime = tick();
                    default.Client:Get("TeleportToAfkLobby"):SendToServer();
                    u12:mountTeleportToAfkHud();
                    local PrimaryPart = Players.LocalPlayer.Character.PrimaryPart;

                    if PrimaryPart then
                        task.delay(0.5, function() -- Line: 71
                            -- upvalues: PrimaryPart (copy)
                            PrimaryPart.Anchored = true;
                        end);
                    end;
                end;
            end;

            if Players.LocalPlayer.Character and (p14.Parent == Players.LocalPlayer.Character and tick() - u12.teleportTime >= u2.TELEPORT_COOLDOWN) then
                u12.teleportTime = tick();
                default.Client:Get("TeleportToAfkLobby"):SendToServer();
                u12:mountTeleportToAfkHud();
                local PrimaryPart = Players.LocalPlayer.Character.PrimaryPart;

                if PrimaryPart then
                    task.delay(0.5, function() -- Line: 86
                        -- upvalues: PrimaryPart (copy)
                        PrimaryPart.Anchored = true;
                    end);
                end;
            end;
        end);
    end;
end;

function u2.mountTeleportToAfkHud(p15) -- Line: 96
    -- upvalues: Flamework (copy), AfkPlaceLoadingScreen (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "AfkPlaceLoadingScreen",
        app = AfkPlaceLoadingScreen
    }, {});
end;

function u2.unMountTeleportToAfkHud(p16) -- Line: 102
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("AfkPlaceLoadingScreen");
end;

function u2.teleportToSpawnLocation(p17, p18) -- Line: 105
    -- upvalues: default (copy)
    default.Client:Get("AfkTeleporterTouched"):SendToServer({
        player = p18
    });
end;

u2.TELEPORT_COOLDOWN = 5;
KnitClient.CreateController(u2.new());

return nil;