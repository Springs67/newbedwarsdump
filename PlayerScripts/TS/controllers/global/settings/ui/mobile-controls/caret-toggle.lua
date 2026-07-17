-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local IconButton = v1.IconButton;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    CaretToggle = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: ColorUtil (copy), BedwarsImageId (copy), u2 (copy), IconButton (copy)
        local useEffect = p5.useEffect;
        local InitialValue = u4.InitialValue;

        if InitialValue == nil then
            InitialValue = false;
        end;

        local u6, u7 = p5.useState(InitialValue);
        useEffect(function() -- Line: 17
            -- upvalues: u4 (copy), u6 (copy), u7 (copy)
            if u4.InitialValue ~= nil and u4.InitialValue ~= u6 then
                u7(u4.InitialValue);
            end;
        end, { u4.InitialValue });
        local v9 = {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.fromScale(1, 1),
            Rotation = u6 and 0 or 180,
            ImageColor3 = ColorUtil.WHITE,

            OnClick = function() -- Line: 30, Name: OnClick
                -- upvalues: u6 (copy), u4 (copy), u7 (copy)
                local v8 = not u6;
                u4.OnClick(v8);
                u7(v8);
            end
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v9[i] = v;
            end;
        end;

        v9.Image = BedwarsImageId.ARROW_DOWN_1;

        return u2.createElement(IconButton, v9, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end)
};