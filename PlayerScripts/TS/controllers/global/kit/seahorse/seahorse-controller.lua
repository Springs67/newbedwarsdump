-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "base-kit-controller").BaseKitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SeahorseUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "seahorse", "seahorse-util").SeahorseUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local SeahorseDisplay = RuntimeLib.import(script, script.Parent, "seahorse-display").SeahorseDisplay;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "SeahorseController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 37
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 41
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy)
    BaseKitController.constructor(p7, BedwarsKit.SEAHORSE, {
        imageIds = { "rbxassetid://11902486870", "rbxassetid://11902487235", "rbxassetid://11902487139", "rbxassetid://11902486968" },
        sounds = {
            GameSound.SEAHORSE_DAMAGE_BEAM,
            GameSound.SEAHORSE_DAMAGE_SHOT_1,
            GameSound.SEAHORSE_DAMAGE_SHOT_2,
            GameSound.SEAHORSE_EVOLVE_1,
            GameSound.SEAHORSE_EVOLVE_2,
            GameSound.SEAHORSE_EVOLVE_3,
            GameSound.SEAHORSE_FREEZE,
            GameSound.SEAHORSE_HEAL_BEAM,
            GameSound.SEAHORSE_HEAL_SHOT_1,
            GameSound.SEAHORSE_HEAL_SHOT_2,
            GameSound.SEAHORSE_SPEEDUP
        },
        animations = {
            AnimationType.SEAHORSE_BEAM,
            AnimationType.SEAHORSE_IDLE_LOOP,
            AnimationType.SEAHORSE_SHOOT,
            AnimationType.SEAHORSE_SPAWN,
            AnimationType.SEAHORSE_SWIM_LOOP
        }
    });
    p7.Name = "SeahorseController";
    p7.seahorseMap = {};
end;

function u5.KnitStart(p8) -- Line: 50
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p8);
end;

function u5.onKitLocalActivated(u9, p10) -- Line: 53
    -- upvalues: default2 (copy), KnitClient (copy), u3 (copy), SeahorseDisplay (copy)
    p10:GiveTask(default2.Client:Get("UpdateSeahorseStacks"):Connect(function(p11) -- Line: 54
        -- upvalues: u9 (copy), KnitClient (ref), u3 (ref), SeahorseDisplay (ref)
        if u9.stackStatusTree then
            u3.update(u9.stackStatusTree, u3.createElement(SeahorseDisplay, {
                stacks = p11.stacks
            }));

            return;
        end;

        u9.stackStatusTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u3.createElement(SeahorseDisplay, {
            stacks = p11.stacks
        }));
    end));
end;

function u5.onKitLocalDeactivated(p12) -- Line: 66
    -- upvalues: u3 (copy)
    if p12.stackStatusTree then
        u3.unmount(p12.stackStatusTree);
        p12.stackStatusTree = nil;
    end;
end;

function u5.onKitReplicationActivated(u13, u14) -- Line: 72
    -- upvalues: WatchCollectionTag (copy), default2 (copy), Players (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), u2 (copy), Workspace (copy), RandomUtil (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), SeahorseUtil (copy), Linear (copy), EffectUtil (copy), RunService (copy)
    u14:GiveTask(WatchCollectionTag("seahorse_data", function(p15) -- Line: 73
        -- upvalues: u14 (copy), u13 (copy)
        u14:GiveTask(u13:registerSeahorseData(p15));
    end));
    u14:GiveTask(default2.Client:Get("SeahorseBeamBlast"):Connect(function(p16) -- Line: 76
        -- upvalues: Players (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
        local PrimaryPart = p16.target.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local v17 = p16.target == Players.LocalPlayer.Character;

        if v17 then
            local u18 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = p16.heal and 1.2 or 0.3
            });
            task.delay(p16.heal and 2.5 or 0.5, function() -- Line: 90
                -- upvalues: u18 (copy)
                u18.Destroy();
            end);
        end;

        local v19;

        if p16.heal then
            v19 = GameSound.SEAHORSE_SPEEDUP;
        else
            v19 = GameSound.SEAHORSE_FREEZE;
        end;

        local v20 = {};

        if v17 then
            PrimaryPart = nil;
        end;

        v20.position = PrimaryPart;
        SoundManager:playSound(v19, v20);
    end));
    u14:GiveTask(default2.Client:Get("SeahorseBasicShot"):Connect(function(u21) -- Line: 98
        -- upvalues: u13 (copy), ReplicatedStorage (ref), u2 (ref), Workspace (ref), RandomUtil (ref), GameSound (ref), SoundManager (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref), SeahorseUtil (ref), Linear (ref), EffectUtil (ref)
        local u22 = u13.seahorseMap[u21.fromSeahorseId];
        local v23;

        if u22 == nil then
            v23 = u22;
        else
            v23 = u22.model;
        end;

        local PrimaryPart = u21.target.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Parent;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local seahorse = ReplicatedStorage.Assets.Effects.seahorse;
        local u24 = u2.new();
        local u25 = true;
        u24:GiveTask(function() -- Line: 117
            -- upvalues: u25 (ref)
            u25 = false;

            return u25;
        end);
        local v26, v27;

        if u22 then
            u22.inAction = true;
            u22.target = u21.target;
            u24:GiveTask(function() -- Line: 124
                -- upvalues: u22 (copy)
                u22.inAction = false;
                u22.target = nil;
            end);
            v26 = false;
            v27 = 0;
        else
            v26 = false;
            v27 = 0;
        end;

        while true do
            if true then
                if v26 then
                    v27 = v27 + 1;
                else
                    v26 = true;
                end;
            end;

            if v27 >= u21.shotCount or not u25 then
                break;
            end;

            local v28;

            if v23 == nil then
                v28 = v23;
            else
                v28 = v23.Parent;
            end;

            if not v28 then
                break;
            end;

            local Position = v23.RootPart.start.Position;
            local v29;

            if u21.heal then
                v29 = seahorse.heal_shard;
            else
                v29 = seahorse.damage_shard;
            end;

            local u30 = v29:Clone();
            u30.Parent = Workspace;
            local v31;

            if u21.heal then
                v31 = RandomUtil.fromList(GameSound.SEAHORSE_HEAL_SHOT_1, GameSound.SEAHORSE_HEAL_SHOT_2);
            else
                v31 = RandomUtil.fromList(GameSound.SEAHORSE_DAMAGE_SHOT_1, GameSound.SEAHORSE_DAMAGE_SHOT_2);
            end;

            local v32 = {};
            local v33;

            if u22 == nil then
                v33 = u22;
            else
                v33 = u22.data.Owner.Value;
            end;

            local v34;

            if v33 == Players.LocalPlayer.Character then
                v34 = nil;
            else
                v34 = Position;
            end;

            v32.position = v34;
            v32.playbackSpeedMultiplier = 0.95 + math.random() * 0.1;
            SoundManager:playSound(v31, v32);
            local Animator = v23.AnimationController:FindFirstChild("Animator");

            if Animator then
                GameAnimationUtil:playAnimation(Animator, AnimationType.SEAHORSE_SHOOT);
            end;

            local u37 = default(SeahorseUtil.BASIC_SHOT_TRAVEL_DURATION_SEC, Linear, function(p35) -- Line: 166
                -- upvalues: u21 (copy), u24 (copy), Position (copy), u30 (copy)
                local PrimaryPart2 = u21.target.PrimaryPart;

                if PrimaryPart2 ~= nil then
                    PrimaryPart2 = PrimaryPart2.CFrame.Position;
                end;

                if not PrimaryPart2 then
                    return u24:DoCleaning();
                end;

                local v36 = Position:Lerp(PrimaryPart2, p35);
                u30.CFrame = CFrame.new(v36, PrimaryPart2 + (PrimaryPart2 - Position).Unit);
                u30.CFrame = u30.CFrame * CFrame.Angles(0, 0, 3.141592653589793 * (u21.heal and 1 or -1));
            end);
            u24:GiveTask(function() -- Line: 182
                -- upvalues: u37 (copy)
                return u37:Cancel();
            end);
            task.spawn(function() -- Line: 185
                -- upvalues: u37 (copy), u21 (copy), seahorse (copy), EffectUtil (ref), u30 (copy), Workspace (ref), RandomUtil (ref), GameSound (ref), SoundManager (ref), Players (ref)
                u37:Wait();
                local v38;

                if u21.heal then
                    v38 = seahorse.heal_impact;
                else
                    v38 = seahorse.damage_impact;
                end;

                local v39 = v38:Clone();
                EffectUtil:disableEffects(v39:GetDescendants());
                local Position2 = u30.CFrame.Position;
                v39.Position = Position2;
                v39.Parent = Workspace;
                EffectUtil:playEffects({ v39 }, u21.target, {
                    destroyAfterSec = 3
                });
                u30:Destroy();
                local v40;

                if u21.heal then
                    v40 = RandomUtil.fromList(GameSound.TRINITY_LIGHT_ORB_HEAL);
                else
                    v40 = RandomUtil.fromList(GameSound.ICICLE_IMPACT_1, GameSound.ICICLE_IMPACT_2);
                end;

                local v41 = {};

                if u21.target == Players.LocalPlayer.Character then
                    Position2 = nil;
                end;

                v41.position = Position2;
                v41.playbackSpeedMultiplier = 0.95 + math.random() * 0.1;
                v41.volumeMultiplier = u21.heal and 0.4 or 1;
                SoundManager:playSound(v40, v41);
            end);
            task.wait(SeahorseUtil.TIME_BETWEEN_BASIC_SHOT_SEC);
        end;

        if u22 then
            u22.target = nil;
            task.delay(0.2, function() -- Line: 208
                -- upvalues: u22 (copy)
                u22.inAction = false;
            end);
        end;
    end));
    u14:GiveTask(default2.Client:Get("SeahorseShootBeam"):Connect(function(u42) -- Line: 213
        -- upvalues: ReplicatedStorage (ref), u13 (copy), u2 (ref), GameSound (ref), SoundManager (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), Workspace (ref), default (ref), Linear (ref), RunService (ref), SeahorseUtil (ref)
        local v43;

        if u42.heal then
            v43 = Color3.fromRGB(70, 253, 42);
        else
            v43 = Color3.fromRGB(188, 231, 249);
        end;

        local seahorse = ReplicatedStorage.Assets.Effects.seahorse;
        local u44 = u13.seahorseMap[u42.fromSeahorseId];

        if not u44 then
            return nil;
        end;

        local model = u44.model;
        local PrimaryPart = u42.target.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Parent;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u45 = u2.new();
        local u46 = true;
        u45:GiveTask(function() -- Line: 232
            -- upvalues: u46 (ref)
            u46 = false;
        end);

        if u44 then
            u44.inAction = true;
            u44.target = u42.target;
            u45:GiveTask(function() -- Line: 238
                -- upvalues: u44 (copy)
                u44.inAction = false;
                u44.target = nil;
            end);
        end;

        u44.beamMaid = u45;
        local start = model.RootPart.start;
        local v47;

        if u42.heal then
            v47 = GameSound.SEAHORSE_HEAL_BEAM;
        else
            v47 = GameSound.SEAHORSE_DAMAGE_BEAM;
        end;

        local v48 = {};

        if u44 ~= nil then
            u44 = u44.data.Owner.Value;
        end;

        local v49;

        if u44 == Players.LocalPlayer.Character then
            v49 = nil;
        else
            v49 = start.Position;
        end;

        v48.position = v49;
        SoundManager:playSound(v47, v48);
        local Animator = model.AnimationController:FindFirstChild("Animator");
        local u50 = Animator and GameAnimationUtil:playAnimation(Animator, AnimationType.SEAHORSE_BEAM);

        if u50 then
            u45:GiveTask(function() -- Line: 259
                -- upvalues: u50 (copy)
                return u50:Stop(0.1);
            end);
        end;

        for _, descendant in start:GetDescendants() do
            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = true;
                descendant.Color = ColorSequence.new(v43);
                u45:GiveTask(function() -- Line: 268
                    -- upvalues: descendant (copy)
                    descendant.Enabled = false;

                    return descendant.Enabled;
                end);
            end;
        end;

        local v51;

        if u42.heal then
            v51 = seahorse.heal_impact;
        else
            v51 = seahorse.damage_impact;
        end;

        local u52 = v51:Clone();
        u45:GiveTask(u52);
        local v53 = u52:FindFirstChild("end");

        for _, child in model.Beam:GetChildren() do
            if child:IsA("Beam") then
                child.Color = ColorSequence.new(v43);
                child.Attachment1 = v53;
                child.Enabled = true;
                u45:GiveTask(function() -- Line: 284
                    -- upvalues: child (copy)
                    child.Enabled = false;

                    return child.Enabled;
                end);
            end;
        end;

        local CFrame2 = start.CFrame;
        u52.CFrame = CFrame2;
        u52.Parent = Workspace;
        local u56 = default(0.2, Linear, function(p54) -- Line: 292
            -- upvalues: u42 (copy), u45 (copy), CFrame2 (copy), u52 (copy)
            local PrimaryPart2 = u42.target.PrimaryPart;

            if PrimaryPart2 ~= nil then
                PrimaryPart2 = PrimaryPart2.Position;
            end;

            if not PrimaryPart2 then
                return u45:DoCleaning();
            end;

            local v55 = CFrame2.Position:Lerp(PrimaryPart2, p54);
            u52.CFrame = CFrame.new(v55, PrimaryPart2 + (PrimaryPart2 - CFrame2.Position).Unit);
        end);
        u45:GiveTask(function() -- Line: 306
            -- upvalues: u56 (copy)
            return u56:Cancel();
        end);
        task.spawn(function() -- Line: 309
            -- upvalues: u56 (copy), u46 (ref), u45 (copy), RunService (ref), u42 (copy), u52 (copy)
            u56:Wait();

            if not u46 then
                return nil;
            end;

            u45:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 314
                -- upvalues: u42 (ref), u45 (ref), u52 (ref)
                if not u42.target.PrimaryPart then
                    return u45:DoCleaning();
                end;

                u52.Position = u42.target.PrimaryPart.Position;
            end));
        end);
        task.delay(SeahorseUtil.BEAM_DURATION_SEC, function() -- Line: 321
            -- upvalues: u45 (copy)
            u45:DoCleaning();
        end);
    end));
    u14:GiveTask(default2.Client:Get("SeahorseBeamEnd"):Connect(function(p57) -- Line: 325
        -- upvalues: u13 (copy)
        local v58 = u13.seahorseMap[p57.fromSeahorseId];

        if v58 ~= nil then
            local beamMaid = v58.beamMaid;

            if beamMaid ~= nil then
                beamMaid:DoCleaning();
            end;
        end;
    end));
end;

function u5.onKitReplicationDeactivated(p59) -- Line: 337
end;

function u5.onInnateAbilityEnabled(p60, p61, p62) -- Line: 339
end;

function u5.onAbilityUsed(p63, p64, p65) -- Line: 341
end;

function u5.registerSeahorseData(u66, u67) -- Line: 343
    -- upvalues: u2 (copy)
    u67:WaitForChild("Loaded");
    local u68 = u2.new();
    u68:GiveTask(u67.AncestryChanged:Connect(function() -- Line: 346
        -- upvalues: u68 (copy)
        u68:DoCleaning();
    end));
    local u69 = u2.new();
    u68:GiveTask(u69);
    u69:GiveTask(u66:spawnSeahorse(u67));
    u68:GiveTask(u67:GetAttributeChangedSignal("Level"):Connect(function() -- Line: 352
        -- upvalues: u69 (copy), u66 (copy), u67 (copy)
        u69:DoCleaning();
        u69:GiveTask(u66:spawnSeahorse(u67, true));
    end));

    return u68;
end;

function u5.spawnSeahorse(u70, u71, p72) -- Line: 358
    -- upvalues: u2 (copy), EntityUtil (copy), ReplicatedStorage (copy), Players (copy), RunService (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    if p72 == nil then
        p72 = false;
    end;

    local u73 = u2.new();
    local Owner = u71:WaitForChild("Owner", 1);

    if Owner ~= nil then
        Owner = Owner.Value;
    end;

    local v74;

    if Owner == nil then
        v74 = Owner;
    else
        v74 = Owner:IsA("Model");
    end;

    if not v74 then
        return u73;
    end;

    local u75 = EntityUtil:getEntity(Owner);
    local v76;

    if u75 == nil then
        v76 = u75;
    else
        v76 = u75:isAlive();
    end;

    if not v76 then
        return u73;
    end;

    local u77 = ReplicatedStorage.Assets.Misc.seahorse:FindFirstChild("level_" .. tostring(u71:GetAttribute("Level"))):Clone();
    u70.seahorseMap[u71:GetAttribute("Id")] = {
        model = u77,
        data = u71
    };
    print("SPAWNING: " .. tostring(u71:GetAttribute("Id")));
    u73:GiveTask(u77);
    local AnimationController = u77:FindFirstChild("AnimationController");

    if AnimationController ~= nil then
        AnimationController = AnimationController:FindFirstChild("Animator");
    end;

    local v78;

    if Owner == Players.LocalPlayer.Character then
        v78 = RunService.RenderStepped;
    else
        v78 = RunService.Heartbeat;
    end;

    local u79 = 50;
    local Position = u77:GetPivot().Position;
    local Position2 = u77:GetPivot().Position;
    local u80 = true;
    local u81 = Vector3.new(0, 0, 0);
    local u82 = nil;
    u73:GiveTask(v78:Connect(function(p83) -- Line: 406
        -- upvalues: u75 (copy), u73 (copy), Position (ref), u70 (copy), u71 (copy), u80 (ref), u82 (ref), u79 (ref), AnimationController (copy), GameAnimationUtil (ref), AnimationType (ref), u77 (copy), u81 (ref), Position2 (ref)
        if not u75:isAlive() then
            return u73:DoCleaning();
        end;

        local v84 = u75:getInstance():GetPrimaryPartCFrame();
        Position = v84 * Vector3.new(-3, 1.5, 0);
        local v85 = u70.seahorseMap[u71:GetAttribute("Id")];
        local v86;

        if v85 == nil then
            v86 = v85;
        else
            v86 = v85.inAction;
        end;

        if u80 then
            local v87 = u82;

            if v87 ~= nil then
                v87:Stop();
            end;

            local v88 = u82;

            if v88 ~= nil then
                v88:Destroy();
            end;

            u82 = nil;
        end;

        if not u80 and v86 then
            u79 = 0;
        end;

        if not (u80 or v86) then
            u79 = math.min(u79 + 50 * p83 * 2, 50);

            if AnimationController and not u82 then
                u82 = GameAnimationUtil:playAnimation(AnimationController, AnimationType.SEAHORSE_SWIM_LOOP, {
                    looped = true
                });
            end;
        end;

        local Position3 = u77:GetPrimaryPartCFrame().Position;
        local Magnitude = (Position - Position3).Magnitude;
        local v89;

        if Magnitude > 60 then
            v89 = Position;
        else
            v89 = Position3:Lerp(Position, (math.clamp(p83 * u79 / Magnitude, 0, 1)));
        end;

        if v86 then
            Vector3.new(u81.X, 0, u81.Z);
            local v90;

            if u81.Magnitude > 15 * p83 then
                v90 = u81.Unit * (15 * p83);
            else
                v90 = u81 * math.max(1 - 0.8 * p83, 0);
            end;

            v89 = Position2 + v90;
        end;

        local v91 = u77:GetPrimaryPartCFrame();
        local v92 = CFrame.new(v89) * (v91 - v91.Position);
        u77:PivotTo(v92);
        u81 = v89 - Position2;
        Position2 = v89;
        u80 = (v89 - Position).Magnitude < 0.5;

        if v85 ~= nil then
            v85 = v85.target;

            if v85 ~= nil then
                v85 = v85.PrimaryPart;

                if v85 ~= nil then
                    v85 = v85.Position;
                end;
            end;
        end;

        local v93 = v85 or v84 * Vector3.new(-3, 1.5, -1);

        if v89 == v93 then
            v93 = v89 + Vector3.new(1, 0, 0);
        end;

        u77:PivotTo(v92:Lerp(CFrame.new(v89, v93), (math.clamp(p83 * 10, 0, 1))));
    end));
    u77.Parent = game.Workspace;

    if AnimationController then
        GameAnimationUtil:playAnimation(AnimationController, AnimationType.SEAHORSE_IDLE_LOOP, {
            looped = true
        });
        GameAnimationUtil:playAnimation(AnimationController, AnimationType.SEAHORSE_SPAWN);
    end;

    if p72 then
        local PrimaryPart = u75:getInstance().PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        local v94 = u75:getInstance() == Players.LocalPlayer.Character;

        if v94 or PrimaryPart then
            local v95 = ({ GameSound.SEAHORSE_EVOLVE_1, GameSound.SEAHORSE_EVOLVE_2, GameSound.SEAHORSE_EVOLVE_3 })[u71:GetAttribute("Level") - 1 + 1];
            local v96 = {};

            if v94 then
                PrimaryPart = nil;
            end;

            v96.position = PrimaryPart;
            SoundManager:playSound(v95, v96);
        end;
    end;

    return u73;
end;

KnitClient.CreateController(u5.new());

return nil;