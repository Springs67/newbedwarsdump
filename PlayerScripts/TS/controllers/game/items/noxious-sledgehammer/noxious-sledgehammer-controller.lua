-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out");
local BlockEngine = v1.BlockEngine;
local GreedyBlockHandler = v1.GreedyBlockHandler;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v2.RandomUtil;
local SoundManager = v2.SoundManager;
local WatchCharacterAnimation = v2.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "NoxiousSledgehammerController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 43
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 47
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "NoxiousSledgehammerController";
    p8.maid = u3.new();
    p8.lastPlayedEffect = {};
end;

function u6.KnitStart(u9) -- Line: 53
    -- upvalues: HandKnitController (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), InventoryUtil (copy), ItemType (copy), SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Lighting (copy), default (copy), Linear (copy), ScreenShakeUtil (copy), KnitClient (copy), ClientSyncEvents (copy), AbilityId (copy), default2 (copy), BlockEngine (copy), Workspace (copy), ReplicatedStorage (copy), EffectUtil (copy), RandomUtil (copy), getItemMeta (copy), RuntimeLib (copy), GreedyBlockHandler (copy)
    HandKnitController.KnitStart(u9);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.SLEDGEHAMMER_SWING) }, function(p10, p11) -- Line: 55
        -- upvalues: Players (ref), InventoryUtil (ref), ItemType (ref), u9 (copy), SoundManager (ref), GameSound (ref), u3 (ref), u4 (ref), Lighting (ref), default (ref), Linear (ref), ScreenShakeUtil (ref)
        local Character = p10.Character;

        if not Character then
            return nil;
        end;

        local u12 = p10 == Players.LocalPlayer;
        local hand = InventoryUtil.getInventory(p10).hand;

        if hand ~= nil then
            hand = hand.tool;
        end;

        if hand ~= nil then
            hand = hand.Name;
        end;

        if hand ~= ItemType.NOXIOUS_SLEDGEHAMMER then
            return nil;
        end;

        local v13 = os.clock();
        local v14 = u9.lastPlayedEffect[p10.UserId];

        if v13 - (v14 == nil and 0 or v14) < 0.5 then
            return nil;
        end;

        u9.lastPlayedEffect[p10.UserId] = os.clock();

        if Character.PrimaryPart then
            local SLEDGEHAMMER_SWING = GameSound.SLEDGEHAMMER_SWING;
            local v15 = {};
            local v16;

            if u12 then
                v16 = nil;
            else
                v16 = Character.PrimaryPart;

                if v16 ~= nil then
                    v16 = v16.CFrame.Position;
                end;
            end;

            v15.position = v16;
            v15.rollOffMinDistance = 30;
            v15.rollOffMaxDistance = 100;
            SoundManager:playSound(SLEDGEHAMMER_SWING, v15);
        end;

        local u17 = u3.new();
        local u18 = 1;
        local v19 = false;

        while true do
            if v19 then
                u18 = u18 + 1;
            else
                v19 = true;
            end;

            if u18 > 3 then
                return;
            end;

            u17:GiveTask(p11:GetMarkerReachedSignal("impact_" .. tostring(u18)):Connect(function() -- Line: 121
                -- upvalues: u18 (ref), u17 (copy), u12 (copy), u4 (ref), Lighting (ref), default (ref), Linear (ref), ScreenShakeUtil (ref), Character (copy), SoundManager (ref), GameSound (ref)
                if u18 == 3 then
                    u17:DoCleaning();
                end;

                if u12 then
                    local u20 = u4("DepthOfFieldEffect", {
                        Name = "SledgehammerDepthOfField",
                        InFocusRadius = 20,
                        FocusDistance = 0,
                        FarIntensity = 0,
                        Parent = Lighting
                    });
                    local u22 = default(0.14, Linear, function(p21) -- Line: 135
                        -- upvalues: u20 (copy)
                        u20.FarIntensity = (math.sqrt(p21) - p21) / 1.2;
                    end);
                    task.spawn(function() -- Line: 139
                        -- upvalues: u22 (copy), u20 (copy)
                        u22:Wait();
                        u20:Destroy();
                    end);
                    ScreenShakeUtil.shakeScreenDirection(Vector2.new(1, 1), {
                        zMagnitude = 1,
                        duration = u18 < 3 and 0.15 or 0.4
                    });
                end;

                if Character.PrimaryPart then
                    local v23 = ({ GameSound.SLEDGEHAMMER_IMPACT_1, GameSound.SLEDGEHAMMER_IMPACT_2, GameSound.SLEDGEHAMMER_IMPACT_3 })[u18 - 1 + 1];
                    local v24 = {};
                    local v25;

                    if u12 then
                        v25 = nil;
                    else
                        v25 = Character.PrimaryPart;

                        if v25 ~= nil then
                            v25 = v25.CFrame.Position;
                        end;
                    end;

                    v24.position = v25;
                    v24.rollOffMinDistance = 30;
                    v24.rollOffMaxDistance = 150;
                    v24.volumeMultiplier = 1.6;
                    SoundManager:playSound(v23, v24);
                end;
            end));
            u18 = u18;
        end;
    end);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.NOXIOUS_SLEDGEHAMMER, {
        animations = { AnimationType.SLEDGEHAMMER_SWING, AnimationType.FP_SLEDGEHAMMER_SWING },
        sounds = {
            GameSound.SLEDGEHAMMER_IMPACT_1,
            GameSound.SLEDGEHAMMER_IMPACT_2,
            GameSound.SLEDGEHAMMER_IMPACT_3,
            GameSound.SLEDGEHAMMER_SWING
        }
    });
    ClientSyncEvents.CanUseLocalAbility:connect(function(p26) -- Line: 178
        -- upvalues: AbilityId (ref), u9 (copy)
        if p26.ability ~= AbilityId.NOXIOUS_SLEDGEHAMMER_SLAM then
            return nil;
        end;

        if u9.slammingMaid then
            p26:setCancelled(true);
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p27) -- Line: 186
        -- upvalues: AbilityId (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), u9 (copy), u3 (ref)
        if p27.ability ~= AbilityId.NOXIOUS_SLEDGEHAMMER_SLAM then
            return nil;
        end;

        if p27.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p27:isCancelled() then
            return nil;
        end;

        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SLEDGEHAMMER_SWING);
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SLEDGEHAMMER_SWING);

        if not u9.slammingMaid then
            u9.slammingMaid = u3.new();
            u9.slammingMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = 0
            }));
            u9.slammingMaid:GiveTask(function() -- Line: 203
                -- upvalues: u9 (ref)
                u9.slammingMaid = nil;

                return u9.slammingMaid;
            end);
            task.delay(1, function() -- Line: 207
                -- upvalues: u9 (ref)
                local slammingMaid = u9.slammingMaid;

                if slammingMaid ~= nil then
                    slammingMaid:DoCleaning();
                end;
            end);
        end;
    end);
    default2.Client:Get("SledgehammerSlam"):Connect(function(p28) -- Line: 215
        -- upvalues: BlockEngine (ref), Workspace (ref), ReplicatedStorage (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), RandomUtil (ref), getItemMeta (ref), RuntimeLib (ref), GreedyBlockHandler (ref)
        local u29 = p28[1];
        local v30 = 0;
        local u31 = 0;

        for _, v in p28[2] do
            local u32 = {};

            for _, v3 in v.blockPositions do
                local v33 = BlockEngine:getStore():getBlockAt(v3);

                if v33 then
                    local v34 = {
                        itemType = v33.Name
                    };
                    local v35 = v33:GetAttribute("Data");
                    v34.data = v35 == nil and 0 or v35;
                    u32[v3] = v34;
                end;
            end;

            if v30 <= 5 or math.random() >= 0.6 then
                v30 = v30 + 1;
                task.delay(v.workspaceTime - Workspace:GetServerTimeNow(), function() -- Line: 244
                    -- upvalues: ReplicatedStorage (ref), u31 (ref), u29 (copy), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), u32 (copy), RandomUtil (ref), getItemMeta (ref), BlockEngine (ref), RuntimeLib (ref), GreedyBlockHandler (ref)
                    local v36 = ReplicatedStorage.Assets.Effects.NoxiousExplosion:Clone();
                    v36.Position = u29 * Vector3.new(0, 0, (u31 + 1) * -5);
                    v36.Parent = Workspace;
                    EffectUtil:playEffects({ v36 }, nil, {
                        destroyAfterSec = 4,
                        sizeMultiplier = math.pow((u31 + 1) / 3, 1.8)
                    });
                    SoundManager:playSound(GameSound.HALLOWEEN_BOSS_RUNE_EXPLODE, {
                        rollOffMaxDistance = 120,
                        rollOffMinDistance = 20,
                        position = v36.Position,
                        volumeMultiplier = u31 * 0.1 + 0.1,
                        playbackSpeedMultiplier = u31 * 0.6 + 0.94
                    });
                    local u37 = 0;

                    for i, v3 in u32 do
                        if u37 < (u31 <= 1 and 3 or 9) then
                            task.spawn(function() -- Line: 263
                                -- upvalues: u37 (ref), RandomUtil (ref), getItemMeta (ref), v3 (copy), GameSound (ref), SoundManager (ref), BlockEngine (ref), i (copy)
                                task.wait(u37 * 0.01);
                                local block = getItemMeta(v3.itemType).block;

                                if block ~= nil then
                                    block = block.hitSound;
                                end;

                                SoundManager:playSound(RandomUtil.fromList(unpack((block == nil and function() -- Line: 272
                                    -- upvalues: GameSound (ref)
                                    return { GameSound.GENERIC_BLOCK_HIT };
                                end or block)())), {
                                    rollOffMaxDistance = 120,
                                    rollOffMinDistance = 20,
                                    volumeMultiplier = 0.5,
                                    position = BlockEngine:getWorldPosition(i)
                                });
                            end);
                        end;

                        u37 = u37 + 1;
                        local v38 = BlockEngine:getHandlerRegistry():getHandler(v3.itemType);

                        if v38 and RuntimeLib.instanceof(v38, GreedyBlockHandler) then
                            local u39 = v38:place(i, v3.data);
                            u39.CanCollide = false;
                            u39.Anchored = false;

                            for _, child in u39:GetChildren() do
                                if child:IsA("BasePart") then
                                    child.CanCollide = false;
                                    child.Anchored = false;
                                end;
                            end;

                            local Unit = (u39.Position - u29.Position).Unit;
                            local v40 = Vector3.new(Unit.X, 0.1, Unit.Y);
                            u39.Parent = Workspace;
                            u39.AssemblyLinearVelocity = v40 * 50;
                            task.delay(3, function() -- Line: 306
                                -- upvalues: u39 (copy)
                                return u39:Destroy();
                            end);
                        end;
                    end;

                    u31 = u31 + 1;
                end);
            end;
        end;
    end);
end;

function u6.isRelevantItem(p41, p42) -- Line: 315
    -- upvalues: ItemType (copy)
    return p42.itemType == ItemType.NOXIOUS_SLEDGEHAMMER;
end;

function u6.onEnable(p43, p44, p45) -- Line: 318
    -- upvalues: Flamework (copy), AbilityId (copy)
    p43:setupYield(function() -- Line: 319
        -- upvalues: Flamework (ref), AbilityId (ref)
        local u46 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.NOXIOUS_SLEDGEHAMMER_SLAM, {
            abilityType = "ItemPrimary",
            clickToTrigger = true,
            abilityButton = {
                icon = "rbxassetid://6862310392"
            }
        }):expect();

        return function() -- Line: 327
            -- upvalues: u46 (copy)
            u46.Destroy();
        end;
    end);
end;

function u6.onDisable(p47) -- Line: 332
    p47.maid:DoCleaning();
end;

KnitClient.CreateController(u6.new());

return nil;