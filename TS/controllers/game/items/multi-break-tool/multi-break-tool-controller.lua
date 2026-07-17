-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BreakBlockDamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ViewmodelController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-controller").ViewmodelController;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "MultiBreakToolController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 34
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 38
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "MultiBreakToolController";
    p6.localMaid = u2.new();
    p6.firstPersonDrillMotorPlayerMap = {};
    p6.thirdPersonDrillMotorPlayerMap = {};
    p6.isCheckingForDrillEnd = false;
    p6.lastBlockDamageTime = 0;
    p6.currentSpinSpeedPlayerMap = {};
    p6.currentSpinSpeedGoalPlayerMap = {};
    p6.currentDrillSoundPlayerMap = {};
    p6.drillSoundPitchMin = 0.1;
    p6.drillSoundPitchMax = 1;
    p6.drillMaxSpinSpeed = 30;
    p6.drillSpinAcceleration = 0.4;
    p6.drillSpinEndCooldownCheck = 0.4;
    p6.stopSpinningSoundLastPlayedPlayerMap = {};
end;

function u4.KnitStart(u7) -- Line: 56
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), SharedSyncEvents (copy), InventoryUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), ClientSyncEvents (copy), getItemMeta (copy), BreakBlockDamageType (copy), SoundManager (copy), RandomUtil (copy), RunService (copy), MathExtras (copy), default (copy)
    HandKnitController.KnitStart(u7);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.MULTI_BREAK_TOOL, {
        sounds = {
            GameSound.MULTI_BREAK_TOOL_DRILL_LOOP,
            GameSound.MULTI_BREAK_TOOL_DRILL_STOP,
            GameSound.MULTI_BREAK_TOOL_STONE_BREAK_1,
            GameSound.MULTI_BREAK_TOOL_STONE_BREAK_2,
            GameSound.MULTI_BREAK_TOOL_STONE_BREAK_3,
            GameSound.MULTI_BREAK_TOOL_STONE_BREAK_4,
            GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_1,
            GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_2,
            GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_3,
            GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_4,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_1,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_2,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_3,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_4
        }
    });
    SharedSyncEvents.BeforeAnimationPlayEvent:connect(function(p8) -- Line: 61
        -- upvalues: InventoryUtil (ref), Players (ref), ItemType (ref), GameAnimationUtil (ref), AnimationType (ref)
        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand ~= ItemType.MULTI_BREAK_TOOL then
            return nil;
        end;

        local v9 = {
            GameAnimationUtil:getAssetId(AnimationType.BREAK_BLOCK),
            GameAnimationUtil:getAssetId(AnimationType.PUNCH),
            GameAnimationUtil:getAssetId(AnimationType.FP_USE_ITEM),
            GameAnimationUtil:getAssetId(AnimationType.FP_WALK)
        };

        if table.find(v9, p8.animationAssetId) ~= nil then
            p8:setCancelled(true);

            return nil;
        end;
    end);
    ClientSyncEvents.DamageBlock:connect(function(p10) -- Line: 79
        -- upvalues: InventoryUtil (ref), Players (ref), u7 (copy)
        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if not (hand and u7:isRelevantItem(hand)) then
            return nil;
        end;

        u7.lastBlockDamageTime = time();

        if not u7.isCheckingForDrillEnd then
            u7:startDrillSpinLocal();
        end;
    end);
    ClientSyncEvents.DamageBlockEffect:connect(function(p11) -- Line: 91
        -- upvalues: InventoryUtil (ref), u7 (copy), getItemMeta (ref), BreakBlockDamageType (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
        if not p11.fromPlayer then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(p11.fromPlayer).hand;

        if not (hand and u7:isRelevantItem(hand)) then
            return nil;
        end;

        local v12 = getItemMeta(p11.blockType);

        if v12 ~= nil then
            v12 = v12.block;

            if v12 ~= nil then
                v12 = v12.breakType;
            end;
        end;

        if not v12 then
            return nil;
        end;

        if v12 == BreakBlockDamageType.STONE then
            p11.sound = SoundManager:createSound(RandomUtil.fromList(unpack({
                GameSound.MULTI_BREAK_TOOL_STONE_BREAK_1,
                GameSound.MULTI_BREAK_TOOL_STONE_BREAK_2,
                GameSound.MULTI_BREAK_TOOL_STONE_BREAK_3,
                GameSound.MULTI_BREAK_TOOL_STONE_BREAK_4
            })));

            return;
        end;

        if v12 == BreakBlockDamageType.WOOD then
            p11.sound = SoundManager:createSound(RandomUtil.fromList(unpack({
                GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_1,
                GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_2,
                GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_3,
                GameSound.MULTI_BREAK_TOOL_WOOD_BREAK_4
            })));

            return;
        end;

        if v12 ~= BreakBlockDamageType.WOOL then
            return;
        end;

        p11.sound = SoundManager:createSound(RandomUtil.fromList(unpack({
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_1,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_2,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_3,
            GameSound.MULTI_BREAK_TOOL_WOOL_BREAK_4
        })));
    end);
    u7.spinConnection = RunService.PreSimulation:Connect(function(u13) -- Line: 126
        -- upvalues: u7 (copy)
        local currentSpinSpeedPlayerMap = u7.currentSpinSpeedPlayerMap;

        local function v20(p14, p15) -- Line: 128
            -- upvalues: u7 (ref), u13 (copy)
            local v16 = u7.firstPersonDrillMotorPlayerMap[p15];
            local v17 = u7.thirdPersonDrillMotorPlayerMap[p15];
            local v18 = u7.currentSpinSpeedPlayerMap[p15];
            local v19 = (v18 == 0 or (v18 ~= v18 or not v18)) and 0 or v18;

            if v19 <= 0 then
                return nil;
            end;

            if v16 then
                v16.C0 = v16.C0 * CFrame.Angles(u13 * -v19, 0, 0);
            end;

            if v17 then
                v17.C0 = v17.C0 * CFrame.Angles(u13 * -v19, 0, 0);
            end;
        end;

        for i, v in currentSpinSpeedPlayerMap do
            v20(v, i, currentSpinSpeedPlayerMap);
        end;
    end);
    u7.spinSpeedConnection = RunService.Heartbeat:Connect(function() -- Line: 164
        -- upvalues: u7 (copy), SoundManager (ref), GameSound (ref), MathExtras (ref), Players (ref)
        local currentSpinSpeedPlayerMap = u7.currentSpinSpeedPlayerMap;

        local function v30(p21, p22) -- Line: 167
            -- upvalues: u7 (ref), SoundManager (ref), GameSound (ref), MathExtras (ref), Players (ref)
            if p21 ~= u7.currentSpinSpeedGoalPlayerMap[p22] then
                local v23 = p21 + math.clamp(u7.currentSpinSpeedGoalPlayerMap[p22] - p21, -u7.drillSpinAcceleration, u7.drillSpinAcceleration);
                local v24 = math.clamp(v23, 0, u7.drillMaxSpinSpeed);

                if p21 <= 0 and v24 > 0 then
                    local v25 = u7.currentDrillSoundPlayerMap[p22];

                    if v25 then
                        v25:Destroy();
                    end;

                    local MULTI_BREAK_TOOL_DRILL_LOOP = GameSound.MULTI_BREAK_TOOL_DRILL_LOOP;
                    local v26 = {
                        looped = true
                    };
                    local Character = p22.Character;

                    if Character ~= nil then
                        Character = Character.PrimaryPart;
                    end;

                    v26.parent = Character;
                    local Character2 = p22.Character;

                    if Character2 ~= nil then
                        Character2 = Character2.PrimaryPart;

                        if Character2 ~= nil then
                            Character2 = Character2.Position;
                        end;
                    end;

                    v26.position = Character2;
                    local v27 = SoundManager:playModifiableSound(MULTI_BREAK_TOOL_DRILL_LOOP, v26);
                    u7.currentDrillSoundPlayerMap[p22] = v27;
                elseif p21 > 0 and v24 <= 0 then
                    local v28 = u7.currentDrillSoundPlayerMap[p22];

                    if v28 then
                        v28:Destroy();
                    end;

                    u7.currentDrillSoundPlayerMap[p22] = nil;
                end;

                local v29 = p21 ~= v24 and u7.currentDrillSoundPlayerMap[p22];

                if v29 then
                    v29.PlaybackSpeed = MathExtras:lerp(u7.drillSoundPitchMin, u7.drillSoundPitchMax, v24 / u7.drillMaxSpinSpeed);
                end;

                u7.currentSpinSpeedPlayerMap[p22] = v24;
            end;

            if u7.isCheckingForDrillEnd and (p22 == Players.LocalPlayer and time() - u7.lastBlockDamageTime > u7.drillSpinEndCooldownCheck) then
                u7:stopDrillSpinLocal();
            end;
        end;

        for i, v in currentSpinSpeedPlayerMap do
            v30(v, i, currentSpinSpeedPlayerMap);
        end;
    end);
    default.Client:Get("MultiBreakToolStartSpinningFromServer"):Connect(function(p31) -- Line: 250
        -- upvalues: Players (ref), u7 (copy)
        if p31.player == Players.LocalPlayer then
            return nil;
        end;

        u7.currentSpinSpeedGoalPlayerMap[p31.player] = u7.drillMaxSpinSpeed;

        if u7.currentSpinSpeedPlayerMap[p31.player] == nil then
            u7.currentSpinSpeedPlayerMap[p31.player] = 0;
        end;

        local Character = p31.player.Character;

        if not Character then
            return nil;
        end;

        local thirdPersonDrillMotorPlayerMap = u7.thirdPersonDrillMotorPlayerMap;
        local player = p31.player;
        local multi_break_tool = Character:FindFirstChild("multi_break_tool");

        if multi_break_tool ~= nil then
            multi_break_tool = multi_break_tool:FindFirstChild("Handle");

            if multi_break_tool ~= nil then
                multi_break_tool = multi_break_tool:FindFirstChild("Drill");

                if multi_break_tool ~= nil then
                    multi_break_tool = multi_break_tool:FindFirstChild("Motor6D");
                end;
            end;
        end;

        thirdPersonDrillMotorPlayerMap[player] = multi_break_tool;
    end);
    default.Client:Get("MultiBreakToolStopSpinningFromServer"):Connect(function(p32) -- Line: 283
        -- upvalues: Players (ref), u7 (copy), SoundManager (ref), GameSound (ref)
        if p32.player == Players.LocalPlayer then
            return nil;
        end;

        local Character = p32.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        u7.currentSpinSpeedGoalPlayerMap[p32.player] = 0;
        local v33 = u7.stopSpinningSoundLastPlayedPlayerMap[p32.player];

        if time() - ((v33 == 0 or (v33 ~= v33 or not v33)) and 0 or v33) > 0.5 then
            SoundManager:playSound(GameSound.MULTI_BREAK_TOOL_DRILL_STOP, {
                volumeMultiplier = 0.5,
                fadeOutTime = 0.1,
                parent = Character,
                position = Character.Position
            });
            u7.stopSpinningSoundLastPlayedPlayerMap[p32.player] = time();
        end;
    end);
end;

function u4.startDrillSpinLocal(p34) -- Line: 319
    -- upvalues: default (copy), Players (copy)
    p34.isCheckingForDrillEnd = true;
    default.Client:Get("MultiBreakToolStartSpinningFromClient"):SendToServer();
    p34.currentSpinSpeedGoalPlayerMap[Players.LocalPlayer] = p34.drillMaxSpinSpeed;

    if p34.currentSpinSpeedPlayerMap[Players.LocalPlayer] == nil then
        p34.currentSpinSpeedPlayerMap[Players.LocalPlayer] = 0;
    end;
end;

function u4.stopDrillSpinLocal(p35) -- Line: 334
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), default (copy)
    p35.isCheckingForDrillEnd = false;
    local MULTI_BREAK_TOOL_DRILL_STOP = GameSound.MULTI_BREAK_TOOL_DRILL_STOP;
    local v36 = {
        volumeMultiplier = 0.5,
        fadeOutTime = 0.1
    };
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    v36.parent = Character;
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    v36.position = Character2;
    SoundManager:playSound(MULTI_BREAK_TOOL_DRILL_STOP, v36);
    default.Client:Get("MultiBreakToolStopSpinningFromClient"):SendToServer();
    p35.currentSpinSpeedGoalPlayerMap[Players.LocalPlayer] = 0;
end;

function u4.onEnable(u37, p38) -- Line: 363
    -- upvalues: ViewmodelController (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    task.spawn(function() -- Line: 365
        -- upvalues: ViewmodelController (ref), u37 (copy), Players (ref)
        local v39 = ViewmodelController:getViewModel();

        if v39 ~= nil then
            v39 = v39:WaitForChild("multi_break_tool"):WaitForChild("Handle"):WaitForChild("Drill"):WaitForChild("Motor6D");
        end;

        u37.firstPersonDrillMotorPlayerMap[Players.LocalPlayer] = v39;
    end);
    local thirdPersonDrillMotorPlayerMap = u37.thirdPersonDrillMotorPlayerMap;
    local LocalPlayer = Players.LocalPlayer;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("multi_break_tool");

        if Character ~= nil then
            Character = Character:FindFirstChild("Handle");

            if Character ~= nil then
                Character = Character:FindFirstChild("Drill");

                if Character ~= nil then
                    Character = Character:FindFirstChild("Motor6D");
                end;
            end;
        end;
    end;

    thirdPersonDrillMotorPlayerMap[LocalPlayer] = Character;
    u37:setupYield(function() -- Line: 393
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u40 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_IDLE, {
            looped = true
        });

        return function() -- Line: 397
            -- upvalues: u40 (copy)
            local v41 = u40;

            if v41 ~= nil then
                v41:Stop();
            end;
        end;
    end);
end;

function u4.onDisable(p42) -- Line: 420
    p42.localMaid:DoCleaning();
end;

function u4.isRelevantItem(p43, p44) -- Line: 423
    -- upvalues: ItemType (copy)
    return p44.itemType == ItemType.MULTI_BREAK_TOOL;
end;

KnitClient.CreateController(u4.new());

return nil;