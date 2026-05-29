local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local v5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "TeamBuffKnitController"
    end,
    ["__index"] = u3
})
v5.__index = v5
function v5.constructor(p6) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p6)
    p6.Name = "GameKnitController"
    p6.disabled = true
end
function v5.KnitStart(p7) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v8, v9 = u2.Controllers.MatchController:getQueueTypeAsync():await()
    if v8 then
        local v10 = u4(v9).disabledFeatures
        if v10 ~= nil then
            v10 = v10.disableTeamBuff
        end
        local v11 = not v10
        if v11 then
            v11 = not p7.disabled
        end
        if v11 then
            p7:onGameInit()
        end
    end
end
function v5.onGameInit(_) --[[ Line: 42 ]] end
return {
    ["TeamBuffKnitController"] = v5
}