local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-generator-type").MissionGenerator
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "base-missions-generator").BaseMissionsGenerator
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "BedCoinMissionsGenerator"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
    --]]
    u4.constructor(p8, u3.BEDCOIN, {
        {
            ["name"] = "Kill %s players",
            ["stages"] = {
                {
                    ["type"] = "PlayerKill",
                    ["progress"] = 3
                }
            }
        },
        {
            ["name"] = "Deal %s player damage",
            ["stages"] = {
                {
                    ["type"] = "PlayerDamage",
                    ["progress"] = 500
                }
            }
        },
        {
            ["name"] = "Play %s games",
            ["stages"] = {
                {
                    ["type"] = "GamePlay",
                    ["progress"] = 2
                }
            }
        },
        {
            ["name"] = "Play %s seconds of gameplay",
            ["stages"] = {
                {
                    ["type"] = "GamePlayTime",
                    ["progress"] = 600
                }
            }
        }
    }, {
        {
            ["name"] = "Kill %s players",
            ["stages"] = {
                {
                    ["type"] = "PlayerKill",
                    ["progress"] = 25
                }
            }
        },
        {
            ["name"] = "Deal %s player damage",
            ["stages"] = {
                {
                    ["type"] = "PlayerDamage",
                    ["progress"] = 4000
                }
            }
        },
        {
            ["name"] = "Play %s games",
            ["stages"] = {
                {
                    ["type"] = "GamePlay",
                    ["progress"] = 15
                }
            }
        },
        {
            ["name"] = "Play %s seconds of gameplay",
            ["stages"] = {
                {
                    ["type"] = "GamePlayTime",
                    ["progress"] = 3600
                }
            }
        }
    }, {
        ["numDailyMissions"] = 2,
        ["numWeeklyMissions"] = 1,
        ["dailyMissionAmount"] = 500,
        ["weeklyMissionAmount"] = 1000,
        ["icon"] = u2.BED_COIN_ICON
    })
end
function u5.onGenerateDailyMissions(u9, p10) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local function v13(p11) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        local v12 = {
            ["name"] = "Bed Coins",
            ["icon"] = u2.BED_COIN_ICON,
            ["rewards"] = {
                {
                    ["bedCoins"] = u9:getDailyMissionRewardAmount()
                }
            }
        }
        p11.reward = v12
    end
    for v14, v15 in p10 do
        v13(v15, v14 - 1, p10)
    end
    return p10
end
function u5.onGenerateWeeklyMissions(u16, p17) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local function v20(p18) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
        --]]
        local v19 = {
            ["name"] = "Bed Coins",
            ["icon"] = u2.BED_COIN_ICON,
            ["rewards"] = {
                {
                    ["bedCoins"] = u16:getWeeklyMissionRewardAmount()
                }
            }
        }
        p18.reward = v19
    end
    for v21, v22 in p17 do
        v20(v22, v21 - 1, p17)
    end
    return p17
end
return {
    ["BedCoinMissionsGenerator"] = u5,
    ["BedCoinMissionsStore"] = u5.new()
}