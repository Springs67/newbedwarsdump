-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local DominationBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "domination-balance").DominationBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CircleProgressBar = RuntimeLib.import(script, script.Parent, "circle-progress-bar").CircleProgressBar;
local u4 = {
    yourScore = 0,
    enemyScore = 0,
    points = {}
};
local u5 = u3.Component:extend("PointCaptureScoreUI");

function u5.init(p6, p7) -- Line: 21
    -- upvalues: u2 (copy)
    p6.enemyColor = Color3.fromRGB(255, 0, 0);
    p6.allyColor = Color3.fromRGB(0, 255, 56);
    p6.connectionMaid = u2.new();
    p6:listenToScoreUpdate();
end;

function u5.render(p8) -- Line: 27
    -- upvalues: u3 (copy)
    return u3.createFragment({ p8:createYourScore() });
end;

function u5.willUnmount(p9) -- Line: 32
    p9.connectionMaid:DoCleaning();
end;

function u5.listenToScoreUpdate(u10) -- Line: 35
    -- upvalues: KnitClient (copy), default (copy), Players (copy)
    local u11 = 0;
    local u12 = 0;

    if not KnitClient.Controllers.TeamScoreController:getTeamScores() then
        return nil;
    end;

    default.Client:Get("TeamScoreUpdate"):Connect(function() -- Line: 42
        -- upvalues: KnitClient (ref), Players (ref), u11 (ref), u12 (ref), u10 (copy)
        local v13 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if not v13 then
            return nil;
        end;

        local v14 = KnitClient.Controllers.TeamScoreController:getTeamScores();

        if not v14 then
            return nil;
        end;

        for _, v in v14 do
            if v.Name == v13.id then
                u11 = v:GetAttribute("Score");
            else
                u12 = v:GetAttribute("Score");
            end;
        end;

        u10.props.yourScore = u11;
        u10.props.enemyScore = u12;
        u10:setState({
            yourScore = u10.props.yourScore,
            enemyScore = u10.props.enemyScore
        });
    end);
end;

function u5.createYourScore(p15) -- Line: 66
    -- upvalues: u3 (copy), ProgressBar (copy), DominationBalance (copy), ColorUtil (copy), CircleProgressBar (copy)
    local v16 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.1),
        Size = UDim2.fromScale(0.6, 0.2),
        AutomaticSize = Enum.AutomaticSize.Y,
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v17 = { u3.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.3, 0.5),
            Size = UDim2.fromScale(0.4, 0.5),
            AutomaticSize = Enum.AutomaticSize.Y,
            AnchorPoint = Vector2.new(0.9, 0.5)
        }, { u3.createElement(ProgressBar, {
                AcceptZero = true,
                Position = UDim2.fromScale(0.5, 0.5),
                Progress = p15.props.yourScore / DominationBalance.WIN_CONDITIONS,
                Size = UDim2.fromScale(0.7, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BarGradient = ColorSequence.new(p15.allyColor, ColorUtil.hexColor(16777215))
            }), u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextStrokeTransparency = 0,
                RichText = false,
                TextScaled = true,
                LayoutOrder = 5,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.5, 0.5),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(255, 255, 255),
                Font = Enum.Font.Arial,
                Text = tostring(p15.props.yourScore) .. "/" .. tostring(DominationBalance.WIN_CONDITIONS),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }) }) };
    local v18 = #v17;
    local points = p15.props.points;

    local function v21(p19, p20) -- Line: 110
        -- upvalues: u3 (ref), CircleProgressBar (ref), ColorUtil (ref)
        return u3.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.2 + p20 * 0.15, 0.5),
            Size = UDim2.new(1, 0, 1, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            AnchorPoint = Vector2.new(0.5, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeYY
        }, { u3.createElement(CircleProgressBar, {
                progress = 0,
                playerGUI = true,
                color = ColorUtil.WHITE,
                id = p19
            }) });
    end;

    local v22 = table.create(#points);

    for i, v in points do
        v22[i] = v21(v, i - 1, points);
    end;

    local v23 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.4, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v24 = {};
    local v25 = #v24;

    for i, v in v22 do
        v24[v25 + i] = v;
    end;

    v17[v18 + 1] = u3.createElement("Frame", v23, v24);
    v17[v18 + 2] = u3.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.7, 0.5),
        Size = UDim2.fromScale(0.4, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        AnchorPoint = Vector2.new(0.1, 0.5)
    }, { u3.createElement(ProgressBar, {
            AcceptZero = true,
            Position = UDim2.fromScale(0.5, 0.5),
            Progress = p15.props.enemyScore / DominationBalance.WIN_CONDITIONS,
            Size = UDim2.fromScale(0.7, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BarGradient = ColorSequence.new(p15.enemyColor, ColorUtil.hexColor(16777215))
        }), u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextStrokeTransparency = 0,
            RichText = false,
            TextScaled = true,
            LayoutOrder = 5,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.Arial,
            Text = tostring(p15.props.enemyScore) .. "/" .. tostring(DominationBalance.WIN_CONDITIONS),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }) });

    return u3.createElement("Frame", v16, v17);
end;

function u5.getEnemyColor(p26) -- Line: 181
    -- upvalues: Players (copy)
    local Team = Players.LocalPlayer.Team;

    if Team ~= nil then
        Team = Team.Name;
    end;

    if Team == "Blue" then
        p26.enemyColor = Color3.fromRGB(255, 237, 0);

        return;
    end;

    p26.enemyColor = Color3.fromRGB(0, 194, 255);
end;

return {
    ScoreBoardWrapper = function() -- Line: 193, Name: ScoreBoardWrapper
        -- upvalues: u3 (copy), u5 (ref), u4 (copy)
        return u3.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u3.createElement(u5, {
                yourScore = u4.yourScore,
                enemyScore = u4.enemyScore,
                points = {}
            }) });
    end,

    PointCaptureScoreUI = u5
};