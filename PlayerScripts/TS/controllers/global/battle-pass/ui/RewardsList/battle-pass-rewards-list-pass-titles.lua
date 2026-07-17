-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GetUIScaleAncestors = v1.GetUIScaleAncestors;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;

return {
    BattlePassRewardsListPassTitles = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), GetUIScaleAncestors (copy), ColorUtil (copy), BattlePassUtils (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 14
            -- upvalues: u6 (copy), GetUIScaleAncestors (ref), u4 (copy)
            local function u15() -- Line: 15
                -- upvalues: u6 (ref), GetUIScaleAncestors (ref), u4 (ref)
                local v7 = u6:getValue();
                local v8 = GetUIScaleAncestors(v7);

                local function _(p9) -- Line: 20
                    return p9.Scale;
                end;

                local v10 = table.create(#v8);

                for i, v in v8 do
                    local _ = i - 1;
                    v10[i] = v.Scale;
                end;

                local function _(p11, p12) -- Line: 29
                    return p11 * p12;
                end;

                local v13 = 1;

                for i = 1, #v10 do
                    local _ = i - 1;
                    v13 = v13 * v10[i];
                end;

                if v7 then
                    local v14 = v7.Parent.AbsoluteSize.Y * u4.Size.Y.Scale / v13;
                    v7.Position = UDim2.new(0, (-v7.AbsoluteSize.X + 8) / 2 / v13, 0, (v14 - 11) / 2);
                    v7.Size = UDim2.new(0, v14, 0, 16);
                end;
            end;

            local u16 = u6:getValue():GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 47
                -- upvalues: u15 (copy)
                u15();
            end);

            return function() -- Line: 50
                -- upvalues: u16 (copy)
                u16:Disconnect();
            end;
        end, {});
        local v17 = {
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.new(0, 0, 1, 0),
            Rotation = -90,
            BackgroundTransparency = 1,
            LayoutOrder = u4.LayoutOrder,
            [u2.Ref] = u6
        };
        local v18 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }), u2.createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.new(0.1, 0, 0, 16)
            }), u2.createElement("TextLabel", {
                Text = "Free Pass",
                TextTransparency = 0.3,
                TextSize = 16,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(0.4, 0, 0, 16),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }) };
        local v19 = #v18;
        local v20 = BattlePassUtils.isActiveBattlePassPaid() and u2.createElement("TextLabel", {
            Text = "Battle Pass",
            TextSize = 16,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(0.5, -8, 0, 16),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        });

        if v20 then
            v18[v19 + 1] = v20;
        end;

        return u2.createFragment({
            BattlePassTitles = u2.createElement("Frame", v17, v18)
        });
    end)
};