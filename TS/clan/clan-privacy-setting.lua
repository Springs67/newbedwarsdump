local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.INVITE_ONLY = "invite_only"
v1.invite_only = "INVITE_ONLY"
v2.ANYONE_CAN_JOIN = "anyone_can_join"
v1.anyone_can_join = "ANYONE_CAN_JOIN"
return {
    ["ClanPrivacySetting"] = v2
}