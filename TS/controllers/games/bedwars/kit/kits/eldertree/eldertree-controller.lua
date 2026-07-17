-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v4.InteractionCategory;
local InteractionPriority = v4.InteractionPriority;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = {
    BedwarsKitSkin.BIGMAN_VICTORIOUS_GOLD,
    BedwarsKitSkin.BIGMAN_VICTORIOUS_PLATINUM,
    BedwarsKitSkin.BIGMAN_VICTORIOUS_DIAMOND,
    BedwarsKitSkin.BIGMAN_VICTORIOUS_EMERALD,
    BedwarsKitSkin.BIGMAN_VICTORIOUS_NIGHTMARE
};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "EldertreeController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p8, BedwarsKit.BIGMAN);
    p8.Name = "EldertreeController";
    p8.orbSet = {};
end;

function u6.onKitLocalActivated(p9, p10) -- Line: 53
    -- upvalues: WatchPlayerCharacter (copy), Players (copy), KnitClient (copy), BedwarsKitSkin (copy), CollectionService (copy)
    p10:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p11, p12) -- Line: 55
        -- upvalues: KnitClient (ref), BedwarsKitSkin (ref), CollectionService (ref)
        if KnitClient.Controllers.KitController:getKitSkin(p11) == BedwarsKitSkin.BIGMAN_SPIRIT and p11 ~= nil then
            local function _(p13) -- Line: 60
                -- upvalues: CollectionService (ref)
                if p13:IsA("ParticleEmitter") then
                    CollectionService:AddTag(p13, "FirstPersonHidden");
                end;
            end;

            for i, descendant in p11:WaitForChild("mesh/uppertorso_particle"):GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    CollectionService:AddTag(descendant, "FirstPersonHidden");
                end;
            end;
        end;
    end));
end;

function u6.onKitLocalDeactivated(p14) -- Line: 72
end;

function u6.onKitReplicationActivated(u15, u16) -- Line: 74
    -- upvalues: default2 (copy), ReplicatedStorage (copy), StringUtil (copy), GameQueryUtil (copy), Workspace (copy), CollectionService (copy), u2 (copy), Players (copy), RuntimeLib (copy), WatchCollectionTag (copy), ClientSyncEvents (copy), TweenService (copy), GameSound (copy), KnitClient (copy), BedwarsKitSkin (copy), u5 (copy), SoundManager (copy)
    default2.Client:OnEvent("TreeOrbSpawn", function(u17) -- Line: 75
        -- upvalues: ReplicatedStorage (ref), StringUtil (ref), GameQueryUtil (ref), u15 (copy), Workspace (ref), CollectionService (ref), u2 (ref), Players (ref), default2 (ref), RuntimeLib (ref)
        local v18 = string.split(u17.skin, "_")[#string.split(u17.skin, "_") - 1 + 1];
        local v19 = ReplicatedStorage.Assets.Misc:FindFirstChild(StringUtil.capitalizeFirstLetter(v18) .. "TreeOrb");
        local v20 = not v19 and "TreeOrb" or v19.Name;
        local u21 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v20):Clone();
        u21:PivotTo(CFrame.new(u17.position));
        u21:SetAttribute("TreeOrbSecret", u17.treeOrbSecret);

        for _, descendant in u21:GetDescendants() do
            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        u15.orbSet[u21] = true;
        u21.Parent = Workspace;
        CollectionService:AddTag(u21, "treeOrb");
        local u22 = u2.new();
        local u23 = u21:GetAttribute("TreeOrbSecret");
        u22:GiveTask(function() -- Line: 97
            -- upvalues: u15 (ref), u21 (copy)
            u15.orbSet[u21] = nil;
        end);
        u22:GiveTask(task.spawn(function() -- Line: 100
            -- upvalues: Players (ref), u17 (copy), default2 (ref), u23 (copy), u22 (copy), u15 (ref), u21 (copy)
            while true do
                local v24 = task.wait(0.2);

                if v24 == 0 or (v24 ~= v24 or not v24) then
                    break;
                end;

                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                if Character and ((Character - u17.position).Magnitude < 10 and default2.Client:Get("ConsumeTreeOrb"):CallServer({
                    treeOrbSecret = u23
                })) then
                    u22:DoCleaning();
                    u15:collectEffect(u21);
                end;
            end;
        end));
        RuntimeLib.Promise.delay(150):andThen(function() -- Line: 130
            -- upvalues: u21 (copy), u22 (copy)
            u21:Destroy();
            u22:DoCleaning();
        end);
    end):andThen(function(p25) -- Line: 135
        -- upvalues: u16 (copy)
        u16:GiveTask(p25);
    end);
    u16:GiveTask(WatchCollectionTag("treeOrb", function(u26) -- Line: 138
        -- upvalues: u2 (ref), RuntimeLib (ref), ClientSyncEvents (ref), u15 (copy), TweenService (ref), GameSound (ref), Players (ref), KnitClient (ref), BedwarsKitSkin (ref), u5 (ref), SoundManager (ref)
        local u27 = u2.new();
        RuntimeLib.Promise.defer(function() -- Line: 140
            -- upvalues: u26 (copy), u27 (copy), ClientSyncEvents (ref), u15 (ref), TweenService (ref)
            local CFrameValue = Instance.new("CFrameValue");
            CFrameValue.Value = u26:GetPivot();
            CFrameValue.Changed:Connect(function(p28) -- Line: 143
                -- upvalues: u26 (ref)
                if u26.PrimaryPart then
                    u26:PivotTo(p28);
                end;
            end);
            local u29 = nil;
            local u30 = nil;
            u27:GiveTask(ClientSyncEvents.ElderTreeCollect:connect(function(p31) -- Line: 150
                -- upvalues: u26 (ref), u15 (ref), u29 (ref), u30 (ref)
                if p31.orb == u26 then
                    u15.orbSet[u26] = nil;
                    local v32 = u29;

                    if v32 ~= nil then
                        v32:Cancel();
                    end;

                    local v33 = u29;

                    if v33 ~= nil then
                        v33:Destroy();
                    end;

                    local v34 = u30;

                    if v34 ~= nil then
                        v34:Cancel();
                    end;

                    local v35 = u30;

                    if v35 ~= nil then
                        v35:Destroy();
                    end;
                end;
            end));

            while true do
                if not (u26.PrimaryPart and u15.orbSet[u26] ~= nil) or u15.orbSet[u26] == nil then
                    break;
                end;

                u29 = TweenService:Create(CFrameValue, TweenInfo.new(2), {
                    Value = CFrameValue.Value + Vector3.new(0, 2, 0)
                });
                u29:Play();
                u29.Completed:Wait();

                if u15.orbSet[u26] == nil then
                    break;
                end;

                u30 = TweenService:Create(CFrameValue, TweenInfo.new(2), {
                    Value = CFrameValue.Value + Vector3.new(0, -2, 0)
                });
                u30:Play();
                u30.Completed:Wait();
            end;
        end);
        local TREE_ORB_AMBIENT = GameSound.TREE_ORB_AMBIENT;
        local Character = Players.LocalPlayer.Character;
        local v36 = nil;
        local v37 = 0.4;

        if Character then
            local v38 = KnitClient.Controllers.KitController:getKitSkin(Character);

            if v38 == BedwarsKitSkin.BIGMAN_CHRISTMAS then
                TREE_ORB_AMBIENT = GameSound.CHRISTMAS_MUSIC;
            elseif v38 == BedwarsKitSkin.BIGMAN_REEF then
                TREE_ORB_AMBIENT = GameSound.ELDERREEF_AMBIENT;
            elseif table.find(u5, v38) ~= nil then
                TREE_ORB_AMBIENT = GameSound.LUCKY_BOX_SHIMMER;
                v37 = 0.6;
                v36 = 0.5;
            end;
        end;

        if TREE_ORB_AMBIENT ~= "" then
            local u39 = SoundManager:playSound(TREE_ORB_AMBIENT, {
                rollOffMaxDistance = 25,
                looped = true,
                position = u26:GetPivot().Position,
                volumeMultiplier = v37,
                playbackSpeedMultiplier = v36
            });
            u27:GiveTask(function() -- Line: 241
                -- upvalues: u39 (copy)
                local v40 = u39;

                if v40 ~= nil then
                    v40:Stop();
                end;

                local v41 = u39;

                if v41 ~= nil then
                    v41:Destroy();
                end;
            end);
        end;

        u27:GiveTask(u26.AncestryChanged:Connect(function(p42, p43) -- Line: 252
            -- upvalues: u27 (copy)
            if p43 == nil then
                u27:DoCleaning();
            end;
        end));
    end));
end;

function u6.onKitReplicationDeactivated(p44) -- Line: 259
end;

function u6.onInnateAbilityEnabled(p45, p46, p47) -- Line: 261
end;

function u6.onAbilityUsed(p48, p49, p50) -- Line: 263
end;

function u6.createTreeOrbInteraction(p51) -- Line: 265
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), BedwarsKitSkin (copy), RandomUtil (copy), SoundManager (copy), default2 (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Consume",
        interactionObjectText = "Tree Orb",
        interactionTag = "treeOrb",
        holdDuration = 0.3,
        removePromptOnInteract = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p52, p53, p54) -- Line: 275, Name: onInteracted
            -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), GameSound (ref), BedwarsKitSkin (ref), RandomUtil (ref), SoundManager (ref), default2 (ref)
            if p52 ~= Players.LocalPlayer then
                return nil;
            end;

            GameAnimationUtil:playAnimation(p52, AnimationType.PUNCH);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
            local CROP_HARVEST = GameSound.CROP_HARVEST;
            local Character = p52.Character;

            if Character then
                local v55 = KnitClient.Controllers.KitController:getKitSkin(Character);

                if v55 == BedwarsKitSkin.BIGMAN_CHRISTMAS then
                    CROP_HARVEST = RandomUtil.randomArraySelectN({
                        GameSound.CHRISTMAS_ELDERTREE_PICKUP,
                        GameSound.CHRISTMAS_ELDERTREE_PICKUP_2,
                        GameSound.CHRISTMAS_ELDERTREE_PICKUP_3,
                        GameSound.CHRISTMAS_ELDERTREE_PICKUP_4,
                        GameSound.CHRISTMAS_ELDERTREE_PICKUP_5
                    }, 1)[1];
                elseif v55 == BedwarsKitSkin.BIGMAN_WITHERED then
                    CROP_HARVEST = GameSound.WITHERED_ELDERTREE_PICKUP;
                elseif v55 == BedwarsKitSkin.BIGMAN_REEF then
                    CROP_HARVEST = GameSound.ELDERREEF_PICKUP;
                elseif v55 == BedwarsKitSkin.BIGMAN_VICTORIOUS_GOLD then
                    CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_GOLD_PICKUP;
                elseif v55 == BedwarsKitSkin.BIGMAN_VICTORIOUS_PLATINUM then
                    CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_PLATINUM_PICKUP;
                elseif v55 == BedwarsKitSkin.BIGMAN_VICTORIOUS_DIAMOND then
                    CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_DIAMOND_PICKUP;
                elseif v55 == BedwarsKitSkin.BIGMAN_VICTORIOUS_EMERALD then
                    CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_EMERALD_PICKUP;
                elseif v55 == BedwarsKitSkin.BIGMAN_VICTORIOUS_NIGHTMARE then
                    CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_NIGHTMARE_PICKUP;
                end;
            end;

            SoundManager:playSound(CROP_HARVEST);
            local v56 = p53:GetAttribute("TreeOrbSecret");

            if default2.Client:Get("ConsumeTreeOrb"):CallServer({
                treeOrbSecret = v56
            }) then
                p53:Destroy();
            end;
        end
    });
end;

function u6.collectEffect(p57, u58) -- Line: 316
    -- upvalues: Players (copy), ClientSyncEvents (copy), GameSound (copy), KnitClient (copy), BedwarsKitSkin (copy), RandomUtil (copy), SoundManager (copy), default (copy), InQuad (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    ClientSyncEvents.ElderTreeCollect:fire(u58);
    local Character2 = Players.LocalPlayer.Character;
    local CROP_HARVEST = GameSound.CROP_HARVEST;

    if Character2 then
        local v59 = KnitClient.Controllers.KitController:getKitSkin(Character2);

        if v59 == BedwarsKitSkin.BIGMAN_CHRISTMAS then
            CROP_HARVEST = RandomUtil.randomArraySelectN({
                GameSound.CHRISTMAS_ELDERTREE_PICKUP,
                GameSound.CHRISTMAS_ELDERTREE_PICKUP_2,
                GameSound.CHRISTMAS_ELDERTREE_PICKUP_3,
                GameSound.CHRISTMAS_ELDERTREE_PICKUP_4,
                GameSound.CHRISTMAS_ELDERTREE_PICKUP_5
            }, 1)[1];
        elseif v59 == BedwarsKitSkin.BIGMAN_WITHERED then
            CROP_HARVEST = GameSound.WITHERED_ELDERTREE_PICKUP;
        elseif v59 == BedwarsKitSkin.BIGMAN_REEF then
            CROP_HARVEST = GameSound.ELDERREEF_PICKUP;
        elseif v59 == BedwarsKitSkin.BIGMAN_VICTORIOUS_GOLD then
            CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_GOLD_PICKUP;
        elseif v59 == BedwarsKitSkin.BIGMAN_VICTORIOUS_PLATINUM then
            CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_PLATINUM_PICKUP;
        elseif v59 == BedwarsKitSkin.BIGMAN_VICTORIOUS_DIAMOND then
            CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_DIAMOND_PICKUP;
        elseif v59 == BedwarsKitSkin.BIGMAN_VICTORIOUS_EMERALD then
            CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_EMERALD_PICKUP;
        elseif v59 == BedwarsKitSkin.BIGMAN_VICTORIOUS_NIGHTMARE then
            CROP_HARVEST = GameSound.ELDERTREE_VICTORIOUS_NIGHTMARE_PICKUP;
        end;
    end;

    SoundManager:playSound(CROP_HARVEST);
    default(0.25, InQuad, function(p60) -- Line: 353
        -- upvalues: u58 (copy)
        u58:PivotTo(p60);
    end, u58.PrimaryPart.CFrame, CFrame.new(Character)):Play();
    task.delay(0.25, function() -- Line: 356
        -- upvalues: u58 (copy)
        u58:Destroy();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;