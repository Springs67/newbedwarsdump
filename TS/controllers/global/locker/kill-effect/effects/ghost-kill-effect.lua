-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = Color3.fromRGB(115, 192, 144);
local u4 = Color3.fromRGB(48, 117, 87);
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "GhostKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 25
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 29
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 33
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), TweenService (copy), u3 (copy), ReplicatedStorage (copy), u4 (copy), RuntimeLib (copy), default (copy), OutExpo (copy)
    local u13 = u1.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    KillEffect.hideCharacter(p9, p11);
    u13:GiveTask(SoundManager:playSound(GameSound.GHOST_VACUUM_SUCKING_LOOP, {
        position = u14:GetPivot().Position
    }));
    local v15 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
    local v16 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);

    for _, descendant in u14:GetDescendants() do
        if descendant:IsA("BasePart") then
            TweenService:Create(descendant, v15, {
                Transparency = 1
            }):Play();
            TweenService:Create(descendant, v16, {
                Color = u3
            }):Play();

            if descendant.Name == "LeftHand" or (descendant.Name == "LeftFoot" or (descendant.Name == "RightHand" or (descendant.Name == "RightFoot" or (descendant.Name == "UpperTorso" or descendant.Name == "Head")))) then
                for _, child in ReplicatedStorage.Assets.Effects.GhostSmokeEffect:Clone():GetChildren() do
                    child.Parent = descendant;
                    child.Enabled = true;
                    child.LockedToPart = false;
                    child.Acceleration = Vector3.new(0, 0.1, 0);
                    child.Rate = 25;
                end;
            end;
        elseif descendant:IsA("Texture") or descendant:IsA("Clothing") then
            if descendant:IsA("Texture") then
                TweenService:Create(descendant, v15, {
                    Transparency = 0.45
                }):Play();
            end;

            TweenService:Create(descendant, v16, {
                Color3 = u4
            }):Play();
        end;
    end;

    local u17 = u14:GetPivot();
    local u19 = RuntimeLib.Promise.new(function() -- Line: 82
        -- upvalues: u14 (copy), u17 (copy), default (ref), OutExpo (ref), u13 (copy)
        task.delay(0.75, function() -- Line: 83
            -- upvalues: u14 (ref), u17 (ref), default (ref), OutExpo (ref)
            default(1.5, OutExpo, function(p18) -- Line: 84
                -- upvalues: u14 (ref)
                return u14:PivotTo(p18);
            end, u14:GetPivot(), u17 * CFrame.new(0, 15, 0)):Play();
        end);
        task.delay(2.25, function() -- Line: 93
            -- upvalues: u13 (ref)
            u13:DoCleaning();
        end);
    end);
    u13:GiveTask(function() -- Line: 97
        -- upvalues: u19 (copy)
        return u19:cancel();
    end);

    return u13;
end;

return u5;