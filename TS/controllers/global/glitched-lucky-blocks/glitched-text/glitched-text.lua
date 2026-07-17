-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GlitchedTextLabel = RuntimeLib.import(script, script.Parent, "glitched-textlabel").GlitchedTextLabel;

return {
    GlitchedText = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), GlitchedTextLabel (copy), Empty (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = { Color3.fromHex("#0ffbf9"), Color3.fromHex("#ff0d23") };
        local v6 = {
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = u3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local v7 = {};
        local v8 = #v7;
        local v9 = {};
        local v10 = {};
        local TextLabelProps = u3.TextLabelProps;

        if type(TextLabelProps) == "table" then
            for i, v in TextLabelProps do
                v10[i] = v;
            end;
        end;

        v10.Text = "<b>" .. u3.Text .. "</b>";
        v10.RichText = true;
        v10.ZIndex = 2;
        v9.TextLabelProps = v10;
        v9.AnimationConfig = {
            DisableRandomMovement = true,
            DisableRandomTransparency = true,
            DisableRandomSpaz = true
        };
        v7[v8 + 1] = u1.createElement(GlitchedTextLabel, v9);

        local function v14(p11) -- Line: 40
            -- upvalues: u3 (copy), u1 (ref), GlitchedTextLabel (ref)
            local v12 = {};
            local v13 = {};
            local TextLabelProps2 = u3.TextLabelProps;

            if type(TextLabelProps2) == "table" then
                for i, v in TextLabelProps2 do
                    v13[i] = v;
                end;
            end;

            v13.Text = u3.Text;
            v13.TextColor3 = p11;
            v13.ZIndex = 1;
            v12.TextLabelProps = v13;

            return u1.createElement(GlitchedTextLabel, v12);
        end;

        local v15 = table.create(#v5);

        for i, v in v5 do
            v15[i] = v14(v, i - 1, v5);
        end;

        for i, v in v15 do
            v7[v8 + 1 + i] = v;
        end;

        return u1.createElement(Empty, v6, v7);
    end)
};