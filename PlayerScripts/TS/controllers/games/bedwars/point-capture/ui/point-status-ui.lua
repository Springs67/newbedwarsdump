-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CircleProgressBar = RuntimeLib.import(script, script.Parent, "circle-progress-bar").CircleProgressBar;
local v2 = u1.Component:extend("PointStatusUI");

function v2.init(p3) -- Line: 9
end;

function v2.render(p4) -- Line: 11
    -- upvalues: u1 (copy), CircleProgressBar (copy), ColorUtil (copy)
    local v5 = {};
    local points = p4.props.points;

    local function v8(p6, p7) -- Line: 18
        -- upvalues: u1 (ref), CircleProgressBar (ref), ColorUtil (ref)
        return u1.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.2 + p7 * 0.15, 0.5),
            Size = UDim2.fromScale(0.1, 0.5),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0.5, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeYY
        }, { u1.createElement(CircleProgressBar, {
                progress = 0,
                color = ColorUtil.WHITE,
                id = p6
            }) });
    end;

    local v9 = table.create(#points);
    local v10 = {
        ResetOnSpawn = false
    };

    for i, v in points do
        v9[i] = v8(v, i - 1, points);
    end;

    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.1),
        Size = UDim2.fromScale(0.2, 0.1),
        AutomaticSize = Enum.AutomaticSize.XY,
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v12 = {};
    local v13 = #v12;

    for i, v in v9 do
        v12[v13 + i] = v;
    end;

    v5[#v5 + 1] = u1.createElement("Frame", v11, v12);

    return u1.createElement("ScreenGui", v10, v5);
end;

return {
    PointStatusUI = v2
};