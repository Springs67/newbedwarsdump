-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local Players = v4.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local MurderGameConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MurdererMatchEndScreen = RuntimeLib.import(script, script.Parent, "ui", "match-end-screen", "murderer-match-end-screen").MurdererMatchEndScreen;
local MurdererRoleReveal = RuntimeLib.import(script, script.Parent, "ui", "murderer-role-reveal").MurdererRoleReveal;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "MurdererGameController";
    end,

    __index = GameKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p7, { GameType.MURDERER_GAME });
    p7.Name = "MurdererGameController";
end;

function u5.KnitStart(p8) -- Line: 46
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p8);
end;

function u5.onGameInit(u9) -- Line: 49
    -- upvalues: KnitClient (copy), ClientSyncEvents (copy), MatchState (copy), FadeUtil (copy), SoundManager (copy), GameSound (copy), default (copy), u3 (copy), MurdererRoleReveal (copy), Players (copy), MurderGameConstants (copy), MurdererMatchEndScreen (copy), WatchCollectionTag (copy), ItemType (copy), Empty (copy), Countdown (copy)
    u9:setupMurderLighting();
    KnitClient.Controllers.BlockPlacementController:disableBlockPlacer();
    ClientSyncEvents.MatchStateChange:connect(function(p10) -- Line: 53
        -- upvalues: MatchState (ref), FadeUtil (ref), SoundManager (ref), GameSound (ref)
        if p10.matchState == MatchState.RUNNING then
            FadeUtil:fade(0.3, 1, 0.3);
            SoundManager:playSound(GameSound.WIND_AMBIENCE, {
                volumeMultiplier = 1.25,
                looped = true
            });
            SoundManager:playSound(GameSound.GRAVEYARD_MUSIC_LOOP, {
                volumeMultiplier = 1.2,
                looped = true
            });
        end;
    end);
    default.Client:Get("MurderRoleReveal"):Connect(function(p11) -- Line: 67
        -- upvalues: u9 (copy), u3 (ref), MurdererRoleReveal (ref), Players (ref), MurderGameConstants (ref)
        u9:handleNameTags();
        local u12 = u3.mount(u3.createElement(MurdererRoleReveal, {
            Role = p11.role
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        task.delay(MurderGameConstants.ROLE_REVEAL_DISPLAY_DURATION, function() -- Line: 72
            -- upvalues: u3 (ref), u12 (copy)
            u3.unmount(u12);
        end);
    end);
    default.Client:Get("MakeMurderer"):Connect(function(p13) -- Line: 76
        -- upvalues: u9 (copy)
        u9:initMurdererHighlight(p13.murderers);
    end);
    default.Client:Get("MurderEndGameScreen"):Connect(function(p14) -- Line: 79
        -- upvalues: u3 (ref), MurdererMatchEndScreen (ref), Players (ref)
        u3.mount(u3.createElement(MurdererMatchEndScreen, {
            Roles = p14.roles,
            Eliminations = p14.eliminations
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    end);
    WatchCollectionTag("ItemDrop", function(p15) -- Line: 86
        -- upvalues: ItemType (ref), u3 (ref), Empty (ref), Countdown (ref)
        if p15.Name ~= ItemType.SHERIFF_CROSSBOW then
            return nil;
        end;

        local v16 = p15:GetAttribute("PickupReadyTime");

        if v16 ~= 0 and (v16 == v16 and v16) then
            u3.mount(u3.createElement("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5),
                ResetOnSpawn = false,
                MaxDistance = 200,
                Adornee = p15,
                Size = UDim2.fromScale(6, 3)
            }, { u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0, 0)
                }, { u3.createElement(Countdown, {
                        EndTime = v16,
                        TextLabel = {
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 0.5),
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.RobotoMono
                        },
                        CountdownConfig = {
                            days = false,
                            hours = false,
                            minutes = false,
                            seconds = true
                        }
                    }) }) }), p15, "ItemDropPickupCountdown");
        end;
    end);
end;

function u5.initMurdererHighlight(p17, p18) -- Line: 125
    -- upvalues: Players (copy)
    for _, v in p18 do
        if v ~= Players.LocalPlayer then
            p17:createHighlight(v);
        end;
    end;
end;

function u5.setupMurderLighting(p19) -- Line: 133
    -- upvalues: Lighting (copy)
    local Atmosphere = Lighting:FindFirstChild("Atmosphere");

    if Atmosphere ~= nil then
        Atmosphere:Destroy();
    end;

    Lighting.FogColor = Color3.fromRGB(237, 237, 229);
    Lighting.FogStart = 50;
    Lighting.FogEnd = 450;
end;

function u5.createHighlight(p20, p21) -- Line: 142
    -- upvalues: u2 (copy)
    if not p21.Character then
        return nil;
    end;

    local v22 = {
        Name = "Highlight",
        Parent = p21.Character
    };
    local Character = p21.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame - Vector3.new(0, 3, 0);
        end;
    end;

    v22.CFrame = Character;
    v22.Shape = Enum.PartType.Cylinder;
    v22.Color = Color3.fromRGB(0, 255, 64);
    v22.Material = Enum.Material.Neon;
    v22.CastShadow = false;
    v22.Size = Vector3.new(0.5, 6, 6);
    v22.Orientation = Vector3.new(0, 0, 90);
    v22.Transparency = 0.75;
    v22.Anchored = false;
    v22.CanCollide = false;
    v22.CanQuery = false;
    v22.CanTouch = false;
    v22.Massless = true;
    local v23 = u2("Part", v22);
    local v24 = {
        Part0 = v23
    };
    local Character2 = p21.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;
    end;

    v24.Part1 = Character2;
    v24.Parent = v23;
    u2("WeldConstraint", v24);
    u2("Highlight", {
        Enabled = true,
        FillTransparency = 1,
        OutlineTransparency = 0,
        DepthMode = Enum.HighlightDepthMode.Occluded,
        FillColor = Color3.fromRGB(0, 255, 238),
        OutlineColor = Color3.fromRGB(255, 255, 255),
        Parent = p21.Character
    });
end;

function u5.handleNameTags(p25) -- Line: 195
    -- upvalues: Players (copy), EntityUtil (copy), Theme (copy), GamePlayerUtil (copy)
    local v26 = Players:GetPlayers();

    local function v29(p27) -- Line: 197
        -- upvalues: Players (ref), EntityUtil (ref), Theme (ref), GamePlayerUtil (ref)
        if p27 == Players.LocalPlayer then
            return nil;
        end;

        local v28 = EntityUtil:getEntity(p27);

        if v28 ~= nil then
            v28:disableLobbyNametagAlwaysOnTop();
        end;

        if v28 ~= nil then
            v28:setNametagBorderColor(Theme.mcGreen);
        end;

        if v28 ~= nil then
            v28:setNametag(GamePlayerUtil.getGamePlayer(p27):getDisplayName(), Color3.fromHex("55FF55"));
        end;
    end;

    for i, v in v26 do
        v29(v, i - 1, v26);
    end;
end;

KnitClient.CreateController(u5.new());

return nil;