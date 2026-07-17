-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local GlitchedMatchAnnouncement = RuntimeLib.import(script, script.Parent, "glitched-match-announcement").GlitchedMatchAnnouncement;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), GlitchedMatchAnnouncement (copy)
    local u3 = u1.mount(u1.createElement(GlitchedMatchAnnouncement, {
        tonedDownEffects = true
    }), p2);

    return function() -- Line: 9
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;