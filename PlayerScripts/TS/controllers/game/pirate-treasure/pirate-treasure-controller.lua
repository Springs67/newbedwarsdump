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
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "PirateTreasureController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 34
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "PirateTreasureController";
    p7.activeTreasureChests = {};
end;

function u5.KnitStart(u8) -- Line: 43
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u8);
    default.Client:Get("SpawnTreasureChest"):Connect(function(p9) -- Line: 45
        -- upvalues: u8 (copy)
        u8:onChestSpawn(p9);
    end);
    default.Client:Get("TreasureChestOpened"):Connect(function(u10) -- Line: 48
        -- upvalues: u8 (copy)
        local u11 = u8.activeTreasureChests[u10.secret];
        local v12;

        if u11 == nil then
            v12 = u11;
        else
            v12 = u11.PrimaryPart;
        end;

        if v12 then
            local v13 = v12:FindFirstChildWhichIsA("ProximityPrompt");

            if v13 ~= nil then
                v13:Destroy();
            end;
        end;

        task.delay(0.3, function() -- Line: 64
            -- upvalues: u11 (copy), u8 (ref), u10 (copy)
            if u11 then
                u8:playOpenedChestAnimations(u11, u10.rarity);
            end;
        end);
        u8.activeTreasureChests[u10.secret] = nil;
    end);
end;

function u5.onChestSpawn(u14, u15) -- Line: 75
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), scaleModel (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), Players (copy), KnitClient2 (copy), DeviceUtil (copy), u3 (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), EntityUtil (copy)
    local u16 = ReplicatedStorage.Assets.Effects.PirateTreasure:Clone();
    local PrimaryPart = u16.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    u14.activeTreasureChests[u15.secret] = u16;
    u16.Parent = Workspace;
    scaleModel(u16, 1.25);
    u16:PivotTo(u15.cframe + Vector3.new(0, -1.3, 0));
    u16:SetAttribute("Secret", u15.secret);
    SoundManager:playSound(GameSound.TREASURE_CHEST_SPAWN, {
        position = u15.cframe.Position
    });
    local v17 = ReplicatedStorage.Assets.Effects.MagicMirrorExplosion:Clone();
    v17.Parent = u16;
    v17:PivotTo(u16:GetPivot());
    EffectUtil:playEffects({ v17 }, nil, {
        destroyAfterSec = 2
    });

    if tonumber(u15.ownerUserId) == Players.LocalPlayer.UserId then
        local u18 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Open",
            ObjectText = "Treasure Chest",
            HoldDuration = 1,
            RequiresLineOfSight = false,
            MaxActivationDistance = 5,
            Parent = PrimaryPart,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        local u19 = u3.new();
        u18.PromptButtonHoldBegan:Connect(function(p20) -- Line: 117
            -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u15 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient2 (ref), u19 (copy), u16 (copy), TweenService (ref)
            if p20 ~= Players.LocalPlayer then
                return nil;
            end;

            if not p20.Character then
                return nil;
            end;

            local u21 = SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCKING, {
                looped = true,
                volumeMultiplier = 1.75,
                position = u15.cframe.Position
            });
            local u22 = GameAnimationUtil:playAnimation(p20, AnimationType.OPEN_CRATE, {
                looped = true
            });
            local u23 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.OPEN_CRATE, {
                looped = true
            });
            u19:GiveTask(function() -- Line: 137
                -- upvalues: u22 (copy), u23 (copy), u21 (copy)
                local v24 = u22;

                if v24 ~= nil then
                    v24:Stop();
                end;

                local v25 = u22;

                if v25 ~= nil then
                    v25:Destroy();
                end;

                local v26 = u23;

                if v26 ~= nil then
                    v26:Stop();
                end;

                local v27 = u23;

                if v27 ~= nil then
                    v27:Destroy();
                end;

                local v28 = u21;

                if v28 ~= nil then
                    v28:Destroy();
                end;
            end);
            local PrimaryPart2 = u16.PrimaryPart;

            if PrimaryPart2 then
                local u29 = TweenService:Create(PrimaryPart2, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                    CFrame = PrimaryPart2:GetPivot() * CFrame.Angles(0, 0, -0.017453292519943295)
                });
                local u30 = TweenService:Create(PrimaryPart2, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                    CFrame = PrimaryPart2:GetPivot() * CFrame.Angles(0, 0, 0.017453292519943295)
                });
                local u31 = true;
                u19:GiveTask(function() -- Line: 182
                    -- upvalues: u31 (ref)
                    u31 = false;
                end);
                u29:Play();
                u29.Completed:Connect(function() -- Line: 186
                    -- upvalues: u30 (copy)
                    u30:Play();
                end);
                u30.Completed:Connect(function() -- Line: 189
                    -- upvalues: u31 (ref), u29 (copy)
                    if not u31 then
                        return nil;
                    end;

                    u29:Play();
                end);
            end;
        end);
        u18.PromptButtonHoldEnded:Connect(function(p32) -- Line: 197
            -- upvalues: Players (ref), u19 (copy)
            if p32 ~= Players.LocalPlayer then
                return nil;
            end;

            u19:DoCleaning();
        end);
        u18.Triggered:Connect(function(p33) -- Line: 203
            -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), u15 (copy), EntityUtil (ref), u14 (copy), u16 (copy), u18 (copy)
            if p33 ~= Players.LocalPlayer then
                return nil;
            end;

            GameAnimationUtil:playAnimation(p33, AnimationType.TENNIS_RACKET_HIT);
            SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCK, {
                volumeMultiplier = 1.75,
                position = u15.cframe.Position
            });
            local v34 = EntityUtil:getEntity(p33);

            if v34 ~= nil then
                v34 = v34:isAlive();
            end;

            if not v34 then
                return nil;
            end;

            if u14:requestOpenChest(u16) then
                u18:Destroy();
            end;
        end);
    end;
end;

function u5.requestOpenChest(p35, p36) -- Line: 228
    -- upvalues: default (copy)
    local v37 = p36:GetAttribute("Secret");

    return default.Client:Get("OpenTreasureChest"):CallServer({
        secret = v37
    });
end;

function u5.playOpenedChestAnimations(p38, u39, u40) -- Line: 234
    -- upvalues: getCrateItemRarityMeta (copy), TweenService (copy), GameSound (copy), SoundManager (copy), EffectUtil (copy), ReplicatedStorage (copy)
    local gradient = getCrateItemRarityMeta(u40).gradient;
    local Main = u39:WaitForChild("Main", 3);

    if Main ~= nil then
        Main = Main:WaitForChild("neon", 3);
    end;

    if Main then
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Color = gradient.colorTop
        }):Play();
    end;

    task.delay(0.3, function() -- Line: 246
        -- upvalues: u39 (copy), TweenService (ref), GameSound (ref), u40 (copy), SoundManager (ref), EffectUtil (ref), ReplicatedStorage (ref), gradient (copy), Main (copy)
        local Main2 = u39:WaitForChild("Main", 3);

        if Main2 ~= nil then
            Main2 = Main2:WaitForChild("Hinge", 3);
        end;

        local v41 = Main2:FindFirstChildWhichIsA("WeldConstraint");

        if v41 ~= nil then
            v41:Destroy();
        end;

        Main2.Anchored = true;
        TweenService:Create(Main2, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            CFrame = Main2.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
        }):Play();
        local v42 = ({
            GameSound.LUCKY_BOX_REVEAL_COMMON,
            GameSound.LUCKY_BOX_REVEAL_RARE,
            GameSound.LUCKY_BOX_REVEAL_EPIC,
            GameSound.LUCKY_BOX_REVEAL_LEGENDARY,
            GameSound.LUCKY_BOX_REVEAL_MYTHIC
        })[u40 + 1];

        if v42 ~= "" and v42 then
            SoundManager:playSound(v42, {
                rollOffMinDistance = 30,
                rollOffMaxDistance = 45,
                position = u39:GetPivot().Position
            });
        end;

        local u43 = EffectUtil:enableInstanceEffect(u39);
        local v44 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        v44.Parent = u39;
        v44:PivotTo(u39:GetPivot());
        v44.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, gradient.colorBottom), ColorSequenceKeypoint.new(1, gradient.colorTop) });
        EffectUtil:playEffects({ v44 }, nil, {
            destroyAfterSec = 1
        });
        task.delay(1.4, function() -- Line: 285
            -- upvalues: Main (ref), TweenService (ref), Main2 (copy), SoundManager (ref), GameSound (ref), u39 (ref), u43 (copy)
            local v45 = Main;

            if v45 ~= nil then
                v45:Destroy();
            end;

            TweenService:Create(Main2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                CFrame = Main2.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
            }):Play();
            SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
                position = u39:GetPivot().Position
            });
            local u46 = SoundManager:playSound(GameSound.LUCKY_BOX_SHIMMER, {
                rollOffMaxDistance = 45,
                volumeMultiplier = 1.75,
                fadeOutTime = 4.2,
                looped = true,
                position = u39:GetPivot().Position
            });
            u43:GiveTask(function() -- Line: 309
                -- upvalues: u46 (copy)
                local v47 = u46;

                if v47 ~= nil then
                    v47:Stop();
                end;

                local v48 = u46;

                if v48 ~= nil then
                    v48:Destroy();
                end;
            end);
            task.delay(4, function() -- Line: 320
                -- upvalues: u43 (ref)
                u43:DoCleaning();
            end);
            task.delay(5, function() -- Line: 324
                -- upvalues: u39 (ref), TweenService (ref)
                local u49 = TweenInfo.new(0.3);

                local function _(p50) -- Line: 327
                    -- upvalues: TweenService (ref), u49 (copy)
                    if p50:IsA("BasePart") then
                        TweenService:Create(p50, u49, {
                            Transparency = 1
                        }):Play();
                    end;
                end;

                for i, descendant in u39:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        TweenService:Create(descendant, u49, {
                            Transparency = 1
                        }):Play();
                    end;
                end;

                task.delay(u49.Time, function() -- Line: 337
                    -- upvalues: u39 (ref)
                    u39:Destroy();
                end);
            end);
        end);
    end);
end;

function u5.preloadAssets(p51) -- Line: 344
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.TENNIS_RACKET_HIT, AnimationType.OPEN_CRATE },
        sounds = {
            GameSound.LUCKY_BOX_REVEAL_COMMON,
            GameSound.LUCKY_BOX_REVEAL_RARE,
            GameSound.LUCKY_BOX_REVEAL_EPIC,
            GameSound.LUCKY_BOX_REVEAL_LEGENDARY,
            GameSound.LUCKY_BOX_REVEAL_MYTHIC,
            GameSound.PIRATE_SHOVEL_DIG_TREASURE_FOUND,
            GameSound.LUCKY_BOX_SHIMMER,
            GameSound.TREASURE_CHEST_SPAWN,
            GameSound.TREASURE_CHEST_UNLOCKING,
            GameSound.TREASURE_CHEST_UNLOCK
        }
    });
end;

KnitClient.CreateController(u5.new());

return nil;