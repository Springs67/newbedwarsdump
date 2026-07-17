-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceType = v1.DeviceType;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util");
local SlimeMeta = v5.SlimeMeta;
local SlimeState = v5.SlimeState;
local SlimeType = v5.SlimeType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "SlimeTamerController";
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
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u3 (copy), Workspace (copy)
    BaseKitController.constructor(p8, BedwarsKit.SLIME_TAMER);
    p8.Name = "SlimeTamerController";
    p8.slimeModelFolder = u3("Folder", {
        Name = "SlimeModelFolder",
        Parent = Workspace
    });
    p8.isPreloaded = false;
end;

function u6.onKitLocalActivated(p9, p10) -- Line: 57
    -- upvalues: KnitClient (copy), GameSound (copy), AnimationType (copy), BedwarsImageId (copy)
    if not p9.isPreloaded then
        KnitClient.Controllers.PreloadController:runPreload({
            sounds = {
                GameSound.SLIME_ALERT_1,
                GameSound.SLIME_OK_1,
                GameSound.SLIME_ALERT_2,
                GameSound.SLIME_OK_2,
                GameSound.SLIME_ALERT_3,
                GameSound.SLIME_OK_3,
                GameSound.SLIME_ALERT_4,
                GameSound.SLIME_OK_4,
                GameSound.SLIME_BOUNCE_1,
                GameSound.SLIME_BOUNCE_2,
                GameSound.SLIME_BOUNCE_3,
                GameSound.SLIME_BOUNCE_4
            },
            animations = { AnimationType.SLIME_IDLE, AnimationType.SLIME_JUMP, AnimationType.SLIME_MOVEMENT },
            imageIds = { BedwarsImageId.SLIME_CYCLE, BedwarsImageId.SLIME_DIRECT }
        });
        p9.isPreloaded = true;
    end;
end;

function u6.onKitReplicationActivated(u11, p12) -- Line: 67
    -- upvalues: Workspace (copy), WatchCollectionTag (copy), WatchCharacter (copy), Players (copy), KnitClient (copy)
    task.spawn(function() -- Line: 68
        -- upvalues: u11 (copy), Workspace (ref)
        u11.slimeDataFolder = Workspace:WaitForChild("SlimeDataFolder");
    end);
    p12:GiveTask(WatchCollectionTag("SlimeData", function(p13) -- Line: 71
        -- upvalues: u11 (copy)
        u11:createSlimeModel(p13);
    end));
    p12:GiveTask(WatchCharacter(function(u14, u15) -- Line: 75
        -- upvalues: Players (ref), u11 (copy), KnitClient (ref)
        u15:GetAttributeChangedSignal("FrostySlimeSlow"):Connect(function() -- Line: 76
            -- upvalues: u15 (copy), Players (ref), u14 (copy), u11 (ref), KnitClient (ref)
            if u15:GetAttribute("FrostySlimeSlow") == nil then
                if Players.LocalPlayer == u14 and u11.speedMaid then
                    u11.speedMaid:Destroy();
                    u11.speedMaid = nil;
                end;
            elseif Players.LocalPlayer == u14 then
                u11.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = false,
                    moveSpeedMultiplier = u15:GetAttribute("FrostySlimeSlow")
                });
            end;
        end);
    end));
end;

function u6.onKitLocalDeactivated(p16) -- Line: 93
end;

function u6.onKitReplicationDeactivated(p17) -- Line: 95
end;

function u6.onInnateAbilityEnabled(p18, p19, p20) -- Line: 97
end;

function u6.onAbilityUsed(p21, p22, p23) -- Line: 99
end;

function u6.createSlimeModel(p24, u25) -- Line: 101
    -- upvalues: u2 (copy), Players (copy), u3 (copy), CollectionService (copy), GameAnimationUtil (copy), AnimationType (copy), SlimeState (copy), GameSound (copy), SoundManager (copy), RandomUtil (copy), SlimeMeta (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), DeviceUtil (copy), DeviceType (copy), RunService (copy)
    u25:WaitForChild("Following");
    u25:WaitForChild("Tamer");

    if u25.Parent == nil then
        return nil;
    end;

    u25:GetAttribute("Id");
    local u26 = u25:GetAttribute("SlimeType");
    local u27 = u2.new();
    u25.AncestryChanged:Connect(function(p28, p29) -- Line: 110
        -- upvalues: u27 (copy)
        if p29 == nil then
            u27:DoCleaning();
        end;
    end);
    local v30 = Players:GetPlayerByUserId(u25.Tamer.Value);

    if not v30 then
        return nil;
    end;

    local u31 = p24:getSlimeModel(u26);

    if v30 ~= nil then
        v30 = v30.Name;
    end;

    u31.Name = u31.Name .. "_" .. v30;

    local function _(p32) -- Line: 127
        if p32:IsA("BasePart") then
            p32.CastShadow = false;
        end;
    end;

    for i, descendant in u31:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CastShadow = false;
        end;
    end;

    u3("ObjectValue", {
        Name = "SlimeData",
        Value = u25,
        Parent = u31
    });
    u31.Parent = p24.slimeModelFolder;
    CollectionService:AddTag(u31, "SlimeModel");
    u27:GiveTask(function() -- Line: 142
        -- upvalues: u31 (copy)
        u31:Destroy();
    end);
    local Animator = u31.AnimationController.Animator;

    local function _(p33) -- Line: 148
        -- upvalues: u27 (copy)
        if p33:IsA("BasePart") then
            u27:GiveTask(p33.AncestryChanged:Connect(function(p34, p35) -- Line: 150
                -- upvalues: u27 (ref)
                if p35 == nil then
                    u27:DoCleaning();
                end;
            end));
        end;
    end;

    for i, descendant in u31:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            u27:GiveTask(descendant.AncestryChanged:Connect(function(p36, p37) -- Line: 150
                -- upvalues: u27 (copy)
                if p37 == nil then
                    u27:DoCleaning();
                end;
            end));
        end;
    end;

    local function u42(u38) -- Line: 160
        -- upvalues: u31 (copy)
        local v39 = u31:GetDescendants();

        local function v41(p40) -- Line: 162
            -- upvalues: u38 (copy)
            if p40:IsA("BasePart") then
                p40.LocalTransparencyModifier = u38;

                return;
            end;

            if p40:IsA("ParticleEmitter") or (p40:IsA("Trail") or p40:IsA("Beam")) then
                if u38 == 1 then
                    p40.Enabled = false;

                    return;
                end;

                if u38 == 0 then
                    p40.Enabled = true;
                end;
            end;
        end;

        for i, v in v39 do
            v41(v, i - 1, v39);
        end;
    end;

    local u43 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SLIME_IDLE));
    u43.Priority = Enum.AnimationPriority.Movement;
    u43.Looped = true;
    local u44 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SLIME_MOVEMENT));
    u44.Priority = Enum.AnimationPriority.Movement;
    u44.Looped = true;
    local u45 = 0;
    local PrimaryPart = u31.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if PrimaryPart == nil then
        PrimaryPart = CFrame.new();
    end;

    local u46 = PrimaryPart;
    local u47 = 0;
    local u48 = u25:GetAttribute("SlimeState");
    local u49 = u2.new();

    local function u61(p50) -- Line: 202
        -- upvalues: u45 (ref), u48 (ref), u31 (copy), u46 (ref), u49 (copy), SlimeState (ref), u43 (copy), u44 (copy), u47 (ref), GameSound (ref), SoundManager (ref), RandomUtil (ref), SlimeMeta (ref), u26 (copy)
        u45 = tick();
        u48 = p50;
        local PrimaryPart2 = u31.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.CFrame;
        end;

        if PrimaryPart2 == nil then
            PrimaryPart2 = CFrame.new();
        end;

        u46 = PrimaryPart2;
        u49:DoCleaning();

        if p50 == SlimeState.IDLE then
            local v51 = u43;

            if v51 ~= nil then
                v51:Play();
            end;

            u43.TimePosition = math.random() * 5;
            u49:GiveTask(function() -- Line: 221
                -- upvalues: u43 (ref)
                local v52 = u43;

                if v52 ~= nil then
                    v52:Stop();
                end;
            end);
        elseif p50 == SlimeState.CHANGING_PLAYER then
            local v53 = u44;

            if v53 ~= nil then
                v53:Play();
            end;

            u49:GiveTask(function() -- Line: 232
                -- upvalues: u44 (ref)
                local v54 = u44;

                if v54 ~= nil then
                    v54:Stop();
                end;
            end);
        end;

        if p50 == SlimeState.CHANGING_PLAYER and tick() - u47 > 1 then
            u47 = tick();
            local u55 = {
                GameSound.SLIME_BOUNCE_1,
                GameSound.SLIME_BOUNCE_2,
                GameSound.SLIME_BOUNCE_3,
                GameSound.SLIME_BOUNCE_4
            };
            task.spawn(function() -- Line: 243
                -- upvalues: SoundManager (ref), RandomUtil (ref), u55 (copy), u31 (ref)
                local v56 = false;
                local v57 = 0;

                while true do
                    if v56 then
                        v57 = v57 + 1;
                    else
                        v56 = true;
                    end;

                    if v57 >= 2 then
                        return;
                    end;

                    local v58 = RandomUtil.fromList(unpack(u55));
                    local v59 = {};
                    local PrimaryPart3 = u31.PrimaryPart;

                    if PrimaryPart3 ~= nil then
                        PrimaryPart3 = PrimaryPart3.Position;
                    end;

                    v59.position = PrimaryPart3;
                    v59.parent = u31.PrimaryPart;
                    v59.volumeMultiplier = 0.7;
                    SoundManager:playSound(v58, v59);
                    task.wait(0.35);
                end;
            end);
            task.delay(1, function() -- Line: 272
                -- upvalues: SoundManager (ref), SlimeMeta (ref), u26 (ref), u31 (ref)
                local okSound = SlimeMeta[u26].okSound;
                local v60 = {};
                local PrimaryPart3 = u31.PrimaryPart;

                if PrimaryPart3 ~= nil then
                    PrimaryPart3 = PrimaryPart3.Position;
                end;

                v60.position = PrimaryPart3;
                v60.volumeMultiplier = 0.7;
                SoundManager:playSound(okSound, v60);
            end);
        end;
    end;

    u27:GiveTask(u25:GetAttributeChangedSignal("SlimeState"):Connect(function() -- Line: 288
        -- upvalues: u61 (copy), u25 (copy)
        u61(u25:GetAttribute("SlimeState"));
    end));
    u61(u25:GetAttribute("SlimeState"));
    local Value = u25.Following.Value;
    local u62;

    if Value == 0 or (Value ~= Value or not Value) then
        u62 = nil;
    else
        u62 = Players:GetPlayerByUserId(Value);
    end;

    u25.Following.Changed:Connect(function() -- Line: 298
        -- upvalues: u31 (copy), Value (ref), u25 (copy), u62 (ref), Players (ref), u42 (copy), ReplicatedStorage (ref), Workspace (ref), SlimeMeta (ref), u26 (copy)
        local u63 = u31:GetPivot();
        Value = u25.Following.Value;

        if Value ~= 0 and (Value == Value and Value) then
            u62 = Players:GetPlayerByUserId(Value);
        end;

        task.spawn(function() -- Line: 305
            -- upvalues: u62 (ref), u31 (ref), u42 (ref), ReplicatedStorage (ref), Workspace (ref), u63 (copy), SlimeMeta (ref), u26 (ref)
            local v64 = u62;

            if v64 ~= nil then
                v64 = v64.Character;
            end;

            if v64 then
                v64 = (u62.Character:GetPivot().Position - u31:GetPivot().Position).Magnitude > 50;
            end;

            if v64 then
                u42(1);
                local u65 = ReplicatedStorage.Assets.Effects.TeleportEffect:Clone();
                u65.Parent = Workspace;
                local u66 = ReplicatedStorage.Assets.Effects.AppearEffect:Clone();
                u66.Parent = Workspace;
                u65:PivotTo(u63);

                local function _(p67) -- Line: 324
                    -- upvalues: SlimeMeta (ref), u26 (ref)
                    if p67:IsA("ParticleEmitter") then
                        p67.Color = ColorSequence.new(SlimeMeta[u26].color);
                        p67:Emit(15);
                    end;
                end;

                for i, child in u65:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child.Color = ColorSequence.new(SlimeMeta[u26].color);
                        child:Emit(15);
                    end;
                end;

                task.delay(0.8, function() -- Line: 333
                    -- upvalues: u65 (copy), u66 (copy), u31 (ref), SlimeMeta (ref), u26 (ref)
                    u65:Destroy();
                    u66:PivotTo(u31:GetPivot());
                    local v68 = u66:GetDescendants();

                    local function v70(p69) -- Line: 337
                        -- upvalues: SlimeMeta (ref), u26 (ref)
                        if p69:IsA("ParticleEmitter") then
                            p69.Color = ColorSequence.new(SlimeMeta[u26].color);

                            if p69.Name == "Pulse" then
                                p69:Emit(1);

                                return;
                            end;

                            p69:Emit(10);
                        end;
                    end;

                    for i, v in v68 do
                        v70(v, i - 1, v68);
                    end;

                    task.delay(0.5, function() -- Line: 350
                        -- upvalues: u66 (ref)
                        u66:Destroy();
                    end);
                end);
            end;
        end);
    end);
    local u71 = u3("Part", {
        Size = Vector3.new(0, 0, 0),
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Parent = u31
    });
    GameQueryUtil:setQueryIgnored(u71, true);
    GameQueryUtil:setQueryIgnored(u31, true);

    local function _(p72) -- Line: 368
        return p72.Name == "stretch.B";
    end;

    local u73 = nil;

    for i, descendant in u31:GetDescendants() do
        local _ = i - 1;

        if descendant.Name == "stretch.B" == true then
            u73 = descendant;
            break;
        end;
    end;

    local u74 = DeviceUtil.guessCurrentDeviceType() == DeviceType.Mobile;
    u27:GiveTask(RunService.Heartbeat:Connect(function(p75) -- Line: 382
        -- upvalues: Value (ref), u62 (ref), u31 (copy), u26 (copy), u74 (copy), GameQueryUtil (ref), u45 (ref), u48 (ref), SlimeState (ref), u42 (copy), u46 (ref), u73 (copy), u71 (copy)
        if Value == nil then
            return nil;
        end;

        if not u62 then
            return nil;
        end;

        if not u62.Character then
            return nil;
        end;

        if not u62.Character.PrimaryPart then
            return nil;
        end;

        if not u31.PrimaryPart then
            return nil;
        end;

        local v76 = select(2, u62.Character.PrimaryPart:GetPivot():ToOrientation());
        local v77 = u26 % 6 / 6 * 6.283185307179586 - v76;
        local v78 = math.cos(v77) * 3.5;
        local v79 = math.sin(v77) * 3.5;
        local v80 = Vector3.new(v78, -2, v79);
        local v81 = u62.Character.PrimaryPart.CFrame + v80;

        if not u74 then
            local v82 = RaycastParams.new();
            v82.CollisionGroup = "Players";
            v82.FilterDescendantsInstances = { u31, u62.Character };
            v82.FilterType = Enum.RaycastFilterType.Exclude;
            local v84 = GameQueryUtil:raycast(v81.Position + Vector3.new(0, 9, 0), Vector3.new(0, -30, 0), v82, {
                ignorePart = function(p83) -- Line: 418, Name: ignorePart
                    return p83.CanCollide == false;
                end
            });
            local v85;

            if v84 == nil then
                v85 = v84;
            else
                v85 = v84.Position;
            end;

            if v85 then
                local v86 = math.cos(v77) * 3.5;
                local v87 = v84.Position.Y - v81.Position.Y - 1;
                local v88 = math.sin(v77) * 3.5;
                local v89 = Vector3.new(v86, v87, v88);
                v81 = u62.Character.PrimaryPart.CFrame + v89;
            end;
        end;

        local v90 = tick() - u45;

        if u48 == SlimeState.IDLE then
            u42(0);
            u31:PivotTo((u46:Lerp(v81, (math.clamp(v90 / 0.3, 0, 1)))));
        elseif u48 == SlimeState.CHANGING_PLAYER then
            local v91 = u46:Lerp(v81, (math.clamp(v90 / 0.8, 0, 1)));

            if (v91.Position - v81.Position).Magnitude > 0.01 then
                v91 = CFrame.new(v91.Position, v81.Position);
            end;

            u31:PivotTo(v91);
        end;

        u71.CFrame = u73.TransformedWorldCFrame;
    end));
end;

function u6.getSlimeModel(p92, p93) -- Line: 453
    -- upvalues: SlimeType (copy), ReplicatedStorage (copy)
    if p93 == SlimeType.VOID then
        return ReplicatedStorage.Assets.Misc.Slimes.VoidSlime:Clone();
    end;

    if p93 == SlimeType.FROSTY then
        return ReplicatedStorage.Assets.Misc.Slimes.FrostySlime:Clone();
    end;

    if p93 == SlimeType.HEALING then
        return ReplicatedStorage.Assets.Misc.Slimes.HealSlime:Clone();
    end;

    local _ = p93 == SlimeType.STICKY;

    return ReplicatedStorage.Assets.Misc.Slimes.StickySlime:Clone();
end;

function u6.getFollowingSlimeData(p94, u95) -- Line: 476
    -- upvalues: CollectionService (copy)
    local function _(p96) -- Line: 478
        -- upvalues: u95 (copy)
        return p96.Following.Value == u95;
    end;

    local v97 = 0;
    local v98 = {};

    for i, v in CollectionService:GetTagged("SlimeData") do
        local _ = i - 1;

        if v.Following.Value == u95 == true then
            v97 = v97 + 1;
            v98[v97] = v;
        end;
    end;

    return v98;
end;

function u6.getTamedSlimeData(p99, u100) -- Line: 493
    -- upvalues: CollectionService (copy)
    local function _(p101) -- Line: 495
        -- upvalues: u100 (copy)
        return p101.Tamer.Value == u100;
    end;

    local v102 = 0;
    local v103 = {};

    for i, v in CollectionService:GetTagged("SlimeData") do
        local _ = i - 1;

        if v.Tamer.Value == u100 == true then
            v102 = v102 + 1;
            v103[v102] = v;
        end;
    end;

    return v103;
end;

function u6.getTamedSlimeOfType(p104, u105, u106) -- Line: 510
    -- upvalues: CollectionService (copy)
    local function _(p107) -- Line: 512
        -- upvalues: u105 (copy), u106 (copy)
        local v108;

        if p107.Tamer.Value == u105 then
            v108 = p107:GetAttribute("SlimeType") == u106;
        else
            v108 = false;
        end;

        return v108;
    end;

    local v109 = 0;
    local v110 = {};

    for i, v in CollectionService:GetTagged("SlimeData") do
        local _ = i - 1;
        local v111;

        if v.Tamer.Value == u105 then
            v111 = v:GetAttribute("SlimeType") == u106;
        else
            v111 = false;
        end;

        if v111 == true then
            v109 = v109 + 1;
            v110[v109] = v;
        end;
    end;

    return v110;
end;

function u6.getTamedSlimeTypes(p112, p113) -- Line: 527
    local u114 = {};

    local function _(p115) -- Line: 530
        -- upvalues: u114 (copy)
        local v116 = p115:GetAttribute("SlimeType");

        if table.find(u114, v116) == nil then
            table.insert(u114, v116);
        end;
    end;

    for i, v in p112:getTamedSlimeData(p113) do
        local _ = i - 1;
        local v117 = v:GetAttribute("SlimeType");

        if table.find(u114, v117) == nil then
            table.insert(u114, v117);
        end;
    end;

    return u114;
end;

KnitClient.CreateController(u6.new());

return nil;