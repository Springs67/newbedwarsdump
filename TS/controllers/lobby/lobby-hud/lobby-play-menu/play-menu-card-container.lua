-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PlayMenuCard = RuntimeLib.import(script, script.Parent, "play-menu-card").PlayMenuCard;

return {
    PlayMenuCardContainer = v2.new(u1)(function(u3) -- Line: 7
        -- upvalues: u1 (copy), PlayMenuCard (copy), Empty (copy)
        local Cards = u3.Cards;

        local function v8(p4, p5) -- Line: 9
            -- upvalues: u3 (copy), u1 (ref), PlayMenuCard (ref)
            local v6 = #u3.Cards;
            local v7 = {};

            for i, v in p4.props do
                v7[i] = v;
            end;

            v7.Page = u3.Page;
            v7.Index = p4.Index;
            v7.QueueVariant = p4.QueueVariant;
            v7.Size = UDim2.fromScale(1, (1 - (v6 - 1) * 0.05) / v6);
            v7.GamepadShouldAutoSelect = p4.Index == 0;

            return u1.createElement(PlayMenuCard, v7);
        end;

        local v9 = table.create(#Cards);

        for i, v in Cards do
            v9[i] = v8(v, i - 1, Cards);
        end;

        local v10 = {
            Size = UDim2.fromScale(1, 0.7)
        };
        local v11 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
            }) };
        local v12 = #v11;

        for i, v in v9 do
            v11[v12 + i] = v;
        end;

        return u1.createFragment({
            CardContainer = u1.createElement(Empty, v10, v11)
        });
    end)
};