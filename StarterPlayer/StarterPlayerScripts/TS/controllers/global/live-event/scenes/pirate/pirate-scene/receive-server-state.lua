local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["ReceiveServerStateBehavior"] = {
        ["name"] = "Receive server state",
        ["priority"] = 100,
        ["event"] = "Heartbeat",
        ["init"] = function(u2) --[[ Name: init, Line 8 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            u1.Client:GetNamespace("PirateSceneRemotes"):Get("RequestPirateSceneServerState"):CallServerAsync():andThen(function(p3) --[[ Line: 9 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                u2:set("hannahModel", p3.hannah)
                u2:set("smokeModel", p3.smoke)
                u2:set("daveyModel", p3.davey)
            end)
            u1.Client:GetNamespace("PirateSceneRemotes"):OnEvent("PirateSceneServerStateChange", function(p4) --[[ Line: 14 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                u2:set("hannahModel", p4.hannah)
                u2:set("smokeModel", p4.smoke)
                u2:set("daveyModel", p4.davey)
            end)
        end,
        ["func"] = function(_, _, _) --[[ Name: func, Line 20 ]] end
    }
}