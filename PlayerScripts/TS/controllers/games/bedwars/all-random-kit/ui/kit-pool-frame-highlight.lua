-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    KitPoolFrameHighlight = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 6
        -- upvalues: u1 (copy), Empty (copy)
        local useEffect = p3.useEffect;
        local u4, u5 = p3.useState(false);
        useEffect(function() -- Line: 10
            -- upvalues: u4 (copy), u2 (copy)
            if u4 and u2.OnHover then
                u2.OnHover();
            end;
        end, { u4 });
        local v6 = {
            Size = UDim2.fromScale(1, 1),

            [u1.Event.MouseEnter] = function() -- Line: 17
                -- upvalues: u5 (copy)
                return u5(true);
            end,

            [u1.Event.MouseLeave] = function() -- Line: 20
                -- upvalues: u5 (copy)
                return u5(false);
            end
        };
        local v7 = {};
        local v8 = #v7;
        local v9 = u2[u1.Children];

        if v9 then
            for i, v in v9 do
                if type(i) == "number" then
                    v7[v8 + i] = v;
                else
                    v7[i] = v;
                end;
            end;
        end;

        local v10 = #v7;

        if u4 then
            u4 = u1.createElement("UIStroke", {
                Transparency = 0,
                Thickness = 3,
                Color = Color3.fromRGB(255, 240, 69)
            }, { u1.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
                }) });
        end;

        if u4 then
            v7[v10 + 1] = u4;
        end;

        return u1.createElement(Empty, v6, v7);
    end)
};