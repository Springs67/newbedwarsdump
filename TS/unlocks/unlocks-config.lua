local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v2 = {}
local u3 = {
    ["startTime"] = 1757714400,
    ["endTime"] = 1757973600
}
v2.FreeKitsEvent = u3
function v2.isFreeKitsEventActive() --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    if u3 == nil then
        return false
    else
        return u1:GetServerTimeNow() >= u3.startTime and u1:GetServerTimeNow() <= u3.endTime
    end
end
return {
    ["UnlocksConfig"] = v2
}