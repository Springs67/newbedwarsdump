-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local InteractionCategory = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller").InteractionCategory;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "TeamUpgradeController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p5);
    p5.Name = "TeamUpgradeController";
    p5.currentUpgrades = {};
    p5.requestPurchaseTeamUpgradeRemote = default.Client:Get("RequestPurchaseTeamUpgrade");
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: KnitController (copy), KnitClient (copy), GameSound (copy), default (copy), ClientStore (copy), KnitClient2 (copy), Players (copy), DeviceUtil (copy), InteractionCategory (copy), ClientSyncEvents (copy), Flamework (copy), BedwarsAppIds (copy), GameCoreClientSyncEvents (copy)
    KnitController.KnitStart(u6);
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.TEAM_UPGRADE_PURCHASE }
    });
    default.Client:OnEvent("BulkUpdateTeamUpgrades", function(p7) -- Line: 44
        -- upvalues: u6 (copy), ClientStore (ref)
        u6.currentUpgrades = p7;
        ClientStore:dispatch({
            type = "SetMyTeamUpgrades",
            myTeamUpgrades = p7
        });
    end);
    default.Client:OnEvent("TeamUpgradePurchased", function(p8, p9) -- Line: 51
        -- upvalues: KnitClient2 (ref), Players (ref), u6 (copy), ClientStore (ref)
        local v10 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v10 ~= nil then
            v10 = v10.id;
        end;

        if p8 == v10 then
            u6.currentUpgrades = p9;
            ClientStore:dispatch({
                type = "SetMyTeamUpgrades",
                myTeamUpgrades = p9
            });
        end;

        ClientStore:dispatch({
            type = "BedwarsSetTeamUpgrades",
            teamId = p8,
            teamUpgrades = p9
        });
    end);
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Upgrade Shop",
        interactionObjectText = "Open",
        interactionTag = "TeamUpgradeShopkeeper",
        instantActivation = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        category = InteractionCategory.OTHER,

        onInteracted = function(p11, p12, p13, p14) -- Line: 80, Name: onInteracted
            -- upvalues: ClientSyncEvents (ref), KnitClient2 (ref), default (ref), Flamework (ref), BedwarsAppIds (ref)
            ClientSyncEvents.TeamUpgradeOpened:fire();
            local v15 = p12:GetAttribute("GeneratorTeam");
            local v16 = KnitClient2.Controllers.TeamController:getPlayerTeam(p11);

            if v16 ~= nil then
                v16 = v16.id;
            end;

            local v17;

            if v16 == "" or (not v16 or v16 ~= v15) then
                v17 = false;
            else
                v17 = true;
                local v18 = KnitClient2.Controllers.ChestItemDisplayController:getTeamCrate();

                if v18 ~= nil then
                    v18 = v18:FindFirstChild("ChestFolderValue");
                end;

                if v18 then
                    local Value = v18.Value;

                    if Value then
                        default.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(Value);
                    end;
                end;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.TEAM_UPGRADE, {
                TeamId = v15,
                IsHomeBase = v17
            });
        end
    });
    GameCoreClientSyncEvents.AppClose:connect(function(p19) -- Line: 115
        -- upvalues: BedwarsAppIds (ref), default (ref)
        if p19.appId ~= BedwarsAppIds.TEAM_UPGRADE then
            return nil;
        end;

        default.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil);
    end);
end;

function u3.requestPurchaseTeamUpgrade(p20, p21) -- Line: 122
    -- upvalues: SoundManager (copy), GameSound (copy)
    local v22 = p20.requestPurchaseTeamUpgradeRemote:CallServer(p21);

    if v22 then
        SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
    end;

    return v22;
end;

function u3.getCurrentTeamUpgrades(p23) -- Line: 129
    return p23.currentUpgrades;
end;

KnitClient.CreateController(u3.new());

return nil;