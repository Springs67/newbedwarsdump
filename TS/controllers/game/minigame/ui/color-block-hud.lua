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
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    ColorBlockHUD = v4.new(u3)(function(p5, p6) -- Line: 15
        -- upvalues: DeviceUtil (copy), MinigameUtil (copy), Players (copy), default (copy), u3 (copy), AutoSizedText (copy), ColorUtil (copy), u2 (copy), KnitClient (copy), Empty (copy)
        local useEffect = p6.useEffect;
        local useState = p6.useState;
        local u7;

        if DeviceUtil.isHoarceKat() then
            u7 = nil;
        else
            u7 = MinigameUtil:getMinigameTeamIdByPlayer(Players.LocalPlayer);
        end;

        local v8, u9 = useState({});
        useEffect(function() -- Line: 20
            -- upvalues: DeviceUtil (ref), default (ref), u9 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u11 = default.Client:Get("ColorBlockScoreUpdated"):Connect(function(p10) -- Line: 25
                -- upvalues: u9 (ref)
                u9(p10.scoreUpdate);
            end);

            return function() -- Line: 28
                -- upvalues: u11 (copy)
                u11:Disconnect();
            end;
        end, {});
        local v12 = {};
        local v13 = {
            Size = UDim2.fromScale(0.8, 0.1),
            Position = UDim2.fromScale(0.5, 0.02),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v14 = {
            u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            HudTitleWrapper = u3.createElement("Frame", {
                AutomaticSize = "XY",
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0, 0.3),
                BackgroundColor3 = Color3.fromRGB(33, 235, 255)
            }, {
                u3.createElement("UIListLayout", {
                    HorizontalAlignment = "Center"
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.2, 0)
                }),
                u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 6),
                    PaddingRight = UDim.new(0, 6),
                    PaddingTop = UDim.new(0, 6),
                    PaddingBottom = UDim.new(0, 6)
                }),
                u3.createElement(AutoSizedText, {
                    Text = "TEAM POINTS",
                    TextSize = DeviceUtil.isSmallScreen() and 16 or 20,
                    TextColor3 = ColorUtil.WHITE,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Font = Enum.Font.GothamBold
                })
            })
        };
        local _ = #v14;
        local v15 = u2.entries(v8);
        table.sort(v15, function(p16, p17) -- Line: 85
            -- upvalues: u7 (copy)
            local _ = p16[2];
            local _ = p17[1];
            local _ = p17[2];

            return p16[1] == u7;
        end);

        local function v26(p18) -- Line: 96
            -- upvalues: KnitClient (ref), u3 (ref), u7 (copy)
            local v19 = p18[1];
            local v20 = p18[2];
            local v21 = KnitClient.Controllers.MinigameTeamController:getTeam(v19);

            if not v21 then
                return nil;
            end;

            local v22 = {
                SizeConstraint = "RelativeYY",
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = v21.color
            };
            local v23 = { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }) };
            local v24 = #v23;
            local v25;

            if u7 == v19 then
                v25 = u3.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255)
                });
            else
                v25 = false;
            end;

            if v25 then
                v23[v24 + 1] = v25;
            end;

            local _ = #v23;
            v23.PlayersRemaining = u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 0.7),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = "<b>" .. tostring(v20) .. "</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Font = Enum.Font.Roboto
            });

            return u3.createFragment({
                TeamBox = u3.createElement("Frame", v22, v23)
            });
        end;

        local v27 = 0;
        local v28 = {};
        local v29 = {
            ResetOnSpawn = false,
            DisplayOrder = 99
        };

        for i, v in v15 do
            local v30 = v26(v, i - 1, v15);

            if v30 ~= nil then
                v27 = v27 + 1;
                v28[v27] = v30;
            end;
        end;

        local v31 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.65)
        };
        local v32 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 6)
            }) };
        local v33 = #v32;

        for i, v in v28 do
            v32[v33 + i] = v;
        end;

        v14.TeamScores = u3.createElement(Empty, v31, v32);
        v12[#v12 + 1] = u3.createElement(Empty, v13, v14);

        return u3.createFragment({
            ColorBlockHud = u3.createElement("ScreenGui", v29, v12)
        });
    end)
};