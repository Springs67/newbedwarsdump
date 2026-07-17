-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local AngelType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit").AngelType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = ConstantManager.registerConstants(script, {
    P1XRange = NumberRange.new(-30, 30),
    P1YRange = NumberRange.new(-15, 15),
    P1ZRange = NumberRange.new(-15, 15)
});
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "AngelEffectsController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 40
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7, ...);
    p7.Name = "AngelEffectsController";
    p7.random = Random.new();
    p7.playerOrbTimeMap = {};
    p7.lastOrbSoundTime = 0;
    p7.lastHealSoundTime = 0;
end;

function u5.KnitStart(u8) -- Line: 48
    -- upvalues: KnitController (copy), default2 (copy), KnitClient (copy), Players (copy), Workspace (copy), u4 (copy), SoundManager (copy), default (copy), InOutQuad (copy), WatchPlayer (copy), KnitClient2 (copy)
    KnitController.KnitStart(u8);
    default2.Client:OnEvent("AngelOrb", function(p9, p10, p11, p12, p13) -- Line: 50
        -- upvalues: KnitClient (ref), Players (ref), Workspace (ref), u8 (copy), u4 (ref), SoundManager (ref), default (ref), InOutQuad (ref)
        KnitClient.Controllers.KitController:getKitSkin(p13);
        local v14 = p12 == Players.LocalPlayer;
        local v15 = p13 == Players.LocalPlayer;
        local v16 = Workspace:GetServerTimeNow() - p11;
        local Character = p12.Character;
        local Character2 = p13.Character;

        if Character == nil or (Character.PrimaryPart == nil or (Character2 == nil or Character2.PrimaryPart == nil)) then
            return nil;
        end;

        local Position = Character2:GetPrimaryPartCFrame().Position;
        local Position2 = (Character2:GetPrimaryPartCFrame() * CFrame.new(u8.random:NextNumber(u4.P1XRange.Min, u4.P1XRange.Max), u8.random:NextNumber(u4.P1YRange.Min, u4.P1YRange.Max), u8.random:NextNumber(u4.P1ZRange.Min, u4.P1ZRange.Max))):Lerp(Character:GetPrimaryPartCFrame(), 0.5).Position;
        local u17 = u8:getOrbModel(p13, p9):Clone();
        u17.Parent = Workspace;
        u17:ScaleTo(0.6);

        if tick() - u8.lastOrbSoundTime > 0.25 then
            SoundManager:playSound(u8:getOrbCreateSound(p13, p9), {
                rollOffMaxDistance = 100,
                volumeMultiplier = 0.5,
                position = Position
            });
        end;

        default(p10 - v16, InOutQuad, function(p18) -- Line: 81
            -- upvalues: Character (copy), Position (copy), Position2 (copy), u17 (copy)
            if Character.PrimaryPart == nil then
                return nil;
            end;

            local Position3 = Character:GetPrimaryPartCFrame().Position;
            local v19 = Position:Lerp(Position2, p18):Lerp(Position2:Lerp(Position3, p18), p18);
            u17:PivotTo(CFrame.new(v19) * CFrame.Angles(0, 6.283185307179586 * p18, 0));
        end, v16, 1):Wait();
        u17:Destroy();
        local v20 = u8:getParticle(p13, p9);

        if (v14 or v15) and tick() - u8.lastHealSoundTime > 0.25 then
            SoundManager:playSound(u8:getOrbHealSound(p13, p9), {
                rollOffMaxDistance = 100,
                position = Character.PrimaryPart.Position
            });
            u8.lastHealSoundTime = tick();
        end;

        for _, child in v20:GetChildren() do
            if child:IsA("ParticleEmitter") then
                local u21 = child:Clone();
                u21.Parent = Character.PrimaryPart;
                u21.Enabled = true;
                u21.Size = NumberSequence.new(0.1);
                task.delay(0.5, function() -- Line: 113
                    -- upvalues: u21 (copy)
                    u21.Enabled = false;
                    task.wait(3);
                    u21:Destroy();
                end);
            end;
        end;
    end);
    default2.Client:Get("AngelFirstTransform"):Connect(function(p22) -- Line: 122
        -- upvalues: SoundManager (ref), u8 (copy)
        local Character = p22.player.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame().Position;
        end;

        if Character == nil then
            return nil;
        end;

        SoundManager:playSound(u8:getTransformSound(p22.player, p22.angelType), {
            rollOffMaxDistance = 150,
            position = Character
        });
    end);
    WatchPlayer(function(u23, p24) -- Line: 152
        -- upvalues: SoundManager (ref), u8 (copy), KnitClient2 (ref)
        p24:GiveTask(u23:GetAttributeChangedSignal("AngelType"):Connect(function() -- Line: 153
            -- upvalues: u23 (copy), SoundManager (ref), u8 (ref), KnitClient2 (ref)
            local v25 = u23:GetAttribute("AngelType");
            local Character = u23.Character;

            if Character ~= nil then
                Character = Character:GetPrimaryPartCFrame().Position;
            end;

            if Character == nil then
                return nil;
            end;

            if v25 == nil then
                return nil;
            end;

            SoundManager:playSound(u8:getTransformSound(u23, v25), {
                rollOffMaxDistance = 150,
                position = Character
            });
            KnitClient2.Controllers.FancyExplosionController:createExplosion({
                radius = 0.5,
                randomSizeOffset = 0,
                randomPositionOffset = 0,
                inDuration = 0.25,
                outDuration = 0.4,
                position = Character,
                model = u8:getExplosionModel(u23, v25),
                simpleScaleParent = {
                    startScale = 0.7,
                    endScale = 0.9
                }
            });
        end));
    end);
end;

function u5.getKitSkinMeta(p26, p27) -- Line: 186
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    local v28 = KnitClient.Controllers.KitSkinController:getKitSkin(p27);

    if v28 == nil then
        return nil;
    end;

    local v29 = BedwarsKitSkinMeta[v28];

    if v29 == nil then
        return nil;
    end;

    return v29;
end;

function u5.getOrbCreateSound(p30, p31, p32) -- Line: 197
    -- upvalues: AngelType (copy), GameSound (copy)
    local v33 = p30:getKitSkinMeta(p31);

    if v33 ~= nil then
        v33 = v33.trinity;
    end;

    if v33 then
        if p32 == AngelType.LIGHT then
            return v33.lightOrbCreateSound;
        end;

        if p32 == AngelType.VOID then
            return v33.darkOrbCreateSound;
        end;
    else
        if p32 == AngelType.LIGHT then
            return GameSound.TRINITY_LIGHT_ORB_CREATE;
        end;

        if p32 == AngelType.VOID then
            return GameSound.TRINITY_VOID_ORB_CREATE;
        end;
    end;

    return GameSound.TRINITY_LIGHT_ORB_CREATE;
end;

function u5.getOrbHealSound(p34, p35, p36) -- Line: 218
    -- upvalues: AngelType (copy), GameSound (copy)
    local v37 = p34:getKitSkinMeta(p35);

    if v37 ~= nil then
        v37 = v37.trinity;
    end;

    if v37 then
        if p36 == AngelType.LIGHT then
            return v37.lightOrbHealSound;
        end;

        if p36 == AngelType.VOID then
            return v37.darkOrbHealSound;
        end;
    else
        if p36 == AngelType.LIGHT then
            return GameSound.TRINITY_LIGHT_ORB_HEAL;
        end;

        if p36 == AngelType.VOID then
            return GameSound.TRINITY_VOID_ORB_HEAL;
        end;
    end;

    return GameSound.TRINITY_LIGHT_ORB_HEAL;
end;

function u5.getTransformSound(p38, p39, p40) -- Line: 239
    -- upvalues: AngelType (copy), GameSound (copy)
    local v41 = p38:getKitSkinMeta(p39);

    if v41 ~= nil then
        v41 = v41.trinity;
    end;

    if v41 then
        if p40 == AngelType.LIGHT then
            return v41.lightTransformSound;
        end;

        if p40 == AngelType.VOID then
            return v41.darkTransformSound;
        end;
    else
        if p40 == AngelType.LIGHT then
            return GameSound.SPIRIT_EXPLODE;
        end;

        if p40 == AngelType.VOID then
            return GameSound.SPIRIT_EXPLODE;
        end;
    end;

    return GameSound.SPIRIT_EXPLODE;
end;

function u5.getOrbModel(p42, p43, p44) -- Line: 260
    -- upvalues: AngelType (copy), ReplicatedStorage (copy)
    local v45 = p42:getKitSkinMeta(p43);

    if v45 ~= nil then
        v45 = v45.trinity;
    end;

    if p44 == AngelType.LIGHT then
        local v46;

        if v45 == nil then
            v46 = v45;
        else
            v46 = v45.lightOrb;
        end;

        if v46 then
            return v45.lightOrb;
        end;

        return ReplicatedStorage.Assets.Effects.AngelLightOrb;
    end;

    local v47;

    if v45 == nil then
        v47 = v45;
    else
        v47 = v45.darkOrb;
    end;

    if v47 then
        return v45.darkOrb;
    end;

    return ReplicatedStorage.Assets.Effects.AngelVoidOrb;
end;

function u5.getExplosionModel(p48, p49, p50) -- Line: 288
    -- upvalues: AngelType (copy), ReplicatedStorage (copy)
    local v51 = p48:getKitSkinMeta(p49);

    if v51 ~= nil then
        v51 = v51.trinity;
    end;

    if p50 == AngelType.LIGHT then
        local v52;

        if v51 == nil then
            v52 = v51;
        else
            v52 = v51.lightExplosion;
        end;

        if v52 then
            return v51.lightExplosion;
        end;

        return ReplicatedStorage.Assets.Effects.AngelLightExplosion;
    end;

    local v53;

    if v51 == nil then
        v53 = v51;
    else
        v53 = v51.darkExplosion;
    end;

    if v53 then
        return v51.darkExplosion;
    end;

    return ReplicatedStorage.Assets.Effects.AngelVoidExplosion;
end;

function u5.getParticle(p54, p55, p56) -- Line: 316
    -- upvalues: AngelType (copy), ReplicatedStorage (copy)
    local v57 = p54:getKitSkinMeta(p55);

    if v57 ~= nil then
        v57 = v57.trinity;
    end;

    if p56 == AngelType.LIGHT then
        local v58;

        if v57 == nil then
            v58 = v57;
        else
            v58 = v57.lightParticle;
        end;

        if v58 then
            return v57.lightParticle;
        end;

        return ReplicatedStorage.Assets.Effects.AngelLightParticles;
    end;

    local v59;

    if v57 == nil then
        v59 = v57;
    else
        v59 = v57.darkParticle;
    end;

    if v59 then
        return v57.darkParticle;
    end;

    return ReplicatedStorage.Assets.Effects.AngelVoidParticles;
end;

KnitClient.CreateController(u5.new());

return nil;