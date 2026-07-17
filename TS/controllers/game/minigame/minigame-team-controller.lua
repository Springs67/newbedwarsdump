-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getMinigameMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").getMinigameMeta;
local MinigameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "MinigameTeamController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: KnitController (copy), u2 (copy), u4 (copy)
    KnitController.constructor(p7);
    p7.Name = "MinigameTeamController";
    p7.teams = {};
    p7.minigameMaid = u2.new();
    p7.actionBarTextLabel = u4.createRef();
end;

function u5.KnitStart(u8) -- Line: 41
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), Players (copy), getMinigameMeta (copy), default (copy), Linear (copy), WatchPlayerCharacter (copy), u3 (copy)
    KnitController.KnitStart(u8);
    default2.Client:WaitFor("MinigameEnded"):expect():Connect(function(p9) -- Line: 43
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref), Players (ref)
        if p9.eliminateNonWinningTeams then
            local u10 = u8:getLocalPlayerTeam();

            if u10 ~= nil then
                u10 = u10.teamId;
            end;

            if u10 == "" or not u10 then
                return nil;
            end;

            local function _(p11) -- Line: 54
                -- upvalues: u10 (copy)
                return p11.teamId == u10;
            end;

            local v12 = false;

            for i, v in p9.winningTeams do
                local _ = i - 1;

                if v.teamId == u10 then
                    v12 = true;
                    break;
                end;
            end;

            if v12 then
                SoundManager:playSound(GameSound.WINTER_MINIGAME_VICTORY);
                u8:hideActionBar();
            else
                SoundManager:playSound(GameSound.WINTER_MINIGAME_DEFEAT);
                KnitClient.Controllers.SpectateUIController:setLobbyButtonsVisiblity(true);
                KnitClient.Controllers.MinigameTeamController:updateActionBar("Your team is eliminated", Color3.fromRGB(255, 51, 51));
            end;
        end;

        local function _(p13) -- Line: 78
            local v14 = p13:FindFirstAncestorWhichIsA("Highlight");

            if v14 ~= nil then
                v14:Destroy();
            end;
        end;

        for i, v in Players:GetPlayers() do
            local _ = i - 1;
            local v15 = v:FindFirstAncestorWhichIsA("Highlight");

            if v15 ~= nil then
                v15:Destroy();
            end;
        end;

        u8.minigameMaid:DoCleaning();
    end);
    default2.Client:Get("MinigameStarted"):Connect(function(p16) -- Line: 89
        -- upvalues: getMinigameMeta (ref), SoundManager (ref), GameSound (ref), KnitClient (ref), default (ref), Linear (ref), u8 (copy), Players (ref)
        local musicOverride = getMinigameMeta(p16.minigame.type).musicOverride;

        if musicOverride == nil then
            musicOverride = GameSound.WINTER_EVENT_MINIGAME_MUSIC;
        end;

        local u17 = SoundManager:playSound(musicOverride, {
            looped = true,
            fadeInTime = 1.5
        });
        local u18 = KnitClient.Controllers.WinterEventController:getClimbSoundGroup();
        default(1.5, Linear, function(p19) -- Line: 102
            -- upvalues: u18 (copy)
            u18.Volume = 0.35 * (1 - p19) + p19 * 0.05;

            return u18.Volume;
        end);
        u8.minigameMaid:GiveTask(function() -- Line: 106
            -- upvalues: default (ref), Linear (ref), u18 (copy), u17 (copy), SoundManager (ref)
            default(1.5, Linear, function(p20) -- Line: 107
                -- upvalues: u18 (ref)
                u18.Volume = 0.35 * p20 + (1 - p20) * 0.05;

                return u18.Volume;
            end);

            if u17 then
                SoundManager:tweenSoundVolume(u17, 0, 1.5);
                task.delay(1.5, function() -- Line: 113
                    -- upvalues: u17 (ref)
                    u17:Stop();
                    u17:Destroy();
                end);
            end;
        end);
        u8.minigameMaid:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function() -- Line: 120
            -- upvalues: KnitClient (ref), Players (ref), u8 (ref)
            if not KnitClient.Controllers.MinigameController:isMinigameActive() then
                return nil;
            end;

            if Players.LocalPlayer:GetAttribute("Spectator") and not KnitClient.Controllers.MinigameController:isEliminated() then
                u8:updateActionBar("Your team is not yet eliminated", Color3.fromRGB(59, 255, 74));
            end;
        end));
    end);
    default2.Client:WaitFor("MinigameTeamUpdate"):andThen(function(p21) -- Line: 132
        -- upvalues: u8 (copy), Players (ref), WatchPlayerCharacter (ref), u3 (ref)
        p21:Connect(function(p22) -- Line: 133
            -- upvalues: u8 (ref), Players (ref), WatchPlayerCharacter (ref), u3 (ref)
            u8.teams = p22;
            local v23 = u8:getLocalPlayerTeam();

            if v23 then
                local function _(p24) -- Line: 138
                    -- upvalues: Players (ref), u8 (ref), WatchPlayerCharacter (ref), u3 (ref)
                    if p24 == Players.LocalPlayer then
                        return nil;
                    end;

                    u8.minigameMaid:GiveTask(WatchPlayerCharacter(p24, function(p25, p26) -- Line: 142
                        -- upvalues: u8 (ref), u3 (ref)
                        u8.minigameMaid:GiveTask(u3("Highlight", {
                            Enabled = true,
                            FillTransparency = 1,
                            OutlineTransparency = 0,
                            DepthMode = Enum.HighlightDepthMode.Occluded,
                            OutlineColor = Color3.fromRGB(59, 255, 74),
                            Parent = p25
                        }));
                    end));
                end;

                for i, v in v23.players do
                    local _ = i - 1;

                    if v ~= Players.LocalPlayer then
                        u8.minigameMaid:GiveTask(WatchPlayerCharacter(v, function(p27, p28) -- Line: 142
                            -- upvalues: u8 (ref), u3 (ref)
                            u8.minigameMaid:GiveTask(u3("Highlight", {
                                Enabled = true,
                                FillTransparency = 1,
                                OutlineTransparency = 0,
                                DepthMode = Enum.HighlightDepthMode.Occluded,
                                OutlineColor = Color3.fromRGB(59, 255, 74),
                                Parent = p27
                            }));
                        end));
                    end;
                end;
            end;
        end);
    end);
end;

function u5.getTeam(p29, u30) -- Line: 161
    local function _(p31) -- Line: 163
        -- upvalues: u30 (copy)
        return p31.teamId == u30;
    end;

    for i, v in p29.teams do
        local _ = i - 1;

        if v.teamId == u30 == true then
            return v;
        end;
    end;

    return nil;
end;

function u5.getTeams(p32) -- Line: 177
    return p32.teams;
end;

function u5.getLocalPlayerTeam(p33) -- Line: 180
    -- upvalues: Players (copy)
    return p33:getPlayerTeam(Players.LocalPlayer);
end;

function u5.getPlayerTeam(p34, p35) -- Line: 183
    -- upvalues: MinigameUtil (copy)
    local v36 = MinigameUtil:getMinigameTeamIdByPlayer(p35);

    if v36 ~= "" and v36 then
        return p34:getTeam(v36);
    end;
end;

function u5.getPlayerTeamId(p37, p38) -- Line: 189
    -- upvalues: MinigameUtil (copy)
    return MinigameUtil:getMinigameTeamIdByPlayer(p38);
end;

function u5.updateActionBar(p39, p40, p41) -- Line: 192
    -- upvalues: Flamework (copy), u4 (copy), ColorUtil (copy)
    if not p39.actionBarMaid then
        p39.actionBarMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextColor3 = p41 or ColorUtil.WHITE,
            Text = "",
            [u4.Ref] = p39.actionBarTextLabel,
            Size = UDim2.fromScale(1, 0.04),
            TextScaled = true,
            Font = "GothamBold"
        }));
    end;

    local v42 = p39.actionBarTextLabel:getValue();
    local v43;

    if v42 then
        local v44;

        if v42 == nil then
            v44 = v42;
        else
            v44 = v42.Text;
        end;

        v43 = v44 ~= p40;
    else
        v43 = v42;
    end;

    if v43 then
        v42.Text = p40;
        v42.TextColor3 = p41 or ColorUtil.WHITE;
    end;
end;

function u5.hideActionBar(p45) -- Line: 218
    local actionBarMaid = p45.actionBarMaid;

    if actionBarMaid ~= nil then
        actionBarMaid:DoCleaning();
    end;

    p45.actionBarMaid = nil;
end;

KnitClient.CreateController(u5.new());

return nil;