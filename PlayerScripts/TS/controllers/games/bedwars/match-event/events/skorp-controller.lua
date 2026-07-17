-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SkorpController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SkorpController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("SkorpAttack"):Connect(function(p6) -- Line: 31
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local Humanoid = p6.spider:WaitForChild("Humanoid", 3);

        if Humanoid ~= nil then
            Humanoid = Humanoid:WaitForChild("Animator", 3);
        end;

        if not Humanoid then
            return nil;
        end;

        AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.SKORP_ATTACK));
    end);
    WatchCollectionTag("skorp", function(p7) -- Line: 42
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local Humanoid = p7:WaitForChild("Humanoid", 3);

        if Humanoid ~= nil then
            Humanoid = Humanoid:WaitForChild("Animator", 3);
        end;

        if not Humanoid then
            return nil;
        end;

        local v8 = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.SKORP_MOVE), {
            looped = true
        });
        print("LENGTH: " .. tostring(v8));
    end);
end;

KnitClient.CreateController(u2.new());

return nil;