-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local v3 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v3.InteractionCategory;
local InteractionPriority = v3.InteractionPriority;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "StarCollectorController";
    end,

    __index = CollectableEntityController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p6);
    p6.Name = "StarCollectorController";
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p7);
end;

function u4.validCollectableEntityTypes(p8) -- Line: 40
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.STARS };
end;

function u4.pickDisplayModel(p9, p10, p11) -- Line: 43
    -- upvalues: ReplicatedStorage (copy), InteractionCategory (copy), InteractionPriority (copy)
    local v12 = p9:getRandomStar();

    return {
        repStorageModel = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v12),
        collectionTag = p10,
        proximityPrompt = {
            interactionLabel = "Collect",

            interactionObjectText = function(p13) -- Line: 50, Name: interactionObjectText
                return string.gsub(p13.Name, "Star", "") .. " Star";
            end,

            category = InteractionCategory.ABILITY,
            priority = InteractionPriority.ABILITY
        }
    };
end;

function u4.onWillRemoveEntity(p14, p15, p16, p17, p18) -- Line: 60
end;

function u4.onCreatedEntity(p19, p20, p21, u22) -- Line: 62
    -- upvalues: SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), RuntimeLib (copy)
    u22:PivotTo(CFrame.new(u22:GetPrimaryPartCFrame().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * 3.141592653589793, 0));
    SoundManager:playSound(GameSound.STAR_IDLE, {
        looped = true,
        parent = u22.PrimaryPart,
        position = u22.PrimaryPart.Position
    });
    local u23 = u22:FindFirstChildWhichIsA("AnimationController");

    if u23 ~= nil then
        u23 = u23:WaitForChild("Animator");
    end;

    if u23 then
        GameAnimationUtil:playAnimation(u23, AnimationType.STAR_IDLE);
        task.spawn(function() -- Line: 80
            -- upvalues: RuntimeLib (ref), u22 (copy), GameAnimationUtil (ref), u23 (copy), AnimationType (ref)
            while RuntimeLib.Promise.delay(math.random(15, 25)):await() and u22.Parent do
                GameAnimationUtil:playAnimation(u23, AnimationType.STAR_RANDOM_SPIN);
            end;
        end);
    end;
end;

function u4.collectEntity(p24, p25, p26, p27) -- Line: 87
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), default (copy)
    if p25 == Players.LocalPlayer then
        SoundManager:playSound(GameSound.STAR_PICKUP);
        default.Client:Get("CollectCollectableEntity"):SendToServer({
            id = p26:GetAttribute("Id"),
            collectableName = p27
        });
    end;
end;

function u4.getRandomStar(p28) -- Line: 96
    -- upvalues: RandomUtil (copy)
    return RandomUtil.fromList(unpack({ "VitalityStar", "CritStar" }));
end;

KnitClient.CreateController(u4.new());

return nil;