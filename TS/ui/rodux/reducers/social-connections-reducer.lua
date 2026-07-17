-- Decompiled with Potassium's decompiler.

local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = {
    supportTasks = {
        joinedGroup = false
    },
    connections = {
        discord = {
            verificationCode = "",
            validated = false,
            legacyDiscordVerification = false
        }
    }
};

return {
    SocialConnectionsReducer = function(p3, p4) -- Line: 16, Name: SocialConnectionsReducer
        -- upvalues: u2 (copy), u1 (copy)
        if p3 == nil then
            p3 = u2;
        end;

        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        local type = p4.type;

        if type == "SocialConnectionsSetAll" then
            v5.supportTasks = p4.supportTasks;
            v5.connections = p4.connections;

            return v5;
        end;

        if type == "SetAllSupportTasks" then
            v5.supportTasks = p4.supportTasks;

            return v5;
        end;

        if type == "SetAllConnections" then
            v5.connections = p4.connections;

            return v5;
        end;

        if type == "SetSomeSupportTasks" then
            for _, v in u1.keys(p4.supportTasks) do
                v5.supportTasks[v] = p4.supportTasks[v];
            end;

            return v5;
        end;

        if type == "SetSomeConnections" then
            for _, v in u1.keys(p4.connections) do
                v5.connections[v] = p4.connections[v];
            end;

            return v5;
        end;

        if type ~= "SetDiscordValidated" then
            return v5;
        end;

        v5.connections.discord.validated = p4.validated;

        return v5;
    end
};