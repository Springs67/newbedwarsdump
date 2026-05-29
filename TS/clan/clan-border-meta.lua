local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NONE = 0
v1[0] = "NONE"
v2.SILVER = 1
v1[1] = "SILVER"
v2.GOLD = 2
v1[2] = "GOLD"
v2.WANTED = 3
v1[3] = "WANTED"
local u3 = {
    [v2.NONE] = {
        ["title"] = "No border",
        ["unlockRequirement"] = {
            ["type"] = "None"
        }
    },
    [v2.SILVER] = {
        ["title"] = "Silver Clan Border",
        ["borderImage"] = "rbxassetid://81095383860957",
        ["unlockRequirement"] = {
            ["type"] = "ClanLevel",
            ["requiredLevel"] = 6
        }
    },
    [v2.GOLD] = {
        ["title"] = "Gold Clan Border",
        ["borderImage"] = "rbxassetid://101992866006332",
        ["unlockRequirement"] = {
            ["type"] = "ClanLevel",
            ["requiredLevel"] = 10
        }
    },
    [v2.WANTED] = {
        ["title"] = "Wanted Clan Border",
        ["borderImage"] = "rbxassetid://72552188769455",
        ["unlockRequirement"] = {
            ["type"] = "Exclusive"
        }
    }
}
return {
    ["isClanBorderUnlocked"] = function(p4, p5) --[[ Name: isClanBorderUnlocked, Line 48 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        local v6 = u3[p4].unlockRequirement
        local v7 = v6.type
        if v7 == "None" then
            return true
        end
        if v7 == "ClanLevel" then
            return p5.level >= v6.requiredLevel
        end
        if v7 == "Exclusive" then
            return false
        end
    end,
    ["ClanBorderType"] = v2,
    ["ClanBorderMeta"] = u3
}