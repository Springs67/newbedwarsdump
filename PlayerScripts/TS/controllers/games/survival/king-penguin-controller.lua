-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EnemyHealthbar = RuntimeLib.import(script, script.Parent, "enemy-healthbar").EnemyHealthbar;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "KingPenguinController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 29
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "KingPenguinController";
end;

function u6.KnitStart(p9) -- Line: 37
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), MonsterType (copy), u2 (copy), u4 (copy), EnemyHealthbar (copy), Players (copy), ReplicatedStorage (copy), GameQueryUtil (copy), u3 (copy), SoundManager (copy), GameSound (copy), Workspace (copy)
    KnitController.KnitStart(p9);
    WatchCollectionTag("Monster", function(u10) -- Line: 39
        -- upvalues: MonsterType (ref), u2 (ref), u4 (ref), EnemyHealthbar (ref), Players (ref), ReplicatedStorage (ref), GameQueryUtil (ref), u3 (ref), SoundManager (ref), GameSound (ref), Workspace (ref)
        if u10:GetAttribute("MonsterType") == MonsterType.KING_PENGUIN and u10:IsA("Model") then
            local u11 = u2.new();
            local u12 = u4.mount(u4.createElement("BillboardGui", {
                ResetOnSpawn = false,
                ExtentsOffsetWorldSpace = Vector3.new(0, 18, 0),
                MaxDistance = 200,
                Adornee = u10.PrimaryPart,
                Size = UDim2.new(0, 200, 0, 100)
            }, { u4.createElement(EnemyHealthbar, {
                    health = 1000,
                    maxHealth = 1000
                }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
            u11:GiveTask(function() -- Line: 55
                -- upvalues: u4 (ref), u12 (copy)
                return u4.unmount(u12);
            end);
            u11:GiveTask(u10:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 58
                -- upvalues: u10 (copy), u4 (ref), u12 (copy), EnemyHealthbar (ref)
                local v13 = u10:GetAttribute("Health");
                local v14 = u10:GetAttribute("MaxHealth");
                u4.update(u12, u4.createElement("BillboardGui", {
                    ExtentsOffsetWorldSpace = Vector3.new(0, 18, 0),
                    MaxDistance = 200,
                    Adornee = u10.PrimaryPart,
                    Size = UDim2.new(0, 200, 0, 100)
                }, { u4.createElement(EnemyHealthbar, {
                        health = v13,
                        maxHealth = v14
                    }) }));
            end));
            u11:GiveTask(u10:GetAttributeChangedSignal("IsSummoning"):Connect(function() -- Line: 73
                -- upvalues: u10 (copy), ReplicatedStorage (ref), GameQueryUtil (ref), u3 (ref), SoundManager (ref), GameSound (ref)
                if u10:GetAttribute("IsSummoning") ~= true then
                    local EffectPart = u10:FindFirstChild("EffectPart");

                    if EffectPart and EffectPart:IsA("BasePart") then
                        EffectPart:Destroy();
                        SoundManager:playSound(GameSound.KING_PENGUIN_SUMMON, {
                            rollOffMaxDistance = 300,
                            position = u10:GetPrimaryPartCFrame().Position
                        });
                    end;

                    return;
                end;

                local v15 = ReplicatedStorage.Assets.Effects.KingPenguinCharge:Clone();
                v15.Anchored = false;
                v15.CanCollide = false;
                v15.CFrame = u10:GetPrimaryPartCFrame();
                GameQueryUtil:setQueryIgnored(v15, true);
                v15.Name = "EffectPart";
                v15.Parent = u10;
                u3("WeldConstraint", {
                    Part0 = v15,
                    Part1 = u10.PrimaryPart,
                    Parent = v15
                });
            end));
            u11:GiveTask(u10.AncestryChanged:Connect(function() -- Line: 99
                -- upvalues: u10 (copy), Workspace (ref), u11 (copy)
                if not u10:IsDescendantOf(Workspace) then
                    u11:DoCleaning();
                end;
            end));
        end;
    end);
end;

KnitClient.CreateController(u6.new());

return nil;