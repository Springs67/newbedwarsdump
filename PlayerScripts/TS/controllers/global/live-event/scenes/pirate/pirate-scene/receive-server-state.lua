-- Decompiled with Potassium's decompiler.

local default = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    ReceiveServerStateBehavior = {
        name = "Receive server state",
        priority = 100,
        event = "Heartbeat",

        init = function(u1) -- Line: 8, Name: init
            -- upvalues: default (copy)
            default.Client:GetNamespace("PirateSceneRemotes"):Get("RequestPirateSceneServerState"):CallServerAsync():andThen(function(p2) -- Line: 9
                -- upvalues: u1 (copy)
                u1:set("hannahModel", p2.hannah);
                u1:set("smokeModel", p2.smoke);
                u1:set("daveyModel", p2.davey);
            end);
            default.Client:GetNamespace("PirateSceneRemotes"):OnEvent("PirateSceneServerStateChange", function(p3) -- Line: 14
                -- upvalues: u1 (copy)
                u1:set("hannahModel", p3.hannah);
                u1:set("smokeModel", p3.smoke);
                u1:set("daveyModel", p3.davey);
            end);
        end,

        func = function(p4, p5, p6) -- Line: 20, Name: func
        end
    }
};