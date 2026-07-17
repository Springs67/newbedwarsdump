-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local WatchCharacter = v1.WatchCharacter;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local PlacementHud = RuntimeLib.import(script, script.Parent, "ui", "placement-hud").PlacementHud;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "OneInTheChamberController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 36
    -- upvalues: GameKnitController (copy), GameType (copy), u4 (copy)
    GameKnitController.constructor(p8, { GameType.ONE_IN_THE_CHAMBER });
    p8.Name = "OneInTheChamberController";
    p8.playerModifierMaid = u4.new();
    p8.winningTeamsMaidMap = {};
end;

function u6.KnitStart(p9) -- Line: 42
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p9);
end;

function u6.onGameInit(u10) -- Line: 45
    -- upvalues: WatchCharacter (copy), EntityUtil (copy), ClientSyncEvents (copy), ClientStore (copy), MatchState (copy), QueueType (copy), Flamework (copy), PlacementHud (copy), KnitClient2 (copy), u3 (copy), OfflinePlayerUtil (copy), u4 (copy), u5 (copy), WatchPlayerCharacter (copy)
    WatchCharacter(function(p11, p12) -- Line: 46
        -- upvalues: EntityUtil (ref)
        local v13 = EntityUtil:getEntity(p11);

        if v13 ~= nil then
            v13:hideNametag();
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p14) -- Line: 53
        -- upvalues: ClientStore (ref), MatchState (ref), QueueType (ref), Flamework (ref), PlacementHud (ref)
        local queueType = ClientStore:getState().Game.queueType;

        if p14.matchState == MatchState.RUNNING and queueType == QueueType.ONE_IN_THE_CHAMBER then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "PlacementHud",
                app = PlacementHud
            }, {
                queueType = queueType
            });
        end;
    end);
    ClientSyncEvents.TeamScoreChange:connect(function() -- Line: 64
        -- upvalues: KnitClient2 (ref), u3 (ref), u10 (copy), OfflinePlayerUtil (ref), u4 (ref), u5 (ref), WatchPlayerCharacter (ref)
        local v15 = KnitClient2.Controllers.TeamScoreController:getHighestTeamScore();

        if not v15 then
            return nil;
        end;

        local function _(p16) -- Line: 70
            return p16.Name;
        end;

        local u17 = table.create(#v15);

        for i, v in v15 do
            local _ = i - 1;
            u17[i] = v.Name;
        end;

        local function _(p18) -- Line: 81
            -- upvalues: u17 (copy), u10 (ref)
            if table.find(u17, p18) == nil then
                local v19 = u10.winningTeamsMaidMap[p18];

                if v19 ~= nil then
                    v19:DoCleaning();
                end;

                u10.winningTeamsMaidMap[p18] = nil;
            end;
        end;

        for i, v in u3.keys(u10.winningTeamsMaidMap) do
            local _ = i - 1;

            if table.find(u17, v) == nil then
                local v20 = u10.winningTeamsMaidMap[v];

                if v20 ~= nil then
                    v20:DoCleaning();
                end;

                u10.winningTeamsMaidMap[v] = nil;
            end;
        end;

        local function v30(p21) -- Line: 99
            -- upvalues: u10 (ref), KnitClient2 (ref), OfflinePlayerUtil (ref), u4 (ref), u5 (ref), WatchPlayerCharacter (ref)
            local Name = p21.Name;

            if u10.winningTeamsMaidMap[Name] ~= nil then
                return nil;
            end;

            local v22 = KnitClient2.Controllers.TeamController:getTeamById(Name);

            if v22 ~= nil then
                local members = v22.members;

                local function v29(p23) -- Line: 109
                    -- upvalues: OfflinePlayerUtil (ref), u4 (ref), u5 (ref), WatchPlayerCharacter (ref), u10 (ref), Name (copy)
                    local v24 = OfflinePlayerUtil.getPlayer(p23);

                    if not v24 then
                        return nil;
                    end;

                    if v24:FindFirstChild("PlayerHighlight") then
                        return nil;
                    end;

                    local u25 = u4.new();

                    local function u27(p26) -- Line: 118
                        -- upvalues: u5 (ref), u25 (copy)
                        u25:GiveTask((u5("Highlight", {
                            Name = "PlayerHighlight",
                            OutlineTransparency = 0.3,
                            Parent = p26,
                            OutlineColor = Color3.fromRGB(255, 0, 0),
                            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        })));
                    end;

                    if v24.Character then
                        u27(v24.Character);
                    end;

                    u25:GiveTask(WatchPlayerCharacter(v24, function(p28) -- Line: 131
                        -- upvalues: u27 (copy)
                        u27(p28);
                    end));
                    u10.winningTeamsMaidMap[Name] = u25;
                end;

                for i, v in members do
                    v29(v, i, members);
                end;
            end;
        end;

        for i, v in v15 do
            v30(v, i - 1, v15);
        end;
    end);
end;

KnitClient.CreateController(u6.new());

return nil;