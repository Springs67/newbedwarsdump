-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local PvPArenaGameState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvpArenaAugmentTeamCard = RuntimeLib.import(script, script.Parent, "pvp-arena-augment-team-card").PvpArenaAugmentTeamCard;

return {
    PvPArenaTeamHealthPanel = v5.new(u4)(function(p6, p7) -- Line: 17
        -- upvalues: u4 (copy), u2 (copy), DeviceUtil (copy), Players (copy), u3 (copy), default (copy), PvPArenaGameState (copy), ColorUtil (copy), Theme (copy), PvpArenaAugmentTeamCard (copy), ProgressBar (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8, u9 = useState(false);
        local u10, u11 = useState(false);
        local u12, u13 = useState(false);
        local u14 = u4.createRef();
        local u15 = u4.createRef();
        local v16 = u2.values(p6.teamHealth.team.members);
        local v17 = nil;
        local v18;

        if v16[1] == nil then
            v18 = nil;
        else
            v18 = v16[1].userId;
        end;

        if v16[2] ~= nil then
            v17 = v16[2].userId;
        end;

        local v19 = p6.teamHealth.health <= 0;
        local v20;

        if DeviceUtil.isHoarceKat() then
            v20 = false;
        else
            local v21 = v16[1];

            if v21 ~= nil then
                v21 = v21.userId;
            end;

            v20 = Players.LocalPlayer.UserId == v21;

            if not v20 then
                local v22 = v16[2];

                if v22 ~= nil then
                    v22 = v22.userId;
                end;

                v20 = Players.LocalPlayer.UserId == v22;
            end;
        end;

        useEffect(function() -- Line: 56
            -- upvalues: u14 (copy), u15 (copy), u3 (ref), u11 (copy), u12 (copy), u8 (copy), u9 (copy), u13 (copy), DeviceUtil (ref), default (ref), PvPArenaGameState (ref)
            local v23 = u14:getValue();
            local v24 = u15:getValue();

            if not v23 then
                return nil;
            end;

            if not v24 then
                return nil;
            end;

            local u25 = u3.new();
            u25:GiveTask(v23.MouseEnter:Connect(function() -- Line: 66
                -- upvalues: u11 (ref)
                u11(true);
            end));
            u25:GiveTask(v23.MouseLeave:Connect(function() -- Line: 69
                -- upvalues: u12 (ref), u11 (ref), u8 (ref), u9 (ref)
                if not u12 then
                    u11(false);

                    if u8 then
                        u9(false);
                    end;
                end;
            end));
            u25:GiveTask(v24.MouseEnter:Connect(function() -- Line: 77
                -- upvalues: u13 (ref)
                u13(true);
            end));
            u25:GiveTask(v24.MouseLeave:Connect(function() -- Line: 80
                -- upvalues: u13 (ref), u12 (ref), u11 (ref), u8 (ref), u9 (ref)
                u13(false);

                if u12 then
                    u11(false);

                    if u8 then
                        u9(false);
                    end;
                end;
            end));

            if not DeviceUtil.isHoarceKat() then
                task.defer(function() -- Line: 90
                    -- upvalues: u25 (copy), default (ref), PvPArenaGameState (ref), u9 (ref)
                    u25:GiveTask(default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p26) -- Line: 91
                        -- upvalues: PvPArenaGameState (ref), u9 (ref)
                        if p26.gameState == PvPArenaGameState.IN_PROGRESS then
                            u9(false);
                        end;
                    end));
                end);
            end;

            return function() -- Line: 98
                -- upvalues: u25 (copy)
                u25:DoCleaning();
            end;
        end, { u10, u12 });
        local v27 = {
            Size = UDim2.fromScale(1, 0.09),
            LayoutOrder = p6.LayoutOrder
        };
        local v28 = { u4.createElement("ImageButton", {
                AnchorPoint = Vector2.new(1, 0),
                Size = UDim2.fromScale(3, 1),
                Position = UDim2.fromScale(1, 0),
                BackgroundTransparency = 1,
                ImageTransparency = 1,

                [u4.Event.MouseButton1Click] = function() -- Line: 113
                    -- upvalues: u10 (copy), u9 (copy), u8 (copy)
                    if u10 then
                        u9(not u8);
                    end;
                end,

                [u4.Ref] = u15,
                Active = u10,
                Interactable = u10
            }) };
        local v29 = {
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(1, 0),
            BackgroundTransparency = 0
        };
        local v30;

        if v19 then
            v30 = ColorUtil.darken(Theme.backgroundPrimary, 0.8);
        elseif v20 then
            v30 = Color3.fromHex("#777BC7");
        else
            v30 = Theme.backgroundPrimary;
        end;

        v29.BackgroundColor3 = v30;
        v29.ImageTransparency = 1;

        v29[u4.Event.MouseButton1Click] = function() -- Line: 131
            -- upvalues: u9 (copy), u8 (copy)
            u9(not u8);
        end;

        v29[u4.Ref] = u14;
        local v31 = {};
        local v32 = #v31;

        if u8 or u10 then
            u10 = u4.createElement(PvpArenaAugmentTeamCard, {
                AppId = "PvpArenaAugmentTeamCard",
                team = p6.teamHealth.team
            });
        end;

        if u10 then
            v31[v32 + 1] = u10;
        end;

        local v33 = #v31;
        v31[v33 + 1] = u4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 2.5
        });
        v31[v33 + 2] = u4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        });
        local createElement = u4.createElement;
        local v34 = {
            Thickness = 3,
            Transparency = 0
        };
        local v35;

        if v19 then
            v35 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        elseif v20 then
            v35 = Color3.fromHex("#FFEF5E");
        else
            v35 = Theme.backgroundSecondary;
        end;

        v34.Color = v35;
        v31[v33 + 3] = createElement("UIStroke", v34);
        local v36 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromScale(0.7, 0.5),
            Position = UDim2.fromScale(0.1, 0.1)
        };
        local v37 = { u4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }) };
        local _ = #v37;
        local v38 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.24, 0.24),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundTransparency = v19 and 0.5 or 0.1
        };
        local v39;

        if v19 then
            v39 = ColorUtil.darken(ColorUtil.WHITE, 0.8);
        else
            v39 = ColorUtil.WHITE;
        end;

        v38.BackgroundColor3 = v39;
        local v40;

        if v18 == 0 or (v18 ~= v18 or not v18) then
            v40 = nil;
        else
            v40 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v18) .. "&w=48&h=48";
        end;

        v38.Image = v40;
        local v41 = {};
        local v42 = u4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        });
        local createElement2 = u4.createElement;
        local v43 = {
            Thickness = 3,
            Transparency = 0
        };
        local v44;

        if v19 then
            v44 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        else
            v44 = Theme.backgroundSecondary;
        end;

        v43.Color = v44;
        v41[1], v41[2] = v42, createElement2("UIStroke", v43);
        local v45 = #v41;
        local v46;

        if v19 then
            v46 = u4.createFragment({
                CrossedOut = u4.createElement("Frame", {
                    Rotation = 45,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.1, 1),
                    BorderColor3 = ColorUtil.darken(Theme.backgroundSecondary, 0.8),
                    BackgroundColor3 = ColorUtil.darken(Theme.backgroundSecondary, 0.8)
                })
            });
        else
            v46 = v19;
        end;

        if v46 then
            v41[v45 + 1] = v46;
        end;

        v37.PlayerCard1 = u4.createElement("ImageLabel", v38, v41);
        local v47 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.24, 0.24),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundTransparency = v19 and 0.5 or 0.1
        };
        local v48;

        if v19 then
            v48 = ColorUtil.darken(ColorUtil.WHITE, 0.8);
        else
            v48 = ColorUtil.WHITE;
        end;

        v47.BackgroundColor3 = v48;
        local v49;

        if v17 == 0 or (v17 ~= v17 or not v17) then
            v49 = nil;
        else
            v49 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v17) .. "&w=48&h=48";
        end;

        v47.Image = v49;
        local v50 = {};
        local v51 = u4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        });
        local createElement3 = u4.createElement;
        local v52 = {
            Thickness = 3,
            Transparency = 0
        };
        local v53;

        if v19 then
            v53 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        else
            v53 = Theme.backgroundSecondary;
        end;

        v52.Color = v53;
        v50[1], v50[2] = v51, createElement3("UIStroke", v52);
        local v54 = #v50;
        local v55;

        if v19 then
            v55 = u4.createFragment({
                CrossedOut = u4.createElement("Frame", {
                    Rotation = 45,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.1, 1),
                    BorderColor3 = ColorUtil.darken(Theme.backgroundSecondary, 0.8),
                    BackgroundColor3 = ColorUtil.darken(Theme.backgroundSecondary, 0.8)
                })
            });
        else
            v55 = v19;
        end;

        if v55 then
            v50[v54 + 1] = v55;
        end;

        v37.PlayerCard2 = u4.createElement("ImageLabel", v47, v50);
        v31.PlayerCardArea = u4.createElement("Frame", v36, v37);
        local v56 = "health-" .. p6.teamHealth.team.id;
        local createElement4 = u4.createElement;
        local v57 = {
            ZIndex = 2,
            AcceptZero = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.8),
            Size = UDim2.fromScale(0.9, 0.1),
            Progress = math.clamp(p6.teamHealth.health / 100, 0, 1),
            BarColor = p6.teamHealth.team.color,
            BarBackgroundColor = Theme.backgroundTertiary
        };
        local v58 = {};
        local createElement5 = u4.createElement;
        local v59 = {
            Thickness = 3,
            Transparency = 0
        };
        local v60;

        if v19 then
            v60 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        else
            v60 = Theme.backgroundSecondary;
        end;

        v59.Color = v60;
        v58[1] = createElement5("UIStroke", v59);
        v31[v56] = createElement4(ProgressBar, v57, v58);
        local createElement6 = u4.createElement;
        local v61 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 1),
            Size = UDim2.fromScale(0.34, 0.6),
            Position = UDim2.fromScale(0.65, 0.65)
        };
        local v62 = {};
        local createElement7 = u4.createElement;
        local v63 = {
            TextSize = 24,
            BackgroundTransparency = 1,
            TextScaled = true,
            TextStrokeTransparency = 0,
            Size = UDim2.fromScale(1, 0.55),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            Text = tostring(p6.teamHealth.health),
            Font = Enum.Font.LuckiestGuy
        };
        local v64;

        if v19 then
            v64 = Color3.fromRGB(255, 0, 0);
        else
            v64 = Color3.fromHex("#29FF52");
        end;

        v63.TextColor3 = v64;
        v63.TextTransparency = v19 and 0.5 or 0;
        v63.TextXAlignment = Enum.TextXAlignment.Center;
        v63.TextStrokeColor3 = Theme.backgroundSecondary;
        v62.PlayerHealthText = createElement7("TextLabel", v63);
        v31.PlayerHealthTextArea = createElement6("Frame", v61, v62);
        v28[#v28 + 1] = u4.createElement("ImageButton", v29, v31);

        return u4.createFragment({
            TeamHealthBackground = u4.createElement(Empty, v27, v28)
        });
    end)
};