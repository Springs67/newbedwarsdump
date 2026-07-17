-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u3 = {
    Color3.fromRGB(255, 181, 38),
    Color3.fromRGB(194, 194, 194),
    Color3.fromRGB(171, 102, 28),
    Color3.fromRGB(56, 186, 0),
    Color3.fromRGB(18, 145, 237),
    Color3.fromRGB(0, 0, 0)
};

return {
    ScriptLeaderboardRow = v2.new(u1)(function(u4, p5) -- Line: 10
        -- upvalues: Players (copy), KnitClient (copy), u3 (copy), u1 (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(u4.data.score);
        local v8 = nil;

        if u4.data.keyType == "player" then
            v8 = Players:GetPlayerByUserId(u4.data.keyValue);

            if v8 ~= nil then
                v8 = v8.DisplayName;
            end;
        elseif u4.data.keyType == "team" then
            v8 = KnitClient.Controllers.TeamController:getTeamById(u4.data.keyValue);

            if v8 ~= nil then
                v8 = v8.name;
            end;
        end;

        if v8 == "" or not v8 then
            v8 = u4.data.keyValue;
        end;

        local v9 = u3[math.min(u4.data.place - 1, #u3 - 1) + 1];
        useEffect(function() -- Line: 32
            -- upvalues: u7 (copy), u4 (copy)
            u7(u4.data.score);
        end, {});

        return u1.createFragment({
            ["ScriptLeaderboard_" .. tostring(u4.data.place)] = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0.4,
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, (u4.data.place - 1) * 0.12),
                Size = UDim2.fromScale(1, 0.12),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, {
                ["ScriptLeaderboardPlace_" .. tostring(u4.data.place)] = u1.createElement("TextLabel", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    AutoLocalize = false,
                    Text = tostring(u4.data.place),
                    Font = Enum.Font.ArialBold,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0, 0),
                    Size = UDim2.fromScale(0.12, 1),
                    BackgroundColor3 = v9
                }, { u1.createElement("UIStroke", {
                        Thickness = 1,
                        Color = ColorUtil.darken(v9, 0.5)
                    }) }),
                ["ScriptLeaderboardName_" .. tostring(u4.data.place)] = u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    AutoLocalize = false,
                    Text = v8,
                    Font = Enum.Font.Arial,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0.12, 0.1),
                    Size = UDim2.fromScale(0.68, 0.8),
                    TextXAlignment = Enum.TextXAlignment.Left
                }, { u1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.05, 0)
                    }), u1.createElement("UIStroke", {
                        Thickness = 1,
                        Color = Color3.fromRGB(0, 0, 0)
                    }) }),
                ["ScriptLeaderboardScore_" .. tostring(u4.data.place)] = u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    AutoLocalize = false,
                    Text = tostring(v6),
                    Font = Enum.Font.Arial,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0.8, 0.1),
                    Size = UDim2.fromScale(0.2, 0.8),
                    TextXAlignment = Enum.TextXAlignment.Right
                }, { u1.createElement("UIPadding", {
                        PaddingRight = UDim.new(0.075, 0)
                    }), u1.createElement("UIStroke", {
                        Thickness = 1,
                        Color = Color3.fromRGB(0, 0, 0)
                    }) })
            })
        });
    end)
};