-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta");
local getMinigameMeta = v2.getMinigameMeta;
local MinigameType = v2.MinigameType;
local MinigameInfo = RuntimeLib.import(script, script.Parent, "minigame-info").MinigameInfo;

return function(p3) -- Line: 8
    -- upvalues: u1 (copy), MinigameInfo (copy), getMinigameMeta (copy), MinigameType (copy)
    local u4 = u1.mount(u1.createElement(MinigameInfo, {
        minigame = getMinigameMeta(MinigameType.SNOWBALL_DODGEBALL),
        startTime = os.time() + 10
    }), p3);

    return function() -- Line: 13
        -- upvalues: u1 (ref), u4 (copy)
        return u1.unmount(u4);
    end;
end;