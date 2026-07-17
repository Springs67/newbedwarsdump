-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    TextBoxCharacterCounter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), u2 (copy), ColorUtil (copy)
        local useEffect = p4.useEffect;
        local v5, u6 = p4.useState(0);
        useEffect(function() -- Line: 11
            -- upvalues: u1 (ref), u3 (copy), u6 (copy)
            local u7 = u1.new();
            local u8 = u3.TextBox:getValue();

            if not u8 then
                warn("[TextBoxCharacterCounter]: TextBox Ref not found");

                return nil;
            end;

            u6(#u8.Text);

            local function _() -- Line: 19
                -- upvalues: u8 (copy), u3 (ref), u6 (ref)
                if not u8 then
                    return nil;
                end;

                if #u8.Text <= u3.MaxCharCount then
                    u6(#u8.Text);
                end;
            end;

            u7:GiveTask(u8:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 27
                -- upvalues: u8 (copy), u3 (ref), u6 (ref)
                if not u8 then
                    return;
                end;

                if #u8.Text <= u3.MaxCharCount then
                    u6(#u8.Text);
                end;
            end));

            return function() -- Line: 30
                -- upvalues: u7 (copy)
                u7:DoCleaning();
            end;
        end, {});
        local v9 = {};

        for i, v in u3 do
            v9[i] = v;
        end;

        v9[u2.Children] = nil;
        v9.TextBox = nil;
        v9.MaxCharCount = nil;
        local v10 = {
            AutomaticSize = "Y",
            SizeConstraint = "RelativeXX",
            TextTransparency = 0.3,
            TextSize = 14,
            BackgroundTransparency = 1,
            Text = tostring(v5) .. "/" .. tostring(u3.MaxCharCount),
            Size = UDim2.new(1, 0, 0, 0),
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Right,
            Font = Enum.Font.Roboto,
            LayoutOrder = u3.LayoutOrder
        };

        for i, v in v9 do
            v10[i] = v;
        end;

        local v11 = {};
        local v12 = #v11;
        local v13 = u3[u2.Children];

        if v13 then
            for i, v in v13 do
                if type(i) == "number" then
                    v11[v12 + i] = v;
                else
                    v11[i] = v;
                end;
            end;
        end;

        return u2.createElement("TextLabel", v10, v11);
    end)
};