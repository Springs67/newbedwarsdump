-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    HostPanelTextBox = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), ColorUtil (copy), Theme (copy), Empty (copy)
        local useState = p5.useState;
        local _ = p5.useEffect;
        local v6 = {};

        for i, v in u4 do
            v6[i] = v;
        end;

        v6[u2.Children] = nil;
        v6.Text = nil;
        v6.PlaceholderText = v6.Text;
        v6.NumbersOnly = nil;
        v6.OnFocusLost = nil;
        v6.MaxCharacters = nil;
        v6.Label = nil;
        v6.LeftPadding = nil;
        v6.MaxTextSize = nil;
        local v7 = {
            Size = v6.Size,
            Position = v6.Position,
            AnchorPoint = v6.AnchorPoint,
            LayoutOrder = v6.LayoutOrder
        };
        v6.AnchorPoint = nil;
        v6.Position = v6.AnchorPoint;
        v6.Size = v6.Position;
        local Text = u4.Text;
        local u8, u9 = useState(Text == nil and "" or Text);
        local Text2 = u4.Text;
        local u10, u11 = useState(Text2 == nil and "" or Text2);
        local v12 = {
            Size = v7.Size or UDim2.fromScale(1, 1),
            Position = v7.Position,
            AnchorPoint = v7.AnchorPoint,
            LayoutOrder = v7.LayoutOrder
        };
        local v13 = {};
        local v14 = #v13;
        local v15;

        if u4.Label == nil then
            v15 = false;
        else
            v15 = u2.createFragment({ u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 6)
                }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    Size = UDim2.fromScale(1, 0),
                    Text = u4.Label,
                    Font = u4.Font or "ArialBold",
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) });
        end;

        if v15 then
            v13[v14 + 1] = v15;
        end;

        local v16 = {};
        local Label = u4.Label;
        local v17;

        if Label == "" or not Label then
            v17 = UDim2.fromScale(1, 1);
        else
            v17 = UDim2.new(1, 0, 0.9, -6);
        end;

        v16.Size = v17;
        local PlaceholderText = u4.PlaceholderText;
        v16.PlaceholderText = tostring(PlaceholderText == nil and "" or PlaceholderText);
        local Text3 = u4.Text;
        v16.Text = tostring(Text3 == nil and "" or Text3);
        v16.TextScaled = true;
        v16.RichText = true;
        v16.Font = "ArialBold";
        v16.TextColor3 = ColorUtil.WHITE;
        v16.BackgroundColor3 = Theme.backgroundTertiary;
        v16.BorderSizePixel = 0;
        v16.ClearTextOnFocus = false;

        v16[u2.Event.FocusLost] = function(p18) -- Line: 99
            -- upvalues: u10 (copy), u4 (copy), u8 (copy), u11 (copy)
            if p18.Text == u10 then
                return nil;
            end;

            if u4.NumbersOnly then
                local v19 = tonumber(p18.Text);

                if v19 == 0 or (v19 ~= v19 or not v19) then
                    p18.Text = u8;
                else
                    p18.Text = p18.Text;
                end;
            end;

            u4.OnFocusLost(p18.Text);
            u11(p18.Text);
        end;

        v16[u2.Change.Text] = function(p20) -- Line: 114
            -- upvalues: u8 (copy), u4 (copy), u9 (copy)
            if p20.Text == u8 then
                return nil;
            end;

            if u4.NumbersOnly then
                local v21 = tonumber(p20.Text);

                if v21 == 0 or (v21 ~= v21 or not v21) then
                    return nil;
                end;
            end;

            local MaxCharacters = u4.MaxCharacters;

            if MaxCharacters ~= 0 and (MaxCharacters == MaxCharacters and MaxCharacters) then
                MaxCharacters = #p20.Text > u4.MaxCharacters;
            end;

            if MaxCharacters ~= 0 and (MaxCharacters == MaxCharacters and MaxCharacters) then
                p20.Text = string.sub(p20.Text, 0, u4.MaxCharacters);
            end;

            u9(p20.Text);
        end;

        for i, v in v6 do
            v16[i] = v;
        end;

        local v22 = u4[u2.Children];

        if v22 ~= nil then
            v22 = v22.uipadding ~= nil;
        end;

        local v23 = not v22;

        if v23 then
            local v24 = {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0)
            };
            local LeftPadding = u4.LeftPadding;
            v24.PaddingLeft = UDim.new(LeftPadding == nil and 0.1 or LeftPadding, 0);
            v24.PaddingRight = UDim.new(0.1, 0);
            v23 = u2.createElement("UIPadding", v24);
        end;

        local v25 = {};
        local v26 = #v25;

        if v23 then
            v25[v26 + 1] = v23;
        end;

        local v27 = #v25;
        local v28 = {};
        local MaxTextSize = u4.MaxTextSize;
        v28.MaxTextSize = MaxTextSize == nil and 18 or MaxTextSize;
        v25[v27 + 1] = u2.createElement("UITextSizeConstraint", v28);
        local v29 = u4[u2.Children];

        if v29 then
            for i, v in v29 do
                if type(i) == "number" then
                    v25[v27 + 1 + i] = v;
                else
                    v25[i] = v;
                end;
            end;
        end;

        v13[#v13 + 1] = u2.createElement("TextBox", v16, v25);

        return u2.createElement(Empty, v12, v13);
    end)
};