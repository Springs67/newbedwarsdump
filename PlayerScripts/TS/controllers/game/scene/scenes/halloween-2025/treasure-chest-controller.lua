-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
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
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "TreasureChestController";
    end,

    __index = GameKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p7, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p7.Name = "TreasureChestController";
    p7.activeTreasureChests = {};
end;

function u5.KnitStart(p8) -- Line: 44
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p8);
end;

function u5.onGameInit(u9) -- Line: 47
    -- upvalues: default (copy)
    default.Client:Get("SpawnHalloweenTreasureChest"):Connect(function(p10) -- Line: 48
        -- upvalues: u9 (copy)
        u9:onChestSpawn(p10);
    end);
    default.Client:Get("HalloweenTreasureChestOpened"):Connect(function(p11) -- Line: 51
        -- upvalues: u9 (copy)
        local v12 = u9.activeTreasureChests[p11.secret];
        local v13;

        if v12 == nil then
            v13 = v12;
        else
            v13 = v12.PrimaryPart;
        end;

        if v13 then
            local v14 = v13:FindFirstChildWhichIsA("ProximityPrompt");

            if v14 ~= nil then
                v14:Destroy();
            end;
        end;

        if v12 then
            u9:playOpenedChestAnimations(v12);
        end;

        u9.activeTreasureChests[p11.secret] = nil;
    end);
end;

function u5.onChestSpawn(u15, u16) -- Line: 76
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), scaleModel (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), DeviceUtil (copy), u3 (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), EntityUtil (copy)
    local u17 = ReplicatedStorage.Assets.Effects.PirateTreasure:Clone();
    local PrimaryPart = u17.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    u15.activeTreasureChests[u16.secret] = u17;
    u17.Parent = Workspace;
    scaleModel(u17, 1.25);
    u17:PivotTo(u16.cframe + Vector3.new(0, -1.3, 0));
    u17:SetAttribute("Secret", u16.secret);
    SoundManager:playSound(GameSound.TREASURE_CHEST_SPAWN, {
        position = u16.cframe.Position
    });
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
    u18.PromptButtonHoldBegan:Connect(function(p20) -- Line: 108
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u16 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient2 (ref), u19 (copy), u17 (copy), TweenService (ref)
        if p20 ~= Players.LocalPlayer then
            return nil;
        end;

        if not p20.Character then
            return nil;
        end;

        local u21 = SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCKING, {
            looped = true,
            volumeMultiplier = 1.75,
            position = u16.cframe.Position
        });
        local u22 = GameAnimationUtil:playAnimation(p20, AnimationType.OPEN_CRATE, {
            looped = true
        });
        local u23 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.OPEN_CRATE, {
            looped = true
        });
        u19:GiveTask(function() -- Line: 128
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
        local PrimaryPart2 = u17.PrimaryPart;

        if PrimaryPart2 then
            local u29 = TweenService:Create(PrimaryPart2, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                CFrame = PrimaryPart2:GetPivot() * CFrame.Angles(0, 0, -0.017453292519943295)
            });
            local u30 = TweenService:Create(PrimaryPart2, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                CFrame = PrimaryPart2:GetPivot() * CFrame.Angles(0, 0, 0.017453292519943295)
            });
            local u31 = true;
            u19:GiveTask(function() -- Line: 173
                -- upvalues: u31 (ref)
                u31 = false;
            end);
            u29:Play();
            u29.Completed:Connect(function() -- Line: 177
                -- upvalues: u30 (copy)
                u30:Play();
            end);
            u30.Completed:Connect(function() -- Line: 180
                -- upvalues: u31 (ref), u29 (copy)
                if not u31 then
                    return nil;
                end;

                u29:Play();
            end);
        end;
    end);
    u18.PromptButtonHoldEnded:Connect(function(p32) -- Line: 188
        -- upvalues: Players (ref), u19 (copy)
        if p32 ~= Players.LocalPlayer then
            return nil;
        end;

        u19:DoCleaning();
    end);
    u18.Triggered:Connect(function(p33) -- Line: 194
        -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), u16 (copy), EntityUtil (ref), u15 (copy), u17 (copy), u18 (copy)
        if p33 ~= Players.LocalPlayer then
            return nil;
        end;

        GameAnimationUtil:playAnimation(p33, AnimationType.TENNIS_RACKET_HIT);
        SoundManager:playSound(GameSound.TREASURE_CHEST_UNLOCK, {
            volumeMultiplier = 1.75,
            position = u16.cframe.Position
        });
        local v34 = EntityUtil:getEntity(p33);

        if v34 ~= nil then
            v34 = v34:isAlive();
        end;

        if not v34 then
            return nil;
        end;

        if u15:requestOpenChest(u17) then
            u18:Destroy();
        end;
    end);
end;

function u5.requestOpenChest(p35, p36) -- Line: 218
    -- upvalues: default (copy)
    local v37 = p36:GetAttribute("Secret");

    return default.Client:Get("OpenHalloweenTreasureChest"):CallServer({
        secret = v37
    });
end;

function u5.playOpenedChestAnimations(p38, u39) -- Line: 224
    -- upvalues: ColorUtil (copy), TweenService (copy), GameSound (copy), SoundManager (copy), EffectUtil (copy), ReplicatedStorage (copy)
    local v40 = {
        colorBottom = ColorUtil.hexColor(11711154),
        colorTop = ColorUtil.hexColor(16777215)
    };
    local Main = u39:WaitForChild("Main", 3);

    if Main ~= nil then
        Main = Main:WaitForChild("neon", 3);
    end;

    if Main then
        TweenService:Create(Main, TweenInfo.new(0.3), {
            Color = v40.colorTop
        }):Play();
    end;

    local Main2 = u39:WaitForChild("Main", 3);

    if Main2 ~= nil then
        Main2 = Main2:WaitForChild("Hinge", 3);
    end;

    local v41 = Main2:FindFirstChildWhichIsA("WeldConstraint");

    if v41 ~= nil then
        v41:Destroy();
    end;

    Main2.Anchored = true;
    TweenService:Create(Main2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        CFrame = Main2.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
    }):Play();
    local _ = {
        GameSound.LUCKY_BOX_REVEAL_COMMON,
        GameSound.LUCKY_BOX_REVEAL_RARE,
        GameSound.LUCKY_BOX_REVEAL_EPIC,
        GameSound.LUCKY_BOX_REVEAL_LEGENDARY,
        GameSound.LUCKY_BOX_REVEAL_MYTHIC
    };
    local LUCKY_BOX_REVEAL_COMMON = GameSound.LUCKY_BOX_REVEAL_COMMON;

    if LUCKY_BOX_REVEAL_COMMON ~= "" and LUCKY_BOX_REVEAL_COMMON then
        SoundManager:playSound(LUCKY_BOX_REVEAL_COMMON, {
            rollOffMinDistance = 30,
            rollOffMaxDistance = 45,
            position = u39:GetPivot().Position
        });
    end;

    local u42 = EffectUtil:enableInstanceEffect(u39);
    local v43 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
    v43.Parent = u39;
    v43:PivotTo(u39:GetPivot());
    v43.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v40.colorBottom), ColorSequenceKeypoint.new(1, v40.colorTop) });
    EffectUtil:playEffects({ v43 }, nil, {
        destroyAfterSec = 1
    });
    task.delay(0.5, function() -- Line: 277
        -- upvalues: Main (copy), TweenService (ref), Main2 (copy), SoundManager (ref), GameSound (ref), u39 (copy), u42 (copy)
        local v44 = Main;

        if v44 ~= nil then
            v44:Destroy();
        end;

        TweenService:Create(Main2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            CFrame = Main2.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
        }):Play();
        SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
            position = u39:GetPivot().Position
        });
        local u45 = SoundManager:playSound(GameSound.LUCKY_BOX_SHIMMER, {
            rollOffMaxDistance = 45,
            volumeMultiplier = 1.75,
            fadeOutTime = 4.2,
            looped = true,
            position = u39:GetPivot().Position
        });
        u42:GiveTask(function() -- Line: 301
            -- upvalues: u45 (copy)
            local v46 = u45;

            if v46 ~= nil then
                v46:Stop();
            end;

            local v47 = u45;

            if v47 ~= nil then
                v47:Destroy();
            end;
        end);
        task.delay(4, function() -- Line: 312
            -- upvalues: u42 (ref)
            u42:DoCleaning();
        end);
        task.delay(5, function() -- Line: 316
            -- upvalues: u39 (ref), TweenService (ref)
            local u48 = TweenInfo.new(0.3);

            local function _(p49) -- Line: 319
                -- upvalues: TweenService (ref), u48 (copy)
                if p49:IsA("BasePart") then
                    TweenService:Create(p49, u48, {
                        Transparency = 1
                    }):Play();
                end;
            end;

            for i, descendant in u39:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    TweenService:Create(descendant, u48, {
                        Transparency = 1
                    }):Play();
                end;
            end;

            task.delay(u48.Time, function() -- Line: 329
                -- upvalues: u39 (ref)
                u39:Destroy();
            end);
        end);
    end);
end;

function u5.preloadAssets(p50) -- Line: 335
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

function u5.cleanUp(u51) -- Line: 341
    local function _(p52, p53) -- Line: 343
        -- upvalues: u51 (copy)
        p52:Destroy();
        u51.activeTreasureChests[p53] = nil;
    end;

    for i, v in u51.activeTreasureChests do
        v:Destroy();
        u51.activeTreasureChests[i] = nil;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;