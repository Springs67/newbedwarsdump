-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitServer = v1.KnitServer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local RunService = v5.RunService;
local LobbyTitle = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "title", "ui", "lobby-title").LobbyTitle;
local PlayerLobbyTitle = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "title", "ui", "player-lobby-title").PlayerLobbyTitle;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local NametagConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local GlobalTeamsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local NameTagWinStreak = RuntimeLib.import(script, script.Parent, "nametag-winstreak").NameTagWinStreak;

return {
    NameTag = v4.new(u3)(function(u6, p7) -- Line: 27
        -- upvalues: RunService (copy), u3 (copy), EventUtil (copy), EntityUtil (copy), GlobalTeamsUtil (copy), KnitServer (copy), EventMeta (copy), Players (copy), u2 (copy), CollectionService (copy), GamePlayerUtil (copy), PlaceUtil (copy), KnitClient (copy), RankMeta (copy), NametagConfig (copy), PlayerLevelUtil (copy), DeviceUtil (copy), NameTagWinStreak (copy), LobbyTitle (copy), TitleType (copy), PlayerLobbyTitle (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(u6.EntityInstance.Name);
        local v10, u11 = useState(RunService:IsStudio() and "fast" or "");
        local v12, u13 = useState(0);
        local v14, u15 = useState(0);
        local v16, u17 = useState("");
        local _, _ = useState("");
        local v18, u19 = useState(false);
        local u20 = u3.createRef();
        local u21 = EventUtil.getActiveTeamEvents();

        if #u21 > 0 then
            EventUtil.isEventRunning(u21[1]);
        end;

        local v22 = EntityUtil:getPlayerFromEntityInstance(u6.EntityInstance);

        local function _(u23, u24) -- Line: 43
            -- upvalues: GlobalTeamsUtil (ref), KnitServer (ref), EventMeta (ref), u21 (copy)
            local u25 = "";

            local function v30(p26) -- Line: 45
                -- upvalues: GlobalTeamsUtil (ref), u24 (copy), KnitServer (ref), u23 (copy), EventMeta (ref), u25 (ref)
                if not GlobalTeamsUtil.getGlobalTeamEventKeyFromEventType(p26) then
                    return "";
                end;

                local v27;

                if u24 then
                    v27 = u24;
                else
                    local v28 = KnitServer.Services.PlayerProfileService:waitForProfile(u23).Data.eventData.events[p26];

                    if not v28 then
                        return "";
                    end;

                    v27 = v28.globalTeamKey;

                    if not v27 then
                        return "";
                    end;
                end;

                local v29 = EventMeta[p26];
                local customPagesConfig = v29.customPagesConfig;

                if customPagesConfig ~= nil then
                    customPagesConfig = customPagesConfig.setTeamPage;

                    if customPagesConfig ~= nil then
                        customPagesConfig = customPagesConfig.team1.globalTeamKey;
                    end;
                end;

                if customPagesConfig == v27 then
                    local customPagesConfig2 = v29.customPagesConfig;

                    if customPagesConfig2 ~= nil then
                        customPagesConfig2 = customPagesConfig2.setTeamPage;

                        if customPagesConfig2 ~= nil then
                            customPagesConfig2 = customPagesConfig2.team1.nameTagIcon;
                        end;
                    end;

                    u25 = " " .. tostring(customPagesConfig2);

                    return;
                end;

                local customPagesConfig2 = v29.customPagesConfig;

                if customPagesConfig2 ~= nil then
                    customPagesConfig2 = customPagesConfig2.setTeamPage;

                    if customPagesConfig2 ~= nil then
                        customPagesConfig2 = customPagesConfig2.team2.globalTeamKey;
                    end;
                end;

                if customPagesConfig2 == v27 then
                    local customPagesConfig3 = v29.customPagesConfig;

                    if customPagesConfig3 ~= nil then
                        customPagesConfig3 = customPagesConfig3.setTeamPage;

                        if customPagesConfig3 ~= nil then
                            customPagesConfig3 = customPagesConfig3.team2.nameTagIcon;
                        end;
                    end;

                    u25 = " " .. tostring(customPagesConfig3);
                end;
            end;

            for i, v in u21 do
                v30(v, i - 1, u21);
            end;

            return u25;
        end;

        useEffect(function() -- Line: 107
            -- upvalues: Players (ref), u6 (copy), u20 (copy), u2 (ref), CollectionService (ref), GamePlayerUtil (ref), u9 (copy), PlaceUtil (ref), KnitClient (ref), u15 (copy), u17 (copy), RankMeta (ref), EntityUtil (ref), u19 (copy), u11 (copy), u13 (copy)
            local u31 = Players:GetPlayerFromCharacter(u6.EntityInstance);

            if not u31 then
                return nil;
            end;

            local u32 = u20:getValue();

            if not u32 then
                return nil;
            end;

            local u33 = u2.new();
            CollectionService:AddTag(u32, "EntityNameTag");
            u32.Adornee = u6.EntityInstance.Head;
            u33:GiveTask(u6.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function() -- Line: 121
                -- upvalues: u6 (ref), u32 (copy)
                local v34 = u6.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace");

                if v34 then
                    u32.StudsOffsetWorldSpace = v34;
                end;
            end));
            u9((GamePlayerUtil.getGamePlayer(u31):getDisplayName()));
            u31:GetAttributeChangedSignal("DisguiseDisplayName"):Connect(function(p35) -- Line: 131
                -- upvalues: GamePlayerUtil (ref), u31 (copy), u9 (ref)
                u9(GamePlayerUtil.getGamePlayer(u31):getDisplayName());
            end);

            if PlaceUtil.isLobbyServer() then
                task.spawn(function() -- Line: 137
                    -- upvalues: u6 (ref), Players (ref), KnitClient (ref), u15 (ref), u17 (ref), RankMeta (ref), u33 (copy), EntityUtil (ref), u19 (ref), GamePlayerUtil (ref), u31 (copy), u11 (ref), u13 (ref)
                    if u6.EntityInstance == Players.LocalPlayer.Character then
                        local u36 = KnitClient.Controllers.NametagController:requestNametagData(Players.LocalPlayer);

                        if u36 ~= nil then
                            u36 = u36:andThen(function(p37) -- Line: 142
                                -- upvalues: u15 (ref), u17 (ref), RankMeta (ref)
                                if not p37 then
                                    return nil;
                                end;

                                local winstreak = p37.winstreak;

                                if winstreak ~= 0 and (winstreak == winstreak and winstreak) then
                                    u15(p37.winstreak);
                                end;

                                local rankDivision = p37.rankDivision;

                                if rankDivision ~= 0 and (rankDivision == rankDivision and rankDivision) then
                                    u17(RankMeta[p37.rankDivision].image);
                                end;
                            end);
                        end;

                        u33:GiveTask(function() -- Line: 158
                            -- upvalues: u36 (copy)
                            local v38 = u36;

                            if v38 ~= nil then
                                v38:cancel();
                            end;
                        end);
                    else
                        KnitClient.Controllers.EntityHoverController:watchEntityMouseHover(function(p39) -- Line: 166
                            -- upvalues: u6 (ref), EntityUtil (ref), KnitClient (ref), u15 (ref), u17 (ref), RankMeta (ref), u33 (ref), u19 (ref)
                            if p39:getInstance() == u6.EntityInstance then
                                local v40 = EntityUtil:getEntity(u6.EntityInstance);

                                if v40 ~= nil then
                                    v40 = v40:getPlayer();
                                end;

                                if not v40 then
                                    return nil;
                                end;

                                local u41 = KnitClient.Controllers.NametagController:requestNametagData(v40);

                                if u41 ~= nil then
                                    u41 = u41:andThen(function(p42) -- Line: 180
                                        -- upvalues: u15 (ref), u17 (ref), RankMeta (ref)
                                        if not p42 then
                                            return nil;
                                        end;

                                        local winstreak = p42.winstreak;

                                        if winstreak ~= 0 and (winstreak == winstreak and winstreak) then
                                            u15(p42.winstreak);
                                        end;

                                        local rankDivision = p42.rankDivision;

                                        if rankDivision ~= 0 and (rankDivision == rankDivision and rankDivision) then
                                            u17(RankMeta[p42.rankDivision].image);
                                        end;
                                    end);
                                end;

                                u33:GiveTask(function() -- Line: 196
                                    -- upvalues: u41 (copy)
                                    local v43 = u41;

                                    if v43 ~= nil then
                                        v43:cancel();
                                    end;
                                end);
                                u19(true);
                            end;
                        end);
                        KnitClient.Controllers.EntityHoverController:watchEntityMouseUnHover(function(p44) -- Line: 205
                            -- upvalues: u19 (ref)
                            u19(false);
                        end);
                    end;

                    local function _() -- Line: 210
                        -- upvalues: GamePlayerUtil (ref), u31 (ref), u11 (ref)
                        local v45 = GamePlayerUtil.getGamePlayer(u31):getClanTag();

                        if v45 ~= nil then
                            u11(v45);
                        end;
                    end;

                    local v46 = GamePlayerUtil.getGamePlayer(u31):getClanTag();

                    if v46 ~= nil then
                        u11(v46);
                    end;

                    u33:GiveTask(u31:GetAttributeChangedSignal("ClanTag"):Connect(function(p47) -- Line: 217
                        -- upvalues: GamePlayerUtil (ref), u31 (ref), u11 (ref)
                        local v48 = GamePlayerUtil.getGamePlayer(u31):getClanTag();

                        if v48 ~= nil then
                            u11(v48);
                        end;
                    end));

                    local function _() -- Line: 221
                        -- upvalues: GamePlayerUtil (ref), u31 (ref), u13 (ref)
                        u13((GamePlayerUtil.getGamePlayer(u31):getLevel()));
                    end;

                    u13((GamePlayerUtil.getGamePlayer(u31):getLevel()));
                    u33:GiveTask(u31:GetAttributeChangedSignal("PlayerLevel"):Connect(function() -- Line: 226
                        -- upvalues: GamePlayerUtil (ref), u31 (ref), u13 (ref)
                        u13((GamePlayerUtil.getGamePlayer(u31):getLevel()));
                    end));
                    u33:GiveTask(u31:GetAttributeChangedSignal("StreamerModeDisguise"):Connect(function() -- Line: 229
                        -- upvalues: GamePlayerUtil (ref), u31 (ref), u13 (ref)
                        u13((GamePlayerUtil.getGamePlayer(u31):getLevel()));
                    end));
                end);
            end;

            return function() -- Line: 234
                -- upvalues: u33 (copy)
                u33:DoCleaning();
            end;
        end, {});
        local v49 = {
            Size = UDim2.fromScale(5, 0.65),
            StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0),
            AlwaysOnTop = true,
            MaxDistance = NametagConfig.BillboardMaxDistanceLobby,
            ResetOnSpawn = false,
            AutoLocalize = false,
            [u3.Ref] = u20
        };
        local v50 = {};
        local v51 = #v50;
        local v52 = PlaceUtil.isGameServer() and u3.createFragment({
            TeamIndicator = u3.createElement("ImageLabel", {
                BorderSizePixel = 0,
                Visible = false,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.75, 0.75),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                BackgroundColor3 = Color3.fromRGB(0, 255, 38)
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(50, 0)
                }) })
        });

        if v52 then
            v50[v51 + 1] = v52;
        end;

        local v53 = #v50;
        v50.DisplayNameContainer = u3.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.8, 0.75),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            Stroke = u3.createElement("UIStroke", {
                Thickness = 1,
                Transparency = 1,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }),
            u3.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.fromRGB(0, 0, 0)),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.15, 0.55),
                    NumberSequenceKeypoint.new(0.5, 0.55),
                    NumberSequenceKeypoint.new(0.85, 0.55),
                    NumberSequenceKeypoint.new(1, 1)
                })
            }),
            DisplayName = u3.createElement("TextLabel", {
                Font = "Roboto",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                AutoLocalize = false,
                TextYAlignment = "Center",
                LayoutOrder = 3,
                Text = (not (v10 ~= "" and PlaceUtil.isLobbyServer()) and "" or "<font color=\"rgb(219,219,219)\">[" .. v10 .. "]</font>") .. " <b>" .. v8 .. "</b>",
                Size = UDim2.new(0.9, 0, 0.9, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        });
        local v54 = PlaceUtil.isLobbyServer();

        if v54 then
            local v55 = PlayerLevelUtil.getLevelMeta(v12);

            if v55 ~= nil then
                v55 = v55.gradient;
            end;

            if v55 then
                v55 = u3.createElement("UIGradient", {
                    Color = PlayerLevelUtil.getLevelMeta(v12).gradient
                });
            end;

            local v56 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                AutoLocalize = false,
                TextYAlignment = "Center",
                TextStrokeTransparency = 0.7,
                LayoutOrder = 1,
                Text = "(" .. tostring(v12) .. ") ",
                Size = UDim2.fromScale(0.2, 0.65),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(-0.06, 0.5),
                TextColor3 = PlayerLevelUtil.getLevelColor(v12),
                TextXAlignment = Enum.TextXAlignment.Right,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            };
            local v57 = {};
            local v58 = #v57;

            if v55 then
                v57[v58 + 1] = v55;
            end;

            v54 = u3.createFragment({
                PlayerLevel = u3.createElement("TextLabel", v56, v57)
            });
        end;

        if v54 then
            v50[v53 + 1] = v54;
        end;

        local v59 = #v50;
        local v60 = v18 or (DeviceUtil.isHoarceKat() or u6.EntityInstance == Players.LocalPlayer.Character);

        if v60 then
            local v61 = {};
            local v62 = #v61;
            local v63 = PlaceUtil.isLobbyServer();

            if v63 then
                if v16 == "" then
                    v63 = false;
                else
                    v63 = u3.createFragment({
                        RankDisplay = u3.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            LayoutOrder = 5,
                            Size = UDim2.fromScale(1, 1),
                            AnchorPoint = Vector2.new(1, 0.5),
                            Position = UDim2.fromScale(1, 0.3),
                            SizeConstraint = Enum.SizeConstraint.RelativeYY,
                            Image = v16
                        })
                    });
                end;
            end;

            if v63 then
                v61[v62 + 1] = v63;
            end;

            local v64 = #v61;
            local v65 = PlaceUtil.isLobbyServer();

            if v65 then
                if v14 > 0 then
                    v65 = u3.createElement(NameTagWinStreak, {
                        WinStreak = v14,
                        Size = UDim2.fromScale(0.1, 0.75),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.fromScale(1.05, 0.6)
                    });
                else
                    v65 = false;
                end;
            end;

            if v65 then
                v61[v64 + 1] = v65;
            end;

            local v66 = #v61;

            if DeviceUtil.isHoarceKat() then
                v22 = u3.createElement(LobbyTitle, {
                    TitleType = TitleType.FLOW,
                    TextLabelProps = {
                        AnchorPoint = Vector2.new(0, 0.99),
                        Size = UDim2.fromScale(1, 0.6)
                    }
                });
            else
                local v67 = PlaceUtil.isLobbyServer();

                if v67 then
                    if v22 then
                        v22 = u3.createElement(PlayerLobbyTitle, {
                            Player = v22,
                            TextLabelProps = {
                                AnchorPoint = Vector2.new(0, 0.99),
                                Size = UDim2.fromScale(1, 0.6)
                            }
                        });
                    end;
                else
                    v22 = v67;
                end;
            end;

            if v22 then
                v61[v66 + 1] = v22;
            end;

            v60 = u3.createFragment(v61);
        end;

        if v60 then
            v50[v59 + 1] = v60;
        end;

        return u3.createFragment({
            Nametag = u3.createElement("BillboardGui", v49, v50)
        });
    end)
};