local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Spectator = "Spectator"
v1.Spectator = "Spectator"
v2.AllowPick = "AllowPick"
v1.AllowPick = "AllowPick"
v2.Random = "Random"
v1.Random = "Random"
v2.SmallestTeam = "SmallestTeam"
v1.SmallestTeam = "SmallestTeam"
return {
    ["LateJoinSetting"] = v2
}