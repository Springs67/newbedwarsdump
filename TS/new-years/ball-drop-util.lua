local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.RunService
local u4 = v2.Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "BallDropUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 19 ]] end
function u6.getTimeToNextBallDropSec(_) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
    --]]
    local v9 = u4:GetServerTimeNow()
    local v10 = (u5.isStaging() or u3:IsStudio()) and 60 or 3600
    local v11
    if u5.isStaging() or u3:IsStudio() then
        v11 = 1766005190
    else
        v11 = 1767142790
    end
    while v11 <= v9 do
        v11 = v11 + v10
    end
    return v11 - v9
end
u6.isEnabled = false
return {
    ["BallDropUtil"] = u6
}