-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    KitDetailsItemCard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local _ = p3.useState;
        local v4 = {};

        for i, v in u2 do
            v4[i] = v;
        end;

        v4.Image = nil;
        v4.Id = nil;
        v4.OnClick = nil;
        v4.OnHover = nil;
        v4[u1.Children] = nil;
        local v5 = {};

        for i, v in v4 do
            v5[i] = v;
        end;

        v5.Text = "";

        v5[u1.Event.Activated] = function() -- Line: 22
            -- upvalues: u2 (copy)
            local v6 = u2.OnClick and u2.OnClick(u2.Id);

            return v6;
        end;

        v5[u1.Event.MouseEnter] = function() -- Line: 25
            -- upvalues: u2 (copy)
            local v7 = u2.OnHover and u2.OnHover(u2.Id);

            return v7;
        end;

        local v8 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }), u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }), u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = u2.Image,
                ScaleType = Enum.ScaleType.Fit
            }) };
        local v9 = #v8;
        local v10 = u2[u1.Children];

        if v10 then
            for i, v in v10 do
                if type(i) == "number" then
                    v8[v9 + i] = v;
                else
                    v8[i] = v;
                end;
            end;
        end;

        return u1.createElement("TextButton", v5, v8);
    end)
};