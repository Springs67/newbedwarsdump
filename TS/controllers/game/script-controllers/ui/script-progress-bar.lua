-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    ScriptProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 7
        -- upvalues: u1 (copy), ProgressBar (copy)
        local useState = p3.useState;
        local useEffect = p3.useEffect;
        local v4, u5 = useState(u2.data.current);
        local v6, u7 = useState(u2.data.text);
        local v8, u9 = useState(u2.data.max);
        local v10, u11 = useState(u2.data.color);
        useEffect(function() -- Line: 14
            -- upvalues: u5 (copy), u2 (copy), u9 (copy), u11 (copy), u7 (copy)
            u5(u2.data.current);
            u9(u2.data.max);
            u11(u2.data.color);
            u7(u2.data.text);
        end, {});
        local createFragment = u1.createFragment;
        local v12 = {};
        local createElement = u1.createElement;
        local v13 = {
            AcceptZero = true,
            Flip = false,
            AutoLocalize = false
        };
        local v14;

        if u2.centered then
            v14 = Vector2.new(0.5, 0);
        else
            v14 = Vector2.new(0, 0);
        end;

        v13.AnchorPoint = v14;
        local v15;

        if u2.centered then
            v15 = UDim2.fromScale(0.5, u2.row * 0.25);
        elseif u2.alignment == "R" then
            v15 = UDim2.fromScale(0.5, (u2.row - 1) * 0.25);
        else
            v15 = UDim2.fromScale(0, (u2.row - 1) * 0.25);
        end;

        v13.Position = v15;
        v13.Size = UDim2.fromScale(0.5, 0.25);
        v13.Progress = math.clamp(v4 / v8, 0, 1);
        v13.BarColor = v10;
        v13.BarBackgroundColor = Color3.fromRGB(0, 0, 0);
        local v16 = {};
        local v17 = math.round(v4 / v8 * 100);
        local v18 = math.clamp(v17, 0, 100);
        v16.text = v6 .. " " .. tostring(v18) .. "%";
        v16.color = Color3.fromRGB(255, 255, 255);
        v13.Title = v16;
        v12.ScriptProgressBar = createElement(ProgressBar, v13);

        return createFragment(v12);
    end)
};