-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v2.HttpService;
local Players = v2.Players;
local RunService = v2.RunService;
local TeleportService = v2.TeleportService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ConfigType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType;
local getConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig;
local StudioQueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "ConnectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p5);
    p5.Name = "ConnectController";
    p5.myConnectedParty = nil;
    p5.connected = false;
    p5.connectSignal = Signal.new();
end;

function u3.KnitStart(u6) -- Line: 40
    -- upvalues: RuntimeLib (copy), default (copy), TeleportService (copy), RunService (copy), getConfig (copy), ConfigType (copy), PlaceUtil (copy), StudioQueueType (copy), QueueType (copy), Players (copy), HttpService (copy)
    RuntimeLib.Promise.retry(RuntimeLib.async(function() -- Line: 41
        -- upvalues: RuntimeLib (ref), default (ref)
        return RuntimeLib.await(default.Client:WaitFor("PlayerConnect"));
    end), 50):andThen(function(p7) -- Line: 44
        -- upvalues: u6 (copy), TeleportService (ref), RunService (ref), getConfig (ref), ConfigType (ref), PlaceUtil (ref), StudioQueueType (ref), QueueType (ref), Players (ref), HttpService (ref)
        u6.connected = true;
        u6.connectSignal:Fire();
        local v8 = TeleportService:GetLocalPlayerTeleportData();

        if not v8 then
            if (RunService:IsStudio() or getConfig(ConfigType.ForceGameServer)) and PlaceUtil.isGameServer() then
                if getConfig(ConfigType.ForceCustomMatch) then
                    local v9 = StudioQueueType or QueueType.BEDWARS_TO2;
                    local v10 = getConfig(ConfigType.LoadMap);
                    p7:SendToServer({
                        customMatchHash = "a",
                        customMatch = {
                            joinCode = "ABCD",
                            accessCode = "",
                            selectedMap = v10 == nil and "to4_Aztec" or v10,
                            queueType = v9,
                            hostUserId = Players.LocalPlayer.UserId
                        }
                    });

                    return;
                end;

                if getConfig(ConfigType.SimulateLateJoin) and Players.LocalPlayer.Name == "Player2" then
                    task.wait(5);
                end;

                p7:SendToServer({
                    match = {
                        accessCodeHash = "",
                        matchId = HttpService:GenerateGUID(false),
                        queueType = StudioQueueType,
                        teamLeaderUserId = Players.LocalPlayer.UserId
                    }
                });
            end;

            return;
        end;

        p7:SendToServer(v8);
        u6.myConnectedParty = v8.party;
    end);
    RuntimeLib.Promise.retry(RuntimeLib.async(function() -- Line: 88
        -- upvalues: RuntimeLib (ref), default (ref)
        return RuntimeLib.await(default.Client:WaitFor("PlayerReady"));
    end), 50):andThen(function(p11) -- Line: 91
        p11:SendToServer();
    end);
end;

function u3.waitForConnected(p12) -- Line: 96
    if p12.connected then
        return nil;
    end;

    p12.connectSignal:Wait();
end;

function u3.getMyConnectedParty(p13) -- Line: 102
    return p13.myConnectedParty;
end;

return {
    ConnectController = KnitClient.CreateController(u3.new())
};