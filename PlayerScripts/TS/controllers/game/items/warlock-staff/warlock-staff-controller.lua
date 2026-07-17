-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local WarlockBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").WarlockBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent, "target-selector", "target-selector-util");
local TargetSelector = v6.TargetSelector;
local TargetType = v6.TargetType;
local WarlockStaffDisplay = RuntimeLib.import(script, script.Parent, "ui", "warlock-staff-ui").WarlockStaffDisplay;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "WarlockStaffController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 46
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 50
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p9);
    p9.Name = "WarlockStaffController";
    p9.maid = u2.new();
    p9.animationMaid = u2.new();
    p9.linkMap = {};
    p9.soundMap = {};
    p9.settingUpStackTree = false;
    p9.energyStack = 0;
    p9.warning = false;
end;

function u7.KnitStart(u10) -- Line: 61
    -- upvalues: HandKnitController (copy), KnitClient (copy), AnimationType (copy), BedwarsImageId (copy), SharedSyncEvents (copy), ItemType (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy), TargetSelector (copy), default (copy), EntityUtil (copy), BedwarsKit (copy), ReplicatedStorage (copy)
    HandKnitController.KnitStart(u10);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.WARLOCK_IDLE, AnimationType.WARLOCK_WALK, AnimationType.HALLOWEEN_BOSS_CAST },
        imageIds = { BedwarsImageId.WHITE_BEAM_ARROW }
    });
    SharedSyncEvents.HandItemRendered:connect(function(p11) -- Line: 67
        -- upvalues: ItemType (ref), Players (ref), u10 (copy)
        if p11.itemType == ItemType.WARLOCK_STAFF then
            local u12 = Players:GetPlayerFromCharacter(p11.entity);

            if not u12 then
                return nil;
            end;

            task.delay(1, function() -- Line: 73
                -- upvalues: u10 (ref), u12 (copy)
                u10:updateSoulStack(u12);
            end);
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p13) -- Line: 78
        -- upvalues: Players (ref), AbilityId (ref), TargetSelector (ref), u10 (copy), default (ref)
        if p13.userCharacter == Players.LocalPlayer.Character and p13.ability == AbilityId.WARLOCK_LINK then
            local v14 = TargetSelector:getTargetEntity();

            if not v14 then
                return nil;
            end;

            if v14 == u10.target then
                return nil;
            end;

            default.Client:Get("WarlockLinkTarget"):CallServer({
                target = v14:getInstance()
            });
        end;
    end);
    default.Client:Get("CreateWarlockLink"):Connect(function(p15) -- Line: 92
        -- upvalues: EntityUtil (ref), u10 (copy)
        local v16 = EntityUtil:getEntity(p15.target);

        if not v16 then
            return nil;
        end;

        u10:createLink(p15.user, v16, p15.isAlly);
    end);
    default.Client:Get("WarlockLinkRemove"):Connect(function(p17) -- Line: 100
        -- upvalues: u10 (copy)
        u10:removeLink(p17.user);
        u10:clearSound(p17.user);
    end);
    KnitClient.Controllers.KitController:watchLocalKit(function(p18) -- Line: 104
        -- upvalues: BedwarsKit (ref), u10 (copy), Players (ref)
        if p18 ~= BedwarsKit.WARLOCK then
            return nil;
        end;

        if not (u10.energyStackTree or u10.settingUpStackTree) then
            u10.settingUpStackTree = true;
            u10:mountStacksUI();
        end;

        Players.LocalPlayer:GetAttributeChangedSignal("WarlockEnergy"):Connect(function(p19) -- Line: 112
            -- upvalues: u10 (ref)
            u10:updateStacksUI();
        end);
    end);
    default.Client:Get("WarlockGainStack"):Connect(function(u20) -- Line: 116
        -- upvalues: ReplicatedStorage (ref), EntityUtil (ref), ItemType (ref), KnitClient (ref), u10 (copy)
        local v21 = ReplicatedStorage.Assets.Effects.WarlockSoul:Clone();
        local v22 = EntityUtil:getEntity(u20.warlock);

        if v22 ~= nil then
            v22 = v22:getHandItemInstanceFromCharacter();
        end;

        local v23;

        if v22 == nil then
            v23 = v22;
        else
            v23 = v22.Name;
        end;

        if v23 ~= ItemType.WARLOCK_STAFF or not v22 then
            return nil;
        end;

        local Handle = v22:FindFirstChild("Handle");

        if Handle ~= nil then
            Handle = Handle:FindFirstChild("1");
        end;

        if Handle then
            KnitClient.Controllers.ReceiveItemEffectController:playEffect(v21, u20.fromPosition, function() -- Line: 141
                -- upvalues: Handle (copy)
                return Handle.WorldCFrame;
            end, 1);
            task.delay(1, function() -- Line: 144
                -- upvalues: u10 (ref), u20 (copy)
                u10:updateSoulStack(u20.warlock);
            end);
        end;
    end);
end;

function u7.isRelevantItem(p24, p25) -- Line: 150
    -- upvalues: ItemType (copy)
    return p25.itemType == ItemType.WARLOCK_STAFF;
end;

function u7.onEnable(p26, p27, p28) -- Line: 153
    -- upvalues: TargetSelector (copy), TargetType (copy), WarlockBalance (copy), EntityUtil (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Flamework (copy), AbilityId (copy), MobileTouchType (copy)
    TargetSelector:enableTargetSelector(TargetType.ALL, {
        requireSight = true,
        distance = WarlockBalance.SELECTOR_RANGE + math.min(p26.energyStack * WarlockBalance.BOUNS_RANGE_PER_STACK, 21)
    });
    p26:setUpAnimation();
    local v29 = "rbxassetid://15186577197";
    local v30 = EntityUtil:getLocalPlayerEntity();

    if v30 then
        local v31 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v30:getInstance())];

        if v31.eldric then
            v29 = v31.eldric.staffIcon;
        end;
    end;

    p26.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.WARLOCK_LINK, {
        abilityType = "ItemPrimary",
        abilityButton = {
            icon = v29
        }
    }):expect());
    local v35 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "WARLOCK",

        boundFunction = function(p32, p33, p34) -- Line: 178, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.WARLOCK_LINK);
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 183, Name: mobileBoundFunction
                -- upvalues: Flamework (ref), AbilityId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.WARLOCK_LINK);
            end
        }
    });
    p26.maid:GiveTask(v35);
end;

function u7.onDisable(p36) -- Line: 190
    -- upvalues: TargetSelector (copy), ContextActionService (copy)
    TargetSelector:disableTargetSelector();
    p36.maid:DoCleaning();
    ContextActionService:UnbindAction("WARLOCK");
    p36:cleanUpAnimation();
end;

function u7.createLink(u37, u38, p39, p40) -- Line: 196
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient (copy), EntityUtil (copy), ItemType (copy), u3 (copy), BedwarsImageId (copy), TweenService (copy)
    local v41 = AnimationUtil:playAnimation(u38, GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_BOSS_CAST));

    if v41 ~= nil then
        v41:AdjustSpeed(0.75);
    end;

    u37:setUpSoundTrack(u38, p39, p40);

    if u38 == Players.LocalPlayer then
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_TWIRLBLADE_ATTACK_2);
        local Character = u38.Character;
        local v42;

        if Character == nil then
            v42 = Character;
        else
            v42 = Character.PrimaryPart;

            if v42 ~= nil then
                v42 = v42.Position;
            end;
        end;

        local PrimaryPart = p39:getInstance().PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if Character and (PrimaryPart and v42) then
            Character:PivotTo(CFrame.new(v42, PrimaryPart));
        end;
    end;

    local Character = u38.Character;
    local v43 = p39:getInstance();

    if not (Character and v43) then
        return nil;
    end;

    local v44 = EntityUtil:getEntity(u38);

    if v44 ~= nil then
        v44 = v44:getHandItemInstanceFromCharacter();
    end;

    local v45;

    if v44 == nil then
        v45 = v44;
    else
        v45 = v44.Name;
    end;

    if v45 ~= ItemType.WARLOCK_STAFF or not v44 then
        return nil;
    end;

    local Handle = v44:FindFirstChild("Handle");
    local u46;

    if Handle == nil then
        u46 = Handle;
    else
        u46 = Handle:FindFirstChild("1");
    end;

    local u47 = u3("Model", {
        Parent = Character
    });
    local u48;

    if v43 == nil then
        u48 = v43;
    else
        u48 = v43:WaitForChild("UpperTorso", 1);

        if u48 ~= nil then
            u48 = u48:WaitForChild("BodyFrontAttachment", 1);
        end;
    end;

    if not u48 and v43.PrimaryPart then
        u48 = u3("Attachment", {
            Parent = v43.PrimaryPart
        });
    end;

    local u49 = p40 and 1 or -1;

    if Handle ~= nil then
        Handle = Handle:FindFirstChild("Parts");
    end;

    if Handle ~= nil then
        Handle = Handle:GetChildren();
    end;

    if u46 and u48 then
        task.spawn(function() -- Line: 278
            -- upvalues: u47 (copy), Handle (copy), u38 (copy), Players (ref), u37 (copy), u3 (ref), u46 (copy), u48 (ref), BedwarsImageId (ref), TweenService (ref), u49 (copy)
            local v50 = false;
            local v51 = 0;

            while true do
                if v50 then
                    v51 = v51 + 1;
                else
                    v50 = true;
                end;

                if v51 >= 5 or (not u47 or u47.Parent == nil) then
                    return;
                end;

                if Handle and #Handle >= 10 then
                    Handle[v51 * 2 + 1].Material = Enum.Material.Neon;
                    Handle[v51 * 2 + 1 + 1].Material = Enum.Material.Neon;
                end;

                local v52 = math.random(-1.5, 1.5);
                local v53 = ColorSequence.new(Color3.fromRGB(33, 247, 61));

                if u38 == Players.LocalPlayer then
                    if u37.warning then
                        v53 = ColorSequence.new(Color3.fromRGB(250, 163, 0));
                    else
                        v53 = ColorSequence.new(Color3.fromRGB(33, 247, 61));
                    end;
                elseif u38.Team ~= Players.LocalPlayer.Team then
                    v53 = ColorSequence.new(Color3.fromRGB(250, 0, 0));
                end;

                TweenService:Create(u3("Beam", {
                    TextureSpeed = 0,
                    Width0 = 0,
                    Width1 = 0,
                    FaceCamera = true,
                    TextureLength = 0,
                    Attachment0 = u46,
                    Attachment1 = u48,
                    Texture = BedwarsImageId.WHITE_BEAM_ARROW,
                    Color = v53,
                    Parent = u47,
                    Transparency = NumberSequence.new(0, 0)
                }), TweenInfo.new(1.5), {
                    TextureLength = 1,
                    Width0 = 5,
                    Width1 = 5,
                    TextureSpeed = u49 * (math.random() + 0.5),
                    CurveSize0 = v52,
                    CurveSize1 = v52
                }):Play();
                task.wait(1.75);
            end;
        end);
        u37.linkMap[u38] = u47;

        if u38 == Players.LocalPlayer then
            u37:initRangeIndicator(p39, u47);
        end;
    end;
end;

function u7.removeLink(u54, u55) -- Line: 338
    -- upvalues: Players (copy), EntityUtil (copy), ItemType (copy)
    local v56 = u54.linkMap[u55];

    if v56 then
        v56:Destroy();
    end;

    u54.linkMap[u55] = nil;

    if u55 == Players.LocalPlayer then
        u54.target = nil;
    end;

    task.delay(1, function() -- Line: 351
        -- upvalues: u54 (copy), u55 (copy), EntityUtil (ref), ItemType (ref)
        if u54.linkMap[u55] == nil then
            local v57 = EntityUtil:getEntity(u55);

            if v57 ~= nil then
                v57 = v57:getHandItemInstanceFromCharacter();
            end;

            local v58;

            if v57 == nil then
                v58 = v57;
            else
                v58 = v57.Name;
            end;

            if v58 ~= ItemType.WARLOCK_STAFF or not v57 then
                return nil;
            end;

            local Handle = v57:FindFirstChild("Handle");

            if Handle ~= nil then
                Handle = Handle:FindFirstChild("Parts");
            end;

            if Handle ~= nil then
                Handle = Handle:GetChildren();
            end;

            if Handle then
                local function _(p59) -- Line: 382
                    p59.Material = Enum.Material.Plastic;
                end;

                for i, v in Handle do
                    local _ = i - 1;
                    v.Material = Enum.Material.Plastic;
                end;
            end;
        end;
    end);
end;

function u7.initRangeIndicator(u60, u61, u62) -- Line: 392
    -- upvalues: RunService (copy), Players (copy), WarlockBalance (copy)
    u60.target = u61;
    local u63 = nil;
    u63 = RunService.Heartbeat:Connect(function() -- Line: 395
        -- upvalues: u60 (copy), u63 (ref), u61 (copy), Players (ref), WarlockBalance (ref), u62 (copy)
        if not u60.target then
            u63:Disconnect();

            return nil;
        end;

        local PrimaryPart = u61:getInstance().PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not (PrimaryPart and Character) then
            u63:Disconnect();

            return nil;
        end;

        if (PrimaryPart - Character).Magnitude > WarlockBalance.SELECTOR_RANGE + u60.energyStack and not u60.warning then
            u60.warning = true;
            u60:enableRangeWarning(u61, u62);
        end;

        if u60.warning and (PrimaryPart - Character).Magnitude < WarlockBalance.SELECTOR_RANGE + u60.energyStack then
            u60.warning = false;
            u60:disableRangeWarning(u61, u62);
        end;
    end);
end;

function u7.enableRangeWarning(p64, p65, p66) -- Line: 427
    local v67 = p66:GetChildren();

    local function v69(p68) -- Line: 429
        if p68:IsA("Beam") then
            p68.Transparency = NumberSequence.new(0.75, 0.75);
            p68.Color = ColorSequence.new(Color3.fromRGB(250, 163, 0));
        end;
    end;

    for i, v in v67 do
        v69(v, i - 1, v67);
    end;
end;

function u7.disableRangeWarning(p70, p71, p72) -- Line: 439
    local v73 = p72:GetChildren();

    local function v75(p74) -- Line: 441
        if p74:IsA("Beam") then
            p74.Transparency = NumberSequence.new(0, 0);
            p74.Color = ColorSequence.new(Color3.fromRGB(33, 247, 61));
        end;
    end;

    for i, v in v73 do
        v75(v, i - 1, v73);
    end;
end;

function u7.updateStacksUI(p76) -- Line: 451
    -- upvalues: Players (copy), u4 (copy), WarlockStaffDisplay (copy)
    if p76.energyStackTree then
        local v77 = Players.LocalPlayer:GetAttribute("WarlockEnergy");
        local v78 = v77 == nil and 0 or v77;
        p76.energyStack = v78;
        local v79 = "rbxassetid://15186577197";
        local Character = Players.LocalPlayer.Character;

        if Character then
            local v80 = p76:getKitSkinData(Character);

            if v80 then
                v79 = v80.staffIcon;
            end;
        end;

        u4.update(p76.energyStackTree, u4.createElement(WarlockStaffDisplay, {
            energyStacks = v78 == nil and 0 or v78,
            icon = v79
        }));
    end;
end;

function u7.mountStacksUI(p81) -- Line: 479
    -- upvalues: Players (copy), KnitClient (copy), WarlockBalance (copy), u4 (copy), WarlockStaffDisplay (copy)
    local v82 = "rbxassetid://15186577197";
    local Character = Players.LocalPlayer.Character;

    if Character then
        local v83 = p81:getKitSkinData(Character);

        if v83 then
            v82 = v83.staffIcon;
        end;
    end;

    local v84 = Players.LocalPlayer:GetAttribute("WarlockEnergy");
    local StatusInfoListController = KnitClient.Controllers.StatusInfoListController;
    local v85 = {
        energyStacks = math.clamp(v84 == nil and 0 or v84, 0, WarlockBalance.MAX_ENERGY),
        icon = v82
    };
    p81.energyStackTree = StatusInfoListController:waitForSetupAddElement(u4.createElement(WarlockStaffDisplay, v85));
end;

function u7.getKitSkinData(p86, p87) -- Line: 500
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    local v88 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p87)];

    if v88.eldric then
        return v88.eldric;
    end;
end;

function u7.setUpAnimation(p89) -- Line: 507
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local LocalPlayer = Players.LocalPlayer;
    local Character = LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local Humanoid = Character.Humanoid;
    local u90 = false;
    local u91 = nil;
    p89.animationMaid:GiveTask(function() -- Line: 516
        -- upvalues: u91 (ref)
        local v92 = u91;

        if v92 ~= nil then
            v92:Stop();
        end;

        local v93 = u91;

        if v93 ~= nil then
            v93:Destroy();
        end;
    end);
    p89.animationMaid:GiveTask(Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 526
        -- upvalues: Humanoid (copy), u90 (ref), u91 (ref), AnimationUtil (ref), LocalPlayer (copy), GameAnimationUtil (ref), AnimationType (ref)
        if Humanoid.MoveDirection.Magnitude > 0 and (Humanoid:GetState() == Enum.HumanoidStateType.Running and not u90) then
            local v94 = u91;

            if v94 ~= nil then
                v94:Stop();
            end;

            local v95 = u91;

            if v95 ~= nil then
                v95:Destroy();
            end;

            u91 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.WARLOCK_WALK));
            local v96 = u91;

            if v96 ~= nil then
                v96:AdjustSpeed(2);
            end;

            u90 = true;
        end;

        if Humanoid.MoveDirection.Magnitude == 0 and Humanoid:GetState() == Enum.HumanoidStateType.Running then
            u90 = false;
            local v97 = u91;

            if v97 ~= nil then
                v97:Stop();
            end;

            local v98 = u91;

            if v98 ~= nil then
                v98:Destroy();
            end;

            u90 = false;
            u91 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.WARLOCK_IDLE));
        end;
    end));
end;

function u7.cleanUpAnimation(p99) -- Line: 558
    p99.animationMaid:DoCleaning();
end;

function u7.setUpSoundTrack(p100, p101, p102, p103) -- Line: 561
    -- upvalues: GameSound (copy), EntityUtil (copy), SoundManager (copy), u3 (copy)
    local v104;

    if p103 then
        v104 = GameSound.WARLOCK_HEAL_START;
    else
        v104 = GameSound.WARLOCK_SIPHON_START;
    end;

    local v105;

    if p103 then
        v105 = GameSound.WARLOCK_HEAL_LOOP;
    else
        v105 = GameSound.WARLOCK_SIPHON_LOOP;
    end;

    local Character = p101.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v106 = EntityUtil:getEntity(p101);

    if v106 then
        local v107 = p100:getKitSkinData(v106:getInstance());

        if v107 then
            v104 = v107.drainCastSound;
            v105 = v107.drainLoopSound;
        end;
    end;

    SoundManager:playSound(v104, {
        position = Character.Position
    });
    local v108 = u3("Sound", {
        RollOffMinDistance = 20,
        RollOffMaxDistance = 40,
        Volume = 0.5,
        Playing = true,
        Looped = true,
        SoundId = v105,
        Parent = Character
    });
    v108:Play();
    p100.soundMap[p101] = v108;

    return v108;
end;

function u7.clearSound(p109, p110) -- Line: 599
    local v111 = p109.soundMap[p110];

    if v111 ~= nil then
        v111:Stop();
    end;

    if v111 ~= nil then
        v111:Destroy();
    end;

    p109.soundMap[p110] = nil;
end;

function u7.updateSoulStack(p112, p113) -- Line: 615
    -- upvalues: EntityUtil (copy), ItemType (copy)
    local v114 = EntityUtil:getEntity(p113);

    if v114 ~= nil then
        v114 = v114:getHandItemInstanceFromCharacter();
    end;

    local v115;

    if v114 == nil then
        v115 = v114;
    else
        v115 = v114.Name;
    end;

    if v115 ~= ItemType.WARLOCK_STAFF or not v114 then
        return nil;
    end;

    local Handle = v114:WaitForChild("Handle", 3);

    if p113 ~= nil then
        p113 = p113:GetAttribute("WarlockEnergy");
    end;

    local v116 = p113 == nil and 0 or p113;

    if Handle ~= nil then
        Handle = Handle:WaitForChild("StackIndicator", 3);
    end;

    if Handle then
        Handle.Rate = v116;
    end;
end;

KnitClient.CreateController(u7.new());

return nil;