local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local v7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "MapKnitController"
    end,
    ["__index"] = u5
})
v7.__index = v7
function v7.constructor(p8, p9) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p8)
    p8.maps = p9
    p8.Name = "MapKnitControler"
end
function v7.KnitStart(u10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u3
        [4] = u4
        [5] = u6
    --]]
    u5.KnitStart(u10)
    task.spawn(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
            [3] = u3
            [4] = u4
            [5] = u6
        --]]
        local v11 = u2.Controllers.MapController:waitForMapName()
        local v12 = nil
        for v13, v14 in u10.maps do
            local _ = v13 - 1
            if u3.includes(string.lower(v11), string.lower(v14)) == true then
                v12 = v14
                break
            end
        end
        if v12 == "" or not v12 then
            return nil
        end
        u10:onMapInit()
        u4.MatchStateChange:connect(function(p15) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u10
            --]]
            if p15.matchState == u6.RUNNING then
                u10:onMatchStart()
            end
        end)
    end)
end
return {
    ["MapKnitController"] = v7
}