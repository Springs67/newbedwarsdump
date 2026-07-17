-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local QueueApp = RuntimeLib.import(script, script.Parent, "queue-app").QueueApp;

return function(p2) -- Line: 10
    -- upvalues: CreateRoduxApp (copy), QueueApp (copy), ClientStore (copy), OfflinePlayerUtil (copy), QueueType (copy), QueueState (copy), RuntimeLib (copy), u1 (copy)
    local u3 = CreateRoduxApp("QueueStatus", QueueApp, {}, {}, {
        Parent = p2
    });
    local u4 = os.time();
    ClientStore:dispatch({
        type = "PartyUpdateAll",
        party = {
            leader = OfflinePlayerUtil.Dummy.SnickTrix,
            members = { OfflinePlayerUtil.Dummy.spleenhook },
            queueData = {
                ticketId = "",
                lastPollTime = 0,
                pollAttempts = 0,
                queueType = QueueType.BEDWARS_TO4,
                joinTime = u4
            },
            queueState = QueueState.IN_QUEUE,
            outgoingInviteUserIds = {}
        }
    });
    RuntimeLib.Promise.delay(3):andThen(function() -- Line: 32
        -- upvalues: ClientStore (ref), OfflinePlayerUtil (ref), QueueType (ref), u4 (copy), QueueState (ref)
        ClientStore:dispatch({
            type = "PartyUpdateAll",
            party = {
                leader = OfflinePlayerUtil.Dummy.SnickTrix,
                members = { OfflinePlayerUtil.Dummy.spleenhook },
                queueData = {
                    ticketId = "",
                    lastPollTime = 0,
                    pollAttempts = 0,
                    queueType = QueueType.BEDWARS_TO4,
                    joinTime = u4
                },
                queueState = QueueState.MATCH_FOUND,
                outgoingInviteUserIds = {}
            }
        });
    end);

    return function() -- Line: 51
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;