-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local RadialWheel = RuntimeLib.import(script, script.Parent, "radial-wheel").RadialWheel;

return function(p2) -- Line: 9
    -- upvalues: u1 (copy), EmoteShowcase (copy), EmoteType (copy), EmoteMeta (copy), Empty (copy), RadialWheel (copy)
    local u3 = 0;
    local v4 = false;
    local v5 = {};

    while true do
        if v4 then
            u3 = u3 + 1;
        else
            v4 = true;
        end;

        if u3 >= 8 then
            local u6 = u1.mount(u1.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, { u1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), u1.createElement(RadialWheel, {
                    numSlices = 8,
                    entries = v5
                }) }), p2);

            return function() -- Line: 49
                -- upvalues: u1 (ref), u6 (copy)
                return u1.unmount(u6);
            end;
        end;

        local v7 = {
            element = u1.createElement(EmoteShowcase, {
                Emote = EmoteType.ACADEMY_AERY_READ
            }),
            title = EmoteMeta[EmoteType.ACADEMY_AERY_READ].name,

            onSelect = function() -- Line: 29, Name: onSelect
                -- upvalues: u3 (ref)
                return print("Entry " .. tostring(u3));
            end
        };
        table.insert(v5, v7);
        u3 = u3;
    end;
end;