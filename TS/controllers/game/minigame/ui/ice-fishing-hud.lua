-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta");
local getMinigameMeta = v6.getMinigameMeta;
local MinigameType = v6.MinigameType;
local MinigameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    IceFishingHUD = v5.new(u4)(function(p7, p8) -- Line: 19
        -- upvalues: DeviceUtil (copy), MinigameUtil (copy), Players (copy), getMinigameMeta (copy), MinigameType (copy), default (copy), u4 (copy), Countdown (copy), AutoSizedText (copy), ColorUtil (copy), u3 (copy), u2 (copy), Empty (copy)
        local useEffect = p8.useEffect;
        local useState = p8.useState;
        local u9;

        if DeviceUtil.isHoarceKat() then
            u9 = nil;
        else
            u9 = MinigameUtil:getMinigameTeamIdByPlayer(Players.LocalPlayer);
        end;

        local v10, u11 = useState({});
        local v12 = os.time();
        local duration = getMinigameMeta(MinigameType.ICE_FISHING).duration;
        local v13, _ = useState(v12 + (duration == nil and 90 or duration));
        useEffect(function() -- Line: 30
            -- upvalues: DeviceUtil (ref), default (ref), u11 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u15 = default.Client:Get("IceFishingScoreUpdated"):Connect(function(p14) -- Line: 35
                -- upvalues: u11 (ref)
                u11(p14.scoreUpdate);
            end);

            return function() -- Line: 38
                -- upvalues: u15 (copy)
                u15:Disconnect();
            end;
        end, {});
        local v16 = {};
        local v17 = {
            Size = UDim2.fromScale(0.8, 0.1),
            Position = UDim2.fromScale(0.5, 0.02),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v18 = {
            u4.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            u4.createElement(Countdown, {
                EndTime = v13,
                TextLabel = {
                    Size = UDim2.fromScale(0.4, 0.4),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                },
                CountdownConfig = {
                    minutes = true,
                    hours = false,
                    days = false
                }
            }),
            HudTitleWrapper = u4.createElement("Frame", {
                AutomaticSize = "XY",
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 0.3),
                BackgroundColor3 = Color3.fromRGB(33, 235, 255)
            }, {
                u4.createElement("UIListLayout", {
                    HorizontalAlignment = "Center"
                }),
                u4.createElement("UICorner", {
                    CornerRadius = UDim.new(0.2, 0)
                }),
                u4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 6),
                    PaddingRight = UDim.new(0, 6),
                    PaddingTop = UDim.new(0, 6),
                    PaddingBottom = UDim.new(0, 6)
                }),
                u4.createElement(AutoSizedText, {
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
        local _ = #v18;
        local v19 = u3.entries(v10);
        table.sort(v19, function(p20, p21) -- Line: 107
            -- upvalues: u9 (copy)
            local _ = p20[2];
            local _ = p21[1];
            local _ = p21[2];

            return p20[1] == u9;
        end);

        local function v30(p22) -- Line: 118
            -- upvalues: u2 (ref), u4 (ref), u9 (copy)
            local v23 = p22[1];
            local v24 = p22[2];
            local v25 = u2.Controllers.MinigameTeamController:getTeam(v23);

            if not v25 then
                return nil;
            end;

            local v26 = {
                SizeConstraint = "RelativeYY",
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = v25.color
            };
            local v27 = { u4.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }) };
            local v28 = #v27;
            local v29;

            if v23 == u9 then
                v29 = u4.createElement("UIStroke", {
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
            v27.PlayersRemaining = u4.createElement("TextLabel", {
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

            return u4.createFragment({
                TeamBox = u4.createElement("Frame", v26, v27)
            });
        end;

        local v31 = 0;
        local v32 = {};
        local v33 = {
            ResetOnSpawn = false,
            DisplayOrder = 99
        };

        for i, v in v19 do
            local v34 = v30(v, i - 1, v19);

            if v34 ~= nil then
                v31 = v31 + 1;
                v32[v31] = v34;
            end;
        end;

        local v35 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.65)
        };
        local v36 = { u4.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 6)
            }) };
        local v37 = #v36;

        for i, v in v32 do
            v36[v37 + i] = v;
        end;

        v18.TeamScores = u4.createElement(Empty, v35, v36);
        v16[#v16 + 1] = u4.createElement(Empty, v17, v18);

        return u4.createFragment({
            IceFishingHud = u4.createElement("ScreenGui", v33, v16)
        });
    end)
};