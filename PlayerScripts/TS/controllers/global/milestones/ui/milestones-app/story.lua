-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local MilestoneRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local MilestonesApp = RuntimeLib.import(script, script.Parent, "milestones-app").MilestonesApp;

return function(p2) -- Line: 9
    -- upvalues: ClientStore (copy), PlayerLevelUtil (copy), MilestoneRewards (copy), CreateRoduxApp (copy), MilestonesApp (copy), u1 (copy)
    ClientStore:dispatch({
        type = "BedwarsSetSome",
        data = {
            playerLevel = 17,
            playerLevelTotalExperience = PlayerLevelUtil.levelSystem:getTotalExperienceForLevel(17),
            milestoneRewardsClaimed = { MilestoneRewards[2].id }
        }
    });
    local u3 = CreateRoduxApp("MilestonesApp", MilestonesApp, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 21
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;