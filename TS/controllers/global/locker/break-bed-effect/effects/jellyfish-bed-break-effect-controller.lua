-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "JellyfishBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u5.__index = u5;

function u5.new(...) -- Line: 34
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 38
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p7, BedBreakEffectType.JELLYFISH);
    p7.Name = "JellyfishBreakEffectController";
end;

function u5.KnitStart(p8) -- Line: 42
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p8);
end;

function u5.onBedBreak(u9, u10, u11, u12, u13) -- Line: 45
    task.spawn(function() -- Line: 46
        -- upvalues: u9 (copy), u10 (copy), u11 (copy), u13 (copy), u12 (copy)
        u9:createEffect(u10, u11, u13, u12);
    end);
end;

function u5.createEffect(u14, p15, p16, u17, p18) -- Line: 50
    -- upvalues: u2 (copy), KnitClient (copy), Workspace (copy), u3 (copy), ReplicatedStorage (copy), BedwarsKitSkin (copy), RunService (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), OutQuad (copy), SoundManager (copy), RandomUtil (copy)
    local u19 = u2.new();
    u14.maid:GiveTask(u19);
    local u20 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p18);
    u20:PivotTo(p16);
    local Root = u20:FindFirstChild("Root");

    if Root ~= nil then
        local function _(p21) -- Line: 60
            if p21:IsA("BasePart") then
                p21.Transparency = 0.55;
            end;
        end;

        for i, descendant in Root:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Transparency = 0.55;
            end;
        end;
    end;

    if not u20 then
        return nil;
    end;

    u14.maid:GiveTask(u20);
    u20.Name = "BedBreakEffectBedClone";
    u20.Parent = Workspace;
    local v22 = u3("Part", {
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Position = u17
    });
    local u23 = u3("Attachment", {
        Parent = v22
    });
    u19:GiveTask(v22);
    u19:GiveTask(u23);
    local Jellyfish = ReplicatedStorage.Assets.Misc.Jellyfish;
    local u24 = KnitClient.Controllers.KitController:getKitSkin(p15);

    if u24 == BedwarsKitSkin.JELLYFISH_HOLIDAY then
        Jellyfish = ReplicatedStorage.Assets.Misc.JellyfishHoliday;
    elseif u24 == BedwarsKitSkin.JELLYFISH_DESSERT then
        Jellyfish = ReplicatedStorage.Assets.Misc.JellyfishDessert;
    end;

    local u25 = {};
    local u26 = false;
    local u27 = 0;
    u19:GiveTask(RunService.Heartbeat:Connect(function(p28) -- Line: 108
        -- upvalues: u26 (ref), u27 (ref), u14 (copy), u17 (copy), u25 (copy)
        if u26 then
            return nil;
        end;

        u27 = u27 + p28;

        local function _(p29) -- Line: 113
            -- upvalues: u14 (ref), u17 (ref), u27 (ref)
            u14:setJellyfishPosition(p29, u17, u27);
        end;

        for i, v in u25 do
            local _ = i - 1;
            u14:setJellyfishPosition(v, u17, u27);
        end;
    end));
    local v30 = { GameSound.JELLYFISH_DEPLOY_1, GameSound.JELLYFISH_DEPLOY_2, GameSound.JELLYFISH_DEPLOY_3 };
    local u31;

    if u24 == BedwarsKitSkin.JELLYFISH_HOLIDAY then
        u31 = { GameSound.HOLIDAY_JELLYFISH_DEPLOY_1, GameSound.HOLIDAY_JELLYFISH_DEPLOY_2, GameSound.HOLIDAY_JELLYFISH_DEPLOY_3 };
    else
        u31 = u24 == BedwarsKitSkin.JELLYFISH_DESSERT and { GameSound.DESSERT_JELLYFISH_DEPLOY_1, GameSound.DESSERT_JELLYFISH_DEPLOY_2, GameSound.DESSERT_JELLYFISH_DEPLOY_3 } or v30;
    end;

    local v32 = { GameSound.JELLYFISH_ZAP_1, GameSound.JELLYFISH_ZAP_2 };
    local u33;

    if u24 == BedwarsKitSkin.JELLYFISH_HOLIDAY then
        u33 = { GameSound.HOLIDAY_JELLYFISH_ZAP_1, GameSound.HOLIDAY_JELLYFISH_ZAP_2 };
    else
        u33 = u24 == BedwarsKitSkin.JELLYFISH_DESSERT and { GameSound.DESSERT_JELLYFISH_ZAP_1, GameSound.DESSERT_JELLYFISH_ZAP_2 } or v32;
    end;

    local v34 = {
        GameSound.JELLYFISH_PULSE_2,
        GameSound.JELLYFISH_PULSE_3,
        GameSound.JELLYFISH_PULSE_4,
        GameSound.JELLYFISH_PULSE_5
    };
    local u35;

    if u24 == BedwarsKitSkin.JELLYFISH_HOLIDAY then
        u35 = {
            GameSound.HOLIDAY_JELLYFISH_PULSE_2,
            GameSound.HOLIDAY_JELLYFISH_PULSE_3,
            GameSound.HOLIDAY_JELLYFISH_PULSE_4,
            GameSound.HOLIDAY_JELLYFISH_PULSE_5
        };
    else
        u35 = u24 == BedwarsKitSkin.JELLYFISH_DESSERT and {
            GameSound.DESSERT_JELLYFISH_PULSE_2,
            GameSound.DESSERT_JELLYFISH_PULSE_3,
            GameSound.DESSERT_JELLYFISH_PULSE_4,
            GameSound.DESSERT_JELLYFISH_PULSE_5
        } or v34;
    end;

    u14.maid:GiveTask(task.spawn(function() -- Line: 141
        -- upvalues: Jellyfish (ref), u19 (copy), u24 (copy), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), u14 (copy), default (ref), OutQuad (ref), u25 (copy), u17 (copy), SoundManager (ref), RandomUtil (ref), u31 (ref)
        local v36 = false;
        local v37 = 0;

        while true do
            if v36 then
                v37 = v37 + 1;
            else
                v36 = true;
            end;

            if v37 >= 4 then
                return;
            end;

            local u38 = Jellyfish:Clone();
            u19:GiveTask(u38);
            u38:SetAttribute("KitSkin", u24);
            u38:ScaleTo(0.85);
            u38:WaitForChild("RootPart");

            local function _(p39) -- Line: 163
                if p39:IsA("MeshPart") then
                    p39.LocalTransparencyModifier = 1;
                end;
            end;

            for i, child in u38:GetChildren() do
                local _ = i - 1;

                if child:IsA("MeshPart") then
                    child.LocalTransparencyModifier = 1;
                end;
            end;

            u38.Parent = Workspace;
            local AnimationController = Instance.new("AnimationController");
            AnimationController.Parent = u38;
            local Animator = Instance.new("Animator");
            Animator.Parent = AnimationController;
            local v40 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_SPAWN));
            local u41 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_MOUNT_IDLE));
            local v42 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_ATTACK));
            v40:Play();
            v40.Ended:Connect(function() -- Line: 183
                -- upvalues: u41 (copy)
                u41:Play();
            end);
            u14.maid:GiveTask(task.spawn(function() -- Line: 190
                -- upvalues: u38 (copy), default (ref), OutQuad (ref)
                local function _(u43) -- Line: 192
                    -- upvalues: default (ref), OutQuad (ref)
                    if u43:IsA("MeshPart") then
                        default(1, OutQuad, function(p44) -- Line: 194
                            -- upvalues: u43 (copy)
                            u43.LocalTransparencyModifier = p44;

                            return u43.LocalTransparencyModifier;
                        end, 1, 0):Play();
                    end;
                end;

                for i, child in u38:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("MeshPart") then
                        default(1, OutQuad, function(p45) -- Line: 194
                            -- upvalues: child (copy)
                            child.LocalTransparencyModifier = p45;

                            return child.LocalTransparencyModifier;
                        end, 1, 0):Play();
                    end;
                end;
            end));
            local v46 = {
                index = v37,
                model = u38,
                animationController = AnimationController,
                animator = Animator,
                idleAnimationTrack = u41,
                attackAnimationTrack = v42
            };
            table.insert(u25, v46);
            u14:setJellyfishPosition(v46, u17, 0);
            u14.maid:GiveTask(SoundManager:playSound(RandomUtil.fromList(unpack(u31)), {
                position = u38:GetPivot().Position
            }));
            task.wait(0.2);
        end;
    end));
    u14.maid:GiveTask(task.spawn(function() -- Line: 226
        -- upvalues: u26 (ref), u14 (copy), u23 (copy), u25 (copy), u24 (copy), u17 (copy), SoundManager (ref), RandomUtil (ref), u33 (ref), u35 (ref), u20 (copy), default (ref), OutQuad (ref), u19 (copy)
        task.wait(2);
        u26 = true;

        local function _(u47) -- Line: 230
            -- upvalues: u14 (ref), u23 (ref)
            u47.attackAnimationTrack:Play();
            u47.attackAnimationTrack.Stopped:Connect(function() -- Line: 233
                -- upvalues: u47 (copy)
                u47.idleAnimationTrack:Play();
            end);
            u14:createLightningBeam(u47.model, u23);
        end;

        for i, v in u25 do
            local _ = i - 1;
            v.attackAnimationTrack:Play();
            v.attackAnimationTrack.Stopped:Connect(function() -- Line: 233
                -- upvalues: v (copy)
                v.idleAnimationTrack:Play();
            end);
            u14:createLightningBeam(v.model, u23);
        end;

        u14:createStaticHitEffect(u24, u17);
        u14.maid:GiveTask(SoundManager:playSound(RandomUtil.fromList(unpack(u33)), {
            position = u17
        }));
        u14.maid:GiveTask(SoundManager:playSound(RandomUtil.fromList(unpack(u35)), {
            position = u17
        }));
        u20:Destroy();
        u14.maid:GiveTask(task.delay(0.5, function() -- Line: 253
            -- upvalues: u26 (ref)
            u26 = false;
        end));
        task.wait(2);
        u14.maid:GiveTask(task.spawn(function() -- Line: 258
            -- upvalues: default (ref), OutQuad (ref), u25 (ref)
            local function v52(p48) -- Line: 259
                -- upvalues: default (ref), OutQuad (ref)
                local function _(u49) -- Line: 261
                    -- upvalues: default (ref), OutQuad (ref)
                    if u49:IsA("MeshPart") then
                        default(1, OutQuad, function(p50) -- Line: 263
                            -- upvalues: u49 (copy)
                            u49.LocalTransparencyModifier = p50;

                            return u49.LocalTransparencyModifier;
                        end, 0, 1):Play();
                    end;
                end;

                for i, child in p48.model:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("MeshPart") then
                        default(1, OutQuad, function(p51) -- Line: 263
                            -- upvalues: child (copy)
                            child.LocalTransparencyModifier = p51;

                            return child.LocalTransparencyModifier;
                        end, 0, 1):Play();
                    end;
                end;
            end;

            for i, v in u25 do
                v52(v, i - 1, u25);
            end;
        end));
        task.wait(2);
        u19:DoCleaning();
    end));
end;

function u5.setJellyfishPosition(p53, p54, p55, p56) -- Line: 282
    local v57;

    if p54 == nil then
        v57 = p54;
    else
        v57 = p54.model;
    end;

    if not v57 or p54.model.Parent == nil then
        return nil;
    end;

    local v58 = p54.index / 6 * 2 * 3.141592653589793 + (p56 == nil and 0 or p56) * 1;
    local v59 = p55.X + math.cos(v58) * 6;
    local v60 = p55.Z + math.sin(v58) * 6;
    local v61 = Vector3.new(v59, p55.Y + 1, v60);
    p54.model:PivotTo(CFrame.new(v61));
end;

function u5.createLightningBeam(p62, p63, p64) -- Line: 309
    -- upvalues: BedwarsKitSkin (copy), ReplicatedStorage (copy), TweenService (copy)
    local v65 = p63:GetAttribute("KitSkin") or BedwarsKitSkin.DEFAULT;
    local StaticConnection = ReplicatedStorage.Assets.Effects.StaticConnection;

    if v65 == BedwarsKitSkin.JELLYFISH_DESSERT then
        StaticConnection = ReplicatedStorage.Assets.Effects.JellyfishDessertStaticConnection;
    end;

    local u66 = StaticConnection.Beam1:Clone();
    local u67 = StaticConnection.Beam2:Clone();
    local u68 = StaticConnection.PointLight:Clone();
    p62.maid:GiveTask(u66);
    p62.maid:GiveTask(u67);
    p62.maid:GiveTask(u68);
    local BellUnder = p63:FindFirstChild("BellUnder");

    if BellUnder ~= nil then
        BellUnder = BellUnder:FindFirstChild("BeamAttachment");
    end;

    u66.Parent = p63;
    u66.Attachment0 = BellUnder;
    u66.Attachment1 = p64;
    u67.Parent = p63;
    u67.Attachment0 = BellUnder;
    u67.Attachment1 = p64;
    u68.Parent = p64;
    p62.maid:GiveTask(task.delay(0.24, function() -- Line: 333
        -- upvalues: TweenService (ref), u66 (copy), u67 (copy), u68 (copy)
        TweenService:Create(u66, TweenInfo.new(0.12), {
            Width0 = 0,
            Width1 = 0
        }):Play();
        TweenService:Create(u67, TweenInfo.new(0.12), {
            Width0 = 0,
            Width1 = 0
        }):Play();
        task.wait(0.12);
        u66:Destroy();
        u67:Destroy();
        u68:Destroy();
    end));
end;

function u5.createStaticHitEffect(p69, p70, p71) -- Line: 348
    -- upvalues: ReplicatedStorage (copy), BedwarsKitSkin (copy), Workspace (copy), EffectUtil (copy)
    local u72 = ReplicatedStorage.Assets.Effects.StaticHit:Clone();

    if p70 == BedwarsKitSkin.JELLYFISH_DESSERT then
        u72 = ReplicatedStorage.Assets.Effects.JellyfishDessertStaticHit:Clone();
    end;

    p69.maid:GiveTask(u72);
    u72.Parent = Workspace;
    u72.Anchored = false;
    u72:PivotTo(CFrame.new(p71));
    u72.Lightning.Anchored = false;
    u72.Lightning:PivotTo(CFrame.new(p71));
    EffectUtil:playEffects(u72:GetChildren());
    p69.maid:GiveTask(task.delay(0.2, function() -- Line: 360
        -- upvalues: u72 (ref)
        u72.Attachment.PointLight.Enabled = false;
    end));
    p69.maid:GiveTask(task.delay(5, function() -- Line: 363
        -- upvalues: u72 (ref)
        u72:Destroy();
    end));
end;

KnitClient.CreateController(u5.new());

return nil;