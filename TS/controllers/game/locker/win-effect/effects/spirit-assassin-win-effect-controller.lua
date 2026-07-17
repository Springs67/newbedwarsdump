-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v3.InOutExpo;
local Linear = v3.Linear;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local TweenService = v7.TweenService;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "SpiritAssassinWinEffectController";
    end,

    __index = WinEffect
});
u8.__index = u8;

function u8.new(...) -- Line: 46
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 50
    -- upvalues: WinEffect (copy), WinEffectType (copy), u5 (copy)
    WinEffect.constructor(p10, WinEffectType.SPIRIT_ASSASSIN);
    p10.Name = "SpiritAssassinWinEffectController";
    p10.canUseTeleport = false;
    p10.spiritOrbIsFlashing = false;
    p10.maid = u5.new();
end;

function u8.KnitStart(u11) -- Line: 57
    -- upvalues: WinEffect (copy), KnitClient (copy), GameSound (copy), Players (copy), WinEffectType (copy), default2 (copy), SoundManager (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient2 (copy), DeviceUtil (copy), EntityUtil (copy)
    WinEffect.KnitStart(u11);
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.FORGE_CRYSTAL_EXPLODE, GameSound.BLACKHOLE_LOOP }
    });
    local _ = Players.LocalPlayer:GetAttribute("WinEffect") == WinEffectType.SPIRIT_ASSASSIN;
    default2.Client:Get("SpiritAssassinWinEffectSetupComplete"):Connect(function(p12) -- Line: 65
        -- upvalues: SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref), u11 (copy), Players (ref), KnitClient2 (ref), DeviceUtil (ref), EntityUtil (ref)
        SoundManager:playSound(GameSound.FORGE_CRYSTAL_EXPLODE, {
            volumeMultiplier = 1,
            position = p12.spiritOrb:GetPrimaryPartCFrame().Position
        });
        SoundManager:playSound(GameSound.BLACKHOLE_LOOP, {
            volumeMultiplier = 1,
            looped = true,
            position = p12.spiritOrb:GetPrimaryPartCFrame().Position
        });
        local spiritModels = p12.spiritModels;

        local function v15(u13) -- Line: 80
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), u11 (ref)
            local Humanoid = u13:FindFirstChild("Humanoid");

            if Humanoid then
                if Humanoid ~= nil then
                    Humanoid = Humanoid:FindFirstChildOfClass("Animator");
                end;

                local u14 = Humanoid and GameAnimationUtil:playAnimation(Humanoid, AnimationType.ROBLOX_DEFAULT_FREEFALL, {
                    looped = true
                });

                if u14 then
                    u11.maid:GiveTask(function() -- Line: 95
                        -- upvalues: u14 (copy)
                        u14:Stop();
                        u14:Destroy();
                    end);
                end;
            end;

            task.spawn(function() -- Line: 104
                -- upvalues: u11 (ref), u13 (copy)
                u11:setTransparency(u13);
            end);
        end;

        for i, v in spiritModels do
            v15(v, i - 1, spiritModels);
        end;

        if Players.LocalPlayer ~= p12.winningPlayer then
            return nil;
        end;

        local spiritModels2 = p12.spiritModels;

        local function v22(u16) -- Line: 117
            -- upvalues: KnitClient2 (ref), DeviceUtil (ref), u11 (ref), Players (ref), EntityUtil (ref)
            local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
            local v17 = {};
            local v18 = u16:GetAttribute("SpiritPlayerName");
            v17.Name = "Soul of " .. tostring(v18 == nil and "Player" or v18);
            local v19 = u16:GetAttribute("SpiritPlayerName");
            v17.ObjectText = "Soul of " .. tostring(v19 == nil and "Player" or v19);
            v17.ActionText = "Teleport";
            v17.AutoLocalize = false;
            v17.ClickablePrompt = DeviceUtil.isMobileControls();
            v17.KeyboardKeyCode = Enum.KeyCode.F;
            v17.RequiresLineOfSight = false;
            v17.Parent = u16;
            v17.MaxActivationDistance = (1 / 0);
            ProximityPromptController:createProximityPrompt(v17).Triggered:Connect(function(p20) -- Line: 140
                -- upvalues: u11 (ref), Players (ref), EntityUtil (ref), u16 (copy)
                if not u11.canUseTeleport then
                    return nil;
                end;

                if p20 == Players.LocalPlayer then
                    local v21 = EntityUtil:getEntity(p20);

                    if v21 ~= nil then
                        v21 = v21:isAlive();
                    end;

                    if not v21 then
                        return nil;
                    end;

                    u11:useSpirit(p20, (u16:GetAttribute("SpiritId")));
                end;
            end);
        end;

        for i, v in spiritModels2 do
            v22(v, i - 1, spiritModels2);
        end;

        u11.canUseTeleport = true;
        u11.spiritOrb = p12.spiritOrb;
    end);
    default2.Client:Get("SpiritAssassinWinEffectTeleportSuccessful"):Connect(function(p23) -- Line: 172
        -- upvalues: u11 (copy), Players (ref), KnitClient (ref), AnimationType (ref)
        u11:createTrail(p23.originalPosition, p23.endPosition);
        u11:playSlashAnimation(p23.player, p23.targetSpirit);
        task.spawn(function() -- Line: 175
            -- upvalues: u11 (ref)
            u11:flashSpiritOrb(u11.spiritOrb);
        end);

        if p23.player == Players.LocalPlayer then
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_DAGGER_SLASH);
            task.delay(0.5, function() -- Line: 181
                -- upvalues: u11 (ref)
                u11.canUseTeleport = true;
            end);
        end;
    end);
end;

function u8.onWin(p24, p25) -- Line: 187
end;

function u8.useSpirit(p26, p27, p28) -- Line: 189
    -- upvalues: default2 (copy)
    p26.canUseTeleport = false;
    default2.Client:Get("SpiritAssassinWinEffectUseSpirit"):SendToServer({
        spiritId = p28
    });
end;

function u8.createTrail(p29, p30, p31) -- Line: 195
    -- upvalues: u6 (copy), Workspace (copy), u4 (copy), u5 (copy)
    local u32 = u6("Attachment", {
        Parent = u6("Part", {
            Transparency = 1,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Anchored = true,
            Position = p30,
            Parent = Workspace
        })
    });
    local u33 = u6("Attachment", {
        Parent = u6("Part", {
            Transparency = 1,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Anchored = true,
            Position = p31,
            Parent = Workspace
        })
    });
    local u34 = u4.link(u33, u32, Color3.fromRGB(180, 128, 255));
    local u35 = u5.new();
    u35:GiveTask(u34);
    task.delay(0.3, function() -- Line: 223
        -- upvalues: u34 (copy), u32 (copy), u33 (copy), u35 (copy)
        u34:Destroy();
        u32:Destroy();
        u33:Destroy();
        u35:DoCleaning();
    end);
end;

function u8.playSlashAnimation(p36, p37, p38) -- Line: 230
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), u6 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), BedwarsKitSkin (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), scaleModel (copy), GameQueryUtil (copy), ModelUtil (copy), InOutExpo (copy)
    local Character = p37.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u39 = ReplicatedStorage.Assets.Effects.SpiritAssassinWinEffectGhostExplosion:Clone();
    u39.Parent = Workspace;
    u39.CFrame = p38:GetPrimaryPartCFrame();
    u39.Smoke.Enabled = true;
    task.delay(0.5, function() -- Line: 244
        -- upvalues: u39 (copy)
        u39.Smoke.Enabled = false;
    end);
    task.delay(2, function() -- Line: 247
        -- upvalues: u39 (copy)
        u39:Destroy();
    end);
    SoundManager:playSound(GameSound.SMOKE_GRENADE_POP, {
        position = p38:GetPrimaryPartCFrame().Position
    });

    if p36.antiGravityForce then
        p36.antiGravityForce:Destroy();
    end;

    Character.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
    p36.antiGravityForce = u6("BodyForce", {
        Name = "SpiritAssassinWinEffectAntiGravity",
        Force = Vector3.new(0, Workspace.Gravity * Character.AssemblyMass, 0),
        Parent = Character
    });
    local v40 = AnimationUtil:playAnimation(p37, GameAnimationUtil:getAssetId(AnimationType.DAGGER_SLASH));

    if v40 ~= nil then
        v40:AdjustSpeed(0.8);
    end;

    local v41 = EntityUtil:getEntity(p37);

    if not v41 then
        return nil;
    end;

    local v42;

    if v41 == nil then
        v42 = v41;
    else
        v42 = v41:getInstance();
    end;

    local DEFAULT = BedwarsKitSkin.DEFAULT;

    if v42 then
        DEFAULT = KnitClient.Controllers.KitController:getKitSkin(v42);
    end;

    local spiritAssassin = BedwarsKitSkinMeta[DEFAULT].spiritAssassin;
    local v43;

    if spiritAssassin == nil then
        v43 = spiritAssassin;
    else
        v43 = spiritAssassin.daggerSlashSound;
    end;

    if v43 == nil then
        v43 = GameSound.SPIRIT_DAGGER_SLASH;
    end;

    local v44 = {};
    local Character2 = p37.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPrimaryPartCFrame().Position;
    end;

    v44.position = Character2;
    v44.rollOffMaxDistance = 45;
    v44.volumeMultiplier = 0.5;
    SoundManager:playSound(v43, v44);

    if spiritAssassin ~= nil then
        spiritAssassin = spiritAssassin.spinEffect;
    end;

    local u45 = ReplicatedStorage.Assets.Effects[spiritAssassin == nil and "DaggerSpin" or spiritAssassin]:Clone();

    if not u45:IsA("Model") then
        return nil;
    end;

    u45:PivotTo(v41:getInstance():GetPrimaryPartCFrame());
    scaleModel(u45, 0.04);
    u45.Parent = Workspace;

    for _, child in u45:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    ModelUtil.tweenModelSize(u45, 0, InOutExpo, 10);
    task.delay(0.3, function() -- Line: 322
        -- upvalues: u45 (copy)
        u45:Destroy();
    end);
end;

function u8.enterSpiritForm(p46, p47) -- Line: 326
    -- upvalues: TweenService (copy), BalanceFile (copy)
    for _, descendant in p47:GetDescendants() do
        if descendant:IsA("BasePart") and descendant.Transparency < 0.5 then
            local u48 = descendant:GetAttribute("SpiritTransparency");

            if u48 == nil then
                u48 = descendant.Transparency;
                descendant:SetAttribute("SpiritTransparency", u48);
            end;

            local Material = descendant.Material;
            TweenService:Create(descendant, TweenInfo.new(0.1), {
                Transparency = 0.369
            }):Play();
            descendant.Material = Enum.Material.ForceField;
            p46.maid:GiveTask(function() -- Line: 341
                -- upvalues: descendant (copy), TweenService (ref), BalanceFile (ref), u48 (ref), Material (copy)
                if descendant.Parent then
                    TweenService:Create(descendant, TweenInfo.new(BalanceFile.SPIRIT_ARMOR_DELAY), {
                        Transparency = u48
                    }):Play();
                    descendant.Material = Material;
                end;
            end);
        end;

        if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
            descendant.Enabled = true;
            p46.maid:GiveTask(function() -- Line: 353
                -- upvalues: descendant (copy)
                descendant.Enabled = false;
            end);
        end;
    end;
end;

function u8.setTransparency(p49, u50) -- Line: 359
    -- upvalues: default (copy), Linear (copy), MathExtras (copy)
    u50:AddTag("entity");
    u50:SetAttribute("Transparency", 0.3);
    local u51 = true;
    p49.maid:GiveTask(function() -- Line: 364
        -- upvalues: u51 (ref)
        u51 = false;
    end);

    while u51 do
        default(0.5, Linear, function(p52) -- Line: 368
            -- upvalues: u51 (ref), MathExtras (ref), u50 (copy)
            if not u51 then
                return nil;
            end;

            u50:SetAttribute("Transparency", (MathExtras:lerp(0.4, 0.7, p52)));
        end):Wait();
        default(0.5, Linear, function(p53) -- Line: 375
            -- upvalues: u51 (ref), MathExtras (ref), u50 (copy)
            if not u51 then
                return nil;
            end;

            u50:SetAttribute("Transparency", (MathExtras:lerp(0.7, 0.4, p53)));
        end):Wait();
    end;
end;

function u8.flashSpiritOrb(u54, p55) -- Line: 384
    -- upvalues: default (copy), Linear (copy), MathExtras (copy)
    if not p55 then
        return nil;
    end;

    if u54.spiritOrbIsFlashing then
        return nil;
    end;

    u54.spiritOrbIsFlashing = true;
    local u56 = true;
    u54.maid:GiveTask(function() -- Line: 393
        -- upvalues: u56 (ref)
        u56 = false;
    end);
    local bigball = p55:FindFirstChild("bigball");

    if bigball ~= nil then
        bigball = bigball:FindFirstChild("inside");
    end;

    local bigball2 = p55:FindFirstChild("bigball");

    if bigball2 ~= nil then
        bigball2 = bigball2:FindFirstChild("outside");
    end;

    local bigball3 = p55:FindFirstChild("bigball");
    local u57 = { bigball.Color:ToHSV() };
    local u58 = { bigball2.Color:ToHSV() };
    local u59 = { bigball3.Color:ToHSV() };
    local u60 = nil;
    default(0.2, Linear, function(p61) -- Line: 412
        -- upvalues: u56 (ref), u60 (ref), MathExtras (ref), u57 (copy), u54 (copy), bigball (copy), u58 (copy), bigball2 (copy), u59 (copy), bigball3 (copy)
        if not u56 then
            return nil;
        end;

        u60 = MathExtras:lerp(u57[3], u57[3] * 1.3, p61);
        u54:setColorValue(bigball, u60);
        u60 = MathExtras:lerp(u58[3], u58[3] * 1.3, p61);
        u54:setColorValue(bigball2, u60);
        u60 = MathExtras:lerp(u59[3], u59[3] * 1.3, p61);
        u54:setColorValue(bigball3, u60);
    end):Wait();
    default(0.2, Linear, function(p62) -- Line: 423
        -- upvalues: u56 (ref), u60 (ref), MathExtras (ref), u57 (copy), u54 (copy), bigball (copy), u58 (copy), bigball2 (copy), u59 (copy), bigball3 (copy)
        if not u56 then
            return nil;
        end;

        u60 = MathExtras:lerp(u57[3] * 1.3, u57[3], p62);
        u54:setColorValue(bigball, u60);
        u60 = MathExtras:lerp(u58[3] * 1.3, u58[3], p62);
        u54:setColorValue(bigball2, u60);
        u60 = MathExtras:lerp(u59[3] * 1.3, u59[3], p62);
        u54:setColorValue(bigball3, u60);
    end):Wait();
    u54.spiritOrbIsFlashing = false;
end;

function u8.setColorValue(p63, p64, p65) -- Line: 436
    local v66 = { p64.Color:ToHSV() };
    p64.Color = Color3.fromHSV(v66[1], v66[2], p65);
end;

KnitClient.CreateController(u8.new());

return nil;