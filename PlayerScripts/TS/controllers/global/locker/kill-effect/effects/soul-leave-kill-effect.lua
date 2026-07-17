-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutExpo = v1.OutExpo;
local OutQuint = v1.OutQuint;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "SoulLeaveKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 31
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, p11, p12) -- Line: 35
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), default (copy), OutExpo (copy), OutQuint (copy), ReplicatedStorage (copy), EffectUtil (copy), u3 (copy), Linear (copy)
    local u13 = u2.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    KillEffect.hideCharacter(u9, p11);
    SoundManager:playSound(GameSound.GHOST_PILLAR_ERUPT, {
        position = u14:GetPivot().Position
    });
    local v15 = CFrame.new(0, -3, 0);
    local v16 = CFrame.Angles(1.5707963267948966, 0, 0);
    default(0.5, OutExpo, function(p17) -- Line: 50
        -- upvalues: u14 (copy)
        return u14:PivotTo(p17);
    end, p12, p12 * v15 * v16);
    default(0.7, OutQuint, function(u18) -- Line: 59
        -- upvalues: u14 (copy)
        local v19 = u14:GetDescendants();

        local function v21(p20) -- Line: 61
            -- upvalues: u18 (copy)
            if p20:IsA("BasePart") and u18 > p20.Transparency then
                p20.Transparency = u18;

                return;
            end;

            if p20:IsA("GuiObject") then
                p20.Transparency = u18;

                return;
            end;

            if p20:IsA("UIStroke") then
                p20.Transparency = u18;

                return;
            end;

            if p20:IsA("Decal") then
                p20.Transparency = u18;
            end;
        end;

        for i, v in v19 do
            v21(v, i - 1, v19);
        end;
    end, 0, 1);
    local v22 = ReplicatedStorage.Assets.Effects.SoulLeaveKillEffect.DeathEffect:Clone();
    v22.Position = u14.PrimaryPart:GetPivot().Position;
    v22.Parent = u14.PrimaryPart;
    EffectUtil:playEffects({ v22 }, nil, {
        destroyAfterSec = 2.2
    });
    task.delay(0.5, function() -- Line: 84
        -- upvalues: ReplicatedStorage (ref), u13 (copy), u14 (copy), u3 (ref), Workspace (ref), u9 (copy), default (ref), Linear (ref)
        local GhostKillEffect = ReplicatedStorage.Assets.Misc:FindFirstChild("GhostKillEffect");

        if GhostKillEffect ~= nil then
            GhostKillEffect = GhostKillEffect:Clone();
        end;

        u13:GiveTask(GhostKillEffect);
        local RootPart = GhostKillEffect:FindFirstChild("RootPart");
        local u23;

        if RootPart == nil then
            u23 = RootPart;
        else
            u23 = RootPart:FindFirstChild("HeadAttachment");
        end;

        local u24;

        if u23 == nil then
            u24 = u23;
        else
            u24 = u23.WorldCFrame + Vector3.new(0, 0, 0.1);
        end;

        if not (RootPart and u24) then
            return u13;
        end;

        local u25 = u14.Head:Clone();
        u25.Neck:Destroy();
        u25.Anchored = true;
        u25:PivotTo(u24);
        u3("WeldConstraint", {
            Part0 = RootPart,
            Part1 = u25,
            Parent = u25
        });
        u25.Parent = GhostKillEffect;
        u25.Transparency = 1;
        local v26 = u14:GetChildren();

        local function v33(p27) -- Line: 123
            -- upvalues: u23 (copy), u3 (ref), u25 (copy)
            if not p27:IsA("Accessory") then
                return nil;
            end;

            if p27.AccessoryType ~= Enum.AccessoryType.Hat and (p27.AccessoryType ~= Enum.AccessoryType.Hair and p27.AccessoryType ~= Enum.AccessoryType.Face) then
                return nil;
            end;

            if p27.AccessoryType == Enum.AccessoryType.Hat then
                local v28 = p27:FindFirstChildOfClass("MeshPart");

                if not v28 then
                    return nil;
                end;

                local v29 = { v28.Size.X, v28.Size.Y, v28.Size.Z };
                table.sort(v29, function(p30, p31) -- Line: 137
                    return p31 < p30;
                end);

                if v29[1] > 3.5 then
                    return nil;
                end;
            end;

            local v32 = p27:Clone();
            local Handle = v32:WaitForChild("Handle", 1);

            if Handle then
                Handle.Name = v32.Name;
                Handle:PivotTo(u23.WorldCFrame);
                u3("WeldConstraint", {
                    Part0 = Handle,
                    Part1 = u25,
                    Parent = Handle
                });
                Handle.Parent = u25;
            end;
        end;

        for i, v in v26 do
            v33(v, i - 1, v26);
        end;

        local v34 = u14:FindFirstChild("3DClothing") or u14:FindFirstChild("Clothing");
        local u35 = { "Hat", "Head", "Mesh/Hat", "Mesh/Face", "Mesh/Head", "Mesh/Hair", "Mesh/Eyes" };

        if v34 ~= nil then
            local v36 = v34:GetChildren();

            local function v39(p37) -- Line: 169
                -- upvalues: u35 (copy), u25 (copy), u3 (ref), u24 (copy)
                if table.find(u35, p37.Name) ~= nil then
                    local v38 = p37:Clone();
                    v38.Parent = u25;
                    u3("WeldConstraint", {
                        Part0 = v38,
                        Part1 = u25,
                        Parent = v38
                    });

                    if u24 and v38 ~= nil then
                        v38:PivotTo(u24);
                    end;
                end;
            end;

            for i, v in v36 do
                v39(v, i - 1, v36);
            end;
        end;

        local function _(p40) -- Line: 193
            if p40:IsA("BasePart") or p40:IsA("Decal") then
                p40.Transparency = 0.5;
            end;
        end;

        for i, descendant in u25:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") or descendant:IsA("Decal") then
                descendant.Transparency = 0.5;
            end;
        end;

        GhostKillEffect:PivotTo(u14.PrimaryPart:GetPivot());
        GhostKillEffect.Parent = Workspace;
        local Character = u9.killerPlayer.Character;
        local v41 = CFrame;
        local Position = GhostKillEffect:GetPivot().Position;
        local v42;

        if Character then
            local v43;

            if Character == nil then
                v43 = Character;
            else
                v43 = Character.PrimaryPart;
            end;

            v42 = v43.Position;
        else
            v42 = GhostKillEffect:GetPivot().LookVector;
        end;

        local v44 = v41.lookAt(Position, v42);

        local function v48(p45) -- Line: 218
            -- upvalues: GhostKillEffect (copy)
            local v46 = math.sin(p45.Y);
            local v47 = math.sin(p45.Y);
            GhostKillEffect:PivotTo(p45 + Vector3.new(v46, 0, v47));
        end;

        local v49 = CFrame;
        local Position2 = (GhostKillEffect:GetPivot() + Vector3.new(0, 9, 0)).Position;
        local v50;

        if Character then
            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            v50 = Character.Position;
        else
            v50 = GhostKillEffect:GetPivot().LookVector;
        end;

        default(2, Linear, v48, v44, v49.lookAt(Position2, v50));
        default(2, Linear, function(u51) -- Line: 240
            -- upvalues: GhostKillEffect (copy)
            local function _(p52) -- Line: 242
                -- upvalues: u51 (copy)
                if p52:IsA("BasePart") and u51 > p52.Transparency then
                    p52.Transparency = u51;
                end;
            end;

            for i, descendant in GhostKillEffect:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") and descendant.Transparency < u51 then
                    descendant.Transparency = u51;
                end;
            end;
        end, 0, 1);
        task.delay(3, function() -- Line: 251
            -- upvalues: u13 (ref)
            u13:DoCleaning();
        end);
    end);

    return u13;
end;

return u5;