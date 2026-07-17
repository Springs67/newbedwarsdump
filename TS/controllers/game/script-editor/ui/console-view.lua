-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ScriptConsoleLinetype = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "types", "script-console-line-type").ScriptConsoleLinetype;

return {
    ConsoleView = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: StringUtil (copy), ColorUtil (copy), ScriptConsoleLinetype (copy), u2 (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(#u4.consoleText);
        local v8, _ = useState(18);
        local v9, u10 = useState("");
        useEffect(function() -- Line: 15
            -- upvalues: u7 (copy), u4 (copy)
            u7(#u4.consoleText);
        end, { #u4.consoleText });
        useEffect(function() -- Line: 18
            -- upvalues: u6 (copy), StringUtil (ref), u4 (copy), u10 (copy)
            local v11 = false;
            local v12 = 0;
            local v13 = {};

            while true do
                if v11 then
                    v12 = v12 + 1;
                else
                    v11 = true;
                end;

                if v12 >= u6 then
                    u10(table.concat(v13, "\n"));

                    return;
                end;

                local v14 = StringUtil.formatCountdownTime(math.floor(u4.consoleText[v12 + 1].time * 100) / 100, {
                    seconds = true,
                    minutes = true,
                    decimalPoints = 2
                });
                table.insert(v13, v14);
            end;
        end, { u6 });
        local u15 = ColorUtil.richTextColor(ColorUtil.hexColor(14178390));

        local function _(p16) -- Line: 43
            -- upvalues: ScriptConsoleLinetype (ref), u15 (copy)
            if p16.lineType == nil or p16.lineType == ScriptConsoleLinetype.LOG then
                return p16.text;
            end;

            return "<font color=\"" .. u15 .. "\">" .. p16.text .. "</font>";
        end;

        local v17 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v18 = {};
        local v19 = {
            BackgroundTransparency = 1,
            ScrollBarImageTransparency = 0.5,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.fromScale(1, 1),
            ScrollingDirection = Enum.ScrollingDirection.Y
        };
        local v20 = {};
        local v21 = #v20;
        local v22 = {
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local consoleText = u4.consoleText;

        local function _(p23) -- Line: 74
            -- upvalues: ScriptConsoleLinetype (ref), u15 (copy)
            if p23.lineType == nil or p23.lineType == ScriptConsoleLinetype.LOG then
                return p23.text;
            end;

            return "<font color=\"" .. u15 .. "\">" .. p23.text .. "</font>";
        end;

        local v24 = table.create(#consoleText);

        for i, v in consoleText do
            local _ = i - 1;
            local v25;

            if v.lineType == nil or v.lineType == ScriptConsoleLinetype.LOG then
                v25 = v.text;
            else
                v25 = "<font color=\"" .. u15 .. "\">" .. v.text .. "</font>";
            end;

            v24[i] = v25;
        end;

        v22.Text = table.concat(v24, "\n");
        v22.RichText = true;
        v22.Size = UDim2.fromScale(0.86, 0);
        v22.BackgroundTransparency = 1;
        v22.AnchorPoint = Vector2.new(0, 0);
        v22.Position = UDim2.fromScale(0.13, 0);
        v22.TextXAlignment = Enum.TextXAlignment.Left;
        v22.TextYAlignment = Enum.TextYAlignment.Top;
        v22.TextSize = v8;
        v22.LineHeight = 1.05;
        v22.Font = Enum.Font.RobotoMono;
        v22.TextColor3 = ColorUtil.hexColor(12303291);
        v20[v21 + 1] = u2.createElement("TextLabel", v22);
        v20[v21 + 2] = u2.createElement("TextLabel", {
            LineHeight = 1.05,
            TextTransparency = 0.8,
            BackgroundTransparency = 1,
            Text = v9,
            Size = UDim2.fromScale(0.12, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            TextSize = v8,
            Font = Enum.Font.RobotoMono,
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Top
        });
        v18[#v18 + 1] = u2.createElement("ScrollingFrame", v19, v20);

        return u2.createElement("ImageButton", v17, v18);
    end)
};