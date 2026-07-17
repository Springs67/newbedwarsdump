-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "target-selector", "target-selector-util");
local TargetSelector = v5.TargetSelector;
local TargetType = v5.TargetType;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local DragonSwordBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").DragonSwordBalance;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local DragonSwordUIDisplay = RuntimeLib.import(script, script.Parent, "ui", "dragon-sword-ui").DragonSwordUIDisplay;
local u6 = { GameSound.DRAGON_SWORD_SHOOT_1, GameSound.DRAGON_SWORD_SHOOT_2, GameSound.DRAGON_SWORD_SHOOT_3 };
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "DragonSwordController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 45
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 49
    -- upvalues: BedwarsKit (copy), AnimationType (copy), u6 (copy), GameSound (copy), BaseKitController (copy), u2 (copy), Workspace (copy)
    local DRAGON_SWORD = BedwarsKit.DRAGON_SWORD;
    local v10 = {
        animations = { AnimationType.DRAGON_SWORD_FIRE, AnimationType.DRAGON_SWORD_ULT }
    };
    local v11 = {};
    local v12 = #v11;
    local v13 = #u6;
    table.move(u6, 1, v13, v12 + 1, v11);
    local v14 = v12 + v13;
    v11[v14 + 1] = GameSound.DRAGON_SWORD_ULT_CAST;
    v11[v14 + 2] = GameSound.DRAGON_SWORD_ULT_FALL;
    v11[v14 + 3] = GameSound.DRAGON_SWORD_ULT_LAND;
    v10.sounds = v11;
    BaseKitController.constructor(p9, DRAGON_SWORD, v10);
    p9.Name = "DragonSwordController";
    p9.swordCount = 0;
    p9.userMap = {};
    p9.swordModelFolder = u2("Folder", {
        Name = "DragonSwords",
        Parent = Workspace
    });
end;

function u7.onKitLocalActivated(u15, p16) -- Line: 73
    -- upvalues: Players (copy), default2 (copy), ClientSyncEvents (copy), TargetSelector (copy), Flamework (copy), AbilityState (copy)
    u15:mountStacksUI(p16);
    p16:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("SwordCount"):Connect(function() -- Line: 75
        -- upvalues: u15 (copy)
        u15:updateSwordCount();
    end));
    p16:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("NextSwordArrival"):Connect(function() -- Line: 78
        -- upvalues: u15 (copy)
        u15:updateStacksUI();
    end));
    p16:GiveTask((default2.Client:Get("DragonSwordCountUpdate"):Connect(function(p17) -- Line: 81
        -- upvalues: Players (ref), u15 (copy)
        if p17.player ~= Players.LocalPlayer then
            return nil;
        end;

        u15.swordCount = p17.after;
        u15:updateSwordCount();
    end)));
    p16:GiveTask(ClientSyncEvents.NewSelectorTarget:connect(function(p18) -- Line: 89
        -- upvalues: u15 (copy), TargetSelector (ref), Flamework (ref), AbilityState (ref)
        if not u15.enabledAbility then
            return nil;
        end;

        local v19 = TargetSelector:getTargetEntity();

        if u15.target and v19 == nil then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u15.enabledAbility, AbilityState.DISABLED);
        end;

        if not u15.target and (v19 and u15.swordCount >= 1) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u15.enabledAbility, AbilityState.READY);
        end;

        u15.target = v19;
    end));
end;

function u7.onKitLocalDeactivated(p20) -- Line: 103
end;

function u7.onKitReplicationActivated(u21, p22) -- Line: 105
    -- upvalues: default2 (copy), Players (copy)
    p22:GiveTask(default2.Client:Get("DragonSwordCountUpdate"):Connect(function(p23) -- Line: 106
        -- upvalues: u21 (copy)
        u21:createSwords(p23.player, p23.after - p23.before);
    end));
    p22:GiveTask(default2.Client:Get("DragonSwordEffect"):Connect(function(p24) -- Line: 110
        -- upvalues: u21 (copy)
        u21:swordFire(p24.player, p24.target);
    end));
    p22:GiveTask(default2.Client:Get("DragonSwordUltEffect"):Connect(function(p25) -- Line: 113
        -- upvalues: u21 (copy)
        u21:swordUltEffect(p25.player, p25.positions);
    end));
    p22:GiveTask(default2.Client:Get("EntityDeathEvent"):Connect(function(p26) -- Line: 116
        -- upvalues: Players (ref), u21 (copy)
        local v27 = Players:GetPlayerFromCharacter(p26.entityInstance);
        local v28 = v27 and u21.userMap[v27];

        if v28 then
            u21.userMap[v27] = nil;

            if v28 ~= nil then
                local function _(p29) -- Line: 124
                    p29:Destroy();
                    p29.Parent = nil;
                end;

                for i, v in v28 do
                    local _ = i - 1;
                    v:Destroy();
                    v.Parent = nil;
                end;
            end;
        end;
    end));
    p22:GiveTask(Players.PlayerRemoving:Connect(function(p30) -- Line: 136
        -- upvalues: u21 (copy)
        if u21.userMap[p30] ~= nil then
            local v31 = u21.userMap[p30];

            if v31 ~= nil then
                local function _(p32) -- Line: 145
                    p32:Destroy();
                    p32.Parent = nil;
                end;

                for i, v in v31 do
                    local _ = i - 1;
                    v:Destroy();
                    v.Parent = nil;
                end;
            end;

            u21.userMap[p30] = nil;
        end;
    end));
end;

function u7.onKitReplicationDeactivated(p33) -- Line: 159
end;

function u7.onInnateAbilityEnabled(p34, p35, p36) -- Line: 161
    -- upvalues: Flamework (copy), AbilityId (copy)
    p34.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.DRAGON_SWORD);
    p34:enableTargetSelector();
    p34.enabledUltAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.DRAGON_SWORD_ULT);
end;

function u7.onAbilityUsed(p37, p38, p39) -- Line: 166
    -- upvalues: Players (copy), AbilityId (copy), TargetSelector (copy), Flamework (copy), AbilityState (copy), default2 (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy)
    if p38 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    local ability = p39.ability;

    if ability == AbilityId.DRAGON_SWORD then
        local v40 = TargetSelector:getTargetEntity();

        if not v40 then
            p39:setCancelled(true);

            if p37.enabledAbility then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p37.enabledAbility, AbilityState.READY);
            end;

            return nil;
        end;

        default2.Client:Get("DragonSwordFire"):SendToServer({
            target = v40:getInstance()
        });
        local v41 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.DRAGON_SWORD_FIRE);
        local v42 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.DRAGON_SWORD_FIRE_FP);

        if v42 ~= nil then
            v42:AdjustSpeed(2);
        end;

        if v41 ~= nil then
            v41:AdjustSpeed(2);
        end;
    elseif ability == AbilityId.DRAGON_SWORD_ULT then
        default2.Client:Get("DragonSwordUlt"):SendToServer();
    end;
end;

function u7.enableTargetSelector(p43) -- Line: 202
    -- upvalues: TargetSelector (copy), TargetType (copy)
    TargetSelector:enableTargetSelector(TargetType.ENTITY, {
        requireSight = true,
        distance = 30
    });
end;

function u7.disableTargetSelector(p44) -- Line: 208
    -- upvalues: TargetSelector (copy)
    TargetSelector:disableTargetSelector();
    p44.target = nil;
end;

function u7.updateSwordCount(p45) -- Line: 212
    -- upvalues: Flamework (copy), AbilityState (copy)
    p45:updateStacksUI();

    if p45.swordCount == 0 and p45.enabledUltAbility then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p45.enabledUltAbility, AbilityState.DISABLED);
    elseif p45.enabledUltAbility then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p45.enabledUltAbility, AbilityState.READY);
    end;

    if p45.swordCount ~= 0 or not p45.enabledAbility then
        if p45.enabledAbility then
            p45:enableTargetSelector();

            if p45.target then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p45.enabledAbility, AbilityState.READY);
            end;
        end;

        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p45.enabledAbility, AbilityState.DISABLED);
    p45:disableTargetSelector();
end;

function u7.updateStacksUI(p46) -- Line: 229
    -- upvalues: Players (copy), u3 (copy), DragonSwordUIDisplay (copy)
    if p46.uiTree then
        local v47 = "rbxassetid://16215603369";
        local v48 = p46:getKitSkinData(Players.LocalPlayer.Character);
        local v49;

        if v48 == nil then
            v49 = v48;
        else
            v49 = v48.swordIcon;
        end;

        if v49 ~= "" and v49 then
            v47 = v48.swordIcon;
        end;

        local v50 = Players.LocalPlayer:GetAttribute("NextSwordArrival");
        local uiTree = p46.uiTree;
        local v51 = {};
        local swordCount = p46.swordCount;
        v51.count = swordCount == nil and 0 or swordCount;
        v51.icon = v47;
        v51.timer = (v50 == 0 or (v50 ~= v50 or not v50)) and -1 or v50;
        u3.update(uiTree, u3.createElement(DragonSwordUIDisplay, v51));
    end;
end;

function u7.mountStacksUI(u52, p53) -- Line: 257
    -- upvalues: Players (copy), KnitClient (copy), u3 (copy), DragonSwordUIDisplay (copy)
    local v54 = "rbxassetid://15186577197";
    local v55 = u52:getKitSkinData(Players.LocalPlayer.Character);
    local v56;

    if v55 == nil then
        v56 = v55;
    else
        v56 = v55.swordIcon;
    end;

    if v56 ~= "" and v56 then
        v54 = v55.swordIcon;
    end;

    local v57 = Players.LocalPlayer:GetAttribute("WarlockEnergy");
    u52.uiTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u3.createElement(DragonSwordUIDisplay, {
        count = v57 == nil and 0 or v57,
        icon = v54
    }));
    p53:GiveTask(function() -- Line: 277
        -- upvalues: u52 (copy), u3 (ref)
        if u52.uiTree then
            u3.unmount(u52.uiTree);
        end;
    end);
end;

function u7.getKitSkinData(p58, p59) -- Line: 283
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p59 then
        return nil;
    end;

    local v60 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p59)];

    if v60.dragon_sword then
        return v60.dragon_sword;
    end;
end;

function u7.createSwords(p61, p62, p63) -- Line: 293
    -- upvalues: DragonSwordBalance (copy)
    local v64 = p61.userMap[p62];
    local v65 = v64 ~= nil and #v64 or v64;
    local v66 = v65 == nil and 0 or v65;
    local v67 = v64 == nil and {} or v64;
    local v68 = math.min(p63, DragonSwordBalance.MAX_SWORD - #v67);
    local v69 = false;
    local v70 = 0;

    while true do
        if v69 then
            v70 = v70 + 1;
        else
            v69 = true;
        end;

        if v70 >= v68 then
            p61.userMap[p62] = v67;

            return;
        end;

        local v71 = p61:createSword(p62, v66 + v70 - 1);

        if v71 then
            table.insert(v67, v71);
        end;
    end;
end;

function u7.createSword(u72, u73, u74) -- Line: 333
    -- upvalues: ReplicatedStorage (copy), RunService (copy)
    local Character = u73.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return nil;
    end;

    local Character2 = u73.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;
    end;

    if not Character2 then
        return nil;
    end;

    local u75 = 0.7853981633974483 * u74 + u73.Character.PrimaryPart.Rotation.Y;
    local v76 = math.sin(u75) * 5;
    local v77 = math.cos(u75) * 5;
    local u78 = Vector3.new(v76, 0, v77);
    local v79 = u72:getKitSkinData(u73.Character);
    local DragonSword = ReplicatedStorage.Assets.Effects.DragonSword;
    local v80;

    if v79 == nil then
        v80 = v79;
    else
        v80 = v79.swordModel;
    end;

    if v80 then
        DragonSword = v79.swordModel;
    end;

    local u81 = DragonSword:Clone();
    u81.Parent = u72.swordModelFolder;
    u81:PivotTo(CFrame.new(Character + u78 + Vector3.new(0, 2, 0)));

    if not (Character and u81) then
        return u81;
    end;

    local u82 = 0;
    local u83 = nil;
    u83 = RunService.Heartbeat:Connect(function(p84) -- Line: 376
        -- upvalues: u81 (copy), u72 (copy), u83 (ref), u73 (copy), u82 (ref), u75 (ref), u74 (copy), u78 (ref)
        if not u81 or u81.Parent ~= u72.swordModelFolder then
            u83:Disconnect();

            return nil;
        end;

        local Character3 = u73.Character;

        if Character3 ~= nil then
            Character3 = Character3:GetPivot().Position;
        end;

        if not Character3 then
            u83:Disconnect();

            return nil;
        end;

        local v85 = u72.userMap[u73];
        local v86 = v85 ~= nil and #v85 or v85;
        local v87 = v86 == nil and 0 or v86;

        if v87 == 0 or (v87 ~= v87 or not v87) then
            u83:Disconnect();

            return nil;
        end;

        u82 = u82 + p84;
        u75 = 0.6283185307179586 * u74 + math.rad(u73.Character.PrimaryPart.Orientation.Y);
        local v88 = math.sin(u75) * 5;
        local v89 = math.cos(u75) * 5;
        u78 = Vector3.new(v88, 0, v89);
        local _ = math.sin(u82 * 2) * 1;
        local v90 = math.sin(u82 + u74) / 4 + 2;
        local v91 = Vector3.new(0, v90, 0);
        u81:PivotTo(CFrame.new(Character3 + u78 + v91));
    end);

    return u81;
end;

function u7.swordFire(p92, p93, p94) -- Line: 419
    -- upvalues: Workspace (copy), u6 (copy), RandomUtil (copy), SoundManager (copy), default (copy), InQuad (copy)
    local v95 = p92.userMap[p93];

    if not v95 or #v95 == 0 then
        return nil;
    end;

    local PrimaryPart = p94.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    if not PrimaryPart then
        return nil;
    end;

    local v96 = #v95;
    local u97 = v95[v96];
    v95[v96] = nil;
    p92.userMap[p93] = v95;

    if not u97 then
        return nil;
    end;

    u97.Parent = Workspace;
    local Handle = u97:WaitForChild("Handle", 3);

    if Handle ~= nil then
        Handle = Handle:WaitForChild("Trail3");
    end;

    if Handle then
        Handle.Enabled = true;
    end;

    local Character = p93.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local Unit = (PrimaryPart - Character).Unit;
    local v98 = u97.PrimaryPart.Position + Vector3.new(0, 6, 0);
    local v99 = u6;
    local v100 = p92:getKitSkinData(p93.Character);
    local v101;

    if v100 == nil then
        v101 = v100;
    else
        v101 = v100.swordShootSounds;
    end;

    if v101 then
        v99 = v100.swordShootSounds;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(v99)), {
        position = v98
    });
    default(0.2, InQuad, function(p102) -- Line: 483
        -- upvalues: u97 (copy)
        u97:PivotTo(p102);
    end, u97.PrimaryPart.CFrame, CFrame.new(v98, PrimaryPart) * CFrame.Angles(1.5707963267948966, 0, 0));
    task.delay(0.2, function() -- Line: 490
        -- upvalues: u97 (copy), PrimaryPart (copy), Unit (copy), default (ref), InQuad (ref)
        default(0.1, InQuad, function(p103) -- Line: 491
            -- upvalues: u97 (ref)
            u97:PivotTo(p103);
        end, u97.PrimaryPart.CFrame, CFrame.new(PrimaryPart, PrimaryPart + Unit) * CFrame.Angles(1.5707963267948966, 0, 0));
    end);
    task.delay(0.3, function() -- Line: 499
        -- upvalues: u97 (copy)
        u97:Destroy();
    end);
end;

function u7.swordUltEffect(p104, p105, u106) -- Line: 503
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient (copy), GameSound (copy), SoundManager (copy), Workspace (copy), TweenService (copy), default (copy), InQuad (copy), ReplicatedStorage (copy)
    local v107 = p104.userMap[p105];
    local Character = p105.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not (v107 and Character) then
        return nil;
    end;

    if #u106 < 1 then
        return nil;
    end;

    p104.userMap[p105] = nil;
    local u108 = 0;
    local v109 = GameAnimationUtil:playAnimation(p105, AnimationType.DRAGON_SWORD_ULT);

    if p105 == Players.LocalPlayer then
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.DRAGON_SWORD_ULT_FP);
    end;

    if v109 ~= nil then
        v109:AdjustSpeed(1.5);
    end;

    local DRAGON_SWORD_ULT_CAST = GameSound.DRAGON_SWORD_ULT_CAST;
    local u110 = p104:getKitSkinData(p105.Character);
    local v111;

    if u110 == nil then
        v111 = u110;
    else
        v111 = u110.swordUltCastSound;
    end;

    if v111 ~= "" and v111 then
        DRAGON_SWORD_ULT_CAST = u110.swordUltCastSound;
    end;

    SoundManager:playSound(DRAGON_SWORD_ULT_CAST, {
        position = Character
    });
    local v112;

    if u110 == nil then
        v112 = u110;
    else
        v112 = u110.swordDragonTransparentModel;
    end;

    if v112 then
        local u113 = u110.swordDragonTransparentModel:Clone();

        if not u113 then
            return nil;
        end;

        SoundManager:playSound(GameSound.DRAGON_ROAR, {
            fadeOutTime = 1,
            position = Character
        });
        u113:PivotTo(CFrame.new(Character + Vector3.new(0, 3, 0)));
        u113.Parent = Workspace;
        local v114 = GameAnimationUtil:playAnimation(u113, AnimationType.DRAGON_SMASH_1);

        if v114 ~= nil then
            v114:AdjustSpeed(0.75);
        end;

        task.delay(1.2, function() -- Line: 569
            -- upvalues: u113 (copy)
            u113:Destroy();
        end);
    end;

    local function v128(u115) -- Line: 573
        -- upvalues: Workspace (ref), u106 (copy), u108 (ref), TweenService (ref), default (ref), InQuad (ref), ReplicatedStorage (ref), u110 (copy), GameSound (ref), SoundManager (ref)
        u115.Parent = Workspace;
        local v116 = u106[u108 + 1];

        local function _(p117) -- Line: 577
            if p117:IsA("ParticleEmitter") then
                p117.Enabled = true;
            end;
        end;

        for i, descendant in u115:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = true;
            end;
        end;

        u108 = u108 + 1;
        local u118 = v116 + Vector3.new(0, 10, 0);
        local u119 = v116 + Vector3.new(0, -1, 0);
        TweenService:Create(u115, TweenInfo.new(1.5), {
            WorldPivot = CFrame.new(u118)
        }):Play();
        default(0.9, InQuad, function(p120) -- Line: 594
            -- upvalues: u115 (copy)
            u115:PivotTo(p120);
        end, u115.PrimaryPart.CFrame, CFrame.new(u118));
        local DragSwordCrack = ReplicatedStorage.Assets.Effects.DragSwordCrack;
        local v121 = u110;

        if v121 ~= nil then
            v121 = v121.swordCrackModel;
        end;

        if v121 then
            DragSwordCrack = u110.swordCrackModel:Clone();
        end;

        local u122 = DragSwordCrack:Clone();
        task.delay(0.9, function() -- Line: 606
            -- upvalues: GameSound (ref), u110 (ref), SoundManager (ref), u118 (copy), u119 (copy), default (ref), InQuad (ref), u115 (copy), u122 (copy), Workspace (ref)
            local DRAGON_SWORD_ULT_FALL = GameSound.DRAGON_SWORD_ULT_FALL;
            local v123 = u110;

            if v123 ~= nil then
                v123 = v123.swordUltFallSound;
            end;

            if v123 ~= "" and v123 then
                DRAGON_SWORD_ULT_FALL = u110.swordUltFallSound;
            end;

            SoundManager:playSound(DRAGON_SWORD_ULT_FALL, {
                position = u118
            });
            task.delay(0.1, function() -- Line: 618
                -- upvalues: GameSound (ref), u110 (ref), SoundManager (ref), u119 (ref)
                local DRAGON_SWORD_ULT_LAND = GameSound.DRAGON_SWORD_ULT_LAND;
                local v124 = u110;

                if v124 ~= nil then
                    v124 = v124.swordUltLandSound;
                end;

                if v124 ~= "" and v124 then
                    DRAGON_SWORD_ULT_LAND = u110.swordUltLandSound;
                end;

                SoundManager:playSound(DRAGON_SWORD_ULT_LAND, {
                    position = u119
                });
            end);
            default(0.2, InQuad, function(p125) -- Line: 631
                -- upvalues: u115 (ref)
                u115:PivotTo(p125);
            end, u115.PrimaryPart.CFrame, CFrame.new(u119));

            local function _(p126) -- Line: 635
                if p126:IsA("ParticleEmitter") then
                    p126.Rate = p126.Rate * 3;
                end;
            end;

            for i, descendant in u115:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Rate = descendant.Rate * 3;
                end;
            end;

            u122:PivotTo(CFrame.new(u119 + Vector3.new(0, -1, 0)));
            u122.Parent = Workspace;

            local function _(p127) -- Line: 648
                if p127:IsA("ParticleEmitter") then
                    p127:Emit(5);
                end;
            end;

            for i, descendant in u122:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(5);
                end;
            end;
        end);
        task.delay(2, function() -- Line: 657
            -- upvalues: u115 (copy), u122 (copy)
            u115:Destroy();
            u115.Parent = nil;
            u122:Destroy();
        end);
    end;

    for i, v in v107 do
        v128(v, i - 1, v107);
    end;
end;

KnitClient.CreateController(u7.new());

return nil;