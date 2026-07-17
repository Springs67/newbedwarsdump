-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v1.InExpo;
local OutExpo = v1.OutExpo;
local OutSine = v1.OutSine;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "PirateShipAttackKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 32
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, u12) -- Line: 36
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), scaleModel (copy), default (copy), OutExpo (copy), u3 (copy), InExpo (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), OutSine (copy), RunService (copy)
    local u13 = u2.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14:PivotTo(u12);
    u14.Parent = Workspace;

    local function _(p15) -- Line: 46
        if p15:IsA("BasePart") then
            p15.CanCollide = false;
            p15.CanQuery = false;
        end;
    end;

    local u16 = true;

    for i, descendant in u14:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
        end;
    end;

    KillEffect.hideCharacter(p9, p11);
    u13:GiveTask(u14);
    local u17 = u14:GetPivot();
    local u18 = ReplicatedStorage.Assets.Misc.PirateShip:Clone();
    u18:PivotTo(u17 * (CFrame.new(5, 8, 10) * CFrame.fromOrientation(0.5235987755982988, 1.5707963267948966, 0)));
    local RootPart = u18:FindFirstChild("RootPart");

    if RootPart ~= nil then
        local master_bone = RootPart:FindFirstChild("master_bone");

        if master_bone ~= nil then
            local hull = master_bone:FindFirstChild("hull");

            if hull ~= nil then
                hull:Destroy();
            end;
        end;
    end;

    local function _(p19) -- Line: 75
        if not p19:IsA("BasePart") then
            if p19:IsA("Decal") then
                p19.Transparency = 1;
            end;

            return;
        end;

        p19.CanCollide = false;
        p19.CanQuery = false;
        p19.Transparency = 1;
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    scaleModel(u18, 0.05);
    u18.Parent = Workspace;
    u13:GiveTask(u18);

    local function _(u20) -- Line: 92
        -- upvalues: default (ref), OutExpo (ref)
        if u20:IsA("BasePart") then
            default(0.75, OutExpo, function(p21) -- Line: 94
                -- upvalues: u20 (copy)
                u20.Transparency = p21;

                return u20.Transparency;
            end, 1, 0);
        end;
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            default(0.75, OutExpo, function(p22) -- Line: 94
                -- upvalues: descendant (copy)
                descendant.Transparency = p22;

                return descendant.Transparency;
            end, 1, 0);
        end;
    end;

    local function fireCannon() -- Line: 103
        -- upvalues: u16 (ref), u3 (ref), u13 (copy), u18 (copy), Workspace (ref), default (ref), InExpo (ref), u17 (copy), ReplicatedStorage (ref), u12 (copy), SoundManager (ref), GameSound (ref)
        if not u16 then
            return nil;
        end;

        local u23 = u3("Part", {
            Name = "PirateShipAttackKillEffect_CannonBall",
            Size = Vector3.new(2, 2, 2),
            CanCollide = false,
            CanQuery = false,
            Shape = Enum.PartType.Ball,
            Color = Color3.fromHex("#353536")
        });
        u13:GiveTask(u23);
        u23.CFrame = u18:GetPivot();
        u23.Parent = Workspace;
        u3("Trail", {
            Attachment0 = u3("Attachment", {
                Position = Vector3.new(0, -0.75, 0),
                Parent = u23
            }),
            Attachment1 = u3("Attachment", {
                Position = Vector3.new(0, 0.75, 0),
                Parent = u23
            }),
            Parent = u23,
            Transparency = NumberSequence.new(0.6)
        });
        default(0.5, InExpo, function(p24) -- Line: 135
            -- upvalues: u23 (copy)
            u23.CFrame = p24;

            return u23.CFrame;
        end, u23.CFrame, u17 * CFrame.new(0, -3 + u23.Size.Y / 2, 0)):Wait();

        if not u16 then
            return nil;
        end;

        if u23 then
            u23:Destroy();
            local v25 = ReplicatedStorage.Assets.Effects.GuidedMissileExplosion:Clone();
            u13:GiveTask(v25);
            v25.Position = u12.Position;
            v25.Parent = Workspace;
            v25.Debris1.Size = NumberSequence.new(0.25);
            v25.Debris2.Size = NumberSequence.new(0.5);
            v25.Debris2.Lifetime = NumberRange.new(4);
            v25.ExplosionFlames.Size = NumberSequence.new(1.5);
            v25.Debris1:Emit(5);
            v25.Debris2:Emit(5);
            v25.ExplosionFlames:Emit(50);
        end;

        u13:GiveTask(SoundManager:playSound(GameSound.MINICOPTER_EXPLODE, {
            rollOffMaxDistance = 160,
            position = u12.Position
        }));
    end;

    local u41 = RuntimeLib.Promise.new(function() -- Line: 165
        -- upvalues: u18 (copy), default (ref), OutSine (ref), u17 (copy), u13 (copy), RunService (ref), u16 (ref), RuntimeLib (ref), fireCannon (copy), OutExpo (ref), u14 (copy), u3 (ref)
        default(1, OutSine, function(p26) -- Line: 166
            -- upvalues: u18 (ref)
            return u18:PivotTo(p26);
        end, u18:GetPivot(), u17 * (CFrame.new(0, 10, 10) * CFrame.Angles(0, 1.5707963267948966, 0))):Wait();
        local u27 = u17;
        u13:GiveTask(RunService.Heartbeat:Connect(function(p28) -- Line: 176
            -- upvalues: u27 (ref), u18 (ref)
            u27 = u27 * CFrame.Angles(0, -0.005, 0);
            local v29 = CFrame.new(0, 10, 10);
            local v30 = CFrame.Angles(0, 1.5707963267948966, 0);
            u18:PivotTo(u27 * v29 * v30);
        end));
        local v31 = Random.new(os.time());
        local v32 = v31:NextInteger(4, 6);
        local v33 = math.round(v32);
        local v34 = false;
        local v35 = 0;

        while true do
            if v34 then
                v35 = v35 + 1;
            else
                v34 = true;
            end;

            if v35 >= v33 then
                local function _(u36) -- Line: 215
                    -- upvalues: default (ref), OutExpo (ref)
                    if u36:IsA("BasePart") then
                        default(0.75, OutExpo, function(p37) -- Line: 217
                            -- upvalues: u36 (copy)
                            u36.Transparency = p37;

                            return u36.Transparency;
                        end, 0, 1);
                    end;
                end;

                for i, descendant in u18:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        default(0.75, OutExpo, function(p38) -- Line: 217
                            -- upvalues: descendant (copy)
                            descendant.Transparency = p38;

                            return descendant.Transparency;
                        end, 0, 1);
                    end;
                end;

                if not u16 then
                    return nil;
                end;

                u14:BreakJoints();
                u13:GiveTask(u3("Explosion", {
                    BlastRadius = 1,
                    DestroyJointRadiusPercent = 0,
                    Position = u14:GetPivot().Position,
                    Parent = game.Workspace
                }));
                local u39 = RuntimeLib.Promise.delay(1):andThen(function() -- Line: 238
                    -- upvalues: u13 (ref)
                    u13:DoCleaning();
                end);
                u13:GiveTask(function() -- Line: 242
                    -- upvalues: u39 (copy)
                    return u39:cancel();
                end);

                return;
            end;

            if not u16 then
                return nil;
            end;

            local u40 = RuntimeLib.Promise.new(function() -- Line: 204
                -- upvalues: fireCannon (ref)
                return fireCannon();
            end);
            u13:GiveTask(function() -- Line: 207
                -- upvalues: u40 (copy)
                return u40:cancel();
            end);
            task.wait(v31:NextNumber(0.3, 0.6));
        end;
    end);
    u13:GiveTask(function() -- Line: 246
        -- upvalues: u13 (copy), u16 (ref), u41 (copy)
        u13:DoCleaning();
        u16 = false;
        u41:cancel();
    end);
    u13:GiveTask(function() -- Line: 251
        -- upvalues: Workspace (ref)
        local function _(p42) -- Line: 253
            if p42.Name == "PirateShipAttackKillEffect_CannonBall" then
                p42:Destroy();
            end;
        end;

        for i, child in Workspace:GetChildren() do
            local _ = i - 1;

            if child.Name == "PirateShipAttackKillEffect_CannonBall" then
                child:Destroy();
            end;
        end;
    end);

    return u13;
end;

return u5;