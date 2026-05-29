local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
return {
    ["getPlayerTeamId"] = function(p6) --[[ Name: getPlayerTeamId, Line 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
        --]]
        if u5:IsClient() then
            local v7 = u3.Controllers.TeamController:getPlayerTeam(p6)
            if v7 ~= nil then
                v7 = v7.id
            end
            return v7
        else
            local v8 = u4.Services.TeamService:getTeam(p6)
            if v8 ~= nil then
                v8 = v8:getId()
            end
            return v8
        end
    end
}