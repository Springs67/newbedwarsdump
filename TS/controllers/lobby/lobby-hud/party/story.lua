-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out");
local PartyApp = v1.PartyApp;
local PartyInvitesReducer = v1.PartyInvitesReducer;
local PartyReducer = v1.PartyReducer;
local QueueState = v1.QueueState;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;

return function(p4) -- Line: 13
    -- upvalues: u3 (copy), GameReducer (copy), PartyReducer (copy), PartyInvitesReducer (copy), OfflinePlayerUtil (copy), QueueState (copy), u2 (copy), StoreProvider (copy), PartyApp (copy)
    local v5 = u3.Store.new(u3.combineReducers({
        Game = GameReducer,
        Party = PartyReducer,
        PartyInvites = PartyInvitesReducer
    }), {
        Party = {
            queueData = nil,
            leader = OfflinePlayerUtil.Dummy.oiogy,
            members = {
                OfflinePlayerUtil.Dummy.SnickTrix,
                OfflinePlayerUtil.Dummy.spleenhook,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99
            },
            queueState = QueueState.NONE,
            outgoingInviteUserIds = {}
        },
        PartyInvites = {
            incomingInvites = {
                {
                    fromPlayer = {
                        name = "SnickTrix",
                        userId = OfflinePlayerUtil.Dummy.SnickTrix.userId
                    },
                    time = os.time()
                },
                {
                    fromPlayer = {
                        name = "spleenhook",
                        userId = OfflinePlayerUtil.Dummy.spleenhook.userId
                    },
                    time = os.time() - 10
                },
                {
                    fromPlayer = {
                        name = "Sprux",
                        userId = OfflinePlayerUtil.Dummy.oiogy.userId
                    },
                    time = os.time()
                },
                {
                    fromPlayer = {
                        name = "Bryan3838",
                        userId = OfflinePlayerUtil.Dummy.Bryan3838.userId
                    },
                    time = os.time() - 10
                },
                {
                    fromPlayer = {
                        name = "AsenDev",
                        userId = OfflinePlayerUtil.Dummy.Asen.userId
                    },
                    time = os.time()
                },
                {
                    fromPlayer = {
                        name = "Rascal",
                        userId = OfflinePlayerUtil.Dummy.Rascal.userId
                    },
                    time = os.time()
                }
            }
        }
    });
    local u6 = u2.mount(u2.createElement(StoreProvider, {
        store = v5
    }, { u2.createElement(PartyApp, {
            AppId = "PARTY"
        }) }), p4);

    return function() -- Line: 73
        -- upvalues: u2 (ref), u6 (copy)
        return u2.unmount(u6);
    end;
end;