-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteImage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-image").EmoteImage;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), EmoteImage (copy), EmoteType (copy)
    local u3 = u1.mount(u1.createElement(EmoteImage, {
        Emote = EmoteType.ANGRY_BUILDER
    }), p2);

    return function() -- Line: 10
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;