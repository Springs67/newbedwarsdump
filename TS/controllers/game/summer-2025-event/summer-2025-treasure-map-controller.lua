-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local BaseEventController = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "event", "base-event-controller").BaseEventController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CrateItemRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "Summer2025TreasureMapController";
    end,

    __index = BaseEventController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: BaseEventController (copy), EventType (copy)
    BaseEventController.constructor(p7, { EventType.SUMMER_2025 });
    p7.Name = "Summer2025TreasureMapController";
    p7.activeTreasureChests = {};
    p7.worldSize = Vector3.new(0, 0, 0);
    p7.centerWorldPosition = Vector3.new(0, 0, 0);
end;

function u5.onEventInit(p8) -- Line: 49
    return nil;
end;

function u5.onChestSpawn(u9, u10) -- Line: 94
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), scaleModel (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), Players (copy), KnitClient2 (copy), DeviceUtil (copy), u3 (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), EntityUtil (copy)
    local u11 = ReplicatedStorage.Assets.Effects.PirateTreasure:Clone();
    local PrimaryPart = u11.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    u9.activeTreasureChests[u10.uuid] = u11;
    u11.Parent = Workspace;
    scaleModel(u11, 1.25);
    u11:PivotTo(CFrame.new(u10.currentWorldPosition + Vector3.new(0, -1.3, 0)));
    u11:SetAttribute("TreasureUUID", u10.uuid);
    local v12 = math.random() * 3.141592653589793 * 2;
    PrimaryPart:PivotTo(PrimaryPart:GetPivot() * CFrame.Angles(0, v12, 0));
    SoundManager:playSound(GameSound.TREASURE_CHEST_SPAWN, {
        position = u10.currentWorldPosition
    });
    local v13 = ReplicatedStorage.Assets.Effects.MagicMirrorExplosion:Clone();
    v13.Parent = u11;
    v13:PivotTo(u11:GetPivot());
    EffectUtil:playEffects({ v13 }, nil, {
        destroyAfterSec = 2
    });

    if u10.owner == Players.LocalPlayer then
        local u14 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Open",
            ObjectText = "Treasure Chest",
            HoldDuration = 1,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            Parent = PrimaryPart,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        local u15 = u3.new();
        u14.PromptButtonHoldBegan:Connect(function(p16) -- Line: 140
            -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u10 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient2 (ref), u15 (copy), u11 (copy), TweenService (ref)
            if p16 ~= Players.LocalPlayer then
                return nil;
            end;

            if not p16.Character then
                return nil;
            end;

            local u17 = SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCKING, {
                looped = true,
                volumeMultiplier = 1.75,
                position = u10.currentWorldPosition
            });
            local u18 = GameAnimationUtil:playAnimation(p16, AnimationType.OPEN_CRATE, {
                looped = true
            });
            local u19 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.OPEN_CRATE, {
                looped = true
            });
            u15:GiveTask(function() -- Line: 160
                -- upvalues: u18 (copy), u19 (copy), u17 (copy)
                local v20 = u18;

                if v20 ~= nil then
                    v20:Stop();
                end;

                local v21 = u18;

                if v21 ~= nil then
                    v21:Destroy();
                end;

                local v22 = u19;

                if v22 ~= nil then
                    v22:Stop();
                end;

                local v23 = u19;

                if v23 ~= nil then
                    v23:Destroy();
                end;

                local v24 = u17;

                if v24 ~= nil then
                    v24:Destroy();
                end;
            end);
            local PrimaryPart2 = u11.PrimaryPart;

            if PrimaryPart2 then
                local u25 = TweenService:Create(PrimaryPart2, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                    CFrame = PrimaryPart2:GetPivot() * CFrame.Angles(0, 0, -0.017453292519943295)
                });
                local u26 = TweenService:Create(PrimaryPart2, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                    CFrame = PrimaryPart2:GetPivot() * CFrame.Angles(0, 0, 0.017453292519943295)
                });
                local u27 = true;
                u15:GiveTask(function() -- Line: 205
                    -- upvalues: u27 (ref)
                    u27 = false;
                end);
                u25:Play();
                u25.Completed:Connect(function() -- Line: 209
                    -- upvalues: u26 (copy)
                    u26:Play();
                end);
                u26.Completed:Connect(function() -- Line: 212
                    -- upvalues: u27 (ref), u25 (copy)
                    if not u27 then
                        return nil;
                    end;

                    u25:Play();
                end);
            end;
        end);
        u14.PromptButtonHoldEnded:Connect(function(p28) -- Line: 220
            -- upvalues: Players (ref), u15 (copy)
            if p28 ~= Players.LocalPlayer then
                return nil;
            end;

            u15:DoCleaning();
        end);
        u14.Triggered:Connect(function(p29) -- Line: 226
            -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), u10 (copy), EntityUtil (ref), u9 (copy), u14 (copy)
            if p29 ~= Players.LocalPlayer then
                return nil;
            end;

            GameAnimationUtil:playAnimation(p29, AnimationType.TENNIS_RACKET_HIT);
            SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCK, {
                volumeMultiplier = 1.75,
                position = u10.currentWorldPosition
            });
            local v30 = EntityUtil:getEntity(p29);

            if v30 ~= nil then
                v30 = v30:isAlive();
            end;

            if not v30 then
                return nil;
            end;

            if u9:requestOpenChest(u10) then
                u14:Destroy();
            end;
        end);
    end;
end;

function u5.requestOpenChest(p31, p32) -- Line: 251
    -- upvalues: default (copy)
    return default.Client:Get("Summer2025_RequestOpenTreasure"):CallServer({
        uuid = p32.uuid
    });
end;

function u5.playOpenedChestAnimations(p33, u34) -- Line: 256
    -- upvalues: getCrateItemRarityMeta (copy), CrateItemRarity (copy), TweenService (copy), GameSound (copy), SoundManager (copy), EffectUtil (copy), ReplicatedStorage (copy)
    local gradient = getCrateItemRarityMeta(CrateItemRarity.THREE_STAR).gradient;
    local Main = u34:WaitForChild("Main", 3);

    if Main ~= nil then
        Main = Main:WaitForChild("neon", 3);
    end;

    if Main then
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Color = gradient.colorTop
        }):Play();
    end;

    task.delay(0.3, function() -- Line: 268
        -- upvalues: u34 (copy), TweenService (ref), GameSound (ref), CrateItemRarity (ref), SoundManager (ref), EffectUtil (ref), ReplicatedStorage (ref), gradient (copy), Main (copy)
        local Main2 = u34:WaitForChild("Main", 3);

        if Main2 ~= nil then
            Main2 = Main2:WaitForChild("Hinge", 3);
        end;

        local v35 = Main2:FindFirstChildWhichIsA("WeldConstraint");

        if v35 ~= nil then
            v35:Destroy();
        end;

        Main2.Anchored = true;
        TweenService:Create(Main2, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            CFrame = Main2.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
        }):Play();
        local v36 = ({
            GameSound.LUCKY_BOX_REVEAL_COMMON,
            GameSound.LUCKY_BOX_REVEAL_RARE,
            GameSound.LUCKY_BOX_REVEAL_EPIC,
            GameSound.LUCKY_BOX_REVEAL_LEGENDARY,
            GameSound.LUCKY_BOX_REVEAL_MYTHIC
        })[CrateItemRarity.THREE_STAR + 1];

        if v36 ~= "" and v36 then
            SoundManager:playSound(v36, {
                rollOffMinDistance = 30,
                rollOffMaxDistance = 45,
                position = u34:GetPivot().Position
            });
        end;

        local u37 = EffectUtil:enableInstanceEffect(u34);
        local v38 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        v38.Parent = u34;
        v38:PivotTo(u34:GetPivot());
        v38.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, gradient.colorBottom), ColorSequenceKeypoint.new(1, gradient.colorTop) });
        EffectUtil:playEffects({ v38 }, nil, {
            destroyAfterSec = 1
        });
        task.delay(1.4, function() -- Line: 307
            -- upvalues: Main (ref), TweenService (ref), Main2 (copy), SoundManager (ref), GameSound (ref), u34 (ref), u37 (copy)
            local v39 = Main;

            if v39 ~= nil then
                v39:Destroy();
            end;

            TweenService:Create(Main2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                CFrame = Main2.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
            }):Play();
            SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
                position = u34:GetPivot().Position
            });
            local u40 = SoundManager:playSound(GameSound.LUCKY_BOX_SHIMMER, {
                rollOffMaxDistance = 45,
                volumeMultiplier = 1.75,
                fadeOutTime = 4.2,
                looped = true,
                position = u34:GetPivot().Position
            });
            u37:GiveTask(function() -- Line: 331
                -- upvalues: u40 (copy)
                local v41 = u40;

                if v41 ~= nil then
                    v41:Stop();
                end;

                local v42 = u40;

                if v42 ~= nil then
                    v42:Destroy();
                end;
            end);
            task.delay(4, function() -- Line: 342
                -- upvalues: u37 (ref)
                u37:DoCleaning();
            end);
            task.delay(5, function() -- Line: 346
                -- upvalues: u34 (ref), TweenService (ref)
                local u43 = TweenInfo.new(0.3);

                local function _(p44) -- Line: 349
                    -- upvalues: TweenService (ref), u43 (copy)
                    if p44:IsA("BasePart") then
                        TweenService:Create(p44, u43, {
                            Transparency = 1
                        }):Play();
                    end;
                end;

                for i, descendant in u34:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        TweenService:Create(descendant, u43, {
                            Transparency = 1
                        }):Play();
                    end;
                end;

                task.delay(u43.Time, function() -- Line: 359
                    -- upvalues: u34 (ref)
                    u34:Destroy();
                end);
            end);
        end);
    end);
end;

function u5.getCurrentTreasure(p45) -- Line: 366
    -- upvalues: Players (copy)
    if not Players.LocalPlayer then
        return nil;
    end;

    local v46, v47, v48;
    v46, v47, v48 = p45.activeTreasureChests, nil, nil;
    local v49, v50, v51;

    if type(v46) == "function" then
        v49, v50 = v46(v47, v51);
    else
        v49, v50 = next(v46, v51);
    end;

    v51 = v49;

    return v50;
end;

KnitClient.CreateController(u5.new());

return nil;