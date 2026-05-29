local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
return {
    ["CombinedKitUtil"] = {
        ["isInCombinedKitMatch"] = function() --[[ Name: isInCombinedKitMatch, Line 11 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u6
                [4] = u3
            --]]
            if u5:IsServer() then
                local v7 = u4.Services.MatchService:getQueueMeta()
                if v7 ~= nil then
                    v7 = v7.game
                end
                return v7 == u6.COMBINED_KIT
            else
                local v8 = u3.Controllers.MatchController:getQueueMeta()
                if v8 ~= nil then
                    v8 = v8.game
                end
                return v8 == u6.COMBINED_KIT
            end
        end
    }
}