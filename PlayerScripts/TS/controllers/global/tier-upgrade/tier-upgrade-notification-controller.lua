-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local TierUpgradeNotificationPopup = RuntimeLib.import(script, script.Parent, "ui", "tier-upgrade-notification-popup").TierUpgradeNotificationPopup;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TierUpgradeNotificationController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "TierUpgradeNotificationController";
end;

function u1.KnitStart(p4) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), PlaceUtil (copy), SoundManager (copy), GameSound (copy), Flamework (copy), Players (copy), TierUpgradeNotificationPopup (copy)
    KnitController.KnitStart(p4);
    default.Client:Get("TierUpgradeNotification"):Connect(function(p5, p6) -- Line: 32
        -- upvalues: PlaceUtil (ref), SoundManager (ref), GameSound (ref), Flamework (ref), Players (ref), TierUpgradeNotificationPopup (ref)
        if PlaceUtil.isLobbyServer() then
            return nil;
        end;

        SoundManager:playSound(GameSound.CATALOG_DISCOVERY);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TierUpgradeNotificationPopup");
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("ItemCatalogPopup");
        local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui");

        if PlayerGui ~= nil then
            PlayerGui = PlayerGui:FindFirstChild("NotificationApp");
        end;

        if PlayerGui then
            PlayerGui.Enabled = false;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "TierUpgradeNotificationPopup",
            app = TierUpgradeNotificationPopup
        }, {
            itemType = p5,

            closeMenu = function() -- Line: 54, Name: closeMenu
                -- upvalues: Flamework (ref), PlayerGui (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TierUpgradeNotificationPopup");

                if PlayerGui then
                    PlayerGui.Enabled = true;
                end;
            end,

            tierLevel = p6
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;