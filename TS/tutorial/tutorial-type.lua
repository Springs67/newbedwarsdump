local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.BEGINNER = "beginner"
v1.beginner = "BEGINNER"
return {
    ["TutorialType"] = v2
}