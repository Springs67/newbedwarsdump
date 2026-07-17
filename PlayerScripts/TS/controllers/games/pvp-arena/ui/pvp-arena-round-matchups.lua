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
    PvPArenaRoundMatchups = v4.new(u3)(function(p6, p7) -- Line: 15
        -- upvalues: u3 (copy), TweenService (copy), DeviceUtil (copy), default (copy), PvPArenaGameState (copy), u2 (copy), Players (copy), Theme (copy), ColorUtil (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(nil);
        local v10, u11 = useState(nil);
        local v12, u13 = useState(nil);
        local v14, u15 = useState(nil);
        local v16, u17 = useState(nil);
        local v18, u19 = useState(nil);
        local u20 = u3.createRef();
        local u21 = u3.createRef();
        useEffect(function() -- Line: 26
            -- upvalues: u20 (copy), u21 (copy), TweenService (ref), DeviceUtil (ref), default (ref), PvPArenaGameState (ref), u2 (ref), Players (ref), u9 (copy), u11 (copy), u13 (copy), u15 (copy), u17 (copy), u19 (copy)
            local v22 = u20:getValue();
            local v23 = u21:getValue();

            if not (v22 and v23) then
                return nil;
            end;

            local u24 = TweenService:Create(v22, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0, 0)
            });
            local u25 = TweenService:Create(v22, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.2, 0)
            });
            local u26 = TweenService:Create(v23, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(1, 0)
            });
            local u27 = TweenService:Create(v23, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.8, 0)
            });

            if not DeviceUtil.isHoarceKat() then
                default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p28) -- Line: 45
                    -- upvalues: PvPArenaGameState (ref), u25 (copy), u27 (copy), u2 (ref), Players (ref), u9 (ref), u11 (ref), u13 (ref), u15 (ref), u17 (ref), u19 (ref), u24 (copy), u26 (copy)
                    if p28.gameState == PvPArenaGameState.INTERMISSION then
                        u25:Play();
                        u27:Play();
                    end;

                    if p28.gameState == PvPArenaGameState.IN_PROGRESS and p28.activeMatchups then
                        local u29 = nil;
                        local activeMatchups = p28.activeMatchups;

                        local function v35(u30) -- Line: 54
                            -- upvalues: u2 (ref), Players (ref), u29 (ref)
                            local v31 = u2.values(u30.teamA.members);
                            local v32 = u2.values(u30.teamB.members);

                            local function _(p33) -- Line: 57
                                -- upvalues: Players (ref), u29 (ref), u30 (copy)
                                if Players.LocalPlayer.UserId == p33.userId then
                                    u29 = u30;
                                end;
                            end;

                            for i, v in v31 do
                                local _ = i - 1;

                                if Players.LocalPlayer.UserId == v.userId then
                                    u29 = u30;
                                end;
                            end;

                            local function _(p34) -- Line: 65
                                -- upvalues: Players (ref), u29 (ref), u30 (copy)
                                if Players.LocalPlayer.UserId == p34.userId then
                                    u29 = u30;
                                end;
                            end;

                            for i, v in v32 do
                                local _ = i - 1;

                                if Players.LocalPlayer.UserId == v.userId then
                                    u29 = u30;
                                end;
                            end;
                        end;

                        for i, v in activeMatchups do
                            v35(v, i - 1, activeMatchups);
                        end;

                        if u29 ~= nil then
                            local v36 = u2.values(u29.teamA.members);
                            local v37 = u2.values(u29.teamB.members);
                            u9(u29.teamA);
                            u11(u29.teamB);

                            if v36[1] ~= nil then
                                u13(v36[1].userId);
                            end;

                            if v36[2] ~= nil then
                                u15(v36[2].userId);
                            end;

                            if v37[1] ~= nil then
                                u17(v37[1].userId);
                            end;

                            if v37[2] ~= nil then
                                u19(v37[2].userId);
                            end;

                            u24:Play();
                            u26:Play();
                        end;
                    end;
                end);

                return;
            end;

            u24:Play();
            u26:Play();
        end, {});
        local v38 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1.6, 0.35),
            Position = UDim2.fromScale(0.5, 0.65)
        };
        local v39 = {};
        local _ = #v39;
        local v40 = {
            [u3.Ref] = u20,
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

        v40.BackgroundColor3 = v8;
        v40.ZIndex = -2;
        local createElement = u3.createElement;
        local v41 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), (u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            })) };
        local createElement2 = u3.createElement;
        local v42 = {
            BackgroundTransparency = 0.1,
            ZIndex = -1,
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.25, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v43;

        if v12 == 0 or (v12 ~= v12 or not v12) then
            v43 = nil;
        else
            v43 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v12) .. "&w=48&h=48";
        end;

        v42.Image = v43;
        v41.PlayerCard1 = createElement2("ImageLabel", v42, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        local createElement3 = u3.createElement;
        local v44 = {
            BackgroundTransparency = 0.1,
            ZIndex = -1,
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.7, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v45;

        if v14 == 0 or (v14 ~= v14 or not v14) then
            v45 = nil;
        else
            v45 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v14) .. "&w=48&h=48";
        end;

        v44.Image = v45;
        v41.PlayerCard2 = createElement3("ImageLabel", v44, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        v39.PvPArenaMatchup1 = createElement("Frame", v40, v41);
        local v46 = {
            [u3.Ref] = u21,
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

        v46.BackgroundColor3 = v10;
        v46.ZIndex = -2;
        local createElement4 = u3.createElement;
        local v47 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), (u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            })) };
        local createElement5 = u3.createElement;
        local v48 = {
            BackgroundTransparency = 0.1,
            ZIndex = -1,
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.3, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v49;

        if v16 == 0 or (v16 ~= v16 or not v16) then
            v49 = nil;
        else
            v49 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v16) .. "&w=48&h=48";
        end;

        v48.Image = v49;
        v47.PlayerCard3 = createElement5("ImageLabel", v48, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        local createElement6 = u3.createElement;
        local v50 = {
            BackgroundTransparency = 0.1,
            ZIndex = -1,
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.75, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v51;

        if v18 == 0 or (v18 ~= v18 or not v18) then
            v51 = nil;
        else
            v51 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v18) .. "&w=48&h=48";
        end;

        v50.Image = v51;
        v47.PlayerCard4 = createElement6("ImageLabel", v50, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) });
        v39.PvPArenaMatchup2 = createElement4("Frame", v46, v47);

        return u3.createFragment({
            PvPArenaMatchupArea = u3.createElement("Frame", v38, v39)
        });
    end)
};