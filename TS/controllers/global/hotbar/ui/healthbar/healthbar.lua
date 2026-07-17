-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    Healthbar = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), ColorUtil (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local useMemo = p4.useMemo;
        local u5 = u1.createRef();
        local u6 = u1.createRef();
        local v7 = useMemo(function() -- Line: 13
            -- upvalues: u3 (copy)
            return u3.Size;
        end, {});
        useEffect(function() -- Line: 16
            -- upvalues: TweenService (ref), u6 (copy), u3 (copy)
            local v8 = u6:getValue();
            local BarTweenSpeed = u3.BarTweenSpeed;
            TweenService:Create(v8, TweenInfo.new(BarTweenSpeed == nil and 0.12 or BarTweenSpeed), {
                Size = UDim2.fromScale(u3.FillRatio, 1)
            }):Play();
        end, { u3.FillRatio });
        useEffect(function() -- Line: 27
            -- upvalues: TweenService (ref), u5 (copy), u3 (copy)
            local v9 = u5:getValue();
            local BarTweenSpeed = u3.BarTweenSpeed;
            TweenService:Create(v9, TweenInfo.new(BarTweenSpeed == nil and 0.012 or BarTweenSpeed), {
                Size = u3.Size
            }):Play();
        end, { u3.Size });
        local v10 = {
            [u1.Ref] = u5,
            Size = v7,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local BackgroundBarTransparency = u3.BackgroundBarTransparency;
        v10.BackgroundTransparency = BackgroundBarTransparency == nil and 0 or BackgroundBarTransparency;
        v10.BorderSizePixel = 0;
        v10.ZIndex = u3.ZIndex;
        local v11 = { u1.createElement("UIGradient", {
                Color = u3.BackgroundColor
            }) };
        local _ = #v11;
        local v12 = {
            [u1.Ref] = u6,
            Size = UDim2.fromScale(u3.FillRatio, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            ZIndex = u3.ZIndex
        };
        local v13 = { u1.createElement("UIGradient", {
                Rotation = 90,
                Color = u3.FillColor
            }) };
        local v14 = #v13;
        local v15 = u3[u1.Children];

        if v15 then
            for i, v in v15 do
                if type(i) == "number" then
                    v13[v14 + i] = v;
                else
                    v13[i] = v;
                end;
            end;
        end;

        v11.BarFill = u1.createElement("Frame", v12, v13);

        return u1.createFragment({
            BarBackground = u1.createElement("Frame", v10, v11)
        });
    end)
};