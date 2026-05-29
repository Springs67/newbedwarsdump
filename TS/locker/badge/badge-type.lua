local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.NONE = "None"
v2.None = "NONE"
local v4 = {}
for v5, v6 in v1 do
    v4[v5] = v6
end
for v7, v8 in v3 do
    v4[v7] = v8
end
return {
    ["BadgeType"] = v4
}