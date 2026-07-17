-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ViewmodelMode = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "HalloweenEventController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p4, { GameType.HALLOWEEN_EVENT });
    p4.Name = "HalloweenEventController";
end;

function u2.KnitStart(p5) -- Line: 35
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.onGameInit(u6) -- Line: 38
    -- upvalues: default (copy), RuntimeLib (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), FireworkType (copy), Flamework (copy)
    default.Client:Get("WinHalloweenEvent"):Connect(function(p7) -- Line: 40
        -- upvalues: RuntimeLib (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), u6 (copy), RandomUtil (ref), FireworkType (ref)
        RuntimeLib.try(function() -- Line: 41
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.HalloweenBossSceneController:disableMusic();
        end, function(p8) -- Line: 43
            warn(p8);
        end);
        SoundManager:playSound(GameSound.HALLOWEEN_LTM_WIN);
        u6:disableFirstPersonMode();
        local v9 = false;
        local v10 = 0;

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= 12 then
                return;
            end;

            local function _(p11) -- Line: 61
                local Character = p11.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                return Character;
            end;

            local v12 = 0;
            local v13 = {};

            for i, v in p7 do
                local _ = i - 1;
                local Character = v.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                if Character ~= nil then
                    v12 = v12 + 1;
                    v13[v12] = Character;
                end;
            end;

            for _, v in v13 do
                task.spawn(function() -- Line: 83
                    -- upvalues: KnitClient (ref), v (copy), RandomUtil (ref), FireworkType (ref)
                    local v14 = false;
                    local v15 = 0;

                    while true do
                        if v14 then
                            v15 = v15 + 1;
                        else
                            v14 = true;
                        end;

                        if v15 >= 3 then
                            return;
                        end;

                        local FireworkController = KnitClient.Controllers.FireworkController;
                        local v16 = (math.random() - 0.5) * 30;
                        local v17 = (math.random() - 0.5) * 30;
                        FireworkController:playFireworkEffect(v + Vector3.new(v16, 30, v17), RandomUtil.fromList(FireworkType.NORMAL, FireworkType.SPARKS));
                        task.wait(0.2);
                    end;
                end);
            end;

            task.wait(2.5);
        end;
    end);
    u6:hideNametags();
    u6:enableFirstPersonMode();
    KnitClient.Controllers.ConsumableController:setDisplayBoostList(false);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("ConsumableBoostList");
end;

function u2.hideNametags(p18) -- Line: 113
    -- upvalues: WatchCharacter (copy), EntityUtil (copy)
    WatchCharacter(function(p19, p20) -- Line: 114
        -- upvalues: EntityUtil (ref)
        local v21 = EntityUtil:getEntity(p19);

        if v21 then
            v21:hideNametag();
        end;
    end);
end;

function u2.enableFirstPersonMode(p22) -- Line: 121
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

function u2.disableFirstPersonMode(p23) -- Line: 132
    -- upvalues: KnitClient (copy), Players (copy)
    KnitClient.Controllers.MobileShiftLockController:blockShiftLock(false);
    Players.LocalPlayer.CameraMaxZoomDistance = 14;
    task.delay(5, function() -- Line: 135
        -- upvalues: Players (ref)
        Players.LocalPlayer.CameraMinZoomDistance = 4;
        task.delay(0.1, function() -- Line: 137
            -- upvalues: Players (ref)
            Players.LocalPlayer.CameraMinZoomDistance = 0;
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;