-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BattleRoyaleUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "battle-royale", "battle-royale-util").BattleRoyaleUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "BattleRoyaleChestController";
    end,

    __index = GameKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p3, { GameType.BATTLE_ROYALE });
    p3.Name = "BattleRoyaleChestController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p4);
end;

function u1.onGameInit(p5) -- Line: 30
    -- upvalues: WatchCollectionTag (copy), BattleRoyaleUtil (copy), ReplicatedStorage (copy)
    WatchCollectionTag("chest", function(u6) -- Line: 31
        -- upvalues: BattleRoyaleUtil (ref), ReplicatedStorage (ref)
        local Model = u6:WaitForChild("Model");
        local ChestFolderValue = u6:FindFirstChild("ChestFolderValue");
        local u7;

        if ChestFolderValue then
            u7 = ChestFolderValue.Value;
        else
            u7 = nil;
        end;

        if not u7 then
            return nil;
        end;

        local v8 = u7:GetAttribute("RarityTier");

        if not v8 then
            return nil;
        end;

        local v9 = BattleRoyaleUtil.RarityEffectColors[v8];

        if not v9 then
            return nil;
        end;

        local u10 = ReplicatedStorage.Assets.Effects.RareLootEffect:Clone();
        u10.Parent = u6;
        u10.CFrame = Model:GetPivot();
        u10.Attachment.ParticleEmitter.Color = ColorSequence.new(v9);
        u10.Attachment.Sparks.Color = ColorSequence.new(v9);
        local u11 = nil;
        u11 = u6:GetAttributeChangedSignal("ChestOpened"):Connect(function() -- Line: 55
            -- upvalues: u7 (ref), u11 (ref), u6 (copy), u10 (copy)
            if not u7 then
                u11:Disconnect();

                return nil;
            end;

            if u6:GetAttribute("ChestOpened") == true then
                u10:Destroy();
            end;
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;