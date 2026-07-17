-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local PvPArenaGameState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    PvPArenaRoundMatchupsSolo = v4.new(u3)(function(p6, p7) -- Line: 15
        -- upvalues: u3 (copy), TweenService (copy), DeviceUtil (copy), default (copy), PvPArenaGameState (copy), u2 (copy), Players (copy), Theme (copy), ColorUtil (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(nil);
        local v10, u11 = useState(nil);
        local v12, u13 = useState(nil);
        local v14, u15 = useState(nil);
        local u16 = u3.createRef();
        local u17 = u3.createRef();
        useEffect(function() -- Line: 24
            -- upvalues: u16 (copy), u17 (copy), TweenService (ref), DeviceUtil (ref), default (ref), PvPArenaGameState (ref), u2 (ref), Players (ref), u9 (copy), u11 (copy), u13 (copy), u15 (copy)
            local v18 = u16:getValue();
            local v19 = u17:getValue();

            if not (v18 and v19) then
                return nil;
            end;

            local u20 = TweenService:Create(v18, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.09, 0)
            });
            local u21 = TweenService:Create(v18, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.2, 0)
            });
            local u22 = TweenService:Create(v19, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.91, 0)
            });
            local u23 = TweenService:Create(v19, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.8, 0)
            });

            if not DeviceUtil.isHoarceKat() then
                default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p24) -- Line: 43
                    -- upvalues: PvPArenaGameState (ref), u21 (copy), u23 (copy), u2 (ref), Players (ref), u9 (ref), u11 (ref), u13 (ref), u15 (ref), u20 (copy), u22 (copy)
                    if p24.gameState == PvPArenaGameState.INTERMISSION then
                        u21:Play();
                        u23:Play();
                    end;

                    if p24.gameState == PvPArenaGameState.IN_PROGRESS and p24.activeMatchups then
                        local u25 = nil;
                        local activeMatchups = p24.activeMatchups;

                        local function v31(u26) -- Line: 52
                            -- upvalues: u2 (ref), Players (ref), u25 (ref)
                            local v27 = u2.values(u26.teamA.members);
                            local v28 = u2.values(u26.teamB.members);

                            local function _(p29) -- Line: 55
                                -- upvalues: Players (ref), u25 (ref), u26 (copy)
                                if Players.LocalPlayer.UserId == p29.userId then
                                    u25 = u26;
                                end;
                            end;

                            for i, v in v27 do
                                local _ = i - 1;

                                if Players.LocalPlayer.UserId == v.userId then
                                    u25 = u26;
                                end;
                            end;

                            local function _(p30) -- Line: 63
                                -- upvalues: Players (ref), u25 (ref), u26 (copy)
                                if Players.LocalPlayer.UserId == p30.userId then
                                    u25 = u26;
                                end;
                            end;

                            for i, v in v28 do
                                local _ = i - 1;

                                if Players.LocalPlayer.UserId == v.userId then
                                    u25 = u26;
                                end;
                            end;
                        end;

                        for i, v in activeMatchups do
                            v31(v, i - 1, activeMatchups);
                        end;

                        if u25 ~= nil then
                            local v32 = u2.values(u25.teamA.members);
                            local v33 = u2.values(u25.teamB.members);
                            u9(u25.teamA);
                            u11(u25.teamB);

                            if v32[1] ~= nil then
                                u13(v32[1].userId);
                            end;

                            if v33[1] ~= nil then
                                u15(v33[1].userId);
                            end;

                            u20:Play();
                            u22:Play();
                        end;
                    end;
                end);

                return;
            end;

            u20:Play();
            u22:Play();
        end, {});
        local v34 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1.6, 0.35),
            Position = UDim2.fromScale(0.5, 0.65)
        };
        local v35 = {};
        local _ = #v35;
        local v36 = {
            [u3.Ref] = u16,
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromScale(0.2, 1),
            Position = UDim2.fromScale(0.2, 0),
            BackgroundTransparency = 0
        };

        if v8 ~= nil then
            v8 = v8.color;
        end;

        if v8 == nil then
            v8 = Theme.backgroundPrimary;
        end;

        v36.BackgroundColor3 = v8;
        v36.ZIndex = -2;
        local createElement = u3.createElement;
        local v37 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), (u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            })) };
        local createElement2 = u3.createElement;
        local v38 = {
            BackgroundTransparency = 0.1,
            ZIndex = -1,
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.25, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v39;

        if v12 == 0 or (v12 ~= v12 or not v12) then
            v39 = nil;
        else
            v39 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v12) .. "&w=48&h=48";
        end;

        v38.Image = v39;
        v37.PlayerCard1 = createElement2("ImageLabel", v38, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        v35.PvPArenaMatchup1 = createElement("Frame", v36, v37);
        local v40 = {
            [u3.Ref] = u17,
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.fromScale(0.2, 1),
            Position = UDim2.fromScale(0.8, 0),
            BackgroundTransparency = 0
        };

        if v10 ~= nil then
            v10 = v10.color;
        end;

        if v10 == nil then
            v10 = Theme.backgroundPrimary;
        end;

        v40.BackgroundColor3 = v10;
        v40.ZIndex = -2;
        local createElement3 = u3.createElement;
        local v41 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), (u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            })) };
        local createElement4 = u3.createElement;
        local v42 = {
            BackgroundTransparency = 0.1,
            ZIndex = -1,
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.75, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v43;

        if v14 == 0 or (v14 ~= v14 or not v14) then
            v43 = nil;
        else
            v43 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v14) .. "&w=48&h=48";
        end;

        v42.Image = v43;
        v41.PlayerCard2 = createElement4("ImageLabel", v42, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        v35.PvPArenaMatchup2 = createElement3("Frame", v40, v41);

        return u3.createFragment({
            PvPArenaMatchupAreaSolo = u3.createElement("Frame", v34, v35)
        });
    end)
};