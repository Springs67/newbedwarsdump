local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "murderer-game", "murderer-balance").MurdererBalance
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.IDLE = "idle"
v6.idle = "IDLE"
v7.REPAIRING = "repairing"
v6.repairing = "REPAIRING"
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "MurderGameConstants"
    end
})
u8.__index = u8
function u8.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(_) --[[ Line: 30 ]] end
function u8.getBedStageInfo(_, p11) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p11 < 1 then
        return nil
    elseif #u8.BED_REPAIR_STAGES < p11 then
        return nil
    else
        return u8.BED_REPAIR_STAGES[p11 - 1 + 1]
    end
end
function u8.getRoleColor(p12, p13) --[[ Line: 41 ]]
    return p12.roleColors[p13]
end
u8.BED_REPAIR_STAGES = {
    {
        ["name"] = "Mattress",
        ["cost"] = 4,
        ["currency"] = v3.WOOL_WHITE,
        ["repairDuration"] = v2:IsStudio() and 1 or 30
    },
    {
        ["name"] = "Blanket",
        ["cost"] = 8,
        ["currency"] = v3.WOOL_WHITE,
        ["repairDuration"] = v2:IsStudio() and 1 or 45
    },
    {
        ["name"] = "Pillow",
        ["cost"] = 16,
        ["currency"] = v3.WOOL_WHITE,
        ["repairDuration"] = v2:IsStudio() and 1 or 70
    }
}
local v14 = {
    [v5.CIVILIAN] = { "Find and eliminate the murderers", "Shear sheep to get wool", "Use wool to repair the bed" },
    [v5.SHERIFF] = { "Find and eliminate the murderers", "Shear sheep to get wool", "Use wool to repair the bed" }
}
local v15 = v5.MURDERER
local v16 = {}
local v17 = v4.MURDERER_KILL_COOLDOWN
__set_list(v16, 1, {"Kill all innocents", tostring(v17) .. " second kill cooldown", "Prevent the bed from getting repaired"})
v14[v15] = v16
u8.ROLE_INSTRUCTIONS = v14
u8.NUM_SHERIFFS = 1
u8.ROLE_REVEAL_DISPLAY_DURATION = 9
u8.GAME_NAME = "Murder in Bedtown"
u8.roleColors = {
    [v5.CIVILIAN] = Color3.fromRGB(73, 180, 242),
    [v5.MURDERER] = Color3.fromRGB(255, 69, 69),
    [v5.SHERIFF] = Color3.fromRGB(74, 242, 112)
}
return {
    ["MurderBedState"] = v7,
    ["MurderGameConstants"] = u8
}