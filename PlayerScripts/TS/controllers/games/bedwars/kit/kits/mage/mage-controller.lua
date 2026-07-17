-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v5.InteractionCategory;
local InteractionPriority = v5.InteractionPriority;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ManaAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ManaAttr;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util");
local MAGE_ELEMENT_CYCLE_INDEX = v6.MAGE_ELEMENT_CYCLE_INDEX;
local MageKitUtil = v6.MageKitUtil;
local MAGE_SPELL_MANA_COST = v6.MAGE_SPELL_MANA_COST;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local MageManaBar = RuntimeLib.import(script, script.Parent, "ui", "mage-mana-bar").MageManaBar;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "MageController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 49
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 53
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), ReplicatedStorage (copy)
    BaseKitController.constructor(p9, BedwarsKit.MAGE, {
        instances = { ReplicatedStorage.Assets.Effects.TomeGuidingBeam }
    });
    p9.Name = "MageController";
end;

function u7.onKitReplicationActivated(p10, p11) -- Line: 59
    -- upvalues: WatchCharacter (copy), KnitClient (copy), BedwarsKit (copy), RuntimeLib (copy), MAGE_ELEMENT_CYCLE_INDEX (copy), BalanceFile (copy), MageKitUtil (copy), ClientSyncEvents (copy), SyncEventPriority (copy), GetAttribute (copy), Players (copy), ManaAttr (copy), MAGE_SPELL_MANA_COST (copy)
    p11:GiveTask(WatchCharacter(function(u12, u13) -- Line: 60
        -- upvalues: KnitClient (ref), BedwarsKit (ref), RuntimeLib (ref), MAGE_ELEMENT_CYCLE_INDEX (ref), BalanceFile (ref), MageKitUtil (ref)
        if KnitClient.Controllers.KitController:isUsingKit(u12, BedwarsKit.MAGE) then
            RuntimeLib.Promise.defer(function() -- Line: 62
                -- upvalues: u12 (copy), MAGE_ELEMENT_CYCLE_INDEX (ref), BalanceFile (ref), MageKitUtil (ref), u13 (copy)
                local v14 = u12:GetAttribute(MAGE_ELEMENT_CYCLE_INDEX);
                local v15 = BalanceFile.MAGE_ELEMENT_CYCLE[(v14 == nil and 0 or v14) + 1];
                local v16 = not MageKitUtil.hasUnlockedMageElement(u12, v15) and "BASE" or v15;
                MageKitUtil.changeMageKitAppearance(u12, u13, v16);
            end);
        end;
    end));
    p11:GiveTask(WatchCharacter(function(u17, u18) -- Line: 74
        -- upvalues: KnitClient (ref), BedwarsKit (ref), MAGE_ELEMENT_CYCLE_INDEX (ref), BalanceFile (ref), MageKitUtil (ref)
        if KnitClient.Controllers.KitController:isUsingKit(u17, BedwarsKit.MAGE) then
            u17:GetAttributeChangedSignal(MAGE_ELEMENT_CYCLE_INDEX):Connect(function() -- Line: 77
                -- upvalues: u17 (copy), MAGE_ELEMENT_CYCLE_INDEX (ref), BalanceFile (ref), MageKitUtil (ref), u18 (copy)
                local v19 = u17:GetAttribute(MAGE_ELEMENT_CYCLE_INDEX);
                local v20 = BalanceFile.MAGE_ELEMENT_CYCLE[v19 + 1];
                local v21 = not MageKitUtil.hasUnlockedMageElement(u17, v20) and "BASE" or v20;
                MageKitUtil.changeMageKitAppearance(u17, u18, v21);
            end);
        end;
    end));
    p11:GiveTask(ClientSyncEvents.StartLaunchProjectile:setPriority(SyncEventPriority.HIGH):connect(function(p22) -- Line: 85
        -- upvalues: GetAttribute (ref), Players (ref), ManaAttr (ref), MAGE_SPELL_MANA_COST (ref)
        local v23 = (p22.projectileType == "mage_spell_base" or (p22.projectileType == "mage_spell_nature" or p22.projectileType == "mage_spell_fire")) and true or p22.projectileType == "mage_spell_ice";

        if v23 then
            local v24 = GetAttribute(Players.LocalPlayer, ManaAttr);
            v23 = (v24 == nil and 0 or v24) < MAGE_SPELL_MANA_COST;
        end;

        if v23 then
            p22:setCancelled(true);
        end;
    end));
end;

function u7.onKitReplicationDeactivated(p25) -- Line: 99
end;

function u7.onKitLocalActivated(u26, p27) -- Line: 101
    -- upvalues: WatchPlayerCharacter (copy), Players (copy), MAGE_ELEMENT_CYCLE_INDEX (copy), BalanceFile (copy), MageKitUtil (copy), CollectionService (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), WatchCollectionTag (copy), u2 (copy), RunService (copy), Flamework (copy), u3 (copy), MageManaBar (copy)
    u26:registerTomeInteraction();
    p27:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p28) -- Line: 103
        -- upvalues: Players (ref), MAGE_ELEMENT_CYCLE_INDEX (ref), BalanceFile (ref), MageKitUtil (ref)
        local v29 = Players.LocalPlayer:GetAttribute(MAGE_ELEMENT_CYCLE_INDEX);
        local v30 = BalanceFile.MAGE_ELEMENT_CYCLE[(v29 == nil and 0 or v29) + 1];
        local v31 = not MageKitUtil.hasUnlockedMageElement(Players.LocalPlayer, v30) and "BASE" or v30;
        MageKitUtil.changeMageKitAppearance(Players.LocalPlayer, p28, v31);
    end));
    p27:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p32) -- Line: 113
        -- upvalues: CollectionService (ref), u26 (copy)
        for _, v in CollectionService:GetTagged("ElementTome") do
            u26:enableTomeGuidingBeam(v, p32);
        end;
    end));
    default.Client:OnEvent("SpawnElementTome", function(p33) -- Line: 118
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), CollectionService (ref)
        local v34 = ReplicatedStorage.Assets.Misc.ElementTome:Clone();
        v34.Parent = Workspace;
        v34:SetAttribute("TomeSecret", p33.secret);
        v34:PivotTo(CFrame.new(p33.position));
        SoundManager:playSound(GameSound.AERY_BUTTERFLY_SPAWN, {
            position = nil
        });
        CollectionService:AddTag(v34, "ElementTome");
    end);
    p27:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(MAGE_ELEMENT_CYCLE_INDEX):Connect(function() -- Line: 129
        -- upvalues: Players (ref), MAGE_ELEMENT_CYCLE_INDEX (ref), BalanceFile (ref), MageKitUtil (ref)
        local v35 = Players.LocalPlayer:GetAttribute(MAGE_ELEMENT_CYCLE_INDEX);
        local v36 = BalanceFile.MAGE_ELEMENT_CYCLE[v35 + 1];

        if not Players.LocalPlayer.Character then
            return nil;
        end;

        local v37 = not MageKitUtil.hasUnlockedMageElement(Players.LocalPlayer, v36) and "BASE" or v36;
        MageKitUtil.changeMageKitAppearance(Players.LocalPlayer, Players.LocalPlayer.Character, v37);
    end));
    p27:GiveTask(WatchCollectionTag("ElementTome", function(u38) -- Line: 138
        -- upvalues: u2 (ref), Players (ref), u26 (copy), RunService (ref)
        local u39 = u2.new();
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        u26:enableTomeGuidingBeam(u38, Character);
        local Position = u38:GetPivot().Position;
        local u40 = 0;
        u39:GiveTask(RunService.Heartbeat:Connect(function(p41) -- Line: 148
            -- upvalues: u38 (copy), u39 (copy), u40 (ref), Position (copy)
            if u38.Parent == nil then
                u39:DoCleaning();

                return nil;
            end;

            if u38.PrimaryPart == nil then
                u39:DoCleaning();

                return nil;
            end;

            u40 = u40 + p41;
            local v42 = math.sin(u40);
            local v43 = Vector3.new(0, v42, 0);
            u38:PivotTo((CFrame.new(Position + v43)));
        end));
        u39:GiveTask(u38.AncestryChanged:Connect(function(p44, p45) -- Line: 165
            -- upvalues: u39 (copy)
            if p45 == nil then
                u39:DoCleaning();
            end;
        end));
    end));
    p27:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createFragment({
        MageManaBar = u3.createElement(MageManaBar)
    })));
end;

function u7.onKitLocalDeactivated(p46) -- Line: 175
end;

function u7.playLearnTomeEffect(p47, u48, u49, u50) -- Line: 177
    -- upvalues: TweenService (copy), MageKitUtil (copy)
    task.spawn(function() -- Line: 178
        -- upvalues: u48 (copy), u49 (copy), TweenService (ref), MageKitUtil (ref), u50 (copy)
        if u48.Parent ~= nil then
            if not u48.Character then
                return nil;
            end;

            local u51 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            task.spawn(function() -- Line: 184
                -- upvalues: u49 (ref), TweenService (ref), u51 (copy), MageKitUtil (ref), u50 (ref)
                local TomeText = u49:WaitForChild("Tome"):WaitForChild("TomeText");
                local Highlight = TomeText:FindFirstChild("Highlight");
                TweenService:Create(TomeText, u51, {
                    Color = MageKitUtil.MageElementMeta[u50].color
                }):Play();
                TweenService:Create(Highlight, u51, {
                    OutlineColor = MageKitUtil.MageElementMeta[u50].color
                }):Play();
            end);
        end;
    end);
end;

function u7.fadeOutTome(p52, u53) -- Line: 197
    -- upvalues: TweenService (copy)
    task.spawn(function() -- Line: 198
        -- upvalues: u53 (copy), TweenService (ref)
        local u54 = TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);

        for _, descendant in u53:GetDescendants() do
            task.spawn(function() -- Line: 201
                -- upvalues: descendant (copy), TweenService (ref), u54 (copy)
                if descendant:IsA("BasePart") then
                    TweenService:Create(descendant, u54, {
                        Transparency = 1
                    }):Play();
                end;
            end);
        end;

        task.wait(1);
        u53:Destroy();
    end);
end;

function u7.enableTomeGuidingBeam(p55, u56, u57) -- Line: 213
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy)
    task.spawn(function() -- Line: 214
        -- upvalues: u57 (copy), u56 (copy), ReplicatedStorage (ref), CollectionService (ref)
        local BodyFrontAttachment = u57:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
        local CenterAttachment = u56:WaitForChild("Tome"):WaitForChild("CenterAttachment");

        for _, child in ReplicatedStorage.Assets.Effects.TomeGuidingBeam:Clone():GetChildren() do
            if child:IsA("Beam") then
                child.Attachment0 = BodyFrontAttachment;
                child.Attachment1 = CenterAttachment;
                child.Parent = CenterAttachment;
                CollectionService:AddTag(child, "TomeGuidingBeam");
            end;
        end;
    end);
end;

function u7.destroyTomeGuidingBeam(p58) -- Line: 228
    -- upvalues: CollectionService (copy)
    local function _(p59) -- Line: 230
        p59:Destroy();
    end;

    for i, v in CollectionService:GetTagged("TomeGuidingBeam") do
        local _ = i - 1;
        v:Destroy();
    end;
end;

function u7.registerTomeInteraction(u60) -- Line: 237
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), MageKitUtil (copy), SoundManager (copy), BalanceFile (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Learn New Element",
        interactionObjectText = "Tome of the Elements",
        interactionTag = "ElementTome",
        holdDuration = 0.3,
        maxActivationDistance = 10,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(u61, u62, p63) -- Line: 247, Name: onInteracted
            -- upvalues: u60 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), default (ref), MageKitUtil (ref), SoundManager (ref), BalanceFile (ref)
            u60:destroyTomeGuidingBeam();
            GameAnimationUtil:playAnimation(u61, AnimationType.PUNCH);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
            local v64 = u62:GetAttribute("TomeSecret");
            local u65 = default.Client:Get("LearnElementTome"):CallServer({
                secret = v64
            });

            if u65.success and u65.element then
                p63:Destroy();
                u60:playLearnTomeEffect(u61, u62, u65.element);
                local learnSound = MageKitUtil.MageElementMeta[u65.element].learnSound;

                if learnSound ~= "" and learnSound then
                    SoundManager:playSound(learnSound);
                end;

                task.delay(BalanceFile.LEARN_TOME_DURATION, function() -- Line: 265
                    -- upvalues: u60 (ref), u62 (copy), u61 (copy), u65 (copy), MageKitUtil (ref)
                    u60:fadeOutTome(u62);

                    if u61.Parent and (u61.Character and u65.element) then
                        MageKitUtil.changeMageKitAppearance(u61, u61.Character, u65.element);
                    end;
                end);
            end;
        end
    });
end;

function u7.onInnateAbilityEnabled(p66, p67, p68) -- Line: 277
end;

function u7.onAbilityUsed(p69, p70, p71) -- Line: 279
end;

KnitClient.CreateController(u7.new());

return nil;