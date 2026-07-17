-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "GhostController";
    end,

    __index = CollectableEntityController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 29
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p4, ...);
    p4.Name = "GhostController";
end;

function u2.KnitStart(p5) -- Line: 33
    -- upvalues: CollectableEntityController (copy), ClientSyncEvents (copy), GameAnimationUtil (copy), AnimationType (copy)
    CollectableEntityController.KnitStart(p5);
    ClientSyncEvents.ProjectileLaunched:connect(function(p6) -- Line: 35
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref)
        if p6.projectileType ~= "ghost" then
            return nil;
        end;

        p6.projectile:FindFirstChildOfClass("AnimationController"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GHOST_SPIN)):Play(0.05);
    end);
end;

function u2.validCollectableEntityTypes(p7) -- Line: 44
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.GHOST };
end;

function u2.pickDisplayModel(p8, p9, p10) -- Line: 47
    -- upvalues: ReplicatedStorage (copy)
    return {
        repStorageModel = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Ghost"),
        collectionTag = p9
    };
end;

function u2.onWillRemoveEntity(p11, p12, p13, u14, u15) -- Line: 53
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), default (copy), InQuad (copy), Players (copy)
    local u16 = u15:GetPivot();

    if u14 then
        local u17 = u15:FindFirstChildOfClass("AnimationController"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GHOST_SPIN));
        u17:Play(0.3, nil, 0.2);
        default(1.4, InQuad, function(p18) -- Line: 59
            -- upvalues: u14 (copy), u15 (copy), u16 (copy), u17 (copy)
            local v19 = u14;

            if v19 ~= nil then
                v19 = v19.Character;

                if v19 ~= nil then
                    v19 = v19:GetPivot();
                end;
            end;

            if not v19 then
                return nil;
            end;

            u15:PivotTo(u16:Lerp(v19 * CFrame.Angles(0, 3.141592653589793, 0), p18));
            u17:AdjustSpeed(0.2 + p18);
        end):Wait();
    end;

    if u14 == Players.LocalPlayer then
        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.VACUUM_GHOST_CAPTURED, {
            looped = false
        });
    end;

    return nil;
end;

function u2.onCreatedEntity(p20, p21, p22, u23) -- Line: 87
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), RuntimeLib (copy)
    u23:PivotTo(u23:GetPivot() + Vector3.new(0, 3, 0));
    local u24 = u23:FindFirstChildOfClass("AnimationController");

    if u24 ~= nil then
        u24:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GHOST_IDLE)):Play();
        task.spawn(function() -- Line: 96
            -- upvalues: RuntimeLib (ref), u23 (copy), u24 (copy), GameAnimationUtil (ref), AnimationType (ref)
            while RuntimeLib.Promise.delay(math.random(15, 25)):await() and u23.Parent do
                u24:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GHOST_FLIP)):Play();
            end;
        end);
    end;

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;