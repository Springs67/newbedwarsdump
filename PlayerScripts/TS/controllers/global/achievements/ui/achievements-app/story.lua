-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local DummyProfileData = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "player-profile", "dummy-player-profile-data").DummyProfileData;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AchievementsApp = RuntimeLib.import(script, script.Parent, "achievements-app").AchievementsApp;

return function(p2) -- Line: 9
    -- upvalues: ClientStore (copy), DummyProfileData (copy), CreateRoduxApp (copy), BedwarsAppIds (copy), AchievementsApp (copy), u1 (copy)
    ClientStore:dispatch({
        type = "LobbySetProfileData",
        profileData = DummyProfileData
    });
    local u3 = CreateRoduxApp(BedwarsAppIds.Achievements, AchievementsApp, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 17
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;