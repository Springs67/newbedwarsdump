-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "lightning-beams", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u6 = {
    GameSound.WIZARD_LIGHTNING_STRIKE,
    GameSound.WIZARD_LIGHTNING_STRIKE_02,
    GameSound.WIZARD_LIGHTNING_STRIKE_03,
    GameSound.WIZARD_LIGHTNING_STRIKE_04
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "WizardLightningStrikeController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 39
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 43
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "WizardLightningStrikeController";
end;

function u7.KnitStart(u10) -- Line: 47
    -- upvalues: KnitController (copy), default2 (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(u10);
    default2.Client:OnEvent("WizardLightningStrike", function(p11) -- Line: 49
        -- upvalues: KnitClient (ref), BedwarsKitSkinMeta (ref), u10 (copy), Players (ref)
        local Character = p11.caster.Character;

        if not Character then
            return nil;
        end;

        local v12;

        if Character then
            v12 = KnitClient.Controllers.KitSkinController:getKitSkin(Character);
        else
            v12 = nil;
        end;

        local v13;

        if v12 then
            v13 = BedwarsKitSkinMeta[v12];
        else
            v13 = nil;
        end;

        local v14 = nil;
        local v15 = {};
        local v16;

        if v13 == nil then
            v16 = v13;
        else
            v16 = v13.wizard;
        end;

        if v16 then
            if v13 == nil then
                v14 = v13;
            else
                v14 = v13.wizard.lightingStrikeColor;
            end;

            local v17;

            if v13 == nil then
                v17 = v13;
            else
                v17 = v13.wizard.lightningStrikeOverlay;
            end;

            if v17 ~= "" and (v17 and v15 ~= nil) then
                local v18;

                if v13 == nil then
                    v18 = v13;
                else
                    v18 = v13.wizard.lightningStrikeOverlay;
                end;

                table.insert(v15, v18);
            end;

            local v19;

            if v13 == nil then
                v19 = v13;
            else
                v19 = v13.wizard.lightningStrikeStaticOverlay;
            end;

            if v19 ~= "" and (v19 and v15 ~= nil) then
                if v13 ~= nil then
                    v13 = v13.wizard.lightningStrikeStaticOverlay;
                end;

                table.insert(v15, v13);
            end;
        end;

        u10:playLightningEffects(p11.target, p11.caster == Players.LocalPlayer, p11.caster, v14, v15);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p20) -- Line: 99
        -- upvalues: AbilityId (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref)
        if p20:isCancelled() then
            return nil;
        end;

        if p20.ability ~= AbilityId.LIGHTNING_STRIKE then
            return nil;
        end;

        if p20.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WIZARD_LIGHTNING_STRIKE_CAST);
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SWING_SWORD);
    end);
end;

function u7.playLightningEffects(u21, u22, u23, u24, u25, p26) -- Line: 113
    -- upvalues: u3 (copy), RandomUtil (copy), u6 (copy), SoundManager (copy), u2 (copy)
    local u27 = u3.new();
    u27:GiveTask(SoundManager:playSound(RandomUtil.fromList(unpack(u6)), {
        rollOffMaxDistance = 200,
        rollOffMinDistance = 35,
        volumeMultiplier = 0.7,
        position = u22
    }));

    if p26 then
        local function _(p28) -- Line: 124
            -- upvalues: u27 (copy), SoundManager (ref), u22 (copy)
            u27:GiveTask(SoundManager:playSound(p28, {
                rollOffMaxDistance = 200,
                rollOffMinDistance = 35,
                volumeMultiplier = 0.7,
                position = u22
            }));
        end;

        for i, v in p26 do
            local _ = i - 1;
            u27:GiveTask(SoundManager:playSound(v, {
                rollOffMaxDistance = 200,
                rollOffMinDistance = 35,
                volumeMultiplier = 0.7,
                position = u22
            }));
        end;
    end;

    u27:GiveTask(task.delay(0.15, function() -- Line: 136
        -- upvalues: u27 (copy), u21 (copy), u22 (copy), u23 (copy), u24 (copy), u25 (copy)
        u27:GiveTask(u21:playStrikeImpactEffects(u22, u23, u24, u25));
    end));
    local v29 = false;
    local v30 = 0;

    while true do
        if v29 then
            v30 = v30 + 1;
        else
            v29 = true;
        end;

        if v30 >= 2 then
            return u27;
        end;

        local v31 = u2.new({
            WorldAxis = Vector3.new(1, 0, 0),
            WorldPosition = u22 + Vector3.new(0, 24, 0)
        }, {
            WorldAxis = Vector3.new(1, 0, 0),
            WorldPosition = u22
        }, 20);
        v31.PulseLength = 1.2;
        v31.FadeLength = 0.2;
        v31.PulseSpeed = 6.666666666666667;
        v31.ColorOffsetSpeed = 1;
        local v32 = math.random() < 0.5 and 8 or -8;
        v31.CurveSize0 = v32;
        v31.CurveSize1 = v32;
        v31.Color = u25 or ColorSequence.new(Color3.fromRGB(118, 156, 245), Color3.fromRGB(79, 166, 171));
    end;
end;

function u7.getLightningImpactEffect(p33, p34) -- Line: 175
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p34.Character then
        return nil;
    end;

    local v35 = KnitClient.Controllers.KitSkinController:getKitSkin(p34.Character);

    if not v35 then
        return nil;
    end;

    local v36 = BedwarsKitSkinMeta[v35];

    if not v36 then
        return nil;
    end;

    local wizard = v36.wizard;

    if wizard ~= nil then
        wizard = wizard.lightningImpactEffect;
    end;

    if wizard then
        return v36.wizard.lightningImpactEffect:Clone();
    end;
end;

function u7.playStrikeImpactEffects(p37, p38, p39, p40, p41) -- Line: 195
    -- upvalues: u3 (copy)
    local v42 = u3.new();
    local v43;

    if p41 == nil then
        v43 = p41;
    else
        v43 = p41.Keypoints[1].Value;
    end;

    v42:GiveTask(p37:playLightBlastImpactEffect(p38, v43));
    v42:GiveTask(p37:scorchImpactPosition(p38, p41, p40));

    if p39 then
        p37:playBlurEffect();
        p37:playScreenShakeEffect(p38);
    end;

    return v42;
end;

function u7.playScreenShakeEffect(p44, p45) -- Line: 212
    -- upvalues: Workspace (copy), GameQueryUtil (copy), ScreenShakeUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local v46, v47 = CurrentCamera:WorldToScreenPoint(p45);

    if not v47 then
        return nil;
    end;

    local v48 = CurrentCamera:ScreenPointToRay(v46.X, v46.Y, (math.max((p45 - CurrentCamera.CFrame.Position).Magnitude - 9, 0)));
    local v49 = GameQueryUtil:raycast(v48.Origin, v48.Direction);

    if v49 ~= nil then
        v49 = v49.Instance;
    end;

    if v49 then
        return nil;
    end;

    ScreenShakeUtil.shake(p45, Vector3.new(0, -1, 0), {
        duration = 0.22,
        magnitude = 0.25
    });
end;

function u7.playBlurEffect(p50) -- Line: 241
    -- upvalues: u4 (copy), Lighting (copy), default (copy), Linear (copy)
    local u51 = u4("DepthOfFieldEffect", {
        Name = "WizardDepthOfField",
        InFocusRadius = 20,
        FocusDistance = 0,
        FarIntensity = 0,
        Parent = Lighting
    });
    local u53 = default(0.14, Linear, function(p52) -- Line: 249
        -- upvalues: u51 (copy)
        u51.FarIntensity = (math.sqrt(p52) - p52) / 1.2 * 0.8;
    end);
    task.spawn(function() -- Line: 253
        -- upvalues: u53 (copy), u51 (copy)
        u53:Wait();
        u51:Destroy();
    end);
end;

function u7.playLightBlastImpactEffect(p54, p55, p56) -- Line: 258
    -- upvalues: u3 (copy), u4 (copy), Workspace (copy), default (copy), Linear (copy)
    local v57 = u3.new();
    local u58 = u4("Part", {
        CanCollide = false,
        CanQuery = false,
        Anchored = true,
        Transparency = 1,
        Position = p55,
        Parent = Workspace
    });
    v57:GiveTask(u58);
    local u59 = u4("PointLight", {
        Range = 16.1,
        Brightness = 0,
        Color = p56 or Color3.fromRGB(26, 208, 240),
        Parent = u58
    });
    v57:GiveTask(u59);
    local u61 = default(0.24, Linear, function(p60) -- Line: 276
        -- upvalues: u59 (copy)
        u59.Brightness = (math.sqrt(p60) - p60) / 1.2 * 4 * 8;
    end);
    v57:GiveTask(function() -- Line: 280
        -- upvalues: u61 (copy)
        return u61:Cancel();
    end);
    v57:GiveTask(task.spawn(function() -- Line: 283
        -- upvalues: u61 (copy), u59 (copy), u58 (copy)
        u61:Wait();
        u59.Brightness = 0;
        u59.Enabled = false;
        u58:Destroy();
    end));

    return v57;
end;

function u7.scorchImpactPosition(p62, p63, u64, p65) -- Line: 292
    -- upvalues: u3 (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), default (copy), Linear (copy)
    local v66 = u3.new();
    local u67 = ReplicatedStorage.Assets.Effects.WizardImpact:Clone();

    if p65 then
        u67 = p62:getLightningImpactEffect(p65) or u67;
    end;

    v66:GiveTask(u67);

    if not u67.PrimaryPart then
        return v66;
    end;

    if u64 then
        u67.Crack.SurfaceGui.ImageLabel.UIGradient.Color = u64;
    end;

    local v68 = Vector3.new(0, u67.PrimaryPart.Size.Y / 2 + 0.5, 0);
    u67:PivotTo(CFrame.new(p63 + v68));
    u67.Parent = Workspace;

    local function _(p69) -- Line: 313
        -- upvalues: u64 (copy)
        if p69:IsA("ParticleEmitter") and u64 then
            local v70 = string.find(p69.Name, "Lightning");

            if v70 ~= 0 and (v70 == v70 and v70) then
                p69.Color = u64;
            end;
        end;
    end;

    for i, descendant in u67:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") and u64 then
            local v71 = string.find(descendant.Name, "Lightning");

            if v71 ~= 0 and (v71 == v71 and v71) then
                descendant.Color = u64;
            end;
        end;
    end;

    EffectUtil:playEffects({ u67 }, nil);
    v66:GiveTask(task.delay(0.5, function() -- Line: 326
        -- upvalues: u67 (ref), default (ref), Linear (ref)
        local ImageLabel = u67.Crack.SurfaceGui.ImageLabel;
        local Brightness = u67.Crack.SurfaceGui.Brightness;
        default(0.5, Linear, function(p72) -- Line: 330
            -- upvalues: u67 (ref), Brightness (copy), ImageLabel (copy)
            local Crack = u67:FindFirstChild("Crack");

            if Crack ~= nil then
                Crack = Crack:FindFirstChild("SurfaceGui");
            end;

            if Crack then
                Crack.Brightness = Brightness * (1 - p72);
                ImageLabel.ImageTransparency = p72 * 0.4;
            end;
        end);
        task.wait(1.5);
        default(1.5, Linear, function(p73) -- Line: 343
            -- upvalues: ImageLabel (copy)
            ImageLabel.ImageTransparency = 0.4 + p73 * 0.6;
        end):Wait();
        u67:Destroy();
    end));

    return v66;
end;

KnitClient.CreateController(u7.new());

return nil;