-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local LobbyPlayMenuPage = RuntimeLib.import(script, script.Parent.Parent, "lobby-hud", "lobby-play-menu", "lobby-play-menu-pages").LobbyPlayMenuPage;
local BeginnerKitRentalPopup = RuntimeLib.import(script, script.Parent, "kit-rental-ui", "beginner-kit-rental-popup").BeginnerKitRentalPopup;
local TutorialLoadingScreen = RuntimeLib.import(script, script.Parent, "tutorial-loading-screen").TutorialLoadingScreen;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "LobbyTutorialController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "LobbyTutorialController";
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: KnitController (copy), Players (copy), default (copy), KnitClient (copy), BeginnerKitRentalPopup (copy), KnitClient2 (copy), Flamework (copy), BedwarsAppIds (copy), LobbyPlayMenuPage (copy)
    KnitController.KnitStart(u7);

    if Players.LocalPlayer:GetAttribute("LoadingTutorialTeleport") == true then
        task.spawn(function() -- Line: 39
            -- upvalues: u7 (copy)
            u7:mountTutorialLoadingHUD();
        end);
    end;

    Players.LocalPlayer:GetAttributeChangedSignal("LoadingTutorialTeleport"):Connect(function() -- Line: 43
        -- upvalues: Players (ref), u7 (copy)
        if Players.LocalPlayer:GetAttribute("LoadingTutorialTeleport") == true then
            u7:mountTutorialLoadingHUD();
        end;
    end);
    default.Client:OnEvent("OpenBeginnerKitRentalPopup", function() -- Line: 48
        -- upvalues: KnitClient (ref), BeginnerKitRentalPopup (ref)
        KnitClient.Controllers.UiQueueManagerController:queueApp({
            app = {
                appId = "BeginnerKitRentalPopup",
                app = BeginnerKitRentalPopup
            },
            props = {}
        });
    end);
    default.Client:OnEvent("PromptTutorial", function() -- Line: 57
        -- upvalues: KnitClient2 (ref), Flamework (ref), BedwarsAppIds (ref), LobbyPlayMenuPage (ref)
        local v8 = KnitClient2.Controllers.LobbyTutorialController:hasCompletedTutorial();

        if not v8 then
            local v9 = KnitClient2.Controllers.PlayerLevelController:getPlayerLevel();
            v8 = (v9 == nil and 0 or v9) >= 2;
        end;

        local v10 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
        local LOBBY_PLAY_MENU_APP = BedwarsAppIds.LOBBY_PLAY_MENU_APP;
        local v11 = {};
        local v12;

        if v8 then
            v12 = LobbyPlayMenuPage.GAME_SELECT;
        else
            v12 = LobbyPlayMenuPage.WELCOME;
        end;

        v11.Page = v12;
        v10:openApp(LOBBY_PLAY_MENU_APP, v11);
    end);
end;

function u4.mountTutorialLoadingHUD(p13) -- Line: 73
    -- upvalues: Flamework (copy), TutorialLoadingScreen (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "TutorialLoadingScreen",
        app = TutorialLoadingScreen
    }, {});
end;

function u4.unmountTutorialLoadingHUD(p14) -- Line: 79
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TutorialLoadingScreen");
end;

function u4.hasCompletedTutorial(p15) -- Line: 82
    -- upvalues: Players (copy)
    return Players.LocalPlayer:GetAttribute("HasCompletedTutorial") == true;
end;

function u4.selectKitRental(p16, p17) -- Line: 85
    -- upvalues: default (copy)
    if default.Client:Get("PlayerSelectedBeginnerKit"):CallServer(p17) then
        p16:closeKitRentalPopup();
    end;
end;

function u4.closeKitRentalPopup(p18) -- Line: 91
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BeginnerKitRentalPopup");
end;

function u4.respondToTutorialPrompt(p19, p20) -- Line: 94
    -- upvalues: default (copy), u2 (copy)
    default.Client:Get("RespondedToTutorialPrompt"):CallServer(p20);

    if p19.promptTree then
        u2.unmount(p19.promptTree);
        p19.promptTree = nil;
    end;
end;

function u4.shouldHideLobbyContent(p21) -- Line: 101
    -- upvalues: Players (copy)
    return Players.LocalPlayer:GetAttribute("HideLobbyContentForBeginner");
end;

function u4.isFirstTimePlayer(p22) -- Line: 104
    -- upvalues: RunService (copy), Players (copy)
    if RunService:IsStudio() then
        return false;
    end;

    return Players.LocalPlayer:GetAttribute("FirstTimePlayer");
end;

KnitClient.CreateController(u4.new());

return nil;