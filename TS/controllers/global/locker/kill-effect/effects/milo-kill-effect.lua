-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getClosestBlockToWorldPosition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").getClosestBlockToWorldPosition;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "MiloKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 35
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(u8, u9, u10, u11) -- Line: 39
    -- upvalues: u1 (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), KillEffect (copy), PlaceUtil (copy), getClosestBlockToWorldPosition (copy), ItemType (copy), ReplicatedStorage (copy), ItemUtil (copy), CollectionService (copy), scaleModel (copy), u2 (copy), RunService (copy)
    local u12 = u1.new();
    task.spawn(function() -- Line: 41
        -- upvalues: u10 (copy), Workspace (ref), u12 (copy), GameAnimationUtil (ref), AnimationType (ref), KillEffect (ref), u8 (copy), PlaceUtil (ref), getClosestBlockToWorldPosition (ref), u11 (copy), ItemType (ref), ReplicatedStorage (ref), ItemUtil (ref), u9 (copy), CollectionService (ref), scaleModel (ref), u2 (ref), RunService (ref)
        u10.Archivable = true;
        local u13 = u10:Clone();
        u13.HumanoidRootPart.Anchored = true;
        u13.Parent = Workspace;
        u12:GiveTask(u13);
        GameAnimationUtil:playAnimation(u13, AnimationType.ROBLOX_DEFAULT_IDLE, {
            looped = true,
            speed = 1
        });
        local _DamageHighlight_ = u13:FindFirstChild("_DamageHighlight_");

        if _DamageHighlight_ then
            _DamageHighlight_:Destroy();
        end;

        KillEffect.hideCharacter(u8, u10);
        local UpperTorso = u13:FindFirstChild("UpperTorso");

        if not UpperTorso then
            return nil;
        end;

        local v14;

        if PlaceUtil.isLobbyServer() then
            v14 = nil;
        else
            v14 = getClosestBlockToWorldPosition(u11.Position);
        end;

        local v15;

        if v14 == nil then
            v15 = ItemType.GRASS;
        else
            v15 = v14.Name;
        end;

        local v16 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(v15);
        local v17 = ItemUtil.cloneItemIntoModel(v16);
        u12:GiveTask(v17);
        v17.Parent = UpperTorso;
        v17.Name = "MiloKillEffectBlock_" .. tostring(u9.UserId);

        local function _(p18) -- Line: 74
            if p18:IsA("BasePart") then
                p18.CanCollide = false;
                p18.Anchored = false;
            end;
        end;

        for i, descendant in v17:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.Anchored = false;
            end;
        end;

        CollectionService:AddTag(v17, "DontBlockSwordRaycast");
        v17:PivotTo(UpperTorso.CFrame);
        scaleModel(v17, 2.5);
        u2("WeldConstraint", {
            Part0 = v17.PrimaryPart,
            Part1 = UpperTorso,
            Parent = UpperTorso
        });
        local Head = u13:FindFirstChild("Head");

        if Head then
            Head.Transparency = 1;
        end;

        local v19 = u10:FindFirstChild("3DClothing");

        if v19 ~= nil then
            local Head2 = v19:FindFirstChild("Head");

            if Head2 ~= nil then
                local function _(p20) -- Line: 102
                    if p20:IsA("MeshPart") then
                        p20.Transparency = 1;
                    end;

                    if p20:IsA("Part") then
                        p20.Transparency = 1;
                    end;
                end;

                for i, child in Head2:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("MeshPart") then
                        child.Transparency = 1;
                    end;

                    if child:IsA("Part") then
                        child.Transparency = 1;
                    end;
                end;
            end;
        end;

        u8:playEffect(UpperTorso.Position);
        task.wait(1.5);
        GameAnimationUtil:playAnimation(u13, AnimationType.ROBLOX_DEFAULT_WALK, {
            looped = true,
            speed = 2
        });
        local Character = u8.killerPlayer.Character;
        local v21;

        if Character == nil then
            v21 = Character;
        else
            v21 = Character.PrimaryPart;
        end;

        if Character and v21 then
            local Unit = (u13:GetPivot().Position - v21.Position).Unit;
            local v22 = u13:GetPivot().Position + Unit;
            u13.HumanoidRootPart.CFrame = CFrame.lookAt(u13:GetPivot().Position, v22, Vector3.new(0, 1, 0));
        end;

        local X = u13:GetPivot().LookVector.X;
        local Z = u13:GetPivot().LookVector.Z;
        local Unit = Vector3.new(X, 0, Z).Unit;
        local u24 = RunService.Heartbeat:Connect(function(p23) -- Line: 140
            -- upvalues: u13 (copy), Unit (copy)
            u13:SetPrimaryPartCFrame(u13:GetPrimaryPartCFrame() + Unit * (40 * p23));
        end);
        u12:GiveTask(function() -- Line: 147
            -- upvalues: u24 (copy)
            if u24 and u24.Connected then
                u24:Disconnect();
            end;
        end);
        task.delay(10, function() -- Line: 152
            -- upvalues: u24 (copy), u13 (copy)
            if u24 and u24.Connected then
                u24:Disconnect();
            end;

            u13:Destroy();
        end);
    end);

    return u12;
end;

function u4.playEffect(p25, p26) -- Line: 162
    -- upvalues: GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy)
    local MIMIC_HIDE = GameSound.MIMIC_HIDE;
    local v27 = ReplicatedStorage.Assets.Effects.MimicBlockEffect:Clone();
    v27.Parent = Workspace;
    v27.Position = p26;
    EffectUtil:playEffects({ v27 }, nil, {
        destroyAfterSec = 1
    });
    SoundManager:playSound(MIMIC_HIDE, {
        volumeMultiplier = 0.25,
        position = p26
    });
end;

return u4;