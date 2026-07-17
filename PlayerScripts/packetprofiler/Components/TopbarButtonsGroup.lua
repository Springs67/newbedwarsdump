-- Decompiled with Potassium's decompiler.

local TextService = game:GetService("TextService");
local RunService = game:GetService("RunService");
local Packages = require(script.Parent.Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local u1 = not RunService:IsRunning();

local function TopbarOptionsButton(p2) -- Line: 13
    -- upvalues: Roact (copy)
    return Roact.createElement("TextButton", {
        AutoLocalize = false,
        Text = p2.ButtonName,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Center,
        Font = Enum.Font.Code,
        TextColor3 = p2.Theme.Name == "Light" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1),
        TextSize = 12,
        BackgroundColor3 = p2.Theme:GetColor("ScrollBarBackground"),
        Size = p2.Size,
        BorderSizePixel = 0,
        [Roact.Event.Activated] = p2.OnClick
    });
end;

local v3 = Roact.Component:extend("TopbarButtonsGroup");

function v3.init(p4) -- Line: 31
    -- upvalues: Roact (copy)
    local v5, v6 = Roact.createBinding(0);
    p4.MouseHovering = v5;
    p4.SetMouseHovering = v6;
    p4.TopbarRef = Roact.createRef();
end;

function v3.render(u7) -- Line: 36
    -- upvalues: TextService (copy), TopbarOptionsButton (copy), Roact (copy), u1 (copy)
    local props = u7.props;
    local v8 = TextService:GetTextSize(props.Text, 12, Enum.Font.Code, Vector2.new(10000, 11));
    local X = v8.X;
    local v9 = {};

    for _, v in props.Options do
        local X2 = TextService:GetTextSize(v.Name, 11, Enum.Font.Code, Vector2.new(10000, 11)).X;
        X = math.max(X, X2);
    end;

    for _, v in props.Options do
        local v10 = {
            ButtonName = v.Name,
            OnClick = v.Callback,
            Theme = props.Theme,
            Size = UDim2.fromOffset(X, 11)
        };
        table.insert(v9, TopbarOptionsButton(v10));
    end;

    return Roact.createElement("TextLabel", {
        AutoLocalize = false,
        Text = props.Text,
        TextColor3 = props.Theme.Name == "Light" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1),
        BackgroundColor3 = u7.MouseHovering:map(function(p11) -- Line: 60
            -- upvalues: props (copy)
            return p11 > 0 and props.Theme:GetColor("Light") or props.Theme:GetColor("ScrollBarBackground");
        end),
        TextSize = 12,
        Font = Enum.Font.Code,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(v8.X, 10),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        LayoutOrder = props.LayoutOrder,
        Visible = not u1,

        [Roact.Event.MouseEnter] = function() -- Line: 71
            -- upvalues: u7 (copy)
            u7.SetMouseHovering(1);
        end,

        [Roact.Event.MouseLeave] = function() -- Line: 74
            -- upvalues: u7 (copy)
            task.defer(function() -- Line: 75
                -- upvalues: u7 (ref)
                if u7.MouseHovering:getValue() == 1 then
                    u7.SetMouseHovering(0);
                end;
            end);
        end,

        [Roact.Ref] = u7.TopbarRef
    }, {
        OptionsHolder = Roact.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Visible = u7.MouseHovering:map(function(p12) -- Line: 86
                return p12 > 0;
            end),
            Position = UDim2.fromOffset(0, 10),

            [Roact.Event.MouseEnter] = function() -- Line: 90
                -- upvalues: u7 (copy)
                u7.SetMouseHovering(2);
            end,

            [Roact.Event.MouseLeave] = function() -- Line: 93
                -- upvalues: u7 (copy)
                task.defer(function() -- Line: 94
                    -- upvalues: u7 (ref)
                    if u7.MouseHovering:getValue() == 2 then
                        u7.SetMouseHovering(0);
                    end;
                end);
            end,

            Size = UDim2.fromOffset(X, 0)
        }, {
            OptionsListLayout = Roact.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top
            }),
            Buttons = Roact.createFragment(v9)
        })
    });
end;

return v3;