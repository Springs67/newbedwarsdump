-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local TrackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType;
local PlayerHighlightsWrapper = RuntimeLib.import(script, script.Parent, "player-highlights").PlayerHighlightsWrapper;

return function(p2) -- Line: 8
    -- upvalues: CreateRoduxApp (copy), PlayerHighlightsWrapper (copy), TrackType (copy), OfflinePlayerUtil (copy), u1 (copy)
    local u3 = CreateRoduxApp("PlayerHighlights", PlayerHighlightsWrapper, {
        cards = {
            {
                amount = 33,
                trackType = TrackType.BLOCKBREAKS,
                player = OfflinePlayerUtil.Dummy.Asen
            },
            {
                amount = 420,
                trackType = TrackType.DAMAGE,
                player = OfflinePlayerUtil.Dummy.oiogy
            },
            {
                amount = 7,
                trackType = TrackType.KILLS,
                player = OfflinePlayerUtil.Dummy.Bryan3838
            }
        }
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 26
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;