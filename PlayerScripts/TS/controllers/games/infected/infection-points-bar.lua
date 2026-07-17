-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ProgressBar = v1.ProgressBar;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes");
local InfectedDisruptorPointsAttr = v4.InfectedDisruptorPointsAttr;
local InfectedProwlerPointsAttr = v4.InfectedProwlerPointsAttr;
local InfectedRushPointsAttr = v4.InfectedRushPointsAttr;
local InfectedTankPointsAttr = v4.InfectedTankPointsAttr;
local INFECTED_SCALING_DEFINITION = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-scaling-definitions").INFECTED_SCALING_DEFINITION;
local InfectedVariantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local u5 = nil;
local u6 = nil;
local u7 = nil;
local u8 = nil;

local function v28(p9, p10) -- Line: 18
    -- upvalues: u5 (ref), Players (copy), u6 (ref), InfectedTankPointsAttr (copy), GetAttribute (copy), InfectedRushPointsAttr (copy), InfectedDisruptorPointsAttr (copy), InfectedProwlerPointsAttr (copy), u7 (ref), u8 (ref), UIUtil (copy), u2 (copy), ProgressBar (copy)
    local useState = p10.useState;
    local useEffect = p10.useEffect;
    local u11, u12 = useState(0);
    local v13, u14 = useState(u5()[1]);
    local v15, u16 = useState(u5()[2]);
    local v17, u18 = useState(0.01);
    useEffect(function() -- Line: 25
        -- upvalues: Players (ref), u12 (copy), u6 (ref), InfectedTankPointsAttr (ref), GetAttribute (ref), InfectedRushPointsAttr (ref), InfectedDisruptorPointsAttr (ref), InfectedProwlerPointsAttr (ref)
        Players.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Connect(function() -- Line: 26
            -- upvalues: u12 (ref), u6 (ref)
            u12(u6());
        end);
        Players.LocalPlayer:GetAttributeChangedSignal(InfectedTankPointsAttr.Name):Connect(function() -- Line: 30
            -- upvalues: GetAttribute (ref), Players (ref), InfectedTankPointsAttr (ref), u12 (ref)
            local v19 = GetAttribute(Players.LocalPlayer, InfectedTankPointsAttr);
            u12(v19 == nil and 0 or v19);
        end);
        Players.LocalPlayer:GetAttributeChangedSignal(InfectedRushPointsAttr.Name):Connect(function() -- Line: 38
            -- upvalues: GetAttribute (ref), Players (ref), InfectedRushPointsAttr (ref), u12 (ref)
            local v20 = GetAttribute(Players.LocalPlayer, InfectedRushPointsAttr);
            u12(v20 == nil and 0 or v20);
        end);
        Players.LocalPlayer:GetAttributeChangedSignal(InfectedDisruptorPointsAttr.Name):Connect(function() -- Line: 46
            -- upvalues: GetAttribute (ref), Players (ref), InfectedDisruptorPointsAttr (ref), u12 (ref)
            local v21 = GetAttribute(Players.LocalPlayer, InfectedDisruptorPointsAttr);
            u12(v21 == nil and 0 or v21);
        end);
        Players.LocalPlayer:GetAttributeChangedSignal(InfectedProwlerPointsAttr.Name):Connect(function() -- Line: 54
            -- upvalues: GetAttribute (ref), Players (ref), InfectedProwlerPointsAttr (ref), u12 (ref)
            local v22 = GetAttribute(Players.LocalPlayer, InfectedProwlerPointsAttr);
            u12(v22 == nil and 0 or v22);
        end);
    end, {});
    useEffect(function() -- Line: 63
        -- upvalues: u7 (ref), u5 (ref), u11 (copy), u14 (copy), u16 (copy), u18 (copy), u8 (ref)
        local v23 = u7(u5(), u11);
        u14(v23.prev);
        u16(v23.next);
        u18(u8(u11, v23.prev, v23.next));
    end, { u11 });
    local v24 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UIUtil:getActionBarPosition(),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(0.35, 0.04)
    };
    local v25 = { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 12.441176470588236
        }), u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v26 = {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        ImageTransparency = 0,
        Size = UDim2.fromScale(1, 1)
    };

    if v13 ~= nil then
        v13 = v13.progressBarIcon;
    end;

    v26.Image = v13;
    v26.LayoutOrder = 0;
    v25.PreviousTierRepresentativeImage = u2.createElement("ImageLabel", v26);
    v25[#v25 + 1] = u2.createElement(ProgressBar, {
        LayoutOrder = 1,
        AcceptZero = true,
        Progress = v17
    });
    local v27 = {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        ImageTransparency = 0,
        Size = UDim2.fromScale(1, 1)
    };

    if v15 ~= nil then
        v15 = v15.progressBarIcon;
    end;

    v27.Image = v15;
    v27.LayoutOrder = 2;
    v25.NextTierRepresentativeImage = u2.createElement("ImageLabel", v27);

    return u2.createElement("Frame", v24, v25);
end;

u7 = function(p29, p30) -- Line: 121, Name: getPlayerScalingTierProgress
    local v31 = false;
    local v32 = 0;
    local v33 = nil;
    local v34 = nil;

    while true do
        if true then
            if v31 then
                v32 = v32 + 1;
            else
                v31 = true;
            end;
        end;

        if v32 >= #p29 then
            break;
        end;

        if p29[v32 + 1].minPointsRequired > p30 then
            v34 = p29[v32 + 1];
            break;
        end;

        v33 = p29[v32 + 1];
    end;

    return {
        prev = v33,
        next = v34
    };
end;

u5 = function() -- Line: 149, Name: getAllScalingTiers
    -- upvalues: Players (copy), INFECTED_SCALING_DEFINITION (copy)
    local scalingTiers = INFECTED_SCALING_DEFINITION[Players.LocalPlayer:GetAttribute("InfectedVariantType")].scalingTiers;
    table.sort(scalingTiers, function(p35, p36) -- Line: 152
        return p35.minPointsRequired < p36.minPointsRequired;
    end);

    return scalingTiers;
end;

u8 = function(p37, p38, p39) -- Line: 158, Name: getProgress
    if p38 ~= nil then
        p38 = p38.minPointsRequired;
    end;

    local v40 = p38 == nil and 0 or p38;
    local v41 = p37 - v40;

    if p39 ~= nil then
        p39 = p39.minPointsRequired;
    end;

    if p39 ~= nil then
        p37 = p39;
    end;

    return v41 / (p37 - v40);
end;

u6 = function() -- Line: 180, Name: getLocalPlayerInfectedPoints
    -- upvalues: Players (copy), InfectedVariantType (copy), GetAttribute (copy), InfectedTankPointsAttr (copy), InfectedRushPointsAttr (copy), InfectedDisruptorPointsAttr (copy), InfectedProwlerPointsAttr (copy)
    local v42 = Players.LocalPlayer:GetAttribute("InfectedVariantType");

    if v42 == InfectedVariantType.TANK then
        local v43 = GetAttribute(Players.LocalPlayer, InfectedTankPointsAttr);

        return v43 == nil and 0 or v43;
    end;

    if v42 == InfectedVariantType.RUSH then
        local v44 = GetAttribute(Players.LocalPlayer, InfectedRushPointsAttr);

        return v44 == nil and 0 or v44;
    end;

    if v42 == InfectedVariantType.DISRUPTOR then
        local v45 = GetAttribute(Players.LocalPlayer, InfectedDisruptorPointsAttr);

        return v45 == nil and 0 or v45;
    end;

    if v42 == InfectedVariantType.PROWLER then
        local v46 = GetAttribute(Players.LocalPlayer, InfectedProwlerPointsAttr);

        return v46 == nil and 0 or v46;
    end;
end;

return {
    InfectionPointsBar = v3.new(u2)(v28)
};