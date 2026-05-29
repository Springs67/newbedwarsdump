local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ILLUMINATOR = "illuminator"
v1.illuminator = "ILLUMINATOR"
v2.MAZE_RUNNER_1 = "maze_runner_1"
v1.maze_runner_1 = "MAZE_RUNNER_1"
v2.MAZE_RUNNER_2 = "maze_runner_2"
v1.maze_runner_2 = "MAZE_RUNNER_2"
v2.MAZE_RUNNER_3 = "maze_runner_3"
v1.maze_runner_3 = "MAZE_RUNNER_3"
return {
    ["MazeRoleName"] = v2
}