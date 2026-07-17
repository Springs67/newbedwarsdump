-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StatCardComponent = RuntimeLib.import(script, script.Parent, "stat-card").StatCardComponent;
local u2 = u1.Component:extend("PlayerHighlights");

function u2.init(p3) -- Line: 8
end;

function u2.render(u4) -- Line: 10
    -- upvalues: u1 (copy), StatCardComponent (copy)
    if not u4.props.cards then
        return nil;
    end;

    local cards = u4.props.cards;

    local function _(p5, p6) -- Line: 15
        -- upvalues: u1 (ref), StatCardComponent (ref), u4 (copy)
        return u1.createElement(StatCardComponent, {
            card = p5,
            index = p6 + 1,
            DisableAnimation = u4.props.DisableAnimation
        });
    end;

    local v7 = table.create(#cards);

    for i, v in cards do
        v7[i] = u1.createElement(StatCardComponent, {
            card = v,
            index = i - 1 + 1,
            DisableAnimation = u4.props.DisableAnimation
        });
    end;

    local v8 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = u4.props.Visible
    };
    local v9 = { u1.createElement("UIListLayout", {
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }) };
    local v10 = #v9;

    for i, v in v7 do
        v9[v10 + i] = v;
    end;

    return u1.createFragment({
        PlayerHighlights = u1.createElement("Frame", v8, v9)
    });
end;

return {
    PlayerHighlightsWrapper = function(p11) -- Line: 53, Name: PlayerHighlightsWrapper
        -- upvalues: u1 (copy), u2 (ref)
        return u1.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 101
        }, { u1.createElement(u2, {
                cards = p11.cards,
                Visible = p11.Visible,
                DisableAnimation = p11.DisableAnimation
            }) });
    end,

    PlayerHighlights = u2
};