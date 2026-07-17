-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v2.ContentProvider;
local Players = v2.Players;
local StarterGui = v2.StarterGui;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local TopBarApp = RuntimeLib.import(script, script.Parent, "ui", "top-bar-app").TopBarApp;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "TopBarController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "TopBarController";
    p5.preloadedBedsTopBar = false;
end;

function u3.KnitStart(p6) -- Line: 33
    -- upvalues: KnitController (copy), StarterGui (copy)
    KnitController.KnitStart(p6);
    p6:mountHud();
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
end;

function u3.mountHud(p7) -- Line: 38
    -- upvalues: Flamework (copy), TopBarApp (copy), Players (copy)
    p7:unmountHud();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "TopBarApp",
        app = TopBarApp
    }, {
        LocalPlayerId = Players.LocalPlayer.UserId
    });
end;

function u3.unmountHud(p8) -- Line: 47
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("TopBarApp") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TopBarApp");
    end;
end;

function u3.preloadBedsTopbarHud(p9) -- Line: 52
    -- upvalues: PlaceUtil (copy), RuntimeLib (copy), BedwarsImageId (copy), u1 (copy), ContentProvider (copy)
    if not PlaceUtil.isGameServer() then
        return nil;
    end;

    if p9.preloadedBedsTopBar then
        return nil;
    end;

    p9.preloadedBedsTopBar = true;
    RuntimeLib.Promise.defer(function() -- Line: 61
        -- upvalues: BedwarsImageId (ref), u1 (ref), ContentProvider (ref)
        local v10 = { BedwarsImageId.HUD_BED_DESTROYED };

        local function _(p11) -- Line: 63
            -- upvalues: u1 (ref)
            return u1("ImageLabel", {
                Image = p11
            });
        end;

        local v12 = table.create(#v10);

        for i, v in v10 do
            local _ = i - 1;
            v12[i] = u1("ImageLabel", {
                Image = v
            });
        end;

        ContentProvider:PreloadAsync(v12);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;