-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local KillFeed = RuntimeLib.import(script, script.Parent, "kill-feed-app").KillFeed;
local KillFeedCard = RuntimeLib.import(script, script.Parent, "kill-feed-card", "kill-feed-card").KillFeedCard;

return function(u3) -- Line: 9
    -- upvalues: u1 (copy), BedwarsImageId (copy), ItemType (copy), u2 (copy), KillFeed (copy), KillFeedCard (copy)
    local u4 = u1.new();
    local v5 = {
        localPlayerIsKiller = true,
        multiKillCount = 6,
        killer = {
            name = "Spleenhook",
            teamId = "4"
        },
        victim = {
            name = "Luke",
            teamId = "1"
        },
        killIcons = { BedwarsImageId.killfeed.sword },
        killPayout = {
            [ItemType.IRON] = {
                amount = 354
            },
            [ItemType.EMERALD] = {
                amount = 35
            },
            [ItemType.DIAMOND] = {
                amount = 16
            }
        }
    };
    local v6 = {
        multiKillCount = 2,
        killer = {
            name = "Spleenhook_Spleenhook",
            teamId = "4"
        },
        victim = {
            name = "Sprux",
            teamId = "1"
        },
        killIcons = { BedwarsImageId.killfeed.sword, BedwarsImageId.SKULL_LINE_ICON }
    };
    local u7 = u2.mount(u2.createElement(KillFeed, {}, { u2.createElement(KillFeedCard, {
            KillFeedData = v5
        }), u2.createElement(KillFeedCard, {
            KillFeedData = v6
        }) }), u3);
    task.delay(1, function() -- Line: 55
        -- upvalues: BedwarsImageId (ref), u2 (ref), KillFeedCard (ref), u3 (copy)
        u2.mount(u2.createElement(KillFeedCard, {
            KillFeedData = {
                killer = {
                    name = "Sprux",
                    teamId = "1"
                },
                victim = {
                    name = "Bryan3838",
                    teamId = "2"
                },
                killIcons = { BedwarsImageId.killfeed.sword }
            }
        }), u3:FindFirstChild("KillFeedContainer"));
    end);
    task.delay(2, function() -- Line: 71
        -- upvalues: BedwarsImageId (ref), u2 (ref), KillFeedCard (ref), u3 (copy)
        u2.mount(u2.createElement(KillFeedCard, {
            KillFeedData = {
                killer = {
                    name = "Spleenhook_Spleenhook",
                    teamId = "3"
                },
                victim = {
                    name = "Sprux",
                    teamId = "1"
                },
                killIcons = { BedwarsImageId.killfeed.sword }
            }
        }), u3:FindFirstChild("KillFeedContainer"));
    end);

    return function() -- Line: 87
        -- upvalues: u2 (ref), u7 (copy), u4 (copy)
        u2.unmount(u7);
        u4:DoCleaning();
    end;
end;