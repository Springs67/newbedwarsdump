local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.KillHider = 0
v1[0] = "KillHider"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.TauntSound = 0
v3[0] = "TauntSound"
v4.TauntFirework = 1
v3[1] = "TauntFirework"
v4.KillHunter = 2
v3[2] = "KillHunter"
v4.Win = 3
v3[3] = "Win"
v4.Alive = 4
v3[4] = "Alive"
local u5 = {
    [v2.KillHider] = 40
}
local u6 = {
    [v4.TauntSound] = 5,
    [v4.Alive] = 10,
    [v4.TauntFirework] = 10,
    [v4.KillHunter] = 80,
    [v4.Win] = 100
}
return {
    ["HunterScoreType"] = v2,
    ["HiderScoreType"] = v4,
    ["getHiderCurrency"] = function(p7) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6[p7]
    end,
    ["getHunterCurrency"] = function(p8) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p8]
    end
}