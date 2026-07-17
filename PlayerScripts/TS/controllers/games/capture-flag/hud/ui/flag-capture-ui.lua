-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = u3.Component:extend("FlagScoreUI");

function u5.init(p6, p7) -- Line: 28
    -- upvalues: u2 (copy), DeviceUtil (copy)
    p6.enemyColor = Color3.fromRGB(255, 0, 0);
    p6.teamColor = Color3.fromRGB(255, 0, 0);
    p6.connectionMaid = u2.new();
    p6.flagStatusMessage = "";
    p6.teamFlagPosition = 0;

    if not DeviceUtil.isHoarceKat() then
        p6:getEnemyColor();
        p6:listenToScoreUpdate();
        p6:listenToFlagUpdate();
    end;
end;

function u5.render(p8) -- Line: 40
    -- upvalues: u3 (copy)
    return u3.createFragment({ p8:createYourScore() });
end;

function u5.willUnmount(p9) -- Line: 45
    p9.connectionMaid:DoCleaning();
end;

function u5.listenToFlagUpdate(u10) -- Line: 48
    -- upvalues: default (copy), Players (copy), RunService (copy), KnitClient (copy)
    local v12 = default.Client:WaitFor("FlagHolderUpdate"):expect():Connect(function(p11) -- Line: 49
        -- upvalues: Players (ref), u10 (copy)
        local Team = Players.LocalPlayer.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        if p11.teamColor ~= Team then
            if p11.teamColor ~= "Neutral" then
                u10.props.enemyFlag = p11.teamFlag;
                u10:setState({
                    enemyFlag = p11.teamFlag
                });
            end;

            return;
        end;

        if p11.teamFlag == false then
            u10.flagStatusMessage = "Your Flag Has Been Taken!";
        else
            u10.flagStatusMessage = "";
        end;

        u10.props.yourFlag = p11.teamFlag;
        u10:setState({
            yourFlag = p11.teamFlag
        });
    end);
    u10.connectionMaid:GiveTask(v12);
    local v14 = RunService.Heartbeat:Connect(function(p13) -- Line: 73
        -- upvalues: KnitClient (ref), u10 (copy)
        local team = KnitClient.Controllers.FlagCaptureController:getFlagPositions().team;
        local enemy = KnitClient.Controllers.FlagCaptureController:getFlagPositions().enemy;
        local neutralFlag = KnitClient.Controllers.FlagCaptureController:getFlagPositions().neutralFlag;

        if team == u10.props.teamFlagPosition and (enemy == u10.props.enemyFlagPosition and neutralFlag == u10.props.neutralFlagPosition) then
            return nil;
        end;

        u10.props.teamFlagPosition = team;
        u10.props.enemyFlagPosition = enemy;
        u10.props.neutralFlagPosition = neutralFlag;
        u10:setState({
            teamFlagPosition = team,
            enemyFlagPosition = enemy,
            neutralFlagPosition = neutralFlag
        });
    end);
    u10.connectionMaid:GiveTask(v14);
end;

function u5.listenToScoreUpdate(u15) -- Line: 95
    -- upvalues: default (copy), Players (copy)
    local u16 = 0;
    local u17 = 0;
    local v19 = default.Client:WaitFor("FlagScoreUpdate"):expect():Connect(function(p18) -- Line: 98
        -- upvalues: Players (ref), u16 (ref), u17 (ref), u15 (copy)
        local Team = Players.LocalPlayer.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        if p18.teamOneColor == Team then
            u16 = p18.teamOneScore;
            u17 = p18.teamTwoScore;
        else
            u17 = p18.teamOneScore;
            u16 = p18.teamTwoScore;
        end;

        u15.props.yourScore = u16;
        u15.props.enemyScore = u17;
        u15:setState({
            yourScore = u16,
            enemyScore = u17
        });
    end);
    u15.connectionMaid:GiveTask(v19);
end;

function u5.createYourScore(p20) -- Line: 120
    -- upvalues: u3 (copy), ColorUtil (copy), BedwarsImageId (copy), DeviceUtil (copy), TeamColorHex (copy), Players (copy), Empty (copy)
    local v21 = {
        Position = UDim2.fromScale(0.5, 0.075),
        Size = UDim2.fromScale(0.3, 0.04),
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v22 = {
        YourScore = u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextStrokeTransparency = 0,
            RichText = true,
            TextScaled = true,
            Text = tostring(p20.props.yourScore) .. "<font transparency=\".3\">/3</font>",
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(0.1, 1),
            TextColor3 = ColorUtil.WHITE,
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold)
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 28,
                MinTextSize = 18
            }) })
    };
    local _ = #v22;
    local v23 = {
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0.7, 1),
        BackgroundColor3 = ColorUtil.BLACK,
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v24 = {};
    local v25 = #v24;
    local v26 = {
        ScaleType = "Fit",
        Size = UDim2.fromScale(0.75, 0.75),
        Position = UDim2.fromScale(p20.props.teamFlagPosition + 0.005, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        Image = BedwarsImageId.FLAG_ICON
    };
    local v27;

    if DeviceUtil.isHoarceKat() then
        v27 = ColorUtil.hexColor(TeamColorHex.lightBlue);
    else
        v27 = Players.LocalPlayer.Team;

        if v27 ~= nil then
            v27 = v27.TeamColor.Color;
        end;
    end;

    v26.ImageColor3 = v27;
    v26.BackgroundTransparency = 1;
    v26.ZIndex = 10;
    v24.YourTeamFlag = u3.createElement("ImageLabel", v26, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    local v28 = {
        BackgroundTransparency = 0.3,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5)
    };
    local v29;

    if DeviceUtil.isHoarceKat() then
        v29 = ColorUtil.hexColor(TeamColorHex.lightBlue);
    else
        v29 = Players.LocalPlayer.Team;

        if v29 ~= nil then
            v29 = v29.TeamColor.Color;
        end;

        if v29 == nil then
            v29 = ColorUtil.hexColor(TeamColorHex.lightBlue);
        end;
    end;

    v28.BackgroundColor3 = ColorUtil.darken(v29, 0.4);
    v28.ZIndex = 9;
    v24.YourTeamFlagHome = u3.createElement("Frame", v28, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v24[v25 + 1] = u3.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        AutomaticSize = Enum.AutomaticSize.X
    });
    v24.EnemyTeamFlagHome = u3.createElement("Frame", {
        BackgroundTransparency = 0.5,
        ZIndex = 10,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = ColorUtil.darken(p20.enemyColor, 0.4)
    }, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    local v30 = p20:getNeutralFlag();

    if v30 then
        v24[v25 + 2] = v30;
    end;

    local _ = #v24;
    v24.EnemyTeamFlag = u3.createElement("ImageLabel", {
        ScaleType = "Fit",
        BackgroundTransparency = 1,
        ZIndex = 10,
        Size = UDim2.fromScale(0.75, 0.75),
        Position = UDim2.fromScale(p20.props.enemyFlagPosition + 0.01, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        Image = BedwarsImageId.FLAG_ICON,
        ImageColor3 = p20.enemyColor
    }, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v22.BackgroundBar = u3.createElement("Frame", v23, v24);
    v22.EnemyScore = u3.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextStrokeTransparency = 0,
        RichText = true,
        TextScaled = true,
        Text = tostring(p20.props.enemyScore) .. "<font transparency=\".3\">/3</font>",
        Position = UDim2.fromScale(0.9, 0),
        Size = UDim2.fromScale(0.1, 1),
        TextColor3 = ColorUtil.WHITE,
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold)
    }, { u3.createElement("UITextSizeConstraint", {
            MaxTextSize = 28,
            MinTextSize = 18
        }) });

    return u3.createElement(Empty, v21, v22);
end;

function u5.displayFlagStatus(p31, p32, p33) -- Line: 269
    -- upvalues: u3 (copy), BedwarsImageId (copy)
    if p32 and not p31.props.enemyFlag then
        return u3.createElement("ImageLabel", {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            ZIndex = 10,
            Size = UDim2.fromScale(0.2, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = BedwarsImageId.FLAG_ICON,
            ImageColor3 = p33
        });
    end;

    if p32 or p31.props.yourFlag then
        return u3.createElement("ImageLabel", {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            ZIndex = 10,
            Size = UDim2.fromScale(0.2, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;

    return u3.createElement("ImageLabel", {
        ScaleType = "Fit",
        BackgroundTransparency = 0,
        ZIndex = 10,
        Size = UDim2.fromScale(0.2, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = p33,
        BorderColor3 = Color3.fromRGB(255, 0, 0),
        Image = BedwarsImageId.FLAG_ICON,
        BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    });
end;

function u5.getEnemyColor(p34) -- Line: 304
    -- upvalues: Players (copy)
    local Team = Players.LocalPlayer.Team;

    if Team ~= nil then
        Team = Team.Name;
    end;

    if Team == "Blue" then
        p34.enemyColor = Color3.fromRGB(255, 237, 0);
        p34.teamColor = Color3.fromRGB(0, 194, 255);

        return;
    end;

    p34.enemyColor = Color3.fromRGB(0, 194, 255);
    p34.teamColor = Color3.fromRGB(255, 237, 0);
end;

function u5.getNeutralFlag(p35) -- Line: 317
    -- upvalues: u3 (copy), BedwarsImageId (copy)
    if p35.props.neutralFlagPosition == nil then
        return nil;
    end;

    return u3.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(p35.props.neutralFlagPosition, 0),
        Size = UDim2.fromScale(1, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(0, 0)
    }, { u3.createElement("ImageLabel", {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            ZIndex = 10,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = BedwarsImageId.FLAG_ICON,
            ImageColor3 = Color3.fromRGB(204, 0, 255)
        }), u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
end;

return {
    ScoreBoardWrapper = function() -- Line: 345, Name: ScoreBoardWrapper
        -- upvalues: u3 (copy), u5 (ref)
        return u3.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u3.createElement(u5, {
                yourScore = 0,
                enemyScore = 0,
                yourFlag = true,
                enemyFlag = true,
                teamFlagPosition = 0,
                enemyFlagPosition = 0,
                neutralFlagPosition = nil
            }) });
    end,

    FlagScoreUI = u5
};