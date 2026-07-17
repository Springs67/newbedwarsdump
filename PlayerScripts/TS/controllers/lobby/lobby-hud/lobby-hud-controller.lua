-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local LobbyHudMain = RuntimeLib.import(script, script.Parent, "lobby-hud-main", "lobby-hud-main").LobbyHudMain;
local LobbyHudSide = RuntimeLib.import(script, script.Parent, "lobby-hud-side", "lobby-hud-side").LobbyHudSide;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "LobbyHudController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "LobbyHudController";
    p3.lobbyHudHiddenIds = {};
end;

function u1.KnitStart(u4) -- Line: 29
    -- upvalues: KnitController (copy), KnitClient (copy), GameSound (copy)
    KnitController.KnitStart(u4);
    task.spawn(function() -- Line: 31
        -- upvalues: u4 (copy)
        while not game:IsLoaded() do
            task.wait(0.5);
        end;

        u4:mountLobbyHud();
    end);
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.UI_HOVER,
            GameSound.UI_CLICK_2,
            GameSound.UI_OPEN_2,
            GameSound.UI_CLOSE_2
        }
    });
end;

function u1.mountLobbyHud(p5) -- Line: 41
    -- upvalues: Flamework (copy), LobbyHudMain (copy), LobbyHudSide (copy)
    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudMain") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "LobbyHudMain",
            app = LobbyHudMain
        }, {});
    end;

    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudSide") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "LobbyHudSide",
            app = LobbyHudSide
        }, {});
    end;
end;

function u1.unmountLobbyHud(p6) -- Line: 55
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudSide") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("LobbyHudSide");
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudMain") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("LobbyHudMain");
    end;
end;

function u1.openLobbyPlayMenu(p7) -- Line: 63
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.LOBBY_PLAY_MENU_APP, {});
end;

function u1.hideLobbyHud(p8, p9) -- Line: 66
    table.insert(p8.lobbyHudHiddenIds, p9);
    p8:unmountLobbyHud();
end;

function u1.unhideLobbyHud(p10, p11) -- Line: 72
    local v12 = (table.find(p10.lobbyHudHiddenIds, p11) or 0) - 1;

    if v12 ~= -1 then
        table.remove(p10.lobbyHudHiddenIds, v12 + 1);
    end;

    if #p10.lobbyHudHiddenIds == 0 then
        p10:mountLobbyHud();
    end;
end;

KnitClient.CreateController(u1.new());

return nil;