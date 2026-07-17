-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local TweenService = v6.TweenService;
local PvPArenaGameState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvPArenaIntermissionHealthHolder = RuntimeLib.import(script, script.Parent, "pvp-arena-intermission-health-holder").PvPArenaIntermissionHealthHolder;
local v32 = v4.new(u3)(function(p7, p8) -- Line: 16
    -- upvalues: u3 (copy), u2 (copy), TweenService (copy), DeviceUtil (copy), default (copy), u1 (copy), Players (copy), PvPArenaGameState (copy), Theme (copy), PvPArenaIntermissionHealthHolder (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9 = u3.createRef();
    local u10 = u3.createRef();
    local u11, u12 = useState(false);
    useEffect(function() -- Line: 22
        -- upvalues: u9 (copy), u10 (copy), u2 (ref), TweenService (ref), DeviceUtil (ref), u12 (copy), default (ref), u1 (ref), Players (ref), PvPArenaGameState (ref), u11 (copy)
        local v13 = u9:getValue();
        local v14 = u10:getValue();

        if not (v13 and v14) then
            return nil;
        end;

        local v15 = u2.new();
        local u16 = TweenService:Create(v13, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(1, 0.5)
        });
        local u17 = TweenService:Create(v13, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(1.03, 0.5)
        });
        local u18 = TweenService:Create(v14, TweenInfo.new(2.4000000000000004, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(1, 0.5)
        });
        local u19 = TweenService:Create(v14, TweenInfo.new(2.4000000000000004, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(1.3, 0.5)
        });
        u16:Play();
        v15:GiveTask(u16.Completed:Connect(function() -- Line: 43
            -- upvalues: u18 (copy)
            u18:Play();
        end));
        v15:GiveTask(u19.Completed:Connect(function() -- Line: 46
            -- upvalues: u17 (copy)
            u17:Play();
        end));

        if DeviceUtil.isHoarceKat() then
            u16:Play();
            u12(true);

            return;
        end;

        v15:GiveTask(default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p20) -- Line: 55
            -- upvalues: u1 (ref), Players (ref), PvPArenaGameState (ref), u11 (ref), u16 (copy), u12 (ref), u19 (copy)
            local activeMatchups = p20.activeMatchups;
            local v21;

            if activeMatchups == nil then
                v21 = activeMatchups;
            else
                local function v30(p22) -- Line: 58
                    -- upvalues: u1 (ref), Players (ref)
                    local v23 = {};
                    local v24 = #v23;
                    local v25 = u1.values(p22.teamA.members);
                    local v26 = #v25;
                    table.move(v25, 1, v26, v24 + 1, v23);
                    local v27 = u1.values(p22.teamB.members);
                    table.move(v27, 1, #v27, v24 + v26 + 1, v23);

                    local function _(p28) -- Line: 67
                        -- upvalues: Players (ref)
                        return p28.userId == Players.LocalPlayer.UserId;
                    end;

                    local v29 = nil;

                    for i, v in v23 do
                        local _ = i - 1;

                        if v.userId == Players.LocalPlayer.UserId == true then
                            v29 = v;
                            break;
                        end;
                    end;

                    return v29 ~= nil;
                end;

                v21 = nil;

                for i, v in activeMatchups do
                    if v30(v, i - 1, activeMatchups) == true then
                        v21 = v;
                        break;
                    end;
                end;
            end;

            if p20.gameState == PvPArenaGameState.INTERMISSION and not u11 then
                u16:Play();
                u12(true);
            end;

            if p20.gameState == PvPArenaGameState.IN_PROGRESS and v21 then
                u19:Play();
                u12(false);
            end;
        end));
        v15:GiveTask(default.Client:Get("PvPArenaMatchupCompleted"):Connect(function(p31) -- Line: 102
            -- upvalues: Players (ref), u11 (ref), u16 (copy), u12 (ref)
            if (table.find(p31.winningTeamMembers, Players.LocalPlayer) ~= nil or (table.find(p31.losingTeamMembers, Players.LocalPlayer) ~= nil or p31.roundEnded)) and not u11 then
                u16:Play();
                u12(true);
            end;
        end));
    end, {});

    return u3.createElement("ScreenGui", {
        ResetOnSpawn = false,
        DisplayOrder = 900,
        ScreenInsets = Enum.ScreenInsets.None
    }, {
        IntermissionBackground = u3.createElement("Frame", {
            [u3.Ref] = u9,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(1.03, 0.5),
            Size = UDim2.fromScale(0.04, 0.9),
            BackgroundTransparency = 0,
            BackgroundColor3 = Theme.backgroundPrimary
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 30)
            }), u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0,
                Color = Theme.backgroundSecondary
            }) }),
        PlayerHealthArea = u3.createElement("Frame", {
            [u3.Ref] = u10,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1.3, 0.5),
            Size = UDim2.fromScale(0.09, 0.9),
            BackgroundTransparency = 1,
            BackgroundColor3 = Theme.backgroundPrimary
        }, { u3.createElement(PvPArenaIntermissionHealthHolder, {
                AppId = "PvPArenaIntermissionHealthHolder"
            }) })
    });
end);

return {
    PvPArenaIntermissionUI = v5.connect(function(p33, p34) -- Line: 160
        local v35 = {};

        for i, v in p34 do
            v35[i] = v;
        end;

        return v35;
    end)(v32)
};