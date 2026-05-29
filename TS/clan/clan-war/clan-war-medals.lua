local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.GOLD = "gold"
v1.gold = "GOLD"
v2.SILVER = "silver"
v1.silver = "SILVER"
v2.BRONZE = "bronze"
v1.bronze = "BRONZE"
local u3 = {
    [v2.BRONZE] = {
        ["icon"] = "rbxassetid://115001367845176",
        ["percentageDiffToTop"] = 30,
        ["points"] = 1
    },
    [v2.SILVER] = {
        ["icon"] = "rbxassetid://89996353305463",
        ["percentageDiffToTop"] = 15,
        ["points"] = 2
    },
    [v2.GOLD] = {
        ["icon"] = "rbxassetid://89422161604410",
        ["percentageDiffToTop"] = 5,
        ["points"] = 3
    }
}
return {
    ["ClanWarMedal"] = v2,
    ["ClanWarMedalMeta"] = u3,
    ["getClanWarMedalMetadata"] = function(p4) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p4]
    end
}