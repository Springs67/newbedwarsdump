-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local MurderGameRole = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole;
local MurdererMatchEndScreen = RuntimeLib.import(script, script.Parent, "murderer-match-end-screen").MurdererMatchEndScreen;

return function(p2) -- Line: 7
    -- upvalues: u1 (copy), MurdererMatchEndScreen (copy), MurderGameRole (copy), OfflinePlayerUtil (copy)
    local u3 = u1.mount(u1.createElement(MurdererMatchEndScreen, {
        Roles = {
            [MurderGameRole.CIVILIAN] = {
                OfflinePlayerUtil.Dummy.oiogy,
                OfflinePlayerUtil.Dummy.Chase,
                OfflinePlayerUtil.Dummy.DVwastaken,
                OfflinePlayerUtil.Dummy.Bryan3838,
                OfflinePlayerUtil.Dummy.JKJ,
                OfflinePlayerUtil.Dummy.Midciel,
                OfflinePlayerUtil.Dummy.Vorlias,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.SteamPulse
            },
            [MurderGameRole.SHERIFF] = { OfflinePlayerUtil.Dummy.SnickTrix },
            [MurderGameRole.MURDERER] = { OfflinePlayerUtil.Dummy.Asen, OfflinePlayerUtil.Dummy.spleenhook }
        },
        Eliminations = {
            {
                killer = {
                    offlinePlayer = OfflinePlayerUtil.Dummy.Chase,
                    role = MurderGameRole.CIVILIAN
                },
                victim = {
                    offlinePlayer = OfflinePlayerUtil.Dummy.spleenhook,
                    role = MurderGameRole.MURDERER
                },
                time = os.time() - 60
            },
            {
                killer = {
                    offlinePlayer = OfflinePlayerUtil.Dummy.Midciel,
                    role = MurderGameRole.CIVILIAN
                },
                victim = {
                    offlinePlayer = OfflinePlayerUtil.Dummy.Asen,
                    role = MurderGameRole.MURDERER
                },
                time = os.time() - 60
            },
            {
                killer = {
                    offlinePlayer = OfflinePlayerUtil.Dummy.spleenhook,
                    role = MurderGameRole.MURDERER
                },
                victim = {
                    offlinePlayer = OfflinePlayerUtil.Dummy.SnickTrix,
                    role = MurderGameRole.SHERIFF
                },
                time = os.time() - 60
            }
        }
    }), p2);

    return function() -- Line: 46
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;