-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local HotbarPartyMember = RuntimeLib.import(script, script.Parent, "hotbar-party-member").HotbarPartyMember;
local v2 = u1.Component:extend("HotbarPartyMemberList");

function v2.init(p3) -- Line: 9
end;

function v2.render(p4) -- Line: 11
    -- upvalues: u1 (copy), Empty (copy), HotbarPartyMember (copy)
    local v5 = { p4.props.store.Party.leader };
    local members = p4.props.store.Party.members;
    table.move(members, 1, #members, #v5 + 1, v5);

    if #v5 == 1 then
        return u1.createElement(Empty, {
            Size = UDim2.fromScale(0.1, 0)
        });
    end;

    local function _(p6, p7) -- Line: 22
        -- upvalues: u1 (ref), HotbarPartyMember (ref)
        return u1.createElement(HotbarPartyMember, {
            Member = p6,
            LayoutOrder = p7
        });
    end;

    local v8 = table.create(#v5);

    for i, v in v5 do
        v8[i] = u1.createElement(HotbarPartyMember, {
            Member = v,
            LayoutOrder = i - 1
        });
    end;

    local v9 = {
        SizeConstraint = "RelativeXX",
        BackgroundTransparency = 1,
        BorderSizePixel = 1,
        AnchorPoint = p4.props.AnchorPoint,
        Position = p4.props.Position,
        Size = UDim2.fromScale(0.1, 0.1),
        LayoutOrder = p4.props.LayoutOrder
    };
    local v10 = { u1.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 2,
            StartCorner = "BottomRight",
            VerticalAlignment = "Bottom",
            CellSize = UDim2.fromScale(0.45, 0.45),
            CellPadding = UDim2.fromScale(0.05, 0.05)
        }) };
    local v11 = #v10;

    for i, v in v8 do
        v10[v11 + i] = v;
    end;

    return u1.createElement("Frame", v9, v10);
end;

return {
    HotbarPartyMemberList = v2
};