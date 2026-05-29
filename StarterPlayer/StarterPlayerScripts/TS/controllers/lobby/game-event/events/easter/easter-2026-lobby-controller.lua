local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-eggs").EggHunt2026EggMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-meta").EggHunt2026MilestoneMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-reward-meta").Easter2026MilestoneRewardMeta
local u8 = v1.import(script, script.Parent, "egg-hunt-lobby-controller").EggHuntLobbyController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "Easter2026Controller"
    end,
    ["__index"] = u8
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u5
        [4] = u6
        [5] = u7
        [6] = u3
    --]]
    u8.constructor(p12, u4.EGG_HUNT_2026, u5, u6, u7, u3.Assets.Misc.Easter2026.Eggs)
    p12.Name = "Easter2026Controller"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p13)
end
v2.CreateController(u9.new())
return nil