-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local StringUtil = v1.StringUtil;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;

return {
    NumberCounter = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: u2 (copy), default (copy), Linear (copy), StringUtil (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local u6, u7 = p5.useState(0);
        local u8 = u2.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u8 (copy), u4 (copy), default (ref), Linear (ref), StringUtil (ref), u6 (copy), u7 (copy)
            local u9 = u8:getValue();

            if not u9 then
                return nil;
            end;

            local AnimationSpeed = u4.AnimationSpeed;
            default(AnimationSpeed == nil and 0.5 or AnimationSpeed, Linear, function(p10) -- Line: 24
                -- upvalues: u9 (copy), StringUtil (ref)
                u9.Text = StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(p10, 0))));
            end, u6, u4.Value);
            u7(u4.Value);
        end, { u4.Value });
        local v11 = {
            Text = "0",
            TextScaled = true,
            TextXAlignment = "Left",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.7, 1),
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        };
        local TextLabelProps = u4.TextLabelProps;

        if TextLabelProps then
            for i, v in TextLabelProps do
                v11[i] = v;
            end;
        end;

        v11[u2.Ref] = u8;

        return u2.createElement("TextLabel", v11);
    end)
};