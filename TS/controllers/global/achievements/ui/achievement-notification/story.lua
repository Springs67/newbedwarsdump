-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local AchievementId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId;
local AchievementNotification = RuntimeLib.import(script, script.Parent, "achievement-notification").AchievementNotification;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), AchievementNotification (copy), AchievementId (copy)
    local u3 = u1.mount(u1.createElement(AchievementNotification, {
        Id = AchievementId.DAMAGE_LEGEND_1
    }), p2);

    return function() -- Line: 10
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;