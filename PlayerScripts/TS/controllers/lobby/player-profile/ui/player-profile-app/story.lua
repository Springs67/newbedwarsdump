-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out");
local PartyInvitesReducer = v1.PartyInvitesReducer;
local PartyReducer = v1.PartyReducer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClansReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer;
local EventReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "event-reducer").EventReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local DummyProfileData = RuntimeLib.import(script, script.Parent.Parent, "dummy-player-profile-data").DummyProfileData;
local v4 = RuntimeLib.import(script, script.Parent, "player-profile-app");
local PlayerProfileApp = v4.PlayerProfileApp;
local PlayerProfileTab = v4.PlayerProfileTab;

return function(p5) -- Line: 16
    -- upvalues: u3 (copy), BedwarsReducer (copy), PartyReducer (copy), PartyInvitesReducer (copy), ClansReducer (copy), EventReducer (copy), CreateRoduxApp (copy), PlayerProfileApp (copy), DummyProfileData (copy), PlayerProfileTab (copy), u2 (copy)
    u3.Store.new(u3.combineReducers({
        Bedwars = BedwarsReducer,
        Party = PartyReducer,
        PartyInvites = PartyInvitesReducer,
        Clans = ClansReducer,
        Event = EventReducer
    }));
    local u6 = CreateRoduxApp("PlayerProfileApp", PlayerProfileApp, {
        AppId = "PlayerProfile",
        ProfileData = DummyProfileData,
        DefaultTab = PlayerProfileTab.ACHIEVEMENTS
    }, {}, {
        Parent = p5
    });

    return function() -- Line: 52
        -- upvalues: u2 (ref), u6 (copy)
        u2.unmount(u6);
    end;
end;