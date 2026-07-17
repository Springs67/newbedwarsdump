-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local OutBack = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutBack;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v7.CollectionService;
local Players = v7.Players;
local RunService = v7.RunService;
local TweenService = v7.TweenService;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local StarCollectorNotification = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "star-collector", "ui", "star-collector-notification").StarCollectorNotification;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "blocks", "fire-sheep-meta");
local FIRE_SHEEP_BASE_STATS = v8.FIRE_SHEEP_BASE_STATS;
local FireSheepLevel = v8.FireSheepLevel;
local FireSheepLevelColor = v8.FireSheepLevelColor;
local MaxedFireSheep = v8.MaxedFireSheep;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local FireSheepHpBar = RuntimeLib.import(script, script.Parent, "ui", "fire-sheep-hp-bar").FireSheepHpBar;
local u9 = { GameSound.FIRE_SHEEP_ROTATE_1, GameSound.FIRE_SHEEP_ROTATE_2, GameSound.FIRE_SHEEP_ROTATE_3 };
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 47, Name: __tostring
        return "FireSheepStatueController";
    end,

    __index = KnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 53
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12, ...) -- Line: 57
    -- upvalues: KnitController (copy)
    KnitController.constructor(p12, ...);
    p12.Name = "FireSheepStatueController";
    p12.statueTargetMap = {};
    p12.statueRotationMaidMap = {};
    p12.statueAttackMaidMap = {};
    p12.fireSheepStatMap = {};
    p12.statueEffectMap = {};
end;

function u10.KnitStart(u13) -- Line: 66
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), WatchCollectionTag (copy), u4 (copy), FIRE_SHEEP_BASE_STATS (copy), default2 (copy), Players (copy), FireSheepLevel (copy), CollectionService (copy), SoundManager (copy)
    KnitController.KnitStart(u13);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.FIRE_SHEEP_STATUE, {
        animations = { AnimationType.FIRE_SHEEP_ATTACK, AnimationType.FIRE_SHEEP_CHARGE, AnimationType.FIRE_SHEEP_SPAWN },
        sounds = {
            GameSound.FIRE_SHEEP_BREAK,
            GameSound.FIRE_SHEEP_FLAMETHROWER_CHARGE,
            GameSound.FIRE_SHEEP_FLAMETHROWER_LOOP,
            GameSound.FIRE_SHEEP_ROTATE_1,
            GameSound.FIRE_SHEEP_ROTATE_2,
            GameSound.FIRE_SHEEP_ROTATE_3,
            GameSound.FIRE_SHEEP_SPAWN,
            GameSound.FIRE_SHEEP_TARGET,
            GameSound.FIRE_SHEEP_UPGRADE
        }
    });
    WatchCollectionTag("FireSheepStatue", function(p14) -- Line: 72
        -- upvalues: u4 (ref), u13 (copy), FIRE_SHEEP_BASE_STATS (ref)
        local v15 = u4.new();
        u13.statueRotationMaidMap[p14] = v15;
        u13:spawnStatueEffect(p14);
        u13:recolorTeamIndicator(p14);
        u13.fireSheepStatMap[p14] = FIRE_SHEEP_BASE_STATS;
        u13:initializeHayPrompt(p14);
        u13:initializeTargetIndicator(p14);
        u13:createHpBar(p14);
        u13:updateParticleTransparency();
    end);
    default2.Client:OnEvent("ChangeFireSheepTarget", function(p16) -- Line: 87
        -- upvalues: u13 (copy)
        u13.statueTargetMap[p16.statue] = p16.target;
        u13:updateParticleTransparency();
        u13:cleanUpAttack(p16.statue);
        u13:cleanUpRotation(p16.statue);
        u13:rotateStatue(p16.statue);
    end);
    default2.Client:OnEvent("ActivateFireSheepFlamethrower", function(p17) -- Line: 97
        -- upvalues: u13 (copy)
        u13:cleanUpAttack(p17.statue);
        u13:createFlamethrowerEffect(p17.statue, p17.target);
        u13:updateParticleTransparency();
    end);
    default2.Client:OnEvent("FireSheepUpgraded", function(p18) -- Line: 103
        -- upvalues: u13 (copy), Players (ref), FireSheepLevel (ref)
        u13.fireSheepStatMap[p18.statue] = p18.upgradeStats;

        if p18.upgrader == Players.LocalPlayer then
            u13:sendLevelNotification(p18.deltaStats, p18.level);
        end;

        if p18.level == FireSheepLevel.MAX then
            u13:enableMaxFireSheepEffect(p18.statue);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("FireSheepStatue"):Connect(function(p19) -- Line: 115
        -- upvalues: SoundManager (ref), GameSound (ref), u13 (copy)
        SoundManager:playSound(GameSound.FIRE_SHEEP_BREAK, {
            position = p19.Position
        });
        u13:cleanUpAttack(p19);
        u13:cleanUpRotation(p19);
        u13:removeHpBar();
        u13.fireSheepStatMap[p19] = nil;
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p20) -- Line: 125
        -- upvalues: u13 (copy)
        u13:updateParticleTransparency();
    end);
end;

function u10.updateParticleTransparency(p21) -- Line: 129
    -- upvalues: KnitClient (copy), Players (copy)
    local v22;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        v22 = NumberSequence.new(0.9, 1);
    else
        v22 = NumberSequence.new(0, 1);
    end;

    for _, v in p21:getAllFireSheepStatues() do
        if p21.statueTargetMap[v] == Players.LocalPlayer.Character then
            local v23 = p21.statueEffectMap[v];

            if v23 then
                for _, v3 in v23 do
                    v3.Transparency = v22;
                end;
            end;
        end;
    end;
end;

function u10.createHpBar(p24, p25) -- Line: 143
    -- upvalues: FIRE_SHEEP_BASE_STATS (copy), u6 (copy), FireSheepHpBar (copy)
    p25:SetAttribute("NoHealthbar", true);
    local blockHealth = FIRE_SHEEP_BASE_STATS.blockHealth;
    p24.hpBarTree = u6.mount(u6.createElement(FireSheepHpBar, {
        statue = p25,
        currentHp = blockHealth,
        maxHp = blockHealth
    }), p25);
end;

function u10.removeHpBar(p26) -- Line: 153
    -- upvalues: u6 (copy)
    if p26.hpBarTree then
        u6.unmount(p26.hpBarTree);
    end;
end;

function u10.sendLevelNotification(p27, p28, p29) -- Line: 158
    -- upvalues: u3 (copy), FireSheepLevel (copy), BLOCK_SIZE (copy), Flamework (copy), u6 (copy), StarCollectorNotification (copy)
    for _, v in u3.entries(p28) do
        local v30 = v[1];
        local v31 = v[2];

        if v31 ~= 0 and v31 ~= false then
            local v32 = Color3.fromRGB(240, 145, 56);
            local v33 = Color3.fromRGB(242, 105, 13);

            if p29 == FireSheepLevel.MAX then
                v32 = Color3.fromRGB(181, 89, 237);
                v33 = Color3.fromRGB(140, 23, 237);
            end;

            local v34 = nil;

            if v30 == "attackDuration" then
                v34 = "+" .. tostring(v31) .. "s Attack Duration";
            elseif v30 == "blastResistance" then
                v34 = "Blast Resistance";
            elseif v30 == "blockHealth" then
                v34 = "+" .. tostring(v31) .. " Sheep Health";
            elseif v30 == "damagePerSecond" then
                v34 = "+" .. tostring(v31) .. " Attack Damage";
            elseif v30 == "enterSearchRadius" then
                v34 = "+" .. tostring(v31 / BLOCK_SIZE) .. " Blocks Attack Range";
            end;

            if v34 ~= "" and v34 then
                local u35 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(StarCollectorNotification, {
                    text = v34,
                    textColor3 = v32,
                    textStrokeColor3 = v33
                }));
                task.delay(3, function() -- Line: 200
                    -- upvalues: u35 (copy)
                    u35:DoCleaning();
                end);
                task.wait(0.3);
            end;
        end;
    end;
end;

function u10.enableMaxFireSheepEffect(p36, p37) -- Line: 207
    -- upvalues: TweenService (copy), MaxedFireSheep (copy)
    local function _(p38) -- Line: 210
        if p38:IsA("ParticleEmitter") then
            p38:Emit();
        end;
    end;

    for i, child in p37.Rotating.Pedestal.SpawnEffectAttachment:GetChildren() do
        local _ = i - 1;

        if child:IsA("ParticleEmitter") then
            child:Emit();
        end;
    end;

    TweenService:Create(p37.Rotating.Sheep.horns, TweenInfo.new(1), {
        Color = MaxedFireSheep.HornsColor
    }):Play();
    TweenService:Create(p37.Rotating.Sheep.legs_mesh, TweenInfo.new(1), {
        Color = MaxedFireSheep.LegsColor
    }):Play();
    local v39 = p37.StatueBase.Levels:GetChildren();

    local function v41(p40) -- Line: 227
        -- upvalues: TweenService (ref), MaxedFireSheep (ref)
        if p40:IsA("BasePart") then
            TweenService:Create(p40, TweenInfo.new(1), {
                Color = MaxedFireSheep.LevelIndicatorColor
            }):Play();
        end;
    end;

    for i, v in v39 do
        v41(v, i - 1, v39);
    end;

    local function _(p42) -- Line: 238
        -- upvalues: MaxedFireSheep (ref)
        if p42:IsA("ParticleEmitter") then
            p42.Color = MaxedFireSheep.ParticleColor;
        end;
    end;

    for i, child in p37.Rotating.Sheep.wool_mesh:GetChildren() do
        local _ = i - 1;

        if child:IsA("ParticleEmitter") then
            child.Color = MaxedFireSheep.ParticleColor;
        end;
    end;
end;

function u10.rotateStatue(p43, p44) -- Line: 247
    -- upvalues: Workspace (copy), SoundManager (copy), RandomUtil (copy), u9 (copy), default (copy), OutBack (copy), Players (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    if Workspace:GetServerTimeNow() < p44:GetAttribute("ActivationTime") then
        return nil;
    end;

    if p44.Parent == nil then
        return nil;
    end;

    local v45 = p43.statueRotationMaidMap[p44];

    if not v45 then
        return nil;
    end;

    local Rotating = p44:WaitForChild("Rotating");

    if not Rotating then
        return nil;
    end;

    local u46 = p43.statueTargetMap[p44];

    if u46 == nil then
        SoundManager:playSound(RandomUtil.fromList(unpack(u9)), {
            position = p44.Position
        });
        local u47 = Rotating:GetPivot();
        local u48 = u47 * CFrame.Angles(0, math.random(0, 1.5707963267948966), 0);
        local u50 = default(0.4, OutBack, function(p49) -- Line: 280
            -- upvalues: Rotating (copy), u47 (copy), u48 (copy)
            Rotating:PivotTo(u47:Lerp(u48, p49));
        end);
        u50:Play();
        v45:GiveTask(function() -- Line: 284
            -- upvalues: u50 (copy)
            u50:Cancel();
        end);

        return;
    end;

    local v51 = u46 == Players.LocalPlayer.Character;

    if v51 then
        p43:animateTargetIndicator(p44);
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(u9)), {
        position = p44.Position
    });
    local FIRE_SHEEP_TARGET = GameSound.FIRE_SHEEP_TARGET;
    local v52 = {};
    local v53;

    if v51 then
        v53 = nil;
    else
        v53 = p44.Position;
    end;

    v52.position = v53;
    SoundManager:playSound(FIRE_SHEEP_TARGET, v52);
    local Position = u46:GetPivot().Position;
    local X = Position.X;
    local Y = Rotating:GetPivot().Position.Y;
    local v54 = Vector3.new(X, Y, Position.Z);
    local u55 = Rotating:GetPivot();
    local u56 = CFrame.new(Rotating:GetPivot().Position, v54);
    local u58 = default(0.4, OutBack, function(p57) -- Line: 302
        -- upvalues: Rotating (copy), u55 (copy), u56 (copy)
        Rotating:PivotTo(u55:Lerp(u56, p57));
    end);
    u58:Play();
    v45:GiveTask(function() -- Line: 306
        -- upvalues: u58 (copy)
        u58:Cancel();
    end);
    v45:GiveTask(function() -- Line: 309
        -- upvalues: u58 (copy)
        return u58:Cancel();
    end);
    local v59 = p43:getAnimator(p44);
    local v60 = v59 and AnimationUtil:playAnimation(v59, GameAnimationUtil:getAssetId(AnimationType.FIRE_SHEEP_CHARGE));

    if v60 then
        v60:AdjustSpeed(1.3);
        v45:GiveTask(v60);
    end;

    local u61 = SoundManager:playSound(GameSound.FIRE_SHEEP_FLAMETHROWER_CHARGE, {
        position = p44.Position
    });
    v45:GiveTask(function() -- Line: 323
        -- upvalues: u61 (copy)
        local v62 = u61;

        if v62 ~= nil then
            v62:Destroy();
        end;
    end);
    v45:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 329
        -- upvalues: u46 (copy), Rotating (copy)
        local Position2 = u46:GetPivot().Position;
        local X2 = Position2.X;
        local Y2 = Rotating:GetPivot().Position.Y;
        local v63 = Vector3.new(X2, Y2, Position2.Z);
        Rotating:PivotTo((CFrame.new(Rotating:GetPivot().Position, v63)));
    end));
end;

function u10.animateTargetIndicator(p64, p65) -- Line: 337
    -- upvalues: FIRE_SHEEP_BASE_STATS (copy), TweenService (copy)
    local TargetIndicator = p65.Rotating.Sheep.TargetIndicator;
    local v66 = p64.fireSheepStatMap[p65];

    if v66 ~= nil then
        v66 = v66.enterSearchRadius;
    end;

    if v66 == nil then
        v66 = FIRE_SHEEP_BASE_STATS.enterSearchRadius;
    end;

    TargetIndicator.MaxDistance = v66 + 3;

    if TargetIndicator.Enabled then
        return nil;
    end;

    TargetIndicator.Enabled = true;
    local v67 = TweenService:Create(TargetIndicator, TweenInfo.new(0.75, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        StudsOffset = Vector3.new(0, 2.5, 0)
    });
    v67:Play();
    v67.Completed:Connect(function() -- Line: 358
        -- upvalues: TargetIndicator (copy)
        if TargetIndicator ~= nil then
            TargetIndicator.StudsOffset = Vector3.new(0, 1.5, 0);
            TargetIndicator.Enabled = false;
        end;
    end);
end;

u10.initializeTargetIndicator = RuntimeLib.async(function(p68, p69) -- Line: 365
    -- upvalues: FIRE_SHEEP_BASE_STATS (copy)
    local TargetIndicator = p69.Rotating.Sheep:WaitForChild("TargetIndicator", 3);
    TargetIndicator.MaxDistance = FIRE_SHEEP_BASE_STATS.enterSearchRadius + 3;
    TargetIndicator.StudsOffset = Vector3.new(0, 1.5, 0);
    TargetIndicator.Enabled = false;
    TargetIndicator:WaitForChild("ImageLabel").Image = "rbxassetid://12179386990";
end);
u10.recolorTeamIndicator = RuntimeLib.async(function(p70, p71) -- Line: 373
    -- upvalues: TeamController (copy), Players (copy), TweenService (copy)
    local function _(p72) -- Line: 375
        return p72.Name == "Team";
    end;

    local v73 = 0;
    local v74 = {};

    for i, child in p71:WaitForChild("StatueBase"):GetChildren() do
        local _ = i - 1;

        if child.Name == "Team" == true then
            v73 = v73 + 1;
            v74[v73] = child;
        end;
    end;

    if v74 == nil then
        return nil;
    end;

    local v75 = Color3.fromRGB(18, 196, 28);
    local v76 = Color3.fromRGB(191, 28, 28);
    local v77 = TeamController:getTeamById(p71:GetAttribute("Team"));

    if not v77 then
        return nil;
    end;

    local v78 = TeamController:getPlayerTeam(Players.LocalPlayer);

    if not v78 then
        return nil;
    end;

    if v77 == v78 then
        v76 = v75;
    end;

    for _, v in v74 do
        TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
            Color = v76
        }):Play();
    end;
end);

function u10.initializeHayPrompt(u79, u80) -- Line: 409
    -- upvalues: Players (copy), KnitClient2 (copy), DeviceUtil (copy), FireSheepLevel (copy), InventoryUtil (copy), ItemType (copy), default2 (copy)
    local v81 = u80:GetAttribute("PlacedByUserId");

    if v81 == 0 or (v81 ~= v81 or not v81) then
        return nil;
    end;

    local v82 = Players:GetPlayerByUserId(v81);

    if not v82 then
        return nil;
    end;

    if Players.LocalPlayer ~= v82 then
        return nil;
    end;

    local u83 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ActionText = "Feed Purple Hay",
        RequiresLineOfSight = false,
        MaxActivationDistance = 6,
        Parent = u80,
        ClickablePrompt = DeviceUtil.isMobileControls()
    });
    u80:GetAttributeChangedSignal("Level"):Connect(function() -- Line: 428
        -- upvalues: u80 (copy), FireSheepLevel (ref), u83 (copy), u79 (copy)
        local v84 = u80:GetAttribute("Level");

        if v84 == FireSheepLevel.MAX then
            u83:Destroy();
        end;

        if v84 ~= 0 then
            u79:upgradeFireSheepEffect(u80);
            u79:updatePodiumLevel(u80, v84 + 1);
        end;
    end);
    u83.Triggered:Connect(function(p85) -- Line: 438
        -- upvalues: InventoryUtil (ref), ItemType (ref), u80 (copy), FireSheepLevel (ref), default2 (ref)
        if not InventoryUtil.hasEnough(p85, ItemType.PURPLE_HAY_BALE, 1) then
            return nil;
        end;

        if u80:GetAttribute("Level") == FireSheepLevel.MAX then
            return nil;
        end;

        default2.Client:Get("RequestUpgradeFireSheep"):CallServer(u80);
    end);
end;

function u10.updatePodiumLevel(p86, p87, u88) -- Line: 448
    -- upvalues: FireSheepLevelColor (copy)
    local function _(p89) -- Line: 450
        -- upvalues: u88 (copy)
        return p89.Name == "Level" .. tostring(u88);
    end;

    local v90 = nil;

    for i, child in p87.StatueBase.Levels:GetChildren() do
        local _ = i - 1;

        if child.Name == "Level" .. tostring(u88) == true then
            v90 = child;
            break;
        end;
    end;

    if not v90 then
        return nil;
    end;

    v90.Color = FireSheepLevelColor;
    v90.Material = Enum.Material.Neon;
end;

function u10.upgradeFireSheepEffect(p91, p92) -- Line: 469
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.FIRE_SHEEP_UPGRADE);
    local head_mesh = p92.Rotating.Sheep:WaitForChild("head_mesh");

    if head_mesh then
        local function _(p93) -- Line: 474
            if p93:IsA("ParticleEmitter") then
                p93:Emit(5);
            end;
        end;

        for i, child in head_mesh:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child:Emit(5);
            end;
        end;
    end;
end;

function u10.spawnStatueEffect(p94, p95) -- Line: 484
    -- upvalues: Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local Sheep = p95:WaitForChild("Rotating"):WaitForChild("Sheep");
    local v96 = p94:getAnimator(p95);
    local v97 = { Sheep };
    local v98 = Sheep:GetDescendants();
    table.move(v98, 1, #v98, #v97 + 1, v97);

    if Workspace:GetServerTimeNow() < p95:GetAttribute("ActivationTime") then
        local Pedestal = p95.Rotating:WaitForChild("Pedestal");

        if Pedestal ~= nil then
            Pedestal = Pedestal:WaitForChild("SpawnEffectAttachment");
        end;

        if Pedestal then
            local function _(p99) -- Line: 500
                if p99:IsA("ParticleEmitter") then
                    p99:Emit();
                end;
            end;

            for i, child in Pedestal:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child:Emit();
                end;
            end;
        end;

        if v96 then
            AnimationUtil:playAnimation(v96, GameAnimationUtil:getAssetId(AnimationType.FIRE_SHEEP_SPAWN));
        end;

        SoundManager:playSound(GameSound.FIRE_SHEEP_SPAWN, {
            position = p95.Position
        });
    end;
end;

function u10.cleanUpRotation(p100, p101) -- Line: 517
    local v102 = p100.statueRotationMaidMap[p101];

    if v102 then
        v102:DoCleaning();
    end;
end;

function u10.cleanUpAttack(p103, p104) -- Line: 525
    local v105 = p103.statueAttackMaidMap[p104];

    if v105 then
        v105:DoCleaning();
        p103.statueAttackMaidMap[p104] = nil;
    end;
end;

function u10.createFlamethrowerEffect(u106, u107, p108) -- Line: 536
    -- upvalues: u4 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), SoundManager (copy), GameSound (copy)
    if u107.Parent == nil then
        return nil;
    end;

    local u109 = u4.new();
    local UpperTorso = p108:WaitForChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:WaitForChild("BodyFrontAttachment");
    end;

    if not UpperTorso then
        error("Could not find targetAttachment");
    end;

    local v110 = u107.Rotating.Sheep.nose_mesh.FlameSourceAttachment:GetDescendants();
    local v111 = u106:getAnimator(u107);
    local u112 = v111 and AnimationUtil:playAnimation(v111, GameAnimationUtil:getAssetId(AnimationType.FIRE_SHEEP_ATTACK));

    if u112 then
        u109:GiveTask(function() -- Line: 555
            -- upvalues: u112 (copy)
            u112:Destroy();
        end);
    end;

    local FLAMETHROWER_USE = GameSound.FLAMETHROWER_USE;
    local v113 = {
        looped = true
    };
    local v114;

    if p108 == Players.LocalPlayer.Character then
        v114 = nil;
    else
        v114 = u107.Position;
    end;

    v113.position = v114;
    local v115 = SoundManager:playSound(FLAMETHROWER_USE, v113);

    if v115 then
        u109:GiveTask(v115);
    end;

    local u116 = {};

    local function _(u117) -- Line: 570
        -- upvalues: u116 (copy), u109 (copy)
        if u117:IsA("ParticleEmitter") then
            u117.Enabled = true;
            table.insert(u116, u117);
            u109:GiveTask(function() -- Line: 575
                -- upvalues: u117 (copy)
                u117.Enabled = false;
            end);
        end;
    end;

    for i, v in v110 do
        local _ = i - 1;

        if v:IsA("ParticleEmitter") then
            v.Enabled = true;
            table.insert(u116, v);
            u109:GiveTask(function() -- Line: 575
                -- upvalues: v (copy)
                v.Enabled = false;
            end);
        end;
    end;

    u106.statueEffectMap[u107] = u116;
    u109:GiveTask(function() -- Line: 600
        -- upvalues: u106 (copy), u107 (copy)
        local v118 = u106.statueEffectMap[u107];

        if v118 ~= nil then
            table.clear(v118);
        end;
    end);
    u106.statueAttackMaidMap[u107] = u109;
end;

function u10.getAnimator(p119, p120) -- Line: 612
    -- upvalues: u5 (copy)
    local AnimationController = p120.Rotating.Sheep:WaitForChild("AnimationController");

    if not AnimationController then
        return nil;
    end;

    local v121;

    if AnimationController == nil then
        v121 = AnimationController;
    else
        v121 = AnimationController:WaitForChild("Animator");
    end;

    return v121 or u5("Animator", {
        Parent = AnimationController
    });
end;

function u10.getAllFireSheepStatues(p122) -- Line: 629
    -- upvalues: CollectionService (copy)
    return CollectionService:GetTagged("FireSheepStatue");
end;

KnitClient.CreateController(u10.new());

return nil;