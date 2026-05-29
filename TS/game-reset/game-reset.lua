local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v16 = {
    ["isDSTActiveInPST"] = function() --[[ Line: 14 ]]
        local v4 = os.date("!*t")
        local v5 = v4.year
        local function v11(p6, p7, p8) --[[ Line: 19 ]]
            local v9 = os.time({
                ["day"] = 1,
                ["hour"] = 2,
                ["year"] = p6,
                ["month"] = p7
            })
            local v10 = (8 - os.date("*t", v9).wday) % 7
            return v9 + ((p8 - 1) * 7 + v10) * 86400
        end
        local v12 = v11(v5, 3, 2)
        local v13 = v11(v5, 11, 1)
        local v14 = os.time(v4)
        local v15
        if v12 <= v14 then
            v15 = v14 < v13
        else
            v15 = false
        end
        return v15
    end
}
local v17 = v2.new
local v18
if v3:IsStudio() then
    v18 = os.time() + 60
else
    v18 = (v16.isDSTActiveInPST() and 0 or 3600) + 1683324000
end
local u19 = v17(v18)
v16.resetTime = u19
function v16.getResetTimeManager() --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return u19
end
return {
    ["GameReset"] = v16
}