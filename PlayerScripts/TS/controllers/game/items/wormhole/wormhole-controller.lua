-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local InElastic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InElastic;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WormholeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "wormhole", "wormhole-util").WormholeUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "WormholeController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p8);
    p8.Name = "WormholeController";
    p8.wormholeChannelMaid = {};
    p8.buttonMaid = u3.new();
    p8.assetsPreloaded = false;
    p8.recallingDisabled = false;
    p8.wormholeItemEnabled = false;
end;

function u6.KnitStart(u9) -- Line: 57
    -- upvalues: KnitController (copy), KnitClient2 (copy), getQueueMeta (copy), ClientSyncEvents (copy), SyncEventPriority (copy), default2 (copy)
    KnitController.KnitStart(u9);
    local v10, v11 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();
    local v12;

    if v10 then
        v12 = getQueueMeta(v11);
    else
        v12 = nil;
    end;

    if v10 then
        local v13;

        if v12 == nil then
            v13 = v12;
        else
            v13 = v12.disableRecalling;
        end;

        u9.recallingDisabled = v13 and true or false;

        if v12 ~= nil then
            v12 = v12.enableWormholeItem;
        end;

        u9.wormholeItemEnabled = v12 and true or false;
    end;

    local v14 = KnitClient2.Controllers.MatchController:getCustomMatchConfig() == nil;

    if u9.recallingDisabled and (v14 and not u9.wormholeItemEnabled) then
        return nil;
    end;

    u9:setupRemotes();
    u9:setupWormholeAbility();
    ClientSyncEvents.OwlNewTarget:setPriority(SyncEventPriority.HIGHEST):connect(function(p15) -- Line: 80
        -- upvalues: u9 (copy)
        if p15.target then
            u9:disableWormHoleAbility();

            return;
        end;

        u9:enableWormholeAbility();
    end);
    default2.Client:OnEvent("MatchEndEvent", function(p16) -- Line: 87
        -- upvalues: u9 (copy)
        u9:disableWormHoleAbility();
    end);
end;

function u6.playWormholeEffect(p17, p18, p19) -- Line: 91
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local v20 = ReplicatedStorage.Assets.Effects.WormholeTeleport:Clone();
    v20.CFrame = p18;
    v20.Parent = Workspace;
    EffectUtil:playEffects({ v20 }, p19, {
        destroyAfterSec = 1
    });
end;

function u6.enableWormholeAbility(p21) -- Line: 99
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    if not p21.wormholeItemEnabled then
        p21.buttonMaid:DoCleaning();
        local u22 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.RECALL, {
            abilityType = "Recall",
            abilityButton = {
                layoutOrder = -10000,
                icon = BedwarsImageId.HOME
            }
        }):expect();
        p21.buttonMaid:GiveTask(function() -- Line: 109
            -- upvalues: u22 (copy)
            u22.Destroy();
        end);
    end;

    p21.recallingDisabled = false;
end;

function u6.disableWormHoleAbility(p23) -- Line: 115
    p23.buttonMaid:DoCleaning();
    p23.recallingDisabled = true;
end;

function u6.setupRemotes(u24) -- Line: 119
    -- upvalues: default2 (copy), u3 (copy), Players (copy), Flamework (copy), u4 (copy), TimedProgressBar (copy), EntityUtil (copy), WormholeUtil (copy), GameSound (copy), SoundManager (copy), GameAnimationUtil (copy), AnimationType (copy), GameQueryUtil (copy), Workspace (copy), EffectUtil (copy), default (copy), InElastic (copy)
    default2.Client:OnEvent("WormholeChannel", function(p25, p26) -- Line: 120
        -- upvalues: u3 (ref), Players (ref), Flamework (ref), u4 (ref), TimedProgressBar (ref), EntityUtil (ref), WormholeUtil (ref), GameSound (ref), SoundManager (ref), GameAnimationUtil (ref), AnimationType (ref), GameQueryUtil (ref), Workspace (ref), EffectUtil (ref), default (ref), InElastic (ref), u24 (copy)
        local Character = p25.Character;

        if not Character then
            return nil;
        end;

        local v27 = u3.new();

        if Character == Players.LocalPlayer.Character then
            v27:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(TimedProgressBar, {
                HideOnComplete = true,
                Size = UDim2.fromScale(1, 0.05),
                EndTime = p26,
                ProgressBarConfig = {
                    Flip = true,
                    GradientRotation = 0,
                    Title = {
                        text = "Teleporting back to base..."
                    },
                    BarGradient = ColorSequence.new(Color3.fromRGB(255, 184, 28), Color3.fromRGB(255, 209, 112))
                }
            })));
        end;

        local v28 = EntityUtil:getEntity(p25);

        if v28 ~= nil then
            v28 = v28:getInstance();
        end;

        if not v28 then
            return nil;
        end;

        local v29 = WormholeUtil.getWormholeLoopSound(v28);
        local v30 = v29 == GameSound.VOID_TITAN_RECALL_LOOP and true or v29 == GameSound.SPIRIT_TITAN_RECALL_LOOP;
        local u31 = SoundManager:playSound(v29, {
            looped = true,
            rollOffMaxDistance = 90,
            position = Character:GetPivot().Position,
            playbackSpeedMultiplier = v30 and 0.8 or 1
        });
        local u32 = GameAnimationUtil:playAnimation(p25, AnimationType.RIFT_REVIVE, {
            looped = true
        });
        local u33 = WormholeUtil.getWormholeRecallEffect(v28):Clone();
        u33:PivotTo(Character:GetPivot() + Vector3.new(0, -2.8, 0));

        local function _(p34) -- Line: 169
            -- upvalues: GameQueryUtil (ref)
            if p34:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p34, true);
                p34.CanCollide = false;
                p34.Anchored = true;
            end;
        end;

        for i, descendant in u33:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
                descendant.CanCollide = false;
                descendant.Anchored = true;
            end;
        end;

        u33.Parent = Workspace;
        local v35 = EntityUtil:getEntity(p25);

        if v35 ~= nil then
            v35 = v35:getInstance();
        end;

        local v36 = WormholeUtil.getWormholeChannelTime(v35);
        local v37 = { u33 };
        local v38 = EntityUtil:getEntity(p25);

        if v38 ~= nil then
            v38 = v38:getInstance();
        end;

        EffectUtil:playEffects(v37, v38, {
            destroyAfterSec = v36
        });
        local u39 = 0;
        local u42 = default(v36, InElastic, function(p40) -- Line: 198
            -- upvalues: u39 (ref), u31 (copy), u33 (copy)
            u39 = u39 + p40;

            if u39 >= 0.1 then
                u39 = 0;

                if u31 then
                    local v41 = u31:getInstance();

                    if v41 ~= nil then
                        v41 = v41.PlaybackSpeed;
                    end;

                    u31:setProperty("PlaybackSpeed", (v41 == nil and 1 or v41) + 0.04);
                end;

                local PulseUp = u33.Pulse.Particle.PulseUp;
                PulseUp.Rate = PulseUp.Rate + 0.05;
            end;
        end);
        task.delay(v36 - 1, function() -- Line: 217
        end);
        v27:GiveTask(function() -- Line: 221
            -- upvalues: u31 (copy), u32 (copy), u33 (copy), u42 (copy)
            local v43 = u31;

            if v43 ~= nil then
                v43:Stop();
            end;

            local v44 = u31;

            if v44 ~= nil then
                v44:Destroy();
            end;

            local v45 = u32;

            if v45 ~= nil then
                v45:Stop();
            end;

            local v46 = u32;

            if v46 ~= nil then
                v46:Destroy();
            end;

            u33:Destroy();
            u42:Cancel();
        end);
        task.delay(v36, function() -- Line: 241
            -- upvalues: u31 (copy), u32 (copy), u33 (copy), u42 (copy)
            local v47 = u31;

            if v47 ~= nil then
                v47:Stop();
            end;

            local v48 = u31;

            if v48 ~= nil then
                v48:Destroy();
            end;

            local v49 = u32;

            if v49 ~= nil then
                v49:Stop();
            end;

            local v50 = u32;

            if v50 ~= nil then
                v50:Destroy();
            end;

            u33:Destroy();
            u42:Cancel();
        end);
        u24.wormholeChannelMaid[p25.UserId] = v27;
    end);
    default2.Client:OnEvent("WormholeChannelCancel", function(p51) -- Line: 265
        -- upvalues: u24 (copy)
        local v52 = u24.wormholeChannelMaid[p51.UserId];

        if v52 ~= nil then
            v52:DoCleaning();
        end;
    end);
    default2.Client:OnEvent("WormholeUse", function(p53, p54, p55) -- Line: 274
        -- upvalues: u24 (copy), EntityUtil (ref), Players (ref), WormholeUtil (ref), SoundManager (ref)
        local Character = p53.Character;

        if not Character then
            return nil;
        end;

        local v56 = u24.wormholeChannelMaid[p53.UserId];

        if v56 ~= nil then
            v56:DoCleaning();
        end;

        local v57 = EntityUtil:getEntity(p53);

        if v57 ~= nil then
            v57 = v57:getInstance();
        end;

        if not v57 then
            return nil;
        end;

        if Character == Players.LocalPlayer.Character then
            SoundManager:playSound((WormholeUtil.getWormholeSound(v57)));
        else
            local v58 = WormholeUtil.getWormholeSound(v57);
            SoundManager:playSound(v58, {
                position = p54
            });
            SoundManager:playSound(v58, {
                position = p55
            });
        end;

        u24:playWormholeEffect(CFrame.new(p54), nil);
        local v59 = CFrame.new(p55);
        local v60 = EntityUtil:getEntity(p53);

        if v60 ~= nil then
            v60 = v60:getInstance();
        end;

        u24:playWormholeEffect(v59, v60);
    end);
end;

function u6.setupWormholeAbility(u61) -- Line: 317
    -- upvalues: KnitClient (copy), GameSound (copy), ClientStore (copy), MatchState (copy), ClientSyncEvents (copy)
    local v62 = game.Workspace:GetAttribute("RecallingDisabled");

    if v62 == 0 or (v62 ~= v62 or (v62 == "" or not v62)) then
        if not u61.assetsPreloaded then
            KnitClient.Controllers.PreloadController:runPreload({
                sounds = {
                    GameSound.WORMHOLE_TELEPORT,
                    GameSound.SPIRIT_TITAN_RECALL,
                    GameSound.VOID_TITAN_RECALL,
                    GameSound.WORMHOLE_USE
                }
            });
            u61.assetsPreloaded = true;
        end;

        if ClientStore:getState().Game.matchState == MatchState.RUNNING then
            u61:enableWormholeAbility();
        else
            local u63 = nil;
            u63 = ClientSyncEvents.MatchStateChange:connect(function(p64) -- Line: 333
                -- upvalues: MatchState (ref), u61 (copy), u63 (ref)
                if p64.matchState ~= MatchState.RUNNING then
                    return nil;
                end;

                u61:enableWormholeAbility();
                u63:Destroy();
            end);
        end;
    else
        u61:disableWormHoleAbility();
    end;

    game.Workspace:GetAttributeChangedSignal("RecallingDisabled"):Connect(function() -- Line: 343
        -- upvalues: u61 (copy)
        local v65 = game.Workspace:GetAttribute("RecallingDisabled");

        if v65 == 0 or (v65 ~= v65 or (v65 == "" or not v65)) then
            u61:enableWormholeAbility();

            return;
        end;

        u61:disableWormHoleAbility();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;