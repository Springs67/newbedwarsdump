local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.BATTLEPASS = "battlepass"
v2.battlepass = "BATTLEPASS"
v3.BEDCOIN = "bedcoin"
v2.bedcoin = "BEDCOIN"
local v4 = {}
for v5, v6 in v3 do
    v4[v5] = v6
end
for v7, v8 in v1 do
    v4[v7] = v8
end
return {
    ["MissionGenerator"] = v4
}