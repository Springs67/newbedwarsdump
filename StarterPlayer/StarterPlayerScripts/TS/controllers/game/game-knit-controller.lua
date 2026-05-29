local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "GameKnitController"
    end,
    ["__index"] = u3
})
v6.__index = v6
function v6.constructor(p7, p8) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7)
    p7.gameTypes = p8
    p7.Name = "GameKnitController"
end
function v6.KnitStart(p9) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
    --]]
    if not u5.isGameServer() then
        return nil
    end
    local v10, v11 = u2.Controllers.MatchController:getQueueTypeAsync():await()
    if v10 then
        local v12 = u4(v11)
        local v13 = p9.gameTypes
        local v14 = v12.game
        if table.find(v13, v14) ~= nil then
            p9:onGameInit()
        end
    end
end
function v6.onGameInit(_) --[[ Line: 40 ]] end
return {
    ["GameKnitController"] = v6
}