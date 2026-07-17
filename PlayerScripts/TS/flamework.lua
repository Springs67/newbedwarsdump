-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;

return {
    setup = function(p1) -- Line: 5, Name: setup
        -- upvalues: Flamework (copy), PlaceUtil (copy)
        local function _(p2) -- Line: 7
            -- upvalues: Flamework (ref)
            Flamework.registerExternalClass(p2);
        end;

        for i, v in p1 do
            local _ = i - 1;
            Flamework.registerExternalClass(v);
        end;

        Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "global" });
        Flamework._addPaths({ "ReplicatedStorage", "TS", "components" });
        Flamework._addPaths({ "ReplicatedStorage", "TS", "strollers" });

        if PlaceUtil.isLobbyServer() then
            Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "lobby" });
        end;

        if PlaceUtil.isAfkServer() then
            Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "afk-place" });
        end;

        if PlaceUtil.isGameServer() then
            Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "game" });
            Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "games", "bedwars" });
        end;

        Flamework.ignite();
    end
};