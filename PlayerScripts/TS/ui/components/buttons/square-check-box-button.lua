-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    SquareCheckBoxButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 8
        -- upvalues: u2 (copy), ColorUtil (copy), Empty (copy)
        local useEffect = p4.useEffect;
        local u5, u6 = p4.useState(false);
        useEffect(function() -- Line: 12
            -- upvalues: u3 (copy), u6 (copy)
            if u3.Checked ~= nil then
                u6(u3.Checked);
            end;
        end, { u3.Checked });
        local v7 = {};

        for i, v in u3 do
            v7[i] = v;
        end;

        v7.OnChecked = nil;
        v7.Checked = nil;
        v7.CornerRadius = nil;
        v7[u2.Children] = nil;
        local v8 = {};

        for i, v in v7 do
            v8[i] = v;
        end;

        local v9 = {};
        local v10 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ImageTransparency = 1,
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,

            [u2.Event.MouseButton1Click] = function() -- Line: 40
                -- upvalues: u3 (copy), u5 (copy), u6 (copy)
                local OnChecked = u3.OnChecked;

                if OnChecked ~= nil then
                    OnChecked(u5);
                end;

                u6(not u5);
            end
        };
        local v11 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("UICorner", {
                CornerRadius = u3.CornerRadius or UDim.new(0.1, 0)
            }) };
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

        local v14 = #v11;

        if u5 then
            u5 = u2.createElement("Frame", {
                BackgroundTransparency = 0.25,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }) });
        end;

        if u5 then
            v11[v14 + 1] = u5;
        end;

        v9[#v9 + 1] = u2.createElement("ImageButton", v10, v11);

        return u2.createElement(Empty, v8, v9);
    end)
};