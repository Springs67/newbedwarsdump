-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PIRATE_SHOVEL_IRON = BalanceFile.PIRATE_SHOVEL_IRON;
local PIRATE_SHOVEL_DIAMOND = BalanceFile.PIRATE_SHOVEL_DIAMOND;
local PIRATE_SHOVEL_EMERALD = BalanceFile.PIRATE_SHOVEL_EMERALD;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "PirateShovelController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "PirateShovelController";
end;

function u2.KnitStart(u5) -- Line: 37
    -- upvalues: KnitController (copy), default (copy), GameAnimationUtil (copy), AnimationType (copy), PIRATE_SHOVEL_IRON (copy), SoundManager (copy), GameSound (copy), PIRATE_SHOVEL_DIAMOND (copy), ReplicatedStorage (copy), Workspace (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("PirateDigTreasure"):Connect(function(u6) -- Line: 39
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), PIRATE_SHOVEL_IRON (ref), SoundManager (ref), GameSound (ref), u5 (copy), PIRATE_SHOVEL_DIAMOND (ref), ReplicatedStorage (ref), Workspace (ref)
        local Character = u6.player.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame().Position;
        end;

        if not Character then
            return nil;
        end;

        GameAnimationUtil:playAnimation(u6.player, AnimationType.SHOVEL_DIG);

        if u6.diceNumber < PIRATE_SHOVEL_IRON then
            SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG, {
                rollOffMaxDistance = 45,
                volumeMultiplier = 0.5,
                position = Character
            });

            return;
        end;

        local v7 = SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG_TREASURE_HIT, {
            rollOffMaxDistance = 45,
            volumeMultiplier = 0.5,
            position = Character
        });

        if u6.diceNumber < PIRATE_SHOVEL_IRON then
            return nil;
        end;

        u5:playEffect(Character, u6.player, u6.diceNumber);
        local v8 = v7:getInstance();

        if v8 ~= nil then
            v8.Ended:Once(function() -- Line: 67
                -- upvalues: u6 (copy), PIRATE_SHOVEL_DIAMOND (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), Character (copy)
                if PIRATE_SHOVEL_DIAMOND <= u6.diceNumber then
                    local u9 = ReplicatedStorage.Assets.Effects.PirateShovelEffect:Clone();
                    u9:PivotTo(CFrame.new(u6.treasurePosition));
                    u9.Parent = Workspace;
                    SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
                        rollOffMaxDistance = 45,
                        volumeMultiplier = 0.5,
                        position = Character
                    });
                    task.delay(1, function() -- Line: 77
                        -- upvalues: u9 (copy)
                        u9:Destroy();
                    end);
                end;
            end);
        end;
    end);
end;

function u2.playEffect(p10, p11, u12, p13) -- Line: 86
    -- upvalues: PIRATE_SHOVEL_IRON (copy), ItemType (copy), PIRATE_SHOVEL_DIAMOND (copy), PIRATE_SHOVEL_EMERALD (copy), KnitClient (copy), Players (copy)
    local v14 = {};

    if PIRATE_SHOVEL_IRON < p13 then
        table.insert(v14, {
            amount = 2,
            itemType = ItemType.IRON
        });
    end;

    if PIRATE_SHOVEL_DIAMOND < p13 then
        table.insert(v14, {
            amount = 1,
            itemType = ItemType.DIAMOND
        });
    end;

    if PIRATE_SHOVEL_EMERALD < p13 then
        table.insert(v14, {
            amount = 1,
            itemType = ItemType.EMERALD
        });
    end;

    local u15;

    if u12 == nil then
        u15 = u12;
    else
        u15 = u12.Character;
    end;

    KnitClient.Controllers.ReceiveItemEffectController:playEffectForItems(v14, p11, function() -- Line: 117
        -- upvalues: u12 (copy), u15 (copy)
        local Character = u12.Character;

        if Character ~= u15 then
            return nil;
        end;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.CFrame;
            end;
        end;

        return Character;
    end, u12 == Players.LocalPlayer and "PlayLocally" or "PlayGlobally");
end;

KnitClient.CreateController(u2.new());

return nil;