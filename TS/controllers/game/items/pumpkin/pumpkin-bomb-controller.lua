-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PumpkinBombController";
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
    p4.Name = "PumpkinBombController";
    p4.miniPumpkinCount = 3;
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:WaitFor("PumpkinExplode"):andThen(function(p6) -- Line: 35
        -- upvalues: u5 (copy)
        p6:Connect(function(p7) -- Line: 36
            -- upvalues: u5 (ref)
            u5:playExplosion(p7.position);
            u5:playMiniEffects(p7.position);
        end);
    end);
end;

function u2.playExplosion(p8, p9) -- Line: 52
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local u10 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    u10.Parent = Workspace;
    EffectUtil:playEffects({ u10 }, nil, {
        sizeMultiplier = 1
    });
    u10.CFrame = CFrame.new(p9);
    task.delay(2, function() -- Line: 59
        -- upvalues: u10 (copy)
        u10:Destroy();
    end);
end;

function u2.playMiniEffects(u11, u12) -- Line: 63
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), TweenService (copy), SoundManager (copy), GameSound (copy)
    local u13 = 0;
    local v14 = false;
    local v15 = { Vector3.new(0, 5, 0), Vector3.new(6, 2, 3), Vector3.new(-6, 2, -3) };

    while true do
        if v14 then
            u13 = u13 + 1;
        else
            v14 = true;
        end;

        if u13 >= u11.miniPumpkinCount then
            return;
        end;

        local u16 = ReplicatedStorage.Assets.Misc.PumpkinBomb:Clone();
        local u17 = u16;
        u16.CFrame = CFrame.new(u12);

        local function _(p18) -- Line: 82
            -- upvalues: u17 (ref), u12 (copy)
            if p18.Name == "Pumpkin" then
                u17 = p18;
                p18.CFrame = CFrame.new(u12);
            end;
        end;

        for i, child in u16:GetChildren() do
            local _ = i - 1;

            if child.Name == "Pumpkin" then
                u17 = child;
                child.CFrame = CFrame.new(u12);
            end;
        end;

        u16.Parent = Workspace;
        local u19 = u17.Position + v15[u13 + 1];
        task.delay(0.1, function() -- Line: 96
            -- upvalues: TweenService (ref), u17 (ref), u13 (ref), u19 (copy)
            TweenService:Create(u17, TweenInfo.new(u13 * 0.55 + 0.55, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut), {
                Orientation = Vector3.new(90, 180, 90),
                Position = u19,
                Size = u17.Size * 2
            }):Play();
        end);
        task.delay(u13 * 0.5 + 0.5, function() -- Line: 103
            -- upvalues: u11 (copy), u19 (copy), SoundManager (ref), GameSound (ref), u16 (copy)
            u11:playExplosion(u19);
            SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                rollOffMaxDistance = 300,
                position = u19
            });
            u16:Destroy();
        end);
        u13 = u13;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;