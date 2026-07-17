-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u6 = Random.new();
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "SnowballKillEffect";
    end,

    __index = KillEffect
});
u7.__index = u7;

function u7.new(...) -- Line: 35
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, p10) -- Line: 39
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p9, p10);
    KillEffect.setPlayDefaultKillEffect(p9, false);
end;

function u7.onKill(p11, p12, p13, u14) -- Line: 43
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), GameQueryUtil (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), RunService (copy), GameWorldUtil (copy), u4 (copy), default (copy), InQuad (copy), u6 (copy), WeldUtil (copy), OutQuad (copy)
    local u15 = u3.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16:PivotTo(u14);
    u16.Parent = Workspace;
    u16.HumanoidRootPart.Anchored = false;
    u16.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    KillEffect.hideCharacter(p11, p13);
    u15:GiveTask(u16);

    for _, descendant in u16:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, false);
        end;
    end;

    SoundManager:playSound(GameSound.SNOWBALL_KILL_EFFECT, {
        rollOffMaxDistance = 150,
        rollOffMinDistance = 50,
        position = u16.HumanoidRootPart.Position,
        parent = u16.HumanoidRootPart
    });
    local u17 = ReplicatedStorage.Assets.Effects.SnowballHit.Attachment:Clone();
    u17.Parent = Workspace.Terrain;
    u15:GiveTask(u17);
    local u18 = 0;
    local u19 = 0;
    u15:GiveTask(RunService.Heartbeat:Connect(function(p20) -- Line: 70
        -- upvalues: u18 (ref), u19 (ref), u14 (copy), GameWorldUtil (ref), u4 (ref), Workspace (ref), GameQueryUtil (ref), u15 (copy), default (ref), InQuad (ref), u16 (copy), u6 (ref), ReplicatedStorage (ref), WeldUtil (ref), u17 (copy), OutQuad (ref)
        u18 = u18 + p20;

        if u18 - u19 > 0.1 then
            u19 = u18;
            local v21 = u14.Position + GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 1.5707963267948966) * 14;
            local u22 = u4("Part", {
                Size = Vector3.new(1, 1, 1),
                Transparency = 1,
                Anchored = false,
                CanCollide = true,
                Shape = Enum.PartType.Ball,
                Color = Color3.fromRGB(199, 232, 255),
                CFrame = CFrame.new(v21),
                CustomPhysicalProperties = PhysicalProperties.new(10, 1, 0, 1, 0),
                TopSurface = Enum.SurfaceType.Smooth,
                BottomSurface = Enum.SurfaceType.Smooth,
                Parent = Workspace
            });
            u22.CollisionGroup = "snowball";
            GameQueryUtil:setQueryIgnored(u22, true);
            u15:GiveTask(u22);
            default(0.1, InQuad, function(p23) -- Line: 94
                -- upvalues: u22 (copy)
                u22.Transparency = p23;

                return u22.Transparency;
            end, 1, 0);
            u22.CollisionGroup = "DisablePlayerCollisions";
            local Unit = (u16:GetPivot().Position - v21).Unit;
            u22:ApplyImpulse(Unit * (u22.AssemblyMass * (50 + u6:NextNumber(0, 50))));
            local u24 = nil;
            u24 = u22.Touched:Connect(function(p25) -- Line: 104
                -- upvalues: GameQueryUtil (ref), u24 (ref), u22 (copy), Unit (copy), ReplicatedStorage (ref), Workspace (ref), u16 (ref), WeldUtil (ref), u17 (ref), default (ref), OutQuad (ref), u15 (ref)
                if GameQueryUtil:isQueryIgnored(p25) then
                    return nil;
                end;

                u24:Disconnect();
                local v26 = GameQueryUtil:raycast(u22.Position - Unit * 5, Unit * 10);

                if v26 then
                    local u27 = ReplicatedStorage.Assets.Effects.OilPart:Clone();
                    u27.Color = Color3.fromRGB(199, 232, 255);
                    u27.Parent = Workspace;
                    u27.CFrame = CFrame.lookAt(v26.Position, v26.Position + v26.Normal);
                    GameQueryUtil:setQueryIgnored(u27, true);
                    u27.CanCollide = false;
                    u27.CanQuery = false;
                    u27.Anchored = true;

                    if v26.Instance:IsDescendantOf(u16) then
                        u27.Anchored = false;
                        WeldUtil:weldParts(u16.HumanoidRootPart, u27);
                    end;

                    u17.WorldCFrame = u27.CFrame;

                    for _, descendant in u17:GetDescendants() do
                        if descendant:IsA("ParticleEmitter") then
                            descendant:Emit((descendant:GetAttribute("EmitCount")));
                        end;
                    end;

                    default(0.5, OutQuad, function(p28) -- Line: 137
                        -- upvalues: u27 (copy)
                        u27.Size = (Vector3.new(0.3, 0.3, 0.1)):Lerp(Vector3.new(1, 1, 0.1), p28);
                        u27.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(199, 232, 255), p28);
                    end, 0, 1);
                    u15:GiveTask(u27);
                end;

                u22.LocalTransparencyModifier = 1;
                task.delay(0.1, function() -- Line: 144
                    -- upvalues: u22 (ref)
                    u22:Destroy();
                end);
            end);
        end;
    end));
    task.delay(6, function() -- Line: 150
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);

    return u15;
end;

return u7;