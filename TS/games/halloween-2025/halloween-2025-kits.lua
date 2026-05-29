local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NONE = "none"
v1.none = "NONE"
v2.WHISPER = "whisper"
v1.whisper = "WHISPER"
v2.MELODY = "melody"
v1.melody = "MELODY"
v2.SUMMONER = "summoner"
v1.summoner = "SUMMONER"
v2.NAZAR = "nazar"
v1.nazar = "NAZAR"
v2.REBELLION_LEADER = "rebellion_leader"
v1.rebellion_leader = "REBELLION_LEADER"
v2.SORCERER = "sorcerer"
v1.sorcerer = "SORCERER"
return {
    ["HalloweenKit"] = v2
}