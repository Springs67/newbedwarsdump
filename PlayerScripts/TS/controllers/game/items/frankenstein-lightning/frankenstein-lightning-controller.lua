-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local FrankensteinCurseClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "frankenstein-curse-client-status-effect-handler").FrankensteinCurseClientStatusEffectHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "FrankensteinLightningController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: GameSound (copy)
    p5.lightning_strike_sounds = { GameSound.FRANKEN_LIGHTNING_STRIKE_1, GameSound.FRANKEN_LIGHTNING_STRIKE_2, GameSound.FRANKEN_LIGHTNING_STRIKE_3 };
    p5.lightning_hit_player_sounds = { GameSound.FRANKEN_LIGHTNING_HIT_PLAYER_1, GameSound.FRANKEN_LIGHTNING_HIT_PLAYER_2, GameSound.FRANKEN_LIGHTNING_HIT_PLAYER_3 };
end;

function u3.onStart(u6) -- Line: 37
    -- upvalues: KnitClient (copy), getQueueMeta (copy), GameSound (copy), GameType (copy), default (copy), SoundManager (copy), RandomUtil (copy), StatusEffectType (copy), FrankensteinCurseClientStatusEffectHandler (copy)
    local v7, v8 = KnitClient.Controllers.MatchController:getQueueTypeAsync():await();

    if v7 and getQueueMeta(v8).luckyBlock ~= nil then
        local PreloadController = KnitClient.Controllers.PreloadController;
        local v9 = {};
        local v10 = { GameSound.FRANKEN_LIGHTNING_CHARGE };
        local v11 = #v10;
        local lightning_strike_sounds = u6.lightning_strike_sounds;
        local v12 = #lightning_strike_sounds;
        table.move(lightning_strike_sounds, 1, v12, v11 + 1, v10);
        local lightning_hit_player_sounds = u6.lightning_hit_player_sounds;
        table.move(lightning_hit_player_sounds, 1, #lightning_hit_player_sounds, v11 + v12 + 1, v10);
        v9.sounds = v10;
        v9.loadOnGameTypes = { GameType.BEDWARS };
        PreloadController:runPreload(v9);
    end;

    default.Client:Get("LightningDischarge"):Connect(function(u13) -- Line: 58
        -- upvalues: u6 (copy), SoundManager (ref), RandomUtil (ref)
        local u14 = u13.sourcePlayer and true or false;

        local function _(p15) -- Line: 61
            -- upvalues: u6 (ref)
            return u6:shockCharacter(p15);
        end;

        for i, v in u13.struckInstances do
            local _ = i - 1;
            u6:shockCharacter(v);
        end;

        local struckInstances = u13.struckInstances;

        local function v20(p16) -- Line: 68
            -- upvalues: u14 (copy), u13 (copy), SoundManager (ref), RandomUtil (ref), u6 (ref)
            local v17 = u14;

            if v17 then
                v17 = u13.sourcePlayer;

                if v17 ~= nil then
                    v17 = v17.Character;
                end;
            end;

            if v17 then
                SoundManager:playSound(RandomUtil.fromList(unpack(u6.lightning_hit_player_sounds)), {
                    rollOffMinDistance = 10,
                    rollOffMaxDistance = 80,
                    volumeMultiplier = 0.4,
                    position = u6:getSoundPosition(p16)
                });
                u6:charactersConnectedShock(u13.sourcePlayer.Character, p16);

                return;
            end;

            local v18 = RandomUtil.fromList(unpack(u6.lightning_strike_sounds));
            local v19 = {};
            local sourceBlock = u13.sourceBlock;

            if sourceBlock ~= nil then
                sourceBlock = sourceBlock.Position;
            end;

            v19.position = sourceBlock;
            v19.rollOffMinDistance = 10;
            v19.rollOffMaxDistance = 80;
            v19.volumeMultiplier = 0.4;
            SoundManager:playSound(v18, v19);
            u6:coilConnectedShock(u13.sourceBlock, p16);
        end;

        for i, v in struckInstances do
            v20(v, i - 1, struckInstances);
        end;
    end);
    default.Client:Get("LightningChargeUp"):Connect(function(p21) -- Line: 106
        -- upvalues: SoundManager (ref), GameSound (ref), u6 (copy)
        if not p21.source then
            return nil;
        end;

        local function _(p22) -- Line: 112
            return p22.Name == "FrankenBolt";
        end;

        local v23 = nil;

        for i, v in p21.source.Humanoid:GetAccessories() do
            local _ = i - 1;

            if v.Name == "FrankenBolt" == true then
                v23 = v;
                break;
            end;
        end;

        if v23 then
            local Handle = v23:FindFirstChild("Handle");

            if Handle ~= nil then
                Handle = Handle:FindFirstChild("Lightning");
            end;

            if Handle then
                Handle.Enabled = true;
                SoundManager:playSound(GameSound.FRANKEN_LIGHTNING_CHARGE, {
                    rollOffMinDistance = 10,
                    rollOffMaxDistance = 80,
                    volumeMultiplier = 0.4,
                    position = u6:getSoundPosition(p21.source)
                });
                task.delay(1, function() -- Line: 139
                    -- upvalues: Handle (copy)
                    Handle.Enabled = false;

                    return Handle.Enabled;
                end);
            end;
        end;
    end);
    KnitClient.Controllers.StatusEffectController:setHandler(StatusEffectType.FRANKENSTEIN_MONSTER, FrankensteinCurseClientStatusEffectHandler);
end;

function u3.charactersConnectedShock(p24, p25, p26) -- Line: 148
    local v27 = p24:getShockAttachment(p25);
    local v28 = p24:getShockAttachment(p26);

    if v27 and v28 then
        p24:spawnConnectedShocks(v27, v28);
    end;
end;

function u3.coilConnectedShock(p29, p30, p31) -- Line: 155
    local v32 = p29:getLightningCoilAttachment(p30);
    local v33 = p29:getShockAttachment(p31);
    p29:activateCoilParticles(p30);

    if v32 and v33 then
        p29:spawnConnectedShocks(v32, v33);
    end;
end;

function u3.activateCoilParticles(p34, p35) -- Line: 163
    local pSphere1 = p35:GetRootPart():FindFirstChild("pSphere1");
    local u36;

    if pSphere1 == nil then
        u36 = pSphere1;
    else
        u36 = pSphere1:FindFirstChild("Lightning");
    end;

    if pSphere1 ~= nil then
        pSphere1 = pSphere1:FindFirstChild("z");
    end;

    local v37;

    if u36 == nil then
        v37 = u36;
    else
        v37 = u36.Enabled;
    end;

    if v37 then
        if pSphere1 == nil then
            v37 = pSphere1;
        else
            v37 = pSphere1.Enabled;
        end;
    end;

    if u36 and (pSphere1 and not v37) then
        u36.Enabled = true;
        pSphere1.Enabled = true;
        task.delay(1.2, function() -- Line: 191
            -- upvalues: u36 (copy), pSphere1 (copy)
            u36.Enabled = false;
            pSphere1.Enabled = false;
        end);
    end;
end;

function u3.spawnConnectedShocks(p38, p39, p40) -- Line: 197
    -- upvalues: ReplicatedStorage (copy), TweenService (copy)
    local StaticConnection = ReplicatedStorage.Assets.Effects.StaticConnection;
    local u41 = StaticConnection.Beam1:Clone();
    local u42 = StaticConnection.Beam2:Clone();
    local u43 = StaticConnection.PointLight:Clone();
    u41.Parent = p39;
    u41.Attachment0 = p39;
    u41.Attachment1 = p40;
    u42.Parent = p39;
    u42.Attachment0 = p39;
    u42.Attachment1 = p40;
    u43.Parent = p39;
    task.delay(0.24, function() -- Line: 209
        -- upvalues: TweenService (ref), u41 (copy), u42 (copy), u43 (copy)
        TweenService:Create(u41, TweenInfo.new(0.12), {
            Width0 = 0,
            Width1 = 0
        }):Play();
        TweenService:Create(u42, TweenInfo.new(0.12), {
            Width0 = 0,
            Width1 = 0
        }):Play();
        task.wait(0.12);
        u41:Destroy();
        u42:Destroy();
        u43:Destroy();
    end);
end;

function u3.shockCharacter(p44, p45) -- Line: 224
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local UpperTorso = p45:FindFirstChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    local u46 = ReplicatedStorage.Assets.Effects.StaticHit:Clone();
    u46.Parent = Workspace;
    u46.Anchored = false;
    u46.CFrame = UpperTorso.CFrame;
    u46.Lightning.Anchored = false;
    u46.Lightning.CFrame = UpperTorso.CFrame;
    EffectUtil:playEffects(u46:GetChildren(), p45);
    task.delay(0.2, function() -- Line: 236
        -- upvalues: u46 (copy)
        u46.Attachment.PointLight.Enabled = false;
    end);
    task.delay(5, function() -- Line: 239
        -- upvalues: u46 (copy)
        u46:Destroy();
    end);
end;

function u3.getShockAttachment(p47, p48) -- Line: 243
    local UpperTorso = p48:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
    end;

    return UpperTorso;
end;

function u3.getLightningCoilAttachment(p49, p50) -- Line: 250
    local Glow = p50:GetRootPart():FindFirstChild("Glow");

    if Glow ~= nil then
        Glow = Glow:FindFirstChild("GlowAttachment");
    end;

    return Glow;
end;

function u3.getSoundPosition(p51, p52) -- Line: 257
    -- upvalues: Players (copy)
    if Players.LocalPlayer.Character == p52 then
        return nil;
    end;

    local PrimaryPart = p52.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    return PrimaryPart;
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/game/items/frankenstein-lightning/frankenstein-lightning-controller@FrankensteinLightningController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    default = u3
};