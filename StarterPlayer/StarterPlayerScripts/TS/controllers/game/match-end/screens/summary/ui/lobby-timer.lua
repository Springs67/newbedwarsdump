local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "client", "ui", "lib", "components", "basic-countdown-card").BasicCountdownCard
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
return {
    ["LobbyTimer"] = v5.new(u4)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u4
            [4] = u2
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local v11, u12 = v9(0)
        local v13, u14 = v9(0)
        v10(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u6
                [3] = u12
                [4] = u14
            --]]
            local v15 = u3.Controllers.MatchController:getCustomMatchConfig()
            if v15 ~= nil then
                v15 = v15.queueType
            end
            local v16
            if v15 then
                v16 = u6(v15)
            else
                v16 = nil
            end
            if v16 ~= nil then
                v16 = v16.lobbyDelaySecs
            end
            u12(v16 == nil and 30 or v16)
            u14(os.time())
        end, {})
        return u4.createElement(u2, {
            ["Text"] = "Returning to Lobby in {0}",
            ["EndTime"] = v13 + v11,
            ["Size"] = p7.Size or UDim2.fromScale(0.3, 1),
            ["Position"] = p7.Position or UDim2.new(0.5, 0, 0, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        })
    end)
}