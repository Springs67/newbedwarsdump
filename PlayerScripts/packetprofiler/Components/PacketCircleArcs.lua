-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local TweenService = game:GetService("TweenService");
local Players = game:GetService("Players");
local Packages = require(script.Parent.Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local v1 = Roact.Component:extend("PacketCircleArcs");

local function lerp(p2, p3, p4) -- Line: 13
    return p2 + (p3 - p2) * p4;
end;

local function CircleArc(u5) -- Line: 17
    -- upvalues: Roact (copy)
    local EndPercent = u5.Data.EndPercent;
    local StartPercent = u5.Data.StartPercent;
    local VisiblePercent = u5.Data.VisiblePercent;

    return Roact.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://3587367081",
        ImageColor3 = u5.Highlighted:map(function(p6) -- Line: 25
            -- upvalues: StartPercent (copy), EndPercent (copy), u5 (copy)
            if StartPercent <= p6 and p6 <= EndPercent then
                return u5.Data.Color:Lerp(Color3.new(1, 1, 1), 0.5);
            end;

            return u5.Data.Color;
        end),
        Size = UDim2.fromScale(2, 1),
        Position = UDim2.fromScale(u5.Side == "Left" and 0 or -1, 0),
        ZIndex = u5.ZIndex
    }, {
        UIGradient = Roact.createElement("UIGradient", {
            Rotation = u5.AnimationAlpha:map(function(p7) -- Line: 37
                -- upvalues: u5 (copy), VisiblePercent (copy)
                if u5.Side == "Left" then
                    local v8 = math.clamp(p7 * 2, 0, 1);

                    return -3.6 * (0 + (VisiblePercent - 0) * v8) + 180;
                end;

                local v9 = math.clamp(p7 * 2 - 1, 0, 1);

                return (0 + -180 * ((0 + (VisiblePercent - 50 - 0) * v9) / 100)) * 2;
            end),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(u5.Side == "Left" and 0.498 or 0.5, 0),
                NumberSequenceKeypoint.new(u5.Side == "Left" and 0.499 or 0.501, 1),
                NumberSequenceKeypoint.new(1, 1)
            })
        })
    });
end;

function v1.init(u10) -- Line: 60
    -- upvalues: Roact (copy), Packages (copy), Players (copy), RunService (copy), TweenService (copy)
    local v11, v12 = Roact.createBinding(0);
    u10.AnimationAlpha = v11;
    u10.SetAnimationAlpha = v12;
    local v13, v14 = Roact.createBinding(0);
    u10.ActualAlpha = v13;
    u10.SetActualAlpha = v14;
    local v15, v16 = Roact.createBinding(Vector2.zero);
    u10.MousePosition = v15;
    u10.SetMousePosition = v16;
    local v17, v18 = Roact.createBinding(-1);
    u10.HighlightedPercent = v17;
    u10.SetHighlightedPercent = v18;
    local u19 = Packages.IsPlugin and u10.props.PluginMouse or Players.LocalPlayer:GetMouse();
    RunService.RenderStepped:Connect(function(p20) -- Line: 68
        -- upvalues: u19 (copy), u10 (copy), TweenService (ref)
        local v21 = Vector2.new(u19.X, u19.Y);
        u10.SetMousePosition(v21);
        local v22 = u10.ActualAlpha:getValue();
        u10.SetAnimationAlpha(TweenService:GetValue(v22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out));
        u10.SetActualAlpha((math.clamp(v22 + p20 * 2, 0, 1)));
    end);
end;

function v1.render(u23) -- Line: 79
    -- upvalues: CircleArc (copy), Roact (copy)
    u23.SetActualAlpha(0);
    local v24 = #u23.props.Arcs;
    local v25 = 0;
    local v26 = {
        Left = {},
        Right = {}
    };

    for i, v in ipairs(u23.props.Arcs) do
        local v27 = v24 - i + 2;
        local v28 = math.min(v25 + v.Percent, 100);

        if v25 > 100 then
            break;
        end;

        if v28 > 50 and v25 <= 50 then
            v26.Left[i] = CircleArc({
                Side = "Left",
                ZIndex = v27,
                Data = {
                    VisiblePercent = 50,
                    StartPercent = v25,
                    EndPercent = v25 + v.Percent,
                    Color = v.Color
                },
                AnimationAlpha = u23.AnimationAlpha,
                Highlighted = u23.HighlightedPercent
            });
        end;

        local v29 = v28 > 50 and "Right" or "Left";
        v26[v29][i] = CircleArc({
            ZIndex = v27,
            Data = {
                StartPercent = v25,
                EndPercent = v25 + v.Percent,
                VisiblePercent = v28,
                Color = v.Color
            },
            Side = v29,
            AnimationAlpha = u23.AnimationAlpha,
            Highlighted = u23.HighlightedPercent
        });
        v25 = v25 + v.Percent;
    end;

    return Roact.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),

        [Roact.Event.MouseEnter] = function() -- Line: 135
            -- upvalues: u23 (copy)
            u23.MouseOver = true;
        end,

        [Roact.Event.MouseLeave] = function() -- Line: 138
            -- upvalues: u23 (copy)
            u23.MouseOver = false;
            u23.SetHighlightedPercent(-1);
        end,

        [Roact.Event.MouseMoved] = function(p30) -- Line: 142
            -- upvalues: u23 (copy)
            if u23.MouseOver then
                local v31 = u23.MousePosition:getValue();
                local v32 = p30.AbsolutePosition + p30.AbsoluteSize / 2;
                local v33 = math.atan2(v31.Y - v32.Y, v31.X - v32.X);
                local v34 = math.deg(v33) + 90;

                if v34 < 0 then
                    v34 = v34 + 360;
                end;

                u23.SetHighlightedPercent(100 - v34 / 360 * 100);
            end;
        end,

        [Roact.Event.InputEnded] = function() -- Line: 155
            -- upvalues: u23 (copy)
            if u23.HighlightedPercent:getValue() == -1 then
                return;
            end;

            u23.SetHighlightedPercent(-1);
        end
    }, {
        Left = Roact.createElement("Frame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Arcs = Roact.createFragment(v26.Left)
        }),
        Right = Roact.createElement("Frame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Arcs = Roact.createFragment(v26.Right)
        })
    });
end;

return v1;