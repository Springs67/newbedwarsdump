-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "PickaxeSwordController";
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
    GameKnitController.constructor(p4, { GameType.HALLOWEEN_2024_EVENT, GameType.HALLOWEEN_2025_EVENT_PVE });
    p4.Name = "PickaxeSwordController";
    p4.nextReadyTime = -1;
end;

function u2.KnitStart(p5) -- Line: 36
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.onGameInit(u6) -- Line: 39
    -- upvalues: ClientSyncEvents (copy), ItemType (copy), Workspace (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), default (copy), CollectionService (copy)
    ClientSyncEvents.SwordSwing:connect(function(p7) -- Line: 40
        -- upvalues: ItemType (ref), u6 (copy), Workspace (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
        if p7.swordType == ItemType.IRON_PICKAXE_SWORD then
            if u6.nextReadyTime > Workspace:GetServerTimeNow() then
                return nil;
            end;

            u6.nextReadyTime = Workspace:GetServerTimeNow() + p7.attackSpeed - 0.05;
            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.MINING);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.MINING_FP);
            task.delay(0.3, function() -- Line: 48
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.GAUNTLETS_JAB_SWING_4);
            end);
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p8) -- Line: 53
        -- upvalues: CollectionService (ref), SoundManager (ref), GameSound (ref)
        if CollectionService:HasTag(p8.entityInstance, "Crystal") then
            SoundManager:playSound(GameSound.MINER_STONE_BREAK, {
                position = p8.cframe.Position
            });
            local RootPart = p8.entityInstance:WaitForChild("RootPart", 3);

            if RootPart ~= nil then
                local function _(p9) -- Line: 61
                    if p9:IsA("MeshPart") then
                        p9.Anchored = false;
                    end;
                end;

                for i, child in RootPart:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("MeshPart") then
                        child.Anchored = false;
                    end;
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;