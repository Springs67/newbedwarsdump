-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SettingTextbox = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), ColorUtil (copy), Theme (copy), Empty (copy)
        local useState = p5.useState;
        local _ = p5.useEffect;
        local Value = u4.Value;
        local u6, u7 = useState(Value == nil and "" or Value);
        local Value2 = u4.Value;
        local u8, u9 = useState(Value2 == nil and "" or Value2);
        local v10 = {};
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v10[i] = v;
            end;
        end;

        local v11 = {};
        local v12 = #v11;
        local v13;

        if u4.Label == nil then
            v13 = false;
        else
            v13 = u2.createFragment({ u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 6)
                }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    TextScaled = true,
                    RichText = true,
                    Font = "ArialBold",
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    Size = UDim2.fromScale(1, 0),
                    Text = u4.Label,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) });
        end;

        if v13 then
            v11[v12 + 1] = v13;
        end;

        local v14 = {};
        local Label = u4.Label;
        local v15;

        if Label == "" or not Label then
            v15 = UDim2.fromScale(1, 1);
        else
            v15 = UDim2.new(1, 0, 0.9, -6);
        end;

        v14.Size = v15;
        local TextBoxProps = u4.TextBoxProps;

        if TextBoxProps ~= nil then
            TextBoxProps = TextBoxProps.PlaceholderText;
        end;

        v14.PlaceholderText = TextBoxProps == nil and "" or TextBoxProps;
        local TextBoxProps2 = u4.TextBoxProps;

        if TextBoxProps2 ~= nil then
            TextBoxProps2 = TextBoxProps2.Text;
        end;

        v14.Text = TextBoxProps2 == nil and "" or TextBoxProps2;
        v14.TextScaled = true;
        v14.RichText = true;
        v14.Font = "ArialBold";
        v14.TextColor3 = ColorUtil.WHITE;
        v14.BackgroundColor3 = Theme.backgroundTertiary;
        v14.BorderSizePixel = 0;
        v14.ClearTextOnFocus = false;

        v14[u2.Event.FocusLost] = function(p16) -- Line: 85
            -- upvalues: u8 (copy), u4 (copy), u6 (copy), u9 (copy)
            if p16.Text == u8 then
                return nil;
            end;

            if u4.NumbersOnly then
                local v17 = tonumber(p16.Text);

                if v17 == 0 or (v17 ~= v17 or not v17) then
                    p16.Text = u6;
                else
                    p16.Text = p16.Text;
                end;
            end;

            u4.OnFocusLost(p16.Text);
            u9(p16.Text);
        end;

        v14[u2.Change.Text] = function(p18) -- Line: 100
            -- upvalues: u6 (copy), u4 (copy), u7 (copy)
            if p18.Text == u6 then
                return nil;
            end;

            if u4.NumbersOnly then
                local v19 = tonumber(p18.Text);

                if v19 == 0 or (v19 ~= v19 or not v19) then
                    return nil;
                end;
            end;

            local MaxCharacters = u4.MaxCharacters;

            if MaxCharacters ~= 0 and (MaxCharacters == MaxCharacters and MaxCharacters) then
                MaxCharacters = #p18.Text > u4.MaxCharacters;
            end;

            if MaxCharacters ~= 0 and (MaxCharacters == MaxCharacters and MaxCharacters) then
                p18.Text = string.sub(p18.Text, 0, u4.MaxCharacters);
            end;

            u7(p18.Text);
        end;

        local TextBoxProps3 = u4.TextBoxProps;

        if TextBoxProps3 then
            for i, v in TextBoxProps3 do
                v14[i] = v;
            end;
        end;

        local v20 = u4[u2.Children];

        if v20 ~= nil then
            v20 = v20.uipadding ~= nil;
        end;

        local v21 = not v20 and u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.15, 0),
            PaddingBottom = UDim.new(0.15, 0),
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0)
        });
        local v22 = {};
        local v23 = #v22;

        if v21 then
            v22[v23 + 1] = v21;
        end;

        local v24 = #v22;
        v22[v24 + 1] = u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 18
        });
        local v25 = u4[u2.Children];

        if v25 then
            for i, v in v25 do
                if type(i) == "number" then
                    v22[v24 + 1 + i] = v;
                else
                    v22[i] = v;
                end;
            end;
        end;

        v11[#v11 + 1] = u2.createElement("TextBox", v14, v22);

        return u2.createElement(Empty, v10, v11);
    end)
};