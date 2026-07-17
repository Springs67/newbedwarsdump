-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "base-kit-controller").BaseKitController;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v4.InteractionCategory;
local InteractionPriority = v4.InteractionPriority;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "HiddenMetalController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), ExpireList (copy)
    BaseKitController.constructor(p7, BedwarsKit.METAL_DETECTOR);
    p7.Name = "HiddenMetalController";
    p7.animationPlayingCooldowns = ExpireList.new(2);
end;

function u5.onKitLocalActivated(u8, p9) -- Line: 47
    -- upvalues: default (copy), CollectableEntityType (copy), CollectionService (copy), WatchCollectionTag (copy), KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    default.Client:OnEvent("CollectableEntitySpawn", function(p10) -- Line: 48
        -- upvalues: CollectableEntityType (ref), u8 (copy)
        if p10.entityType ~= CollectableEntityType.HIDDEN_METAL then
            return nil;
        end;

        u8:createLocalModel({
            id = p10.id,
            origin = p10.position
        });
    end);
    default.Client:OnEvent("CollectableEntityRemoved", function(u11) -- Line: 57
        -- upvalues: CollectionService (ref)
        local function _(p12) -- Line: 59
            -- upvalues: u11 (copy)
            return p12:GetAttribute("Id") == u11.id;
        end;

        local v13 = nil;

        for i, v in CollectionService:GetTagged("hidden-metal") do
            local _ = i - 1;

            if v:GetAttribute("Id") == u11.id == true then
                v13 = v;
                break;
            end;
        end;

        if v13 ~= nil then
            v13:Destroy();
        end;
    end);
    p9:GiveTask(WatchCollectionTag("hidden-metal", function(p14) -- Line: 78
        -- upvalues: CollectionService (ref)
        CollectionService:AddTag(p14, "hidden-metal-prompt");
    end));
    p9:GiveTask(KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Collect",
        interactionTag = "hidden-metal-prompt",
        holdDuration = 1,
        maxActivationDistance = 8,
        removePromptOnInteract = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p15, p16, p17) -- Line: 90, Name: onInteracted
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), default (ref)
            local v18 = p16:GetAttribute("Id");

            if v18 == nil then
                return nil;
            end;

            GameAnimationUtil:playAnimation(p15, AnimationType.SHOVEL_DIG);
            SoundManager:playSound(GameSound.SNAP_TRAP_CONSUME_MARK);
            default.Client:Get("CollectCollectableEntity"):SendToServer({
                id = v18
            });
        end
    }));
end;

function u5.onKitLocalDeactivated(p19) -- Line: 103
end;

function u5.onKitReplicationActivated(u20, p21) -- Line: 105
    -- upvalues: WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), ReplicatedStorage (copy), WeldUtil (copy)
    p21:GiveTask(WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.SHOVEL_DIG) }, function(p22, u23) -- Line: 106
        -- upvalues: u20 (copy), Players (ref), ReplicatedStorage (ref), WeldUtil (ref)
        local Character = p22.Character;

        if not Character then
            return nil;
        end;

        if u20.animationPlayingCooldowns:has(p22.UserId) and p22.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u20.animationPlayingCooldowns:add(p22.UserId);
        local u24 = ReplicatedStorage.Assets.Effects.Shovel:Clone();
        u24.Parent = Character;
        WeldUtil:weldCharacterAccessories(Character);
        local metal_detector = Character:FindFirstChild("metal_detector");

        if metal_detector then
            for _, child in metal_detector:GetChildren() do
                if child:IsA("BasePart") then
                    child.Transparency = 1;
                end;
            end;
        end;

        u23.Stopped:Connect(function() -- Line: 126
            -- upvalues: u24 (copy), u23 (copy)
            u24:Destroy();
            u23:Destroy();
        end);
        u23.Destroying:Connect(function() -- Line: 130
            -- upvalues: u24 (copy), metal_detector (copy)
            u24:Destroy();

            if metal_detector then
                for _, child in metal_detector:GetChildren() do
                    if child:IsA("BasePart") then
                        child.Transparency = 0;
                    end;
                end;
            end;
        end);
    end));
end;

function u5.onKitReplicationDeactivated(p25) -- Line: 142
end;

function u5.onInnateAbilityEnabled(p26, p27, p28) -- Line: 144
end;

function u5.onAbilityUsed(p29, p30, p31) -- Line: 146
end;

function u5.KnitStart(p32) -- Line: 148
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p32);
end;

function u5.createLocalModel(p33, p34) -- Line: 151
    -- upvalues: u2 (copy), Workspace (copy), GameQueryUtil (copy), CollectionService (copy)
    local v35 = u2("Model", {});
    v35.PrimaryPart = u2("Part", {
        Anchored = true,
        CanCollide = false,
        Transparency = 1,
        Parent = v35
    });
    v35.Parent = Workspace;
    v35:PivotTo(CFrame.new(p34.origin));
    v35:SetAttribute("Id", p34.id);

    for _, descendant in v35:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    CollectionService:AddTag(v35, "hidden-metal");

    return v35;
end;

KnitClient.CreateController(u5.new());

return nil;