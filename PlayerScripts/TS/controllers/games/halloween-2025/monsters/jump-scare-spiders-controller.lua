-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Tween = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "JumpScareSpidersController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p5.Name = "JumpScareSpidersController";
    p5.effectMap = {};
end;

function u3.KnitStart(p6) -- Line: 39
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p6);
end;

function u3.onGameInit(u7) -- Line: 42
    -- upvalues: default (copy)
    default.Client:Get("JumpSpiderEffect"):Connect(function(p8) -- Line: 43
        -- upvalues: u7 (copy)
        print(p8.serverModel);
        u7:createEffect(p8.spawnPosition, p8.victim, p8.serverModel);
    end);
end;

function u3.createEffect(p9, p10, u11, u12) -- Line: 49
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), Tween (copy), Linear (copy), EntityUtil (copy), RunService (copy)
    local u13 = ReplicatedStorage.Assets.Misc.Spider:Clone();

    for _, descendant in u13:GetDescendants() do
        if descendant:IsA("Part") then
            descendant.CollisionGroup = "Monster";
            descendant.CanCollide = false;
            CollectionService:AddTag(descendant, "CanNoclip");
        end;
    end;

    local Character = u11.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    local u14 = Character;

    if not u14 then
        return nil;
    end;

    u13.PrimaryPart.Anchored = true;
    u13:PivotTo(CFrame.new(p10.Position, u14.Position));
    u13.Parent = u12;
    AnimationUtil:playAnimation(u13, GameAnimationUtil:getAssetId(AnimationType.SPIDER_ATTACK));
    SoundManager:playSound(GameSound.SPIDER_ATTACK_1, {
        position = u14.Position
    });
    local v15 = u14.LookVector * 0.5;
    local v16 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0);
    local u17 = (u14 + v15 + Vector3.new(0, 1, 0)) * v16;
    Tween(0.5, Linear, function(p18) -- Line: 81
        -- upvalues: u13 (copy)
        u13:PivotTo(p18);
    end, u13.PrimaryPart.CFrame, u17):Play();
    task.delay(0.5, function() -- Line: 84
        -- upvalues: EntityUtil (ref), u12 (copy), u11 (copy), RunService (ref), u14 (ref), u13 (copy), u17 (ref)
        local u19 = EntityUtil:getEntity(u12);
        local u20 = EntityUtil:getEntity(u11);

        if not (u19 and u20) then
            return nil;
        end;

        local u21 = nil;
        u21 = RunService.Heartbeat:Connect(function(p22) -- Line: 91
            -- upvalues: u11 (ref), u14 (ref), u19 (copy), u20 (copy), u13 (ref), u21 (ref), u17 (ref)
            local Character2 = u11.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.CFrame;
                end;
            end;

            u14 = Character2;

            if u19:isDead() or (u20:isDead() or not u14) then
                u13.PrimaryPart.Anchored = false;
                u21:Disconnect();

                return nil;
            end;

            local v23 = u14.LookVector * 0.5;
            local v24 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0);
            u17 = (u14 + v23 + Vector3.new(0, 1, 0)) * v24;
            u13:PivotTo(u17);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;