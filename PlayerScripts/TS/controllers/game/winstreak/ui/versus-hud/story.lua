-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local VersusHud = RuntimeLib.import(script, script.Parent, "versus-hud").VersusHud;

return function(p2) -- Line: 8
    -- upvalues: OfflinePlayerUtil (copy), Theme (copy), BedwarsImageId (copy), u1 (copy), VersusHud (copy)
    local u3 = u1.mount(u1.createElement(VersusHud, {
        TeamA = {
            Name = "AsenDevIsSuperCool",
            offlinePlayer = OfflinePlayerUtil.Dummy.Asen,
            teamColor = Theme.mcAqua,
            stat = {
                value = 3,
                icon = BedwarsImageId.WINSTREAK
            }
        },
        TeamB = {
            Name = "Sprux",
            offlinePlayer = OfflinePlayerUtil.Dummy.oiogy,
            teamColor = Theme.mcGreen,
            stat = {
                value = 5,
                icon = BedwarsImageId.WINSTREAK
            }
        }
    }), p2);

    return function() -- Line: 31
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;