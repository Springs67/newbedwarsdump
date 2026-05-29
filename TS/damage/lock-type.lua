local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.OWL = 0
v1[0] = "OWL"
v2.DRILL = 1
v1[1] = "DRILL"
v2.PEEK = 2
v1[2] = "PEEK"
v2.TUTORIAL = 3
v1[3] = "TUTORIAL"
v2.SQUAD_LAUNCHER = 4
v1[4] = "SQUAD_LAUNCHER"
v2.BALLISTA = 5
v1[5] = "BALLISTA"
return {
    ["LockType"] = v2
}