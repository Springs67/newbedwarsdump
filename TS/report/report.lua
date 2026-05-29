local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.PENDING = "PENDING"
v1.PENDING = "PENDING"
v2.BANNED = "BANNED"
v1.BANNED = "BANNED"
v2.AQUITTED = "AQUITTED"
v1.AQUITTED = "AQUITTED"
return {
    ["ReportTicketResult"] = v2
}