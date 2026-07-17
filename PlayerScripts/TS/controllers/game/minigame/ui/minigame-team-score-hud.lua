-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local MinigameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil;

return {
    MinigameTeamScoreHud = v4.new(u3)(function(p5, p6) -- Line: 14
        -- upvalues: DeviceUtil (copy), MinigameUtil (copy), Players (copy), KnitClient (copy), u3 (copy), ColorUtil (copy), AutoSizedText (copy), u2 (copy), Empty (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7;

        if DeviceUtil.isHoarceKat() then
            u7 = nil;
        else
            u7 = MinigameUtil:getMinigameTeamIdByPlayer(Players.LocalPlayer);
        end;

        local v8, u9 = useState(nil);
        useEffect(function() -- Line: 19
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u9 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local MinigameController = KnitClient.Controllers.MinigameController;

            if MinigameController.scoreSnapshot then
                u9(MinigameController.scoreSnapshot);
            end;

            local u11 = MinigameController.scoreUpdateSignal:Connect(function(p10) -- Line: 27
                -- upvalues: u9 (ref)
                u9(p10);
            end);

            return function() -- Line: 30
                -- upvalues: u11 (copy)
                u11:Disconnect();
            end;
        end, {});
        local v12 = {
            ResetOnSpawn = false,
            DisplayOrder = 99
        };
        local v13 = {};
        local v14 = {
            Size = UDim2.fromScale(0.8, 0.125),
            Position = UDim2.fromScale(0.5, 0.02),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v15 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local _ = #v15;
        local v16 = {
            AutomaticSize = "XY",
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0, 0.3),
            BackgroundColor3 = Color3.fromRGB(33, 235, 255)
        };
        local v17 = { u3.createElement("UIListLayout", {
                HorizontalAlignment = "Center"
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.2, 0)
            }), u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
                PaddingTop = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 6)
            }) };
        local v18 = {};
        local teamScoresHud = p5.Minigame.teamScoresHud;

        if teamScoresHud ~= nil then
            teamScoresHud = string.upper(teamScoresHud.title);
        end;

        v18.Text = teamScoresHud == nil and "TEAM POINTS" or teamScoresHud;
        v18.TextSize = DeviceUtil.isSmallScreen() and 16 or 20;
        v18.TextColor3 = ColorUtil.WHITE;
        v18.Position = UDim2.fromScale(0.5, 0.5);
        v18.AnchorPoint = Vector2.new(0.5, 0.5);
        v18.TextXAlignment = Enum.TextXAlignment.Center;
        v18.TextYAlignment = Enum.TextYAlignment.Center;
        v18.Font = Enum.Font.GothamBold;
        v17[#v17 + 1] = u3.createElement(AutoSizedText, v18);
        v15.HudTitleWrapper = u3.createElement("Frame", v16, v17);

        if v8 then
            local v19 = u2.entries(v8);
            table.sort(v19, function(p20, p21) -- Line: 100
                -- upvalues: u7 (copy)
                local _ = p20[2];
                local _ = p21[1];
                local _ = p21[2];

                return p20[1] == u7;
            end);

            local function v30(p22) -- Line: 111
                -- upvalues: KnitClient (ref), u3 (ref), u7 (copy)
                local v23 = p22[1];
                local v24 = p22[2];
                local v25 = KnitClient.Controllers.MinigameTeamController:getTeam(v23);

                if not v25 then
                    return nil;
                end;

                local v26 = {
                    SizeConstraint = "RelativeYY",
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = v25.color
                };
                local v27 = { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }) };
                local v28 = #v27;
                local v29;

                if u7 == v23 then
                    v29 = u3.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(255, 255, 255)
                    });
                else
                    v29 = false;
                end;

                if v29 then
                    v27[v28 + 1] = v29;
                end;

                local _ = #v27;
                v27.TeamScore = u3.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>" .. tostring(v24) .. "</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.Roboto
                });

                return u3.createFragment({
                    TeamBox = u3.createElement("Frame", v26, v27)
                });
            end;

            local v31 = 0;
            v8 = {};

            for i, v in v19 do
                local v32 = v30(v, i - 1, v19);

                if v32 ~= nil then
                    v31 = v31 + 1;
                    v8[v31] = v32;
                end;
            end;
        end;

        local v33 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.65)
        };
        local v34 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 6 or 10)
            }) };
        local v35 = #v34;

        if v8 then
            for i, v in v8 do
                v34[v35 + i] = v;
            end;
        end;

        v15.TeamScores = u3.createElement(Empty, v33, v34);
        v13[#v13 + 1] = u3.createElement(Empty, v14, v15);

        return u3.createFragment({
            SnowballDodgeballHud = u3.createElement("ScreenGui", v12, v13)
        });
    end)
};