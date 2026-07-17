-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local NumberSpinner = v1.NumberSpinner;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

local function _(p3) -- Line: 7
    return string.gsub(string.reverse((string.gsub(string.reverse(p3), "%d%d%d", "%1,"))), "^,", "");
end;

local v4 = u2.Component:extend("LeaderboardPosition");

function v4.init(p5, p6) -- Line: 13
    -- upvalues: u2 (copy)
    p5.rankRef = u2.createRef();
    local NewLeaderboardPos = p5.props.NewLeaderboardPos;
    local PreviousLeaderboardPos = p5.props.PreviousLeaderboardPos;
    p5.changeDiff = math.abs(((NewLeaderboardPos == 0 or (NewLeaderboardPos ~= NewLeaderboardPos or not NewLeaderboardPos)) and 0 or NewLeaderboardPos) - ((PreviousLeaderboardPos == 0 or (PreviousLeaderboardPos ~= PreviousLeaderboardPos or not PreviousLeaderboardPos)) and 0 or PreviousLeaderboardPos));
    local v7;

    if NewLeaderboardPos == nil or PreviousLeaderboardPos == nil then
        v7 = false;
    else
        v7 = p5.changeDiff ~= 0;
    end;

    p5.shouldDisplayChange = v7;
end;

function v4.didMount(p8) -- Line: 29
    -- upvalues: NumberSpinner (copy), RuntimeLib (copy)
    if not p8.shouldDisplayChange then
        return nil;
    end;

    local v9 = p8.rankRef:getValue();
    local u10 = NumberSpinner.fromGuiObject(v9);
    local NewLeaderboardPos = p8.props.NewLeaderboardPos;
    local PreviousLeaderboardPos = p8.props.PreviousLeaderboardPos;
    u10.Commas = true;
    u10.Decimals = 0;
    u10.Duration = 0;
    u10.Prefix = "";
    u10.Value = PreviousLeaderboardPos;
    RuntimeLib.Promise.delay(1):andThen(function() -- Line: 43
        -- upvalues: u10 (copy), NewLeaderboardPos (copy)
        u10.Duration = 1.5;
        u10.Value = NewLeaderboardPos;
    end);
    v9.Visible = false;
end;

function v4.render(p11) -- Line: 50
    -- upvalues: u2 (copy), ColorUtil (copy)
    local NewLeaderboardPos = p11.props.NewLeaderboardPos;
    local v12 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        BackgroundColor3 = Color3.fromRGB(61, 64, 122)
    };
    local FrameProps = p11.props.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v12[i] = v;
        end;
    end;

    local createFragment = u2.createFragment;
    local v13 = {};
    local createElement = u2.createElement;
    local v14 = {};
    local v15 = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0.1, 0)
    });
    local v16 = u2.createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.05, 0.15),
        Size = UDim2.fromScale(0, 0.4),
        AutomaticSize = Enum.AutomaticSize.X
    }, { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4)
        }), u2.createElement("TextLabel", {
            Text = "Rank",
            BackgroundTransparency = 1,
            TextScaled = true,
            FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            TextColor3 = ColorUtil.hexColor(7470896)
        }), u2.createElement("TextLabel", {
            Text = tostring(NewLeaderboardPos),
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.hexColor(7470896),
            TextScaled = true,
            TextSize = 12,
            [u2.Ref] = p11.rankRef
        }) });
    local v17 = u2.createElement("TextLabel", {
        Text = "MONTHLY WINS",
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0.05, 0.85),
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.fromScale(0.5, 0.3),
        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(179, 179, 179)
    });
    local createElement2 = u2.createElement;
    local v18 = {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.95, 0.5)
    };
    local v19 = tostring(p11.changeDiff);
    v18.Text = "+ " .. string.gsub(string.reverse((string.gsub(string.reverse(v19), "%d%d%d", "%1,"))), "^,", "");
    v18.TextXAlignment = Enum.TextXAlignment.Right;
    v18.Size = UDim2.fromScale(0.5, 0.4);
    v18.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold);
    v18.TextColor3 = ColorUtil.hexColor(7470896);
    v14[1], v14[2], v14[3], v14[4] = v15, v16, v17, createElement2("TextLabel", v18);
    v13.PostgameLeaderboardSection = createElement("Frame", v12, v14);

    return createFragment(v13);
end;

return {
    LeaderboardPosition = v4
};