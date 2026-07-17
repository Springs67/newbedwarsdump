-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local JailorConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jailor", "jailor-constants").JailorConstants;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ShieldType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "WardenKitController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 39
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy), GameSound (copy)
    BaseKitController.constructor(p6, BedwarsKit.JAILOR, {
        animations = { AnimationType.JAILOR_IMPRISON, AnimationType.FP_JAILOR_IMPRISON },
        sounds = { GameSound.JAILOR_IMPRISON_SLAM, GameSound.JAILOR_SOUL_CONSUME }
    });
    p6.Name = "WardenKitController";
    p6.imprisonedSoulCount = 0;
end;

function u4.KnitStart(p7) -- Line: 47
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p7);
end;

function u4.onKitLocalActivated(u8, p9) -- Line: 50
    -- upvalues: default2 (copy), Players (copy), ShieldType (copy), SoundManager (copy), GameSound (copy)
    p9:GiveTask((default2.Client:Get("UpdateImprisonedSoulCount"):Connect(function(p10) -- Line: 51
        -- upvalues: u8 (copy)
        u8.imprisonedSoulCount = p10;
    end)));
    p9:GiveTask(Players.LocalPlayer.CharacterAdded:Connect(function(u11) -- Line: 55
        -- upvalues: ShieldType (ref), SoundManager (ref), GameSound (ref)
        local u12 = "Shield_" .. ShieldType.JAILOR_KIT;
        local v13 = u11:GetAttribute(u12);
        local u14 = v13 == nil and 0 or v13;
        u11:GetAttributeChangedSignal(u12):Connect(function() -- Line: 62
            -- upvalues: u11 (copy), u12 (copy), u14 (ref), SoundManager (ref), GameSound (ref)
            local v15 = u11:GetAttribute(u12);
            local v16 = v15 == nil and 0 or v15;

            if u14 < v16 then
                SoundManager:playSound(GameSound.TRINITY_LIGHT_ORB_HEAL, {
                    volumeMultiplier = 0.16,
                    playbackSpeedMultiplier = 0.9 + 0.2 * math.random()
                });
            end;

            u14 = v16;
        end);
    end));
end;

function u4.onKitLocalDeactivated(p17) -- Line: 78
end;

function u4.onKitReplicationActivated(u18, p19) -- Line: 80
    -- upvalues: default2 (copy), BlockEngine (copy), KnitClient (copy), BedwarsKit (copy), JailorConstants (copy)
    p19:GiveTask((default2.Client:Get("JailorImprisonSoul"):Connect(function(p20, p21, p22) -- Line: 81
        -- upvalues: u18 (copy)
        u18:playImprisonEffect(p20, p21);
    end)));
    p19:GiveTask(BlockEngine:getBlockDamageHook():connect(function(p23) -- Line: 85
        -- upvalues: KnitClient (ref), BedwarsKit (ref), JailorConstants (ref), u18 (copy)
        if not KnitClient.Controllers.KitController:isUsingKit(p23.player, BedwarsKit.JAILOR) then
            return nil;
        end;

        p23.damage = JailorConstants.getBlockDamage(p23.damage, u18.imprisonedSoulCount);
    end));
end;

function u4.onKitReplicationDeactivated(p24) -- Line: 92
end;

function u4.onInnateAbilityEnabled(p25, p26, p27) -- Line: 94
end;

function u4.onAbilityUsed(p28, p29, p30) -- Line: 96
end;

function u4.playImprisonEffect(p31, p32, u33) -- Line: 98
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), WeldUtil (copy), default (copy), Linear (copy), ColorUtil (copy), MapUtil (copy)
    local u34 = u2.new();
    local u35 = ReplicatedStorage.Assets.Misc.JailorSoul:Clone();
    u35:PivotTo(CFrame.new(u33));
    u35.Parent = Workspace;
    task.delay(1.5, function() -- Line: 104
        -- upvalues: u35 (copy)
        local function _(p36) -- Line: 106
            if p36:IsA("ParticleEmitter") then
                p36.Enabled = false;
            end;
        end;

        for i, descendant in u35:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;

        task.delay(2.5, function() -- Line: 114
            -- upvalues: u35 (ref)
            u35:Destroy();
        end);
    end);
    local u37 = p32 == Players.LocalPlayer;

    if u37 then
        local u38 = GameAnimationUtil:playAnimation(p32, AnimationType.JAILOR_IMPRISON);

        if u38 then
            u34:GiveTask(function() -- Line: 122
                -- upvalues: u38 (copy)
                return u38:Stop(0.25);
            end);
        end;

        local u39 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_JAILOR_IMPRISON);

        if u39 then
            u34:GiveTask(function() -- Line: 128
                -- upvalues: u39 (copy)
                return u39:Stop(0.25);
            end);
        end;
    end;

    local Character = p32.Character;
    local v40;

    if Character == nil then
        v40 = Character;
    else
        v40 = Character.PrimaryPart;
    end;

    if not v40 then
        return u34:DoCleaning();
    end;

    local JAILOR_SOUL_CONSUME = GameSound.JAILOR_SOUL_CONSUME;
    local v41 = {
        rollOffMinDistance = 8,
        rollOffMaxDistance = 60
    };
    local v42;

    if u37 then
        v42 = nil;
    else
        v42 = Character.PrimaryPart;
    end;

    v41.parent = v42;
    SoundManager:playSound(JAILOR_SOUL_CONSUME, v41);
    local u43 = ReplicatedStorage.Assets.Effects.JailorImprisonSoul:Clone();
    u34:GiveTask(u43);
    local u44 = u43:FindFirstChild("0");
    local u45 = u43:FindFirstChild("1");

    if not (u44 and u45) then
        return u34:DoCleaning();
    end;

    local u46 = {};
    local u47;

    if u37 then
        u47 = ReplicatedStorage.Assets.Misc.JailorSkull:Clone();
        u34:GiveTask(u47);
        table.insert(u46, u47);
        KnitClient.Controllers.ViewmodelController:addAccessory(u47);
    else
        u47 = nil;
    end;

    local u48 = ReplicatedStorage.Assets.Misc.JailorSkull:Clone();
    u34:GiveTask(u48);
    table.insert(u46, u48);
    local Humanoid = Character:FindFirstChild("Humanoid");

    if Humanoid then
        Humanoid:AddAccessory(u48);
        WeldUtil:weldCharacterAccessories(Character);
    end;

    u43.CFrame = CFrame.new(u33, Character:GetPrimaryPartCFrame().Position);
    u43.Transparency = 0;
    u43.Parent = Workspace;

    local function _(p49) -- Line: 179
        return p49:IsA("ParticleEmitter");
    end;

    local u50 = nil;

    for i, descendant in u35:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") == true then
            u50 = descendant;
            break;
        end;
    end;

    local Color = u50.Color;
    local u51 = {};

    if u37 then
        KnitClient.Controllers.ScreenShakeController:shake(u33, (Character:GetPrimaryPartCFrame().Position - u33).Unit, {
            zMagnitude = 0.1,
            magnitude = 0.1,
            duration = 1.5,
            cycles = 30
        });
    end;

    local u73 = default(1.5, Linear, function(p52) -- Line: 207
        -- upvalues: Character (copy), u34 (copy), u48 (copy), u47 (ref), KnitClient (ref), u45 (copy), u44 (copy), u43 (copy), ColorUtil (ref), MapUtil (ref), u51 (copy), u46 (copy), Color (copy), u50 (copy), u33 (copy)
        if not Character.Parent then
            u34:DoCleaning();

            return nil;
        end;

        local v53 = u48;

        if u47 and KnitClient.Controllers.ViewmodelController:isVisible() then
            v53 = u47;
        end;

        local v54 = v53:FindFirstChildWhichIsA("BasePart");

        if v54 ~= nil then
            v54 = v54.Position;
        end;

        if v54 then
            u45.WorldPosition = v54;
        end;

        local u55 = 0.25 * (u44.WorldPosition - u45.WorldPosition).Magnitude;
        local u56 = math.sin(6.283185307179586 * p52 / 0.5);
        local u57 = math.pow(p52, 2);
        local u58 = {};
        local v59 = u43:GetDescendants();

        local function v64(p60) -- Line: 234
            -- upvalues: u58 (copy), ColorUtil (ref), u57 (copy), u56 (copy), u55 (copy)
            if not p60:IsA("Beam") then
                return nil;
            end;

            local v61 = u58[p60];

            if not v61 then
                v61 = p60.Color;
                u58[p60] = v61;
            end;

            local Keypoints = v61.Keypoints;

            local function _(p62) -- Line: 247
                -- upvalues: ColorUtil (ref), u57 (ref)
                return ColorSequenceKeypoint.new(p62.Time, p62.Value:Lerp(ColorUtil.hexColor(6291428), u57));
            end;

            local v63 = table.create(#Keypoints);

            for i, v in Keypoints do
                local _ = i - 1;
                v63[i] = ColorSequenceKeypoint.new(v.Time, v.Value:Lerp(ColorUtil.hexColor(6291428), u57));
            end;

            p60.Color = ColorSequence.new(v63);
            p60.CurveSize0 = u56 * u55;
            p60.CurveSize1 = u56 * -1 * u55;
        end;

        for i, v in v59 do
            v64(v, i - 1, v59);
        end;

        local function v70(p65) -- Line: 263
            -- upvalues: MapUtil (ref), u51 (ref), ColorUtil (ref), u57 (copy)
            local v66 = p65:GetDescendants();

            local function v69(p67) -- Line: 265
                -- upvalues: MapUtil (ref), u51 (ref), ColorUtil (ref), u57 (ref)
                if p67:IsA("ParticleEmitter") then
                    local v68 = MapUtil.getOrCreate(u51, p67, p67.Color.Keypoints[1].Value);
                    p67.Color = ColorSequence.new(v68:Lerp(ColorUtil.hexColor(6291428), u57));
                end;

                if p67:IsA("BasePart") and p67.Material == Enum.Material.Neon then
                    p67.Color = MapUtil.getOrCreate(u51, p67, p67.Color):Lerp(ColorUtil.hexColor(6291428), u57);
                end;
            end;

            for i, v in v66 do
                v69(v, i - 1, v66);
            end;
        end;

        for i, v in u46 do
            v70(v, i - 1, u46);
        end;

        local Keypoints = Color.Keypoints;

        local function _(p71) -- Line: 283
            -- upvalues: ColorUtil (ref), u57 (copy)
            return ColorSequenceKeypoint.new(p71.Time, p71.Value:Lerp(ColorUtil.hexColor(6291428), u57));
        end;

        local v72 = table.create(#Keypoints);

        for i, v in Keypoints do
            local _ = i - 1;
            v72[i] = ColorSequenceKeypoint.new(v.Time, v.Value:Lerp(ColorUtil.hexColor(6291428), u57));
        end;

        u50.Color = ColorSequence.new(v72);
        u43.CFrame = CFrame.new(u33, Character:GetPrimaryPartCFrame().Position);
    end);
    u34:GiveTask(function() -- Line: 295
        -- upvalues: u73 (copy)
        return u73:Cancel();
    end);
    task.delay(1.52, function() -- Line: 298
        -- upvalues: u34 (copy), u37 (copy), KnitClient (ref), u33 (copy), Character (copy)
        u34:DoCleaning();

        if u37 then
            KnitClient.Controllers.ScreenShakeController:shake(u33, (Character:GetPrimaryPartCFrame().Position - u33).Unit, {
                zMagnitude = 1,
                magnitude = 0.5
            });
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;