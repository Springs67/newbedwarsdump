-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v2.InExpo;
local InQuart = v2.InQuart;
local Linear = v2.Linear;
local OutExpo = v2.OutExpo;
local OutQuart = v2.OutQuart;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = Random.new();
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "IceBlockKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 36
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.onKill(p10, p11, p12, u13) -- Line: 40
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), GameQueryUtil (copy), u5 (copy), RuntimeLib (copy), default (copy), InExpo (copy), OutExpo (copy), InQuart (copy), Linear (copy), OutQuart (copy), EffectUtil (copy), GameWorldUtil (copy)
    local u14 = u3.new();
    local u15 = true;
    p12.Archivable = true;
    local u16 = p12:Clone();
    u16:PivotTo(u13);
    u16.Parent = Workspace;
    u16.HumanoidRootPart.Anchored = false;
    u16.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    KillEffect.hideCharacter(p10, p12);
    u14:GiveTask(u16);
    local u17 = ReplicatedStorage.Assets.Effects.FracturedIceBlock:Clone();
    u17:PivotTo(u16:GetPivot());
    u17.Parent = Workspace;
    local u18 = SoundManager:playModifiableSound(GameSound.WINTER_BOSS_FROST_LOOP, {
        looped = true,
        volumeMultiplier = 0,
        position = u13.Position,
        parent = u16.HumanoidRootPart
    });

    if u18 then
        u14:GiveTask(function() -- Line: 62
            -- upvalues: u18 (copy)
            u18:Destroy();
        end);
    end;

    local u19 = {};

    for _, child in u17:GetChildren() do
        if child:IsA("BasePart") then
            child.Material = Enum.Material.Glass;
            GameQueryUtil:setQueryIgnored(child, true);
            local v20 = {
                size = child.Size
            };
            local Position = child.Position;
            local v21 = u5:NextNumber(-6, 6);
            local v22 = u5:NextNumber(-6, 6);
            v20.origin = Position + Vector3.new(v21, v22, u5:NextNumber(-6, 6));
            v20.position = child.Position;
            u19[child] = v20;
            child.Size = Vector3.new(0, 0, 0);
        end;
    end;

    u14:GiveTask(u17);
    local u31 = RuntimeLib.Promise.new(function() -- Line: 84
        -- upvalues: default (ref), InExpo (ref), u18 (copy), OutExpo (ref), u17 (copy), u19 (copy), InQuart (ref), Linear (ref), OutQuart (ref), u16 (copy), u15 (ref), ReplicatedStorage (ref), u14 (copy), u13 (copy), GameQueryUtil (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), GameWorldUtil (ref)
        default(2.5, InExpo, function(p23) -- Line: 85
            -- upvalues: u18 (ref)
            if u18 then
                u18.Volume = p23;
            end;
        end, 0, 1);
        default(0.25, OutExpo, function(p24) -- Line: 90
            -- upvalues: u17 (ref), u19 (ref)
            for _, child in u17:GetChildren() do
                if child:IsA("BasePart") then
                    local v25 = u19[child];

                    if v25 then
                        child.Size = v25.size * p24;
                        child.Position = v25.origin:Lerp(v25.position, p24);
                        child.Transparency = 0.9 * p24;
                    end;
                end;
            end;
        end, 0, 1):Wait();
        default(2, InQuart, function(p26) -- Line: 104
            -- upvalues: u17 (ref), Linear (ref)
            for _, child in u17:GetChildren() do
                if child:IsA("BasePart") then
                    child.Transparency = Linear(p26, 0.9, -0.8, 1);
                end;
            end;
        end, 0, 1):Wait();
        task.wait(0.1);
        default(0.1, OutQuart, function(p27) -- Line: 112
            -- upvalues: u17 (ref), Linear (ref)
            for _, child in u17:GetChildren() do
                if child:IsA("BasePart") then
                    child.Transparency = Linear(p27, 0.1, -0.1, 1);
                end;
            end;
        end, 0, 1):Wait();
        local v28 = u18;

        if v28 ~= nil then
            v28:Destroy();
        end;

        u16:Destroy();

        if not u15 then
            return nil;
        end;

        local v29 = ReplicatedStorage.Assets.Effects.SmallIceBreakEffect:Clone();
        u14:GiveTask(v29);
        v29.Position = u13.Position;
        v29.Transparency = 1;
        v29.CanCollide = false;
        GameQueryUtil:setQueryIgnored(v29, true);
        v29.Parent = Workspace;
        EffectUtil:playEffects({ v29 }, nil, {
            destroyAfterSec = 0.75
        });
        u14:GiveTask(SoundManager:playSound(GameSound.WINTER_BOSS_ICE_BREAK, {
            rollOffMaxDistance = 150,
            position = u13.Position
        }));

        for _, child in u17:GetChildren() do
            if child:IsA("BasePart") then
                child.Anchored = false;
                local v30 = GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 0.5235987755982988) * (child.AssemblyMass * 70);
                child:ApplyImpulse(v30);
                child:ApplyAngularImpulse(v30 * 0.5);
            end;
        end;
    end);
    u14:GiveTask(function() -- Line: 152
        -- upvalues: u15 (ref), u31 (copy)
        u15 = false;
        u31:cancel();
    end);
    task.delay(6, function() -- Line: 156
        -- upvalues: u14 (copy)
        u14:DoCleaning();
    end);

    return u14;
end;

return u6;