local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.WIN = "win"
v1.win = "WIN"
v2.LOSS = "loss"
v1.loss = "LOSS"
return {
    ["MatchOutcome"] = v2
}