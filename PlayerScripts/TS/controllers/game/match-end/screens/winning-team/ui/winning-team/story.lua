-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local WinningTeamWrapper = RuntimeLib.import(script, script.Parent, "winning-team").WinningTeamWrapper;

return function(p2) -- Line: 6
    -- upvalues: CreateRoduxApp (copy), WinningTeamWrapper (copy), u1 (copy)
    local u3 = CreateRoduxApp("WinningTeam", WinningTeamWrapper, {
        WinningTeamId = 0,
        NewLeaderboardPos = 12673,
        PreviousLeaderboardPos = 63864
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 14
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;