-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local SpiritSummonerDisplay = RuntimeLib.import(script, script.Parent, "spirit-summoner-display").SpiritSummonerDisplay;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), SpiritSummonerDisplay (copy)
    local u3 = u1.mount(u1.createElement(SpiritSummonerDisplay), p2);

    return function() -- Line: 7
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;