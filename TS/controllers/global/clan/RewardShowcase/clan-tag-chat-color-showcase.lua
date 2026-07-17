-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ChatTagColorDefinition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ChatTagColorDefinition;
local v20 = v2.new(u1)(function(u4, p5) -- Line: 7
    -- upvalues: ChatTagColorDefinition (copy), u1 (copy)
    local useEffect = p5.useEffect;
    local v6 = ChatTagColorDefinition[u4.ClanTagChatColor];
    local Transparency = u4.Transparency;
    local myClan = u4.store.Clans.myClan;

    if myClan ~= nil then
        myClan = myClan.tag;
    end;

    local v7, u8 = p5.useState(myClan == nil and "CLAN" or myClan);

    local function v9() -- Line: 25
        -- upvalues: u4 (copy), u8 (copy)
        local myClan2 = u4.store.Clans.myClan;

        if myClan2 ~= nil then
            myClan2 = myClan2.tag;
        end;

        u8(myClan2 == nil and "CLAN" or myClan2);
    end;

    local myClan2 = u4.store.Clans.myClan;

    if myClan2 ~= nil then
        myClan2 = myClan2.tag;
    end;

    useEffect(v9, { myClan2 });
    local v10 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        ZIndex = u4.ZIndex
    };
    local v11 = {};
    local v12 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.32),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v13 = { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4)
        }) };
    local v14 = v6.kind == "Gradient";

    if v14 then
        local v15 = {
            Color = v6.gradient
        };
        local rotation = v6.rotation;
        v15.Rotation = rotation == nil and 0 or rotation;
        v14 = u1.createElement("UIGradient", v15);
    end;

    local v16 = {
        BackgroundTransparency = 1,
        TextSize = 20,
        LayoutOrder = 1,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.new(0, 0, 1, 0),
        Text = "[" .. v7 .. "]",
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
        TextTransparency = Transparency == nil and 0 or Transparency
    };
    local v17;

    if v6.kind == "Color" then
        v17 = v6.color;
    else
        v17 = Color3.fromRGB(255, 255, 255);
    end;

    v16.TextColor3 = v17;
    v16.TextXAlignment = Enum.TextXAlignment.Center;
    v16.TextYAlignment = Enum.TextYAlignment.Center;
    v16.ZIndex = u4.ZIndex;
    local v18 = {};
    local v19 = #v18;

    if v14 then
        v18[v19 + 1] = v14;
    end;

    v13[#v13 + 1] = u1.createElement("TextLabel", v16, v18);
    v11[#v11 + 1] = u1.createElement("Frame", v12, v13);

    return u1.createElement("Frame", v10, v11);
end);

return {
    ClanTagChatColorShowcase = v3.connect(function(p21, p22) -- Line: 100
        local v23 = {
            store = p21
        };

        for i, v in p22 do
            v23[i] = v;
        end;

        return v23;
    end)(v20)
};