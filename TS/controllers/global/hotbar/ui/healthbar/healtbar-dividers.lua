-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    HealthbarDividers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
        -- upvalues: ColorUtil (copy), u2 (copy), Empty (copy)
        local _ = p4.useState;
        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        local Spacing = v5.Spacing;
        local u6 = Spacing == nil and 0.1 or Spacing;
        local Thickness = v5.Thickness;
        local u7 = Thickness == nil and 1 or Thickness;
        local Color = v5.Color;

        if Color == nil then
            Color = ColorUtil.hexColor(2700097);
        end;

        local function v8() -- Line: 27
            -- upvalues: u2 (ref), Empty (ref), u6 (ref), u7 (ref), Color (ref)
            return u2.createElement(Empty, {
                ZIndex = 10,
                Size = UDim2.new(u6, 0, 1, 0)
            }, { u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 10,
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.new(1, -u7, 0, 0),
                    Size = UDim2.new(0, u7, 0.6, 0),
                    BackgroundColor3 = Color
                }) });
        end;

        local v9 = false;
        local v10 = 0;
        local v11 = {};

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= 9 then
                local v12 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 10,
                    Size = UDim2.fromScale(1, 1)
                };
                local v13 = { u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal"
                    }) };
                local v14 = #v13;

                for i, v in v11 do
                    v13[v14 + i] = v;
                end;

                return u2.createFragment({
                    Dividers = u2.createElement("Frame", v12, v13)
                });
            end;

            local v15 = u2.createElement(v8);
            table.insert(v11, v15);
        end;
    end)
};