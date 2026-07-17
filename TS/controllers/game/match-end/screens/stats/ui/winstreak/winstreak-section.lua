-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

local function _(p3) -- Line: 9
    return string.gsub(string.reverse((string.gsub(string.reverse(p3), "%d%d%d", "%1,"))), "^,", "");
end;

return RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u4, p5) -- Line: 12
    -- upvalues: DeviceUtil (copy), u2 (copy), Flamework (copy), ColorUtil (copy)
    local myTeam = u4.store.Game.myTeam;

    if myTeam ~= nil then
        myTeam = myTeam.id;
    end;

    local u6 = myTeam == u4.WinningTeamId;

    if not (u6 or DeviceUtil.isHoarceKat()) then
        return u2.createFragment();
    end;

    local queueType = u4.store.Game.queueType;
    local v7;

    if queueType then
        v7 = Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(queueType);

        if v7 ~= nil then
            v7 = v7.title;
        end;
    else
        v7 = nil;
    end;

    local v8 = DeviceUtil.isHoarceKat() and "Ranked (Squads)" or v7;

    local function _() -- Line: 35
        -- upvalues: queueType (copy), u4 (copy), u6 (copy)
        if not queueType then
            return 0;
        end;

        local v9 = u4.store.Leaderboard.queues[queueType];

        if v9 ~= nil then
            v9 = v9.currentWinStreak;
        end;

        return v9 == nil and 0 or (not u6 and 0 or v9 + 1);
    end;

    local v10 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(61, 64, 122)
    };
    local FrameProps = u4.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v10[i] = v;
        end;
    end;

    local createFragment = u2.createFragment;
    local v11 = {};
    local createElement = u2.createElement;
    local v12 = {};
    local v13 = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0.1, 0)
    });
    local v14 = u2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0.05, 0),
        PaddingLeft = UDim.new(0.05, 0),
        PaddingRight = UDim.new(0.05, 0),
        PaddingTop = UDim.new(0.05, 0)
    });
    local v15 = u2.createElement("TextLabel", {
        Text = "Win Streak",
        BackgroundTransparency = 1,
        TextScaled = true,
        Position = UDim2.fromScale(0, 0.15),
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.fromScale(0.5, 0.4),
        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
        TextColor3 = ColorUtil.hexColor(16759852)
    });
    local v16 = u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 0.85),
        Text = tostring(v8),
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.fromScale(0.5, 0.3),
        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(179, 179, 179)
    });
    local createElement2 = u2.createElement;
    local v17 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        Size = UDim2.fromScale(0, 0.8),
        AutomaticSize = Enum.AutomaticSize.X
    };
    local v18 = {};
    local v19 = u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    });
    local v20 = u2.createElement("ImageLabel", {
        Image = "rbxassetid://7101217258",
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit
    });
    local createElement3 = u2.createElement;
    local v21 = {
        BackgroundTransparency = 1,
        TextScaled = true
    };
    local v22;

    if queueType then
        local v23 = u4.store.Leaderboard.queues[queueType];

        if v23 ~= nil then
            v23 = v23.currentWinStreak;
        end;

        v22 = v23 == nil and 0 or (not u6 and 0 or v23 + 1);
    else
        v22 = 0;
    end;

    local v24 = tostring(v22);
    v21.Text = string.gsub(string.reverse((string.gsub(string.reverse(v24), "%d%d%d", "%1,"))), "^,", "");
    v21.Size = UDim2.fromScale(0, 0.4);
    v21.AutomaticSize = Enum.AutomaticSize.X;
    v21.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold);
    v21.TextColor3 = ColorUtil.hexColor(16759852);
    v18[1], v18[2], v18[3] = v19, v20, createElement3("TextLabel", v21);
    v12[1], v12[2], v12[3], v12[4], v12[5] = v13, v14, v15, v16, createElement2("Frame", v17, v18);
    v11.PostgameWinstreakSection = createElement("Frame", v10, v12);

    return createFragment(v11);
end);