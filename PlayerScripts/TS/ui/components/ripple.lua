-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    Ripple = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), Empty (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        local u6 = u1.createRef();
        local Speed = p3.Speed;
        local u7 = Speed == nil and 0.8 or Speed;
        local Transparency = p3.Transparency;
        local u8 = Transparency == nil and 0.3 or Transparency;
        local IntervalDuration = p3.IntervalDuration;
        local u9 = IntervalDuration == nil and 2.5 or IntervalDuration;
        local Size = p3.Size;
        local u10 = Size == nil and 1.04 or Size;
        useEffect(function() -- Line: 32
            -- upvalues: u5 (copy), u6 (copy), u8 (copy), TweenService (ref), u7 (copy), u10 (copy), u9 (copy)
            local u11 = u5:getValue();
            local u12 = u6:getValue();
            local u13 = true;

            if u11 and u12 then
                local function u16() -- Line: 37
                    -- upvalues: u11 (copy), u12 (copy), u8 (ref), TweenService (ref), u7 (ref), u10 (ref)
                    u11.Size = UDim2.fromScale(1, 1);
                    u12.Transparency = u8;
                    local v14 = TweenService:Create(u11, TweenInfo.new(u7, Enum.EasingStyle.Cubic), {
                        Size = UDim2.fromScale(u10, u10)
                    });
                    local v15 = TweenService:Create(u12, TweenInfo.new(u7, Enum.EasingStyle.Cubic), {
                        Transparency = 1
                    });
                    v14:Play();
                    v15:Play();
                end;

                task.spawn(function() -- Line: 49
                    -- upvalues: u16 (copy), u9 (ref), u13 (ref)
                    while true do
                        u16();
                        local v17 = task.wait(u9);

                        if v17 ~= 0 and (v17 == v17 and v17) then
                            v17 = u13;
                        end;

                        if v17 == 0 or (v17 ~= v17 or not v17) then
                            return;
                        end;
                    end;
                end);
            end;

            return function() -- Line: 61
                -- upvalues: u13 (ref)
                u13 = false;
            end;
        end, {});
        local v18 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            [u1.Ref] = u5
        };
        local v19 = {};
        local v20 = #v19;
        local v21 = {
            Color = p3.Color or Color3.fromRGB(255, 255, 255)
        };
        local Thickness = p3.Thickness;
        v21.Thickness = Thickness == nil and 2 or Thickness;
        v21.Transparency = u8;
        v21[u1.Ref] = u6;
        v19[v20 + 1] = u1.createElement("UIStroke", v21);
        local v22 = p3[u1.Children];

        if v22 then
            for i, v in v22 do
                if type(i) == "number" then
                    v19[v20 + 1 + i] = v;
                else
                    v19[i] = v;
                end;
            end;
        end;

        return u1.createElement(Empty, v18, v19);
    end)
};