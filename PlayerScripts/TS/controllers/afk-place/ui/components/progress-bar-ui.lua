-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local v2 = u1.Component:extend("ProgressBarUI");

function v2.init(p3) -- Line: 10
    -- upvalues: u1 (copy)
    p3.wrapperRef = u1.createRef();
    p3.fillRef = u1.createRef();
    p3.labelRef = u1.createRef();
    p3.progress = 0;
    p3.count = 0;
    p3.multiplier = p3.props.multiplier;
end;

function v2.render(p4) -- Line: 18
    -- upvalues: u1 (copy), AfkPlaceUtils (copy), ColorUtil (copy)
    local v5 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v6 = { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly
        }), u1.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.5)
        }, { u1.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 0.7),
                Image = p4.props.image,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.35, 0.5)
            }), u1.createElement("TextLabel", {
                [u1.Ref] = p4.labelRef,
                Text = " " .. tostring(p4.props.startAmount),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.7, 0.5),
                Size = UDim2.fromScale(0.4, 0.6),
                FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.None,
                Font = AfkPlaceUtils.Theme.font,
                TextStrokeTransparency = 1,
                TextSize = 42,
                TextScaled = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = "Center",
                TextColor3 = ColorUtil.WHITE,
                SizeConstraint = "RelativeXY"
            }) }) };
    local v7 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.3)
    };
    local v8 = {};
    local _ = #v8;
    local v9 = {
        [u1.Ref] = p4.wrapperRef,
        Size = UDim2.fromScale(0.8, 0.8),
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        BorderSizePixel = 0,
        ZIndex = 1,
        Position = UDim2.fromScale(0.1, 0)
    };
    local v10 = { u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 30)
        }) };
    local _ = #v10;
    local v11 = {
        [u1.Ref] = p4.fillRef,
        Size = UDim2.fromScale(p4.progress, 1),
        BackgroundColor3 = Color3.fromRGB(255, 237, 0),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 1
    };
    local v12 = { u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 30)
        }), u1.createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new(Color3.fromRGB(255, 224, 26), Color3.fromRGB(255, 188, 80))
        }) };
    local v13 = #v12;
    local v14 = p4.props[u1.Children];

    if v14 then
        for i, v in v14 do
            if type(i) == "number" then
                v12[v13 + i] = v;
            else
                v12[i] = v;
            end;
        end;
    end;

    v10.BarFill = u1.createElement("Frame", v11, v12);
    v8.BarBackground = u1.createElement("Frame", v9, v10);
    v6[#v6 + 1] = u1.createElement("Frame", v7, v8);

    return u1.createElement("Frame", v5, v6);
end;

function v2.didMount(p15) -- Line: 122
    p15:setupResourceListener();
    p15.multiplier = (p15.props.isVip and 0.15 or 0) + 1 + (p15.props.isPremium and 0.15 or 0);
end;

function v2.willUnmount(p16) -- Line: 126
    local resourceHeartbeat = p16.resourceHeartbeat;

    if resourceHeartbeat ~= nil then
        resourceHeartbeat:Disconnect();
    end;
end;

function v2.setupResourceListener(u17) -- Line: 132
    -- upvalues: RunService (copy)
    local u18 = u17.fillRef:getValue();
    local u19 = u17.labelRef:getValue();

    if not (u18 and u19) then
        return nil;
    end;

    local u20 = 0;
    u17.resourceHeartbeat = RunService.Heartbeat:Connect(function(p21) -- Line: 139
        -- upvalues: u18 (copy), u17 (copy), u19 (copy), u20 (ref)
        u18.Size = UDim2.fromScale(u17.progress, 1);
        u19.Text = tostring(u17.count + u17.props.startAmount);
        u20 = u20 + p21;
        u17.count = math.floor(u20 * u17.props.rate * u17.multiplier / 3600);
        u17.progress = u20 * u17.props.rate * u17.multiplier / 3600 - math.floor(u20 * u17.props.rate * u17.multiplier / 3600);
    end);
end;

return {
    ProgressBarUI = v2
};