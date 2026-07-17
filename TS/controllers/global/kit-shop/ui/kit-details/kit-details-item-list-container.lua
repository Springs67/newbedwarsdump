-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CalcTotalUIScale = v1.CalcTotalUIScale;
local GetUIScaleAncestors = v1.GetUIScaleAncestors;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    KitDetailsItemListContainer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 8
        -- upvalues: u2 (copy), GetUIScaleAncestors (copy), CalcTotalUIScale (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState({});
        local v7, u8 = useState(Vector2.new(0, 0));
        local u9 = u2.createRef();
        local ScrollBarThickness = u3.ScrollBarThickness;
        local v10 = ScrollBarThickness == nil and 3 or ScrollBarThickness;
        local u11 = u3.CalculateCellSize(v7, v10);
        local CellPadding = u3.CellPadding;
        local v12 = CellPadding == nil and 10 or CellPadding;
        local v13;

        if u3.CanvasOffset then
            v13 = u3.CanvasOffset(v7, v10);
        else
            v13 = nil;
        end;

        useEffect(function() -- Line: 26
            -- upvalues: u6 (copy), u3 (copy), u11 (copy)
            u6(u3.SetItems(u11));
        end, { u3.SetItems, u11 });
        local v14 = {};

        for i, v in u3 do
            v14[i] = v;
        end;

        v14.CalculateCellSize = nil;
        v14.CellPadding = nil;
        v14.CanvasOffset = nil;
        v14.SetItems = nil;
        v14.ScrollBarThickness = nil;
        local v15 = {};

        for i, v in v14 do
            v15[i] = v;
        end;

        v15[u2.Ref] = u9;
        local v16;

        if v13 == nil then
            v16 = v13;
        else
            v16 = v13.X;
        end;

        if v13 ~= nil then
            v13 = v13.Y;
        end;

        v15.CanvasSize = UDim2.fromOffset(u11.X.Offset * #v5 + v12 * (#v5 - 1) + (v16 == nil and 0 or v16), 1 + (v13 == nil and 0 or v13));
        v15.ScrollBarThickness = v10;
        v15.BorderSizePixel = 0;
        v15.BackgroundTransparency = 1;

        v15[u2.Change.AbsoluteSize] = function(p17) -- Line: 67
            -- upvalues: u9 (copy), GetUIScaleAncestors (ref), CalcTotalUIScale (ref), u8 (copy)
            local v18 = u9:getValue();

            if not v18 then
                u8(p17.AbsoluteSize);

                return;
            end;

            local v19 = CalcTotalUIScale((GetUIScaleAncestors(v18)));
            u8(p17.AbsoluteSize * (1 / v19));
        end;

        local v20 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0, v12)
            }) };
        local v21 = #v20;

        for i, v in v5 do
            v20[v21 + i] = v;
        end;

        return u2.createElement("ScrollingFrame", v15, v20);
    end)
};