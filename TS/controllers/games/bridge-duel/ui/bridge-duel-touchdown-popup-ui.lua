-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local v7 = v2.new(u1)(function(p4) -- Line: 8
    -- upvalues: TeamColorHex (copy), u1 (copy), ColorUtil (copy)
    local lightBlue = TeamColorHex.lightBlue;
    local orange = TeamColorHex.orange;
    local v5 = p4.scores[1];
    local v6 = p4.scores[2];

    if p4.scoringTeam.id == "1" then
        v5 = v5 - 1;
    else
        v6 = v6 - 1;
    end;

    return u1.createFragment({
        BridgeDuelTouchdownPopupGui = u1.createElement("ScreenGui", {
            DisplayOrder = 20,
            IgnoreGuiInset = true,
            ResetOnSpawn = false
        }, {
            BridgeDuelTouchdownPopup = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                Position = UDim2.new(0.5, 0, 0.35, 0)
            }, {
                TouchdownPlayerText = u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Font = "LuckiestGuy",
                    TextStrokeTransparency = 1,
                    TextTransparency = 1,
                    Text = "<font color=\"" .. ColorUtil.richTextColor(p4.teamColor) .. "\">" .. p4.scoringPlayer.Name .. "</font> scored a touchdown",
                    Size = UDim2.fromScale(1, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(245, 245, 220),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                })
            }),
            BridgeDuelTouchdownScoresPopup = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                Position = UDim2.new(0.5, 0, 0.45, 0)
            }, {
                u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 0.125)
                }),
                TouchdownScoresTextOne = u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Font = "LuckiestGuy",
                    TextStrokeTransparency = 1,
                    TextTransparency = 1,
                    LayoutOrder = 1,
                    Text = "<font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(lightBlue)) .. "\">" .. tostring(v5) .. "</font>",
                    Size = UDim2.fromScale(0.05, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(245, 245, 220),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                }),
                TouchdownScoresTextDash = u1.createElement("TextLabel", {
                    Text = "-",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Font = "LuckiestGuy",
                    TextStrokeTransparency = 1,
                    TextTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.05, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(245, 245, 220),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                }),
                TouchdownScoresTextTwo = u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Font = "LuckiestGuy",
                    TextStrokeTransparency = 1,
                    TextTransparency = 1,
                    LayoutOrder = 3,
                    Text = "<font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(orange)) .. "\">" .. tostring(v6) .. "</font>",
                    Size = UDim2.fromScale(0.05, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(245, 245, 220),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                })
            })
        })
    });
end);

return {
    BridgeDuelTouchdownPopupGui = v3.connect(function(p8, p9) -- Line: 116
        local v10 = {};

        for i, v in p9 do
            v10[i] = v;
        end;

        return v10;
    end)(v7)
};