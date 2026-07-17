-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local RankDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
local RankedProgressBarCore = RuntimeLib.import(script, script.Parent, "ranked-progress-bar-core").RankedProgressBarCore;

return function(p2) -- Line: 7
    -- upvalues: RankDivision (copy), CreateRoduxApp (copy), RankedProgressBarCore (copy), u1 (copy)
    local u3 = CreateRoduxApp("RankedProgressBarApp", RankedProgressBarCore, {
        RankChangeData = {
            rpDelta = 0,
            rankVisible = true,
            matchesPlayed = 10,
            demotionShieldActive = true,
            oldDivision = {
                rankPoints = 0,
                division = RankDivision.DIAMOND_3
            },
            newDivision = {
                rankPoints = 0,
                division = RankDivision.DIAMOND_3
            }
        }
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 27
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;