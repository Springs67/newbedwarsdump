-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MaterialService = v2.MaterialService;
local Players = v2.Players;
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
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "Halloween2025EventController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 35
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 39
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p5.Name = "Halloween2025EventController";
    p5.abilityMounted = false;
end;

function u3.KnitStart(p6) -- Line: 44
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p6);
end;

function u3.onGameInit(u7) -- Line: 47
    -- upvalues: KnitClient (copy), ViewmodelMode (copy), MaterialService (copy), default (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), FireworkType (copy), ClientSyncEvents (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), SceneKey (copy), HalloweenAbilityInitialSelectionApp (copy), HalloweenAbilityTreeApp (copy)
    u7:hideNametags();
    u7:enableFirstPersonMode();
    KnitClient.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.SHOW_ARMS);
    MaterialService:SetBaseMaterialOverride(Enum.Material.Ground, "");
    default.Client:Get("WinHalloweenEvent"):Connect(function(p8) -- Line: 53
        -- upvalues: RuntimeLib (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), u7 (copy), RandomUtil (ref), FireworkType (ref)
        RuntimeLib.try(function() -- Line: 54
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.Halloween2024Stage3SceneController:disableMusic();
        end, function(p9) -- Line: 56
            warn(p9);
        end);
        SoundManager:playSound(GameSound.HALLOWEEN_LTM_WIN);
        u7:disableFirstPersonMode();
        local v10 = false;
        local v11 = 0;

        while true do
            if v10 then
                v11 = v11 + 1;
            else
                v10 = true;
            end;

            if v11 >= 12 then
                return;
            end;

            local function _(p12) -- Line: 74
                local Character = p12.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                return Character;
            end;

            local v13 = 0;
            local v14 = {};

            for i, v in p8 do
                local _ = i - 1;
                local Character = v.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                if Character ~= nil then
                    v13 = v13 + 1;
                    v14[v13] = Character;
                end;
            end;

            for _, v in v14 do
                task.spawn(function() -- Line: 96
                    -- upvalues: KnitClient (ref), v (copy), RandomUtil (ref), FireworkType (ref)
                    local v15 = false;
                    local v16 = 0;

                    while true do
                        if v15 then
                            v16 = v16 + 1;
                        else
                            v15 = true;
                        end;

                        if v16 >= 3 then
                            return;
                        end;

                        local FireworkController = KnitClient.Controllers.FireworkController;
                        local v17 = (math.random() - 0.5) * 30;
                        local v18 = (math.random() - 0.5) * 30;
                        FireworkController:playFireworkEffect(v + Vector3.new(v17, 30, v18), RandomUtil.fromList(FireworkType.NORMAL, FireworkType.SPARKS));
                        task.wait(0.2);
                    end;
                end);
            end;

            task.wait(2.5);
        end;
    end);
    ClientSyncEvents.SceneLoadingScreenEnd:connect(function(p19) -- Line: 121
        -- upvalues: u7 (copy), Flamework (ref), AbilityId (ref), AbilityMeta (ref), SceneKey (ref), HalloweenAbilityInitialSelectionApp (ref), HalloweenAbilityTreeApp (ref)
        if not u7.abilityMounted then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HALLOWEEN_VIEW_ABILITIES, AbilityMeta[AbilityId.HALLOWEEN_VIEW_ABILITIES].triggerConfig);
            u7.abilityMounted = true;
        end;

        if p19.sceneActivatedFrom == SceneKey.HALLOWEEN_2024_STAGE_1 then
            task.delay(6, function() -- Line: 129
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

function u3.hideNametags(p20) -- Line: 142
    -- upvalues: WatchCharacter (copy), EntityUtil (copy)
    WatchCharacter(function(p21, p22) -- Line: 143
        -- upvalues: EntityUtil (ref)
        local v23 = EntityUtil:getEntity(p21);

        if v23 then
            v23:hideNametag();
        end;
    end);
end;

function u3.enableFirstPersonMode(p24) -- Line: 150
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

function u3.disableFirstPersonMode(p25) -- Line: 161
    -- upvalues: KnitClient (copy), Players (copy)
    KnitClient.Controllers.MobileShiftLockController:blockShiftLock(false);
    Players.LocalPlayer.CameraMaxZoomDistance = 14;
    task.delay(5, function() -- Line: 164
        -- upvalues: Players (ref)
        Players.LocalPlayer.CameraMinZoomDistance = 4;
        task.delay(0.1, function() -- Line: 166
            -- upvalues: Players (ref)
            Players.LocalPlayer.CameraMinZoomDistance = 0;
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;