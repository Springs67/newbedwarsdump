-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out");
local PartyInvitesApp = v1.PartyInvitesApp;
local PartyInvitesReducer = v1.PartyInvitesReducer;
local PartyReducer = v1.PartyReducer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;

return function(p4) -- Line: 12
    -- upvalues: u3 (copy), GameReducer (copy), PartyReducer (copy), PartyInvitesReducer (copy), OfflinePlayerUtil (copy), u2 (copy), StoreProvider (copy), PartyInvitesApp (copy)
    local v5 = u3.Store.new(u3.combineReducers({
        Game = GameReducer,
        Party = PartyReducer,
        PartyInvites = PartyInvitesReducer
    }), {
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
                        userId = OfflinePlayerUtil.Dummy.SnickTrix.userId
                    },
                    time = os.time() - 10
                }
            }
        }
    });
    local u6 = u2.mount(u2.createElement(StoreProvider, {
        store = v5
    }, { u2.createElement(PartyInvitesApp, {
            AppId = "PARTY_INVITES"
        }) }));

    return function() -- Line: 41
        -- upvalues: u2 (ref), u6 (copy)
        u2.unmount(u6);
    end;
end;