local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, script.Parent, "kill-feed-app").KillFeed
local u7 = v1.import(script, script.Parent, "kill-feed-card", "kill-feed-card").KillFeedCard
return function(u8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u5
        [4] = u3
        [5] = u6
        [6] = u7
    --]]
    local u9 = u2.new()
    local v10 = {
        ["localPlayerIsKiller"] = true,
        ["multiKillCount"] = 6,
        ["killer"] = {
            ["name"] = "Spleenhook",
            ["teamId"] = "4"
        },
        ["victim"] = {
            ["name"] = "Luke",
            ["teamId"] = "1"
        },
        ["killIcons"] = { u4.killfeed.sword },
        ["killPayout"] = {
            [u5.IRON] = {
                ["amount"] = 354
            },
            [u5.EMERALD] = {
                ["amount"] = 35
            },
            [u5.DIAMOND] = {
                ["amount"] = 16
            }
        }
    }
    local v11 = {
        ["multiKillCount"] = 2,
        ["killer"] = {
            ["name"] = "Spleenhook_Spleenhook",
            ["teamId"] = "4"
        },
        ["victim"] = {
            ["name"] = "Sprux",
            ["teamId"] = "1"
        },
        ["killIcons"] = { u4.killfeed.sword, u4.SKULL_LINE_ICON }
    }
    local u12 = u3.mount(u3.createElement(u6, {}, { u3.createElement(u7, {
            ["KillFeedData"] = v10
        }), u3.createElement(u7, {
            ["KillFeedData"] = v11
        }) }), u8)
    task.delay(1, function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u7
            [4] = u8
        --]]
        local v13 = {
            ["KillFeedData"] = {
                ["killer"] = {
                    ["name"] = "Sprux",
                    ["teamId"] = "1"
                },
                ["victim"] = {
                    ["name"] = "Bryan3838",
                    ["teamId"] = "2"
                },
                ["killIcons"] = { u4.killfeed.sword }
            }
        }
        u3.mount(u3.createElement(u7, v13), u8:FindFirstChild("KillFeedContainer"))
    end)
    task.delay(2, function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u7
            [4] = u8
        --]]
        local v14 = {
            ["KillFeedData"] = {
                ["killer"] = {
                    ["name"] = "Spleenhook_Spleenhook",
                    ["teamId"] = "3"
                },
                ["victim"] = {
                    ["name"] = "Sprux",
                    ["teamId"] = "1"
                },
                ["killIcons"] = { u4.killfeed.sword }
            }
        }
        u3.mount(u3.createElement(u7, v14), u8:FindFirstChild("KillFeedContainer"))
    end)
    return function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u12
            [3] = u9
        --]]
        u3.unmount(u12)
        u9:DoCleaning()
    end
end