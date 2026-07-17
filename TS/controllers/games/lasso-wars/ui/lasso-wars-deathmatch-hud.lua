-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v20 = v2.new(u1)(function(p4, p5) -- Line: 10
    -- upvalues: KnitClient (copy), Players (copy), default (copy), u1 (copy), ColorUtil (copy)
    local useState = p5.useState;
    local useEffect = p5.useEffect;
    local v6 = KnitClient.Controllers.TeamController:getTeams();
    local u7 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    local function _(p8) -- Line: 16
        -- upvalues: u7 (copy)
        return p8.id ~= u7.id;
    end;

    local u9 = nil;

    for i, v in v6 do
        local _ = i - 1;

        if v.id ~= u7.id == true then
            u9 = v;
            break;
        end;
    end;

    local color = u7.color;
    local color2 = u9.color;
    local v10 = Color3.fromHex("#BA9B6C");
    local v11, u12 = useState(0);
    local v13, u14 = useState(0);
    useEffect(function() -- Line: 34
        -- upvalues: default (ref), KnitClient (ref), Players (ref), u7 (copy), u9 (copy), u12 (copy), u14 (copy)
        default.Client:Get("LassoWars_RefreshScore"):Connect(function(p15) -- Line: 35
            -- upvalues: KnitClient (ref), Players (ref), u7 (ref), u9 (ref), u12 (ref), u14 (ref)
            local v16 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

            if v16 ~= nil then
                v16 = v16.id;
            end;

            if v16 == "" or not v16 then
                return nil;
            end;

            local v17 = p15.scoreMap[v16];
            local v18;

            if v16 == u7.id then
                v18 = u9.id;
            else
                v18 = u7.id;
            end;

            local v19 = p15.scoreMap[v18];

            if v17 ~= 0 and (v17 == v17 and v17) then
                u12(v17);
            end;

            if v19 ~= 0 and (v19 == v19 and v19) then
                u14(v19);
            end;
        end);
    end, { v11, v13 });

    return u1.createFragment({
        LasssoWarsDeathmatchHud = u1.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, {
            HudContainer = u1.createElement("Frame", {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.07, 0.05),
                Position = UDim2.fromScale(0.5, 0.02)
            }, {
                u1.createElement("UIStroke", {
                    Thickness = 2,
                    Color = ColorUtil.brighten(v10, 0.1)
                }),
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                u1.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new(v10, ColorUtil.darken(v10, 0.8))
                }),
                LassoIcon = u1.createElement("ImageLabel", {
                    Image = "rbxassetid://7192710930",
                    LayoutOrder = 2,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.6, 2),
                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.35)
                }),
                ScoreContainer = u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5)
                }, { u1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0.3, 0)
                    }), u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextStrokeTransparency = 0.7,
                        LayoutOrder = 1,
                        TextScaled = true,
                        Text = tostring(v11),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.3, 1),
                        FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextColor3 = color
                    }), u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextStrokeTransparency = 0.7,
                        LayoutOrder = 3,
                        TextScaled = true,
                        Text = tostring(v13),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.3, 1),
                        FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextColor3 = color2
                    }) })
            })
        })
    });
end);

return {
    LassoWarsDeathmatchHud = v3.connect(function(p21, p22) -- Line: 135
        local v23 = {};

        for i, v in p22 do
            v23[i] = v;
        end;

        return v23;
    end)(v20)
};