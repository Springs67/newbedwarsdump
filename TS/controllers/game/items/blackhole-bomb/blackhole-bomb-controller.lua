-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v3.InExpo;
local OutQuad = v3.OutQuad;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out");
local scaleModel = v4.scaleModel;
local scalePart = v4.scalePart;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "BlackholeBombController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 35
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "BlackholeBombController";
end;

function u6.KnitStart(p9) -- Line: 43
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), GameSound (copy), ModelUtil (copy), OutQuad (copy), InExpo (copy), TweenService (copy), ReplicatedStorage (copy), scalePart (copy), Workspace (copy), EffectUtil (copy), ItemUtil (copy), scaleModel (copy), RandomUtil (copy), KnitClient2 (copy)
    KnitController.KnitStart(p9);
    default.Client:OnEvent("BlackholeBombEffect", function(u10) -- Line: 46
        -- upvalues: SoundManager (ref), GameSound (ref), ModelUtil (ref), OutQuad (ref), InExpo (ref), TweenService (ref)
        local v11 = u10.growTime + u10.implosionTime;
        local u12 = SoundManager:playSound(GameSound.BLACKHOLE_LOOP, {
            rollOffMaxDistance = 100,
            looped = true,
            position = u10.position
        });
        ModelUtil.tweenModelSize(u10.blackhole, u10.growTime, OutQuad, u10.growthGoal);
        task.delay(u10.growTime, function() -- Line: 57
            -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u10 (copy), ModelUtil (ref), InExpo (ref)
            local v13 = u12;

            if v13 ~= nil then
                v13:Stop();
            end;

            local v14 = u12;

            if v14 ~= nil then
                v14:Destroy();
            end;

            SoundManager:playSound(GameSound.BLACKHOLE_COLLAPSE, {
                rollOffMaxDistance = 100,
                position = u10.position
            });
            ModelUtil.tweenModelSize(u10.blackhole, u10.implosionTime, InExpo, 0);
        end);
        local v15 = 1;

        for _, descendant in u10.blackhole:GetDescendants() do
            local v16 = descendant:IsA("BasePart") and string.match(descendant.Name, "ring");

            if v16 ~= 0 and (v16 == v16 and (v16 ~= "" and v16)) then
                TweenService:Create(descendant, TweenInfo.new(v11, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    Orientation = Vector3.new(0, v15 * 1000, 0)
                }):Play();
                v15 = v15 + 1;
            end;
        end;
    end);
    default.Client:OnEvent("BlackholeBombExplode", function(p17) -- Line: 85
        -- upvalues: ReplicatedStorage (ref), scalePart (ref), Workspace (ref), EffectUtil (ref)
        local u18 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
        scalePart(u18, 3.5);
        u18.Parent = Workspace;
        EffectUtil:playEffects({ u18 }, nil);
        u18.CFrame = CFrame.new(p17.position);
        task.delay(2, function() -- Line: 91
            -- upvalues: u18 (copy)
            u18:Destroy();
        end);
    end);
    default.Client:OnEvent("BlackholeBombPull", function(u19) -- Line: 96
        -- upvalues: ReplicatedStorage (ref), ItemUtil (ref), scaleModel (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), KnitClient2 (ref)
        local v20 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(u19.blockType);
        local v21 = ItemUtil.cloneItemIntoModel(v20);
        scaleModel(v21, 2);
        SoundManager:playSound(RandomUtil.fromList(unpack({
            GameSound.BLACKHOLE_BLOCKPULL_1,
            GameSound.BLACKHOLE_BLOCKPULL_2,
            GameSound.BLACKHOLE_BLOCKPULL_3,
            GameSound.BLACKHOLE_BLOCKPULL_4
        })), {
            volumeMultiplier = 0.5,
            rollOffMaxDistance = 100,
            position = u19.startPosition
        });
        KnitClient2.Controllers.ReceiveItemEffectController:playEffect(v21, u19.startPosition, function() -- Line: 105
            -- upvalues: u19 (copy)
            return CFrame.new(u19.endPosition);
        end, 1);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;