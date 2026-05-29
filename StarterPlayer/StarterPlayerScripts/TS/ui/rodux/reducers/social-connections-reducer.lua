local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u2 = {
    ["supportTasks"] = {
        ["joinedGroup"] = false
    },
    ["connections"] = {
        ["discord"] = {
            ["verificationCode"] = "",
            ["validated"] = false,
            ["legacyDiscordVerification"] = false
        }
    }
}
return {
    ["SocialConnectionsReducer"] = function(p3, p4) --[[ Name: SocialConnectionsReducer, Line 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        if p3 == nil then
            p3 = u2
        end
        local v5 = {}
        for v6, v7 in p3 do
            v5[v6] = v7
        end
        local v8 = p4.type
        if v8 == "SocialConnectionsSetAll" then
            v5.supportTasks = p4.supportTasks
            v5.connections = p4.connections
            return v5
        end
        if v8 == "SetAllSupportTasks" then
            v5.supportTasks = p4.supportTasks
            return v5
        end
        if v8 == "SetAllConnections" then
            v5.connections = p4.connections
            return v5
        end
        if v8 == "SetSomeSupportTasks" then
            for _, v9 in u1.keys(p4.supportTasks) do
                v5.supportTasks[v9] = p4.supportTasks[v9]
            end
            return v5
        end
        if v8 == "SetSomeConnections" then
            for _, v10 in u1.keys(p4.connections) do
                v5.connections[v10] = p4.connections[v10]
            end
            return v5
        end
        if v8 ~= "SetDiscordValidated" then
            return v5
        end
        v5.connections.discord.validated = p4.validated
        return v5
    end
}