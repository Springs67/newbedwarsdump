-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = ConstantManager.registerConstants(script, {
    RotationSpeed = 15,
    ExplosionSoundMaxDistance = 150,
    RandomSizeOffset = 10,
    RandomPositionOffset = 2
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "SpiritController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 34
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "SpiritController";
    p8.spiritToMaid = {};
end;

function u6.KnitStart(u9) -- Line: 43
    -- upvalues: KnitController (copy), CollectionService (copy), u3 (copy), default2 (copy), RuntimeLib (copy), SoundManager (copy), u5 (copy), KnitClient2 (copy)
    KnitController.KnitStart(u9);
    CollectionService:GetInstanceAddedSignal("spirit"):Connect(function(u10) -- Line: 45
        -- upvalues: u3 (ref), u9 (copy)
        local v11 = u3.new();
        u9.spiritToMaid[u10] = v11;
        local u12 = u9:setupSpiritAnimationTracks(u10);
        u12.idle:Play();
        v11:GiveTask(u10:GetAttributeChangedSignal("State"):Connect(function() -- Line: 51
            -- upvalues: u10 (copy), u12 (copy), u9 (ref)
            local v13 = u10:GetAttribute("State");

            if v13 ~= 1 then
                if v13 == 2 then
                    u9:tweenOutSpirit(u10);
                end;

                return;
            end;

            u12.idle:Stop();
            u12.run:Play();
        end));
        v11:GiveTask(u12.idle);
        v11:GiveTask(u12.run);
    end);
    CollectionService:GetInstanceRemovedSignal("spirit"):Connect(function(p14) -- Line: 63
        -- upvalues: u9 (copy)
        local v15 = u9.spiritToMaid[p14];

        if v15 ~= nil then
            v15:DoCleaning();
        end;

        u9.spiritToMaid[p14] = nil;
    end);
    default2.Client:OnEvent("SpiritExplosion", RuntimeLib.async(function(p16) -- Line: 71
        -- upvalues: SoundManager (ref), u5 (ref), RuntimeLib (ref), KnitClient2 (ref)
        SoundManager:playSound(p16.explosionSound, {
            position = p16.position,
            rollOffMaxDistance = u5.ExplosionSoundMaxDistance
        });
        RuntimeLib.await(KnitClient2.Controllers.FancyExplosionController:createExplosion({
            position = p16.position,
            radius = p16.radius,
            randomSizeOffset = u5.RandomSizeOffset,
            randomPositionOffset = u5.RandomPositionOffset,
            rotationSpeed = u5.RotationSpeed
        }));
    end));
end;

function u6.setupSpiritAnimationTracks(p17, p18) -- Line: 85
    -- upvalues: u4 (copy), GameAnimationUtil (copy), AnimationType (copy)
    local AnimationController = Instance.new("AnimationController");
    AnimationController.Parent = p18;
    local Animator = Instance.new("Animator");
    Animator.Parent = AnimationController;

    return {
        idle = Animator:LoadAnimation(u4("Animation", {
            AnimationId = GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_FLOATING)
        })),
        run = Animator:LoadAnimation(u4("Animation", {
            AnimationId = GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_RUN)
        }))
    };
end;

u6.tweenOutSpirit = RuntimeLib.async(function(p19, u20) -- Line: 101
    -- upvalues: default (copy), InExpo (copy)
    default(0.2, InExpo, function(p21) -- Line: 103
        -- upvalues: u20 (copy)
        for _, child in u20:GetChildren() do
            if child:IsA("BasePart") then
                child.Transparency = p21;
            end;
        end;
    end, 0.9, 1):Wait();
end);
KnitClient.CreateController(u6.new());

return nil;