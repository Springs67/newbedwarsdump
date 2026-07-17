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
    PvPArenaSoloHealthPanel = v5.new(u4)(function(p6, p7) -- Line: 17
        -- upvalues: u4 (copy), u2 (copy), DeviceUtil (copy), Players (copy), u3 (copy), default (copy), PvPArenaGameState (copy), ColorUtil (copy), Theme (copy), PvpArenaAugmentTeamCard (copy), ProgressBar (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8, u9 = useState(false);
        local u10, u11 = useState(false);
        local u12, u13 = useState(false);
        local u14 = u4.createRef();
        local u15 = u4.createRef();
        local v16 = u2.values(p6.teamHealth.team.members);
        local v17;

        if v16[1] == nil then
            v17 = nil;
        else
            v17 = v16[1].userId;
        end;

        if v16[2] ~= nil then
            local _ = v16[2].userId;
        end;

        local v18 = p6.teamHealth.health <= 0;
        local v19;

        if DeviceUtil.isHoarceKat() then
            v19 = false;
        else
            local v20 = v16[1];

            if v20 ~= nil then
                v20 = v20.userId;
            end;

            v19 = Players.LocalPlayer.UserId == v20;

            if not v19 then
                local v21 = v16[2];

                if v21 ~= nil then
                    v21 = v21.userId;
                end;

                v19 = Players.LocalPlayer.UserId == v21;
            end;
        end;

        useEffect(function() -- Line: 56
            -- upvalues: u14 (copy), u15 (copy), u3 (ref), u11 (copy), u12 (copy), u8 (copy), u9 (copy), u13 (copy), DeviceUtil (ref), default (ref), PvPArenaGameState (ref)
            local v22 = u14:getValue();
            local v23 = u15:getValue();

            if not v22 then
                return nil;
            end;

            if not v23 then
                return nil;
            end;

            local u24 = u3.new();
            u24:GiveTask(v22.MouseEnter:Connect(function() -- Line: 66
                -- upvalues: u11 (ref)
                u11(true);
            end));
            u24:GiveTask(v22.MouseLeave:Connect(function() -- Line: 69
                -- upvalues: u12 (ref), u11 (ref), u8 (ref), u9 (ref)
                if not u12 then
                    u11(false);

                    if u8 then
                        u9(false);
                    end;
                end;
            end));
            u24:GiveTask(v23.MouseEnter:Connect(function() -- Line: 77
                -- upvalues: u13 (ref)
                u13(true);
            end));
            u24:GiveTask(v23.MouseLeave:Connect(function() -- Line: 80
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
                    -- upvalues: u24 (copy), default (ref), PvPArenaGameState (ref), u9 (ref)
                    u24:GiveTask(default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p25) -- Line: 91
                        -- upvalues: PvPArenaGameState (ref), u9 (ref)
                        if p25.gameState == PvPArenaGameState.IN_PROGRESS then
                            u9(false);
                        end;
                    end));
                end);
            end;

            return function() -- Line: 98
                -- upvalues: u24 (copy)
                u24:DoCleaning();
            end;
        end, { u10, u12 });
        local v26 = {
            Size = UDim2.fromScale(1, 0.09),
            LayoutOrder = p6.LayoutOrder
        };
        local v27 = { u4.createElement("ImageButton", {
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
        local v28 = {
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.fromScale(0.7, 1),
            Position = UDim2.fromScale(1, 0),
            BackgroundTransparency = 0
        };
        local v29;

        if v18 then
            v29 = ColorUtil.darken(Theme.backgroundPrimary, 0.8);
        elseif v19 then
            v29 = Color3.fromHex("#777BC7");
        else
            v29 = Theme.backgroundPrimary;
        end;

        v28.BackgroundColor3 = v29;
        v28.ImageTransparency = 1;

        v28[u4.Event.MouseButton1Click] = function() -- Line: 131
            -- upvalues: u9 (copy), u8 (copy)
            u9(not u8);
        end;

        v28[u4.Ref] = u14;
        local v30 = {};
        local v31 = #v30;

        if u8 or u10 then
            u10 = u4.createElement(PvpArenaAugmentTeamCard, {
                AppId = "PvpArenaAugmentTeamCard",
                team = p6.teamHealth.team
            });
        end;

        if u10 then
            v30[v31 + 1] = u10;
        end;

        local v32 = #v30;
        v30[v32 + 1] = u4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.8
        });
        v30[v32 + 2] = u4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        });
        local createElement = u4.createElement;
        local v33 = {
            Thickness = 3,
            Transparency = 0
        };
        local v34;

        if v18 then
            v34 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        elseif v19 then
            v34 = Color3.fromHex("#FFEF5E");
        else
            v34 = Theme.backgroundSecondary;
        end;

        v33.Color = v34;
        v30[v32 + 3] = createElement("UIStroke", v33);
        local v35 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromScale(0.7, 0.5),
            Position = UDim2.fromScale(0.1, 0.1)
        };
        local v36 = {};
        local _ = #v36;
        local v37 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.45, 0.45),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            Position = UDim2.fromScale(0.1, 0),
            BackgroundTransparency = v18 and 0.5 or 0.1
        };
        local v38;

        if v18 then
            v38 = ColorUtil.darken(ColorUtil.WHITE, 0.8);
        else
            v38 = ColorUtil.WHITE;
        end;

        v37.BackgroundColor3 = v38;
        local v39;

        if v17 == 0 or (v17 ~= v17 or not v17) then
            v39 = nil;
        else
            v39 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v17) .. "&w=48&h=48";
        end;

        v37.Image = v39;
        local v40 = {};
        local v41 = u4.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        });
        local createElement2 = u4.createElement;
        local v42 = {
            Thickness = 3,
            Transparency = 0
        };
        local v43;

        if v18 then
            v43 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        else
            v43 = Theme.backgroundSecondary;
        end;

        v42.Color = v43;
        v40[1], v40[2] = v41, createElement2("UIStroke", v42);
        local v44 = #v40;
        local v45;

        if v18 then
            v45 = u4.createFragment({
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
            v45 = v18;
        end;

        if v45 then
            v40[v44 + 1] = v45;
        end;

        v36.PlayerCard1 = u4.createElement("ImageLabel", v37, v40);
        v30.PlayerCardArea = u4.createElement("Frame", v35, v36);
        local v46 = "health-" .. p6.teamHealth.team.id;
        local createElement3 = u4.createElement;
        local v47 = {
            ZIndex = 2,
            AcceptZero = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.8),
            Size = UDim2.fromScale(0.9, 0.1),
            Progress = math.clamp(p6.teamHealth.health / 100, 0, 1),
            BarColor = p6.teamHealth.team.color,
            BarBackgroundColor = Theme.backgroundTertiary
        };
        local v48 = {};
        local createElement4 = u4.createElement;
        local v49 = {
            Thickness = 3,
            Transparency = 0
        };
        local v50;

        if v18 then
            v50 = ColorUtil.darken(Theme.backgroundSecondary, 0.8);
        else
            v50 = Theme.backgroundSecondary;
        end;

        v49.Color = v50;
        v48[1] = createElement4("UIStroke", v49);
        v30[v46] = createElement3(ProgressBar, v47, v48);
        local createElement5 = u4.createElement;
        local v51 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 1),
            Size = UDim2.fromScale(0.34, 0.6),
            Position = UDim2.fromScale(0.6, 0.65)
        };
        local v52 = {};
        local createElement6 = u4.createElement;
        local v53 = {
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
        local v54;

        if v18 then
            v54 = Color3.fromRGB(255, 0, 0);
        else
            v54 = Color3.fromHex("#29FF52");
        end;

        v53.TextColor3 = v54;
        v53.TextTransparency = v18 and 0.5 or 0;
        v53.TextXAlignment = Enum.TextXAlignment.Center;
        v53.TextStrokeColor3 = Theme.backgroundSecondary;
        v52.PlayerHealthText = createElement6("TextLabel", v53);
        v30.PlayerHealthTextArea = createElement5("Frame", v51, v52);
        v27[#v27 + 1] = u4.createElement("ImageButton", v28, v30);

        return u4.createFragment({
            TeamHealthBackground = u4.createElement(Empty, v26, v27)
        });
    end)
};