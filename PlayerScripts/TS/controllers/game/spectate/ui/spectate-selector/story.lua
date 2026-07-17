-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local SpectateSelector = RuntimeLib.import(script, script.Parent, "spectate-selector").SpectateSelector;

return function(p2) -- Line: 8
    -- upvalues: CreateRoduxApp (copy), SpectateSelector (copy), ClientStore (copy), OfflinePlayerUtil (copy), u1 (copy)
    local u3 = CreateRoduxApp("spectate-selector", SpectateSelector, {}, {}, {
        Parent = p2
    });
    ClientStore:dispatch({
        type = "GameSetSpectator",
        spectating = true,
        spectatingPlayer = OfflinePlayerUtil.Dummy.SnickTrix
    });

    return function() -- Line: 17
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;