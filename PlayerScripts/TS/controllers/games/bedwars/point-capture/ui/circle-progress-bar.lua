-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = {
    progress = 0,
    id = "A",
    color = ColorUtil.WHITE
};
local u4 = u2.Component:extend("CircleProgressBar");

function u4.init(p5, p6) -- Line: 19
    -- upvalues: u1 (copy), u2 (copy)
    p5.connectionMaid = u1.new();
    p5.leftCircleUIGradRef = u2.createRef();
    p5.rightCircleUIGradRef = u2.createRef();
    p5.idText = u2.createRef();
    p5:listenToUpdate();
end;

function u4.render(p7) -- Line: 26
    -- upvalues: u2 (copy)
    return u2.createFragment({ p7:createBar() });
end;

function u4.willUnmount(p8) -- Line: 31
    p8.connectionMaid:DoCleaning();
end;

function u4.listenToUpdate(u9) -- Line: 34
    -- upvalues: default2 (copy), TeamController (copy), Players (copy), default (copy), Linear (copy)
    default2.Client:Get("ResourcePointProgressUpdate"):Connect(function(p10) -- Line: 35
        -- upvalues: TeamController (ref), Players (ref), u9 (copy), default (ref), Linear (ref)
        local v11 = TeamController:getPlayerTeam(Players.LocalPlayer);

        if v11 ~= nil then
            v11 = v11.id;
        end;

        if p10.resourcePoint.id ~= u9.props.id then
            return nil;
        end;

        local u12 = u9.leftCircleUIGradRef:getValue();
        local u13 = u9.rightCircleUIGradRef:getValue();

        if not (u12 and u13) then
            return nil;
        end;

        local v14 = math.clamp(p10.resourcePoint.progress * 3.6, 0, 360);
        local v15 = math.floor(v14);
        local Rotation = u13.Rotation;
        local Rotation2 = u12.Rotation;
        local v16 = Color3.fromRGB(59, 59, 59);
        local capturedByTeam = p10.resourcePoint.capturedByTeam;

        if capturedByTeam == "" or not capturedByTeam then
            local capturingTeam = p10.resourcePoint.capturingTeam;

            if capturingTeam ~= "" and capturingTeam then
                if p10.resourcePoint.capturingTeam == v11 then
                    v16 = Color3.fromRGB(0, 255, 33);
                else
                    v16 = Color3.fromRGB(255, 0, 0);
                end;
            end;
        elseif p10.resourcePoint.capturedByTeam == v11 then
            v16 = Color3.fromRGB(0, 255, 33);
        else
            v16 = Color3.fromRGB(255, 0, 0);
        end;

        u12.Color = ColorSequence.new(v16);
        u13.Color = ColorSequence.new(v16);
        default(0.5, Linear, function(p17) -- Line: 73
            -- upvalues: u13 (copy)
            u13.Rotation = p17;
        end, Rotation, (math.clamp(v15, 0, 180)));
        default(0.5, Linear, function(p18) -- Line: 76
            -- upvalues: u12 (copy)
            u12.Rotation = p18;
        end, Rotation2, (math.clamp(v15, 180, 360)));
    end);
end;

function u4.createLeftCircle(p19) -- Line: 99
    -- upvalues: u2 (copy)
    return u2.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.None,
        AnchorPoint = Vector2.new(0.5, 0),
        SizeConstraint = Enum.SizeConstraint.RelativeYY
    }, { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), u2.createElement("UIGradient", {
            Color = ColorSequence.new(Color3.fromRGB(59, 59, 59)),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            Rotation = 180,
            [u2.Ref] = p19.leftCircleUIGradRef
        }) });
end;

function u4.createRightCircle(p20) -- Line: 123
    -- upvalues: u2 (copy)
    return u2.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.None,
        AnchorPoint = Vector2.new(1, 0),
        SizeConstraint = Enum.SizeConstraint.RelativeYY
    }, { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), u2.createElement("UIGradient", {
            Color = ColorSequence.new(Color3.fromRGB(59, 59, 59)),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            [u2.Ref] = p20.rightCircleUIGradRef
        }) });
end;

function u4.createText(p21) -- Line: 146
    -- upvalues: u2 (copy)
    return u2.createElement("TextLabel", {
        Position = UDim2.fromScale(0.45, 0.6),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.8, 0.8),
        TextColor3 = p21.props.color,
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        TextStrokeTransparency = 0,
        RichText = true,
        Font = Enum.Font.LuckiestGuy,
        Text = p21.props.id,
        TextScaled = true,
        [u2.Ref] = p21.idText
    });
end;

function u4.createBar(p22) -- Line: 163
    -- upvalues: u2 (copy)
    local v23 = UDim2.fromScale(1, 1);

    if p22.props.playerGUI then
        v23 = UDim2.fromOffset(15, 15);
    end;

    return u2.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v23,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.None,
        SizeConstraint = Enum.SizeConstraint.RelativeYY
    }, {
        u2.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(94, 92, 92),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0.5, 0)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) }),
        u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(0.5, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0, 0)
        }, { p22:createLeftCircle() }),
        u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(1, 0, 0, 0),
            Size = UDim2.new(0.5, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(1, 0)
        }, { p22:createRightCircle() }),
        u2.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            BackgroundColor3 = Color3.fromRGB(125, 122, 122),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), p22:createText() })
    });
end;

return {
    ScoreBoardWrapper = function() -- Line: 231, Name: ScoreBoardWrapper
        -- upvalues: u2 (copy), u4 (ref), u3 (copy)
        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(u4, {
                progress = u3.progress,
                color = u3.color,
                id = u3.id
            }) });
    end,

    CircleProgressBar = u4
};