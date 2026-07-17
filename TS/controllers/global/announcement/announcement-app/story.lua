-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnnouncementVariant = v1.AnnouncementVariant;
local TextAnnouncementBordered = v1.TextAnnouncementBordered;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return function(p3) -- Line: 7
    -- upvalues: AnnouncementVariant (copy), u2 (copy), TextAnnouncementBordered (copy)
    local v4 = AnnouncementVariant.text({
        message = "Test Announcement",
        duration = 5,
        variant = "textWithBG",
        textlabel = {
            props = {
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.6)
            },
            tween = {
                disabled = true
            }
        },
        position = UDim2.fromScale(0.5, 0.2)
    });
    local u5 = u2.mount(u2.createElement(TextAnnouncementBordered, {
        Announcement = v4
    }), p3);

    return function() -- Line: 26
        -- upvalues: u2 (ref), u5 (copy)
        return u2.unmount(u5);
    end;
end;