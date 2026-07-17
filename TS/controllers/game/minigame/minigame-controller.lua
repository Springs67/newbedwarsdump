-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta");
local getMinigameMeta = v3.getMinigameMeta;
local MinigameType = v3.MinigameType;
local MinigameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ColorBlockHUD = RuntimeLib.import(script, script.Parent, "ui", "color-block-hud").ColorBlockHUD;
local IceFishingHUD = RuntimeLib.import(script, script.Parent, "ui", "ice-fishing-hud").IceFishingHUD;
local MinigameInfo = RuntimeLib.import(script, script.Parent, "ui", "minigame-info").MinigameInfo;
local MinigameTeamScoreHud = RuntimeLib.import(script, script.Parent, "ui", "minigame-team-score-hud").MinigameTeamScoreHud;
local u4 = Color3.fromRGB(248, 246, 240);
local u5 = {
    [MinigameType.COLOR_BLOCK] = u2.createElement(ColorBlockHUD),
    [MinigameType.ICE_FISHING] = u2.createElement(IceFishingHUD)
};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "MinigameController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 45
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 49
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p8);
    p8.Name = "MinigameController";
    p8.scoreUpdateSignal = Signal.new();
    p8.minigameActive = false;
    p8.eliminated = false;
end;

function u6.KnitStart(u9) -- Line: 56
    -- upvalues: KnitController (copy), default (copy), Players (copy), KnitClient (copy)
    KnitController.KnitStart(u9);
    u9:listenForMinigameSelected();
    u9:listenForMinigameStarted();
    u9:listenForMinigameEnded();
    default.Client:WaitFor("WinterMinigameTeamScoreUpdate"):expect():Connect(function(p10) -- Line: 62
        -- upvalues: u9 (copy)
        u9.scoreSnapshot = p10.scoreUpdate;
        u9.scoreUpdateSignal:Fire(p10.scoreUpdate);
    end);
    default.Client:WaitFor("MinigamePlayerEliminated"):expect():Connect(function(p11) -- Line: 66
        -- upvalues: Players (ref), u9 (copy), KnitClient (ref)
        if p11 == Players.LocalPlayer.UserId then
            u9.eliminated = true;
            KnitClient.Controllers.SpectateUIController:setLobbyButtonsVisiblity(true);
            KnitClient.Controllers.MinigameTeamController:updateActionBar("Your have been eliminated", Color3.fromRGB(255, 51, 51));
        end;
    end);
end;

function u6.isEliminated(p12) -- Line: 74
    return p12.eliminated;
end;

function u6.isMinigameActive(p13) -- Line: 77
    return p13.minigameActive;
end;

function u6.listenForMinigameSelected(u14) -- Line: 80
    -- upvalues: default (copy)
    default.Client:WaitFor("MinigameSelected"):expect():Connect(function(p15) -- Line: 81
        -- upvalues: u14 (copy)
        u14:minigameStartFade(p15.minigame);
    end);
end;

function u6.listenForMinigameStarted(u16) -- Line: 85
    -- upvalues: default (copy), getMinigameMeta (copy), KnitClient (copy)
    default.Client:WaitFor("MinigameStarted"):expect():Connect(function(p17) -- Line: 86
        -- upvalues: u16 (copy), getMinigameMeta (ref), KnitClient (ref)
        u16.minigameActive = true;
        local teamScoresHud = getMinigameMeta(p17.minigame.type).teamScoresHud;

        if teamScoresHud ~= nil then
            teamScoresHud = teamScoresHud.disable;
        end;

        if not teamScoresHud then
            u16:displayMinigameHUD(p17.minigame);
        end;

        if not u16:isEliminated() then
            KnitClient.Controllers.SpectateUIController:setLobbyButtonsVisiblity(false);
        end;

        KnitClient.Controllers.WinterEventController:enableThirdPersonMode(12);
    end);
end;

function u6.listenForMinigameEnded(u18) -- Line: 102
    -- upvalues: default (copy), KnitClient (copy)
    default.Client:WaitFor("MinigameEnded"):expect():Connect(function(p19) -- Line: 103
        -- upvalues: u18 (copy), KnitClient (ref)
        u18.minigameActive = false;
        u18:hideMinigameHUD();
        u18:minigameEndFade();
        u18.scoreSnapshot = nil;

        if not u18:isEliminated() then
            KnitClient.Controllers.WinterEventController:forceFirstPersonMode();
        end;
    end);
end;

function u6.minigameStartFade(u20, u21) -- Line: 113
    -- upvalues: FadeUtil (copy), u4 (copy)
    FadeUtil:fade(0.5, 3, 0.5, u4):andThen(function() -- Line: 115
        -- upvalues: u20 (copy), u21 (copy)
        u20:displayMinigameInfo(u21);
    end);
end;

function u6.minigameEndFade(p22) -- Line: 120
    -- upvalues: FadeUtil (copy), u4 (copy)
    FadeUtil:fade(0.5, 3, 0.5, u4);
end;

function u6.displayMinigameInfo(u23, p24) -- Line: 123
    -- upvalues: u2 (copy), MinigameInfo (copy), MinigameUtil (copy), Players (copy), SoundManager (copy), GameSound (copy)
    if u23.infoTree then
        u2.unmount(u23.infoTree);
    end;

    u23.infoTree = u2.mount(u2.createElement(MinigameInfo, {
        minigame = p24,
        startTime = os.time() + MinigameUtil.INFO_SCREEN_DURATION
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    task.delay(MinigameUtil.INFO_SCREEN_DURATION, function() -- Line: 133
        -- upvalues: u23 (copy), u2 (ref), SoundManager (ref), GameSound (ref)
        if u23.infoTree then
            u2.unmount(u23.infoTree);
        end;

        SoundManager:playSound(GameSound.COUNTDOWN_GAMESTART);
    end);
end;

function u6.displayMinigameHUD(p25, p26) -- Line: 140
    -- upvalues: u2 (copy), u5 (copy), MinigameTeamScoreHud (copy), Players (copy)
    if p25.hudTree then
        u2.unmount(p25.hudTree);
    end;

    local v27 = u5[p26.type] or u2.createElement(MinigameTeamScoreHud, {
        Minigame = p26
    });
    p25.hudTree = u2.mount(v27, Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u6.hideMinigameHUD(p28) -- Line: 151
    -- upvalues: u2 (copy)
    if p28.hudTree then
        u2.unmount(p28.hudTree);
    end;
end;

KnitClient.CreateController(u6.new());

return nil;