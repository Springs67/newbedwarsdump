-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "TitanBlessingStatusEffectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "TitanBlessingStatusEffectController";
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 33
        -- upvalues: StatusEffectType (ref), u5 (copy)
        if p6.statusEffect == StatusEffectType.TITANS_BLESSING or (p6.statusEffect == StatusEffectType.SPIRIT_TITANS_BLESSING or p6.statusEffect == StatusEffectType.VOID_TITANS_BLESSING) then
            u5:createWingEffect(p6.entityInstance, p6.statusEffect);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p7) -- Line: 38
        -- upvalues: StatusEffectType (ref), u5 (copy)
        if p7.statusEffect == StatusEffectType.TITANS_BLESSING or (p7.statusEffect == StatusEffectType.SPIRIT_TITANS_BLESSING or p7.statusEffect == StatusEffectType.VOID_TITANS_BLESSING) then
            u5:removeWings(p7.entityInstance);
        end;
    end);
end;

function u2.createWingEffect(p8, p9, p10) -- Line: 44
    -- upvalues: StatusEffectType (copy), ReplicatedStorage (copy), WeldUtil (copy), SoundManager (copy), GameSound (copy), RunService (copy)
    if p9:FindFirstChild("BossWings") or (p9:FindFirstChild("BossWingsSpirit") or p9:FindFirstChild("BossWingsVoid")) then
        return nil;
    end;

    local v11;

    if p10 == StatusEffectType.TITANS_BLESSING then
        v11 = ReplicatedStorage.Assets.Effects.BossWings:Clone();
    elseif p10 == StatusEffectType.SPIRIT_TITANS_BLESSING then
        v11 = ReplicatedStorage.Assets.Effects.BossWingsSpirit:Clone();
    else
        if p10 ~= StatusEffectType.VOID_TITANS_BLESSING then
            ReplicatedStorage.Assets.Effects.BossWings:Clone();

            return nil;
        end;

        v11 = ReplicatedStorage.Assets.Effects.BossWingsVoid:Clone();
    end;

    local v12 = v11 or ReplicatedStorage.Assets.Effects.BossWings:Clone();
    v12.Parent = p9;
    local UpperTorso = p9:WaitForChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:WaitForChild("BodyBackAttachment");
    end;

    if UpperTorso then
        WeldUtil:weldAccessory(p9, v12);
        local FROST_STORM_START = GameSound.FROST_STORM_START;
        local v13 = {};
        local PrimaryPart = p9.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        v13.position = PrimaryPart;
        v13.rollOffMaxDistance = 220;
        SoundManager:playSound(FROST_STORM_START, v13);
        local u14 = {};

        local function _(p15) -- Line: 91
            -- upvalues: u14 (copy)
            if (p15.Name == "grey" or p15.Name == "neon") and p15:IsA("MeshPart") then
                table.insert(u14, p15);
            end;

            if p15:IsA("ParticleEmitter") then
                p15:Emit(30);
            end;
        end;

        for i, descendant in v12:GetDescendants() do
            local _ = i - 1;

            if (descendant.Name == "grey" or descendant.Name == "neon") and descendant:IsA("MeshPart") then
                table.insert(u14, descendant);
            end;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(30);
            end;
        end;

        local u16 = 0;
        local u17 = nil;
        u17 = RunService.Heartbeat:Connect(function(p18) -- Line: 106
            -- upvalues: u16 (ref), u17 (ref), u14 (copy)
            u16 = u16 + p18;

            if u16 >= 1 then
                u17:Disconnect();
            end;

            local v19 = u14;

            local function v22(p20) -- Line: 112
                -- upvalues: u16 (ref)
                p20.Transparency = 1 - u16;

                if p20.Name == "grey" then
                    local function _(p21) -- Line: 116
                        if p21:IsA("ParticleEmitter") and p21.Enabled == false then
                            p21.Enabled = true;
                        end;
                    end;

                    for i, descendant in p20:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("ParticleEmitter") and descendant.Enabled == false then
                            descendant.Enabled = true;
                        end;
                    end;
                end;
            end;

            for i, v in v19 do
                v22(v, i - 1, v19);
            end;
        end);
    end;
end;

function u2.removeWings(p23, p24) -- Line: 132
    local BossWings = p24:FindFirstChild("BossWings");

    if BossWings then
        BossWings:Destroy();
    end;

    local BossWingsSpirit = p24:FindFirstChild("BossWingsSpirit");

    if BossWingsSpirit then
        BossWingsSpirit:Destroy();
    end;

    local BossWingsVoid = p24:FindFirstChild("BossWingsVoid");

    if BossWingsVoid then
        BossWingsVoid:Destroy();
    end;
end;

KnitClient.CreateController(u2.new());

return nil;