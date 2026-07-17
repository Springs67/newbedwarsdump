-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SetUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil;
local WatchCharacterAnimation = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BlacklistedAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "blacklisted-animation-util").BlacklistedAnimationUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "AnimationBlacklistController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "AnimationBlacklistController";
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: KnitController (copy), Players (copy), WatchCharacterAnimation (copy), SetUtil (copy), BlacklistedAnimationUtil (copy)
    KnitController.KnitStart(u4);

    local function _(p5) -- Line: 30
        return p5.Character;
    end;

    local v6 = 0;
    local v7 = {};

    for i, v in Players:GetPlayers() do
        local _ = i - 1;
        local Character = v.Character;

        if Character ~= nil then
            v6 = v6 + 1;
            v7[v6] = Character;
        end;
    end;

    for _, v in v7 do
        task.spawn(function() -- Line: 45
            -- upvalues: v (copy), u4 (copy)
            local Humanoid = v:WaitForChild("Humanoid", 10);

            if not Humanoid then
                return nil;
            end;

            local Animator = Humanoid:WaitForChild("Animator", 10);

            if not Animator then
                return nil;
            end;

            for _, v2 in Animator:GetPlayingAnimationTracks() do
                u4:validateAnimation(v2);
            end;
        end);
    end;

    WatchCharacterAnimation(SetUtil.values(BlacklistedAnimationUtil.ANIMATION_ID_BLACKLIST), function(p8, p9) -- Line: 59
        -- upvalues: u4 (copy)
        u4:validateAnimation(p9);
    end);
end;

function u1.validateAnimation(p10, p11) -- Line: 63
    -- upvalues: BlacklistedAnimationUtil (copy)
    local Animation = p11.Animation;

    if Animation ~= nil then
        Animation = Animation.AnimationId;
    end;

    if Animation == "" or not Animation then
        return nil;
    end;

    if BlacklistedAnimationUtil.ANIMATION_ID_BLACKLIST[Animation] == nil then
        return nil;
    end;

    p11:Stop();
end;

KnitClient.CreateController(u1.new());

return nil;