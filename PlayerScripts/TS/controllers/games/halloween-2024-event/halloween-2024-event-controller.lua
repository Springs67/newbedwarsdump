-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MaterialService = v3.MaterialService;
local Players = v3.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ViewmodelMode = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local HalloweenAbilityInitialSelectionApp = RuntimeLib.import(script, script.Parent, "ui", "halloween-ability-initial-selection-app").HalloweenAbilityInitialSelectionApp;
local HalloweenAbilityTreeApp = RuntimeLib.import(script, script.Parent, "ui", "halloween-ability-tree-app").HalloweenAbilityTreeApp;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "Halloween2024EventController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 41
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p6, { GameType.HALLOWEEN_2024_EVENT });
    p6.Name = "Halloween2024EventController";
end;

function u4.KnitStart(p7) -- Line: 45
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 48
    -- upvalues: KnitClient2 (copy), ViewmodelMode (copy), MaterialService (copy), default (copy), RuntimeLib (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), FireworkType (copy), ClientSyncEvents (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), SceneKey (copy), HalloweenAbilityInitialSelectionApp (copy), HalloweenAbilityTreeApp (copy)
    u8:hideNametags();
    KnitClient2.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.SHOW_ARMS);
    MaterialService:SetBaseMaterialOverride(Enum.Material.Ground, "");
    default.Client:Get("WinHalloweenEvent"):Connect(function(p9) -- Line: 54
        -- upvalues: RuntimeLib (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), u8 (copy), RandomUtil (ref), FireworkType (ref)
        RuntimeLib.try(function() -- Line: 55
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.Halloween2024Stage3SceneController:disableMusic();
        end, function(p10) -- Line: 57
            warn(p10);
        end);
        SoundManager:playSound(GameSound.HALLOWEEN_LTM_WIN);
        u8:disableFirstPersonMode();
        local v11 = false;
        local v12 = 0;

        while true do
            if v11 then
                v12 = v12 + 1;
            else
                v11 = true;
            end;

            if v12 >= 12 then
                return;
            end;

            local function _(p13) -- Line: 75
                local Character = p13.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                return Character;
            end;

            local v14 = 0;
            local v15 = {};

            for i, v in p9 do
                local _ = i - 1;
                local Character = v.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                if Character ~= nil then
                    v14 = v14 + 1;
                    v15[v14] = Character;
                end;
            end;

            for _, v in v15 do
                task.spawn(function() -- Line: 97
                    -- upvalues: KnitClient (ref), v (copy), RandomUtil (ref), FireworkType (ref)
                    local v16 = false;
                    local v17 = 0;

                    while true do
                        if v16 then
                            v17 = v17 + 1;
                        else
                            v16 = true;
                        end;

                        if v17 >= 3 then
                            return;
                        end;

                        local FireworkController = KnitClient.Controllers.FireworkController;
                        local v18 = (math.random() - 0.5) * 30;
                        local v19 = (math.random() - 0.5) * 30;
                        FireworkController:playFireworkEffect(v + Vector3.new(v18, 30, v19), RandomUtil.fromList(FireworkType.NORMAL, FireworkType.SPARKS));
                        task.wait(0.2);
                    end;
                end);
            end;

            task.wait(2.5);
        end;
    end);
    ClientSyncEvents.SceneLoadingScreenEnd:connect(function(p20) -- Line: 122
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityMeta (ref), SceneKey (ref), HalloweenAbilityInitialSelectionApp (ref), HalloweenAbilityTreeApp (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HALLOWEEN_VIEW_ABILITIES, AbilityMeta[AbilityId.HALLOWEEN_VIEW_ABILITIES].triggerConfig);

        if p20.sceneActivatedFrom == SceneKey.HALLOWEEN_2024_STAGE_1 then
            task.delay(6, function() -- Line: 127
                -- upvalues: Flamework (ref), HalloweenAbilityInitialSelectionApp (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                    appId = "HalloweenAbilityInitialSelectionApp",
                    app = HalloweenAbilityInitialSelectionApp
                }, {});
            end);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "HalloweenAbilityTreeApp",
                app = HalloweenAbilityTreeApp
            }, {});
        end;
    end);
end;

function u4.hideNametags(p21) -- Line: 140
    -- upvalues: WatchCharacter (copy), EntityUtil (copy)
    WatchCharacter(function(p22, p23) -- Line: 141
        -- upvalues: EntityUtil (ref)
        local v24 = EntityUtil:getEntity(p22);

        if v24 then
            v24:hideNametag();
        end;
    end);
end;

function u4.enableFirstPersonMode(p25) -- Line: 148
    -- upvalues: KnitClient (copy), ViewmodelMode (copy), Players (copy)
    KnitClient.Controllers.MobileShiftLockController:blockShiftLock(true);
    KnitClient.Controllers.FootstepsController.footstepModifier:addModifier({
        localVolumeMultiplier = 5,
        localFootstepFrequency = 0.13513513513513511
    });
    KnitClient.Controllers.ScreenWobbleController:enableScreenWobble();
    KnitClient.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.SHOW_ARMS);
    Players.LocalPlayer.CameraMinZoomDistance = 0;
    Players.LocalPlayer.CameraMaxZoomDistance = 0;
end;

function u4.disableFirstPersonMode(p26) -- Line: 159
    -- upvalues: KnitClient (copy), Players (copy)
    KnitClient.Controllers.MobileShiftLockController:blockShiftLock(false);
    Players.LocalPlayer.CameraMaxZoomDistance = 14;
    task.delay(5, function() -- Line: 162
        -- upvalues: Players (ref)
        Players.LocalPlayer.CameraMinZoomDistance = 4;
        task.delay(0.1, function() -- Line: 164
            -- upvalues: Players (ref)
            Players.LocalPlayer.CameraMinZoomDistance = 0;
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;