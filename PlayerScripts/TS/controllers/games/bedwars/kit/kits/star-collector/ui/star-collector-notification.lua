-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local UIUtil = v1.UIUtil;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    StarCollectorNotification = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: default (copy), OutExpo (copy), Theme (copy), UIUtil (copy), ColorUtil (copy), u2 (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useBinding(1);
        local v9 = v6:map(function(p8) -- Line: 15
            return 0.4 * p8 + 0.6;
        end);
        useEffect(function() -- Line: 18
            -- upvalues: u4 (copy), default (ref), OutExpo (ref), u7 (copy)
            local u12 = task.spawn(function() -- Line: 19
                -- upvalues: u4 (ref), default (ref), OutExpo (ref), u7 (ref)
                local fadeTime = u4.fadeTime;
                default(fadeTime == nil and 0.5 or fadeTime, OutExpo, function(p10) -- Line: 24
                    -- upvalues: u7 (ref)
                    u7(p10);
                end, 1, 0):Wait();
                local duration = u4.duration;
                task.wait(duration == nil and 2 or duration);
                local fadeTime2 = u4.fadeTime;
                default(fadeTime2 == nil and 0.5 or fadeTime2, OutExpo, function(p11) -- Line: 37
                    -- upvalues: u7 (ref)
                    u7(p11);
                end, 0, 1);
            end);

            return function() -- Line: 41
                -- upvalues: u12 (copy)
                task.cancel(u12);
            end;
        end);
        local v13 = {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            LayoutOrder = Theme.abilityActionBarPriority,
            Position = UIUtil:getActionBarPosition(),
            Text = u4.text,
            FontFace = Font.new("Roboto", Enum.FontWeight.ExtraBold),
            TextColor3 = u4.textColor3 or ColorUtil.WHITE,
            TextStrokeColor3 = u4.textStrokeColor3 or Color3.fromRGB(0, 0, 0),
            TextTransparency = v6,
            Size = u4.size or Theme.actionBarButtonSize
        };
        local v14 = { u2.createElement("UIStroke", {
                Thickness = 1,
                Transparency = v9
            }) };
        local v15 = #v14;
        local v16 = u4.textColorGradient and u2.createElement("UIGradient", {
            Rotation = -87,
            Color = u4.textColorGradient
        });

        if v16 then
            v14[v15 + 1] = v16;
        end;

        return u2.createElement("TextLabel", v13, v14);
    end)
};