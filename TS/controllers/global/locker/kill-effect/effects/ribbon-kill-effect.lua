-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = Random.new();
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "RibbonKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 28
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 32
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.calculateSourcePositionForTime(p10, p11, p12, p13, p14, p15) -- Line: 36
    -- upvalues: OutQuad (copy)
    local Position = p11.Position;
    local v16 = math.sin(p12 + p13) * 8;
    local v17 = OutQuad(math.clamp(p14, 0, 6), 0, 9, 6) + math.noise(p12 + p15) * 2;
    local v18 = math.cos(p12 + p13) * 8;

    return Position + Vector3.new(v16, v17, v18);
end;

function u6.onKill(u19, p20, p21, p22) -- Line: 41
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), u3 (copy), GameQueryUtil (copy), ReplicatedStorage (copy), RunService (copy), u5 (copy), WeldUtil (copy)
    local u23 = u2.new();
    p21.Archivable = true;
    local u24 = p21:Clone();
    u24.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u24.HumanoidRootPart.Anchored = true;
    u24:PivotTo(p22);
    u24.Parent = Workspace;
    KillEffect.hideCharacter(u19, p21);
    u23:GiveTask(u24);
    u23:GiveTask(SoundManager:playSound(GameSound.STRING_KILL_EFFECT, {
        rollOffMaxDistance = 150,
        rollOffMinDistance = 50,
        position = p22.Position
    }));
    local u25 = p22 * CFrame.new(0, -3.5, 0);
    local u26 = u3("Part", {
        Anchored = true,
        CanCollide = false,
        Size = Vector3.new(1, 1, 1),
        Transparency = 1,
        Parent = Workspace,
        CFrame = u25,
        CustomPhysicalProperties = PhysicalProperties.new(10, 1, 1)
    });
    GameQueryUtil:setQueryIgnored(u26, true);
    u23:GiveTask(u26);
    local v27 = u3("Part", {
        Anchored = true,
        CanCollide = false,
        Size = Vector3.new(1, 1, 1),
        Transparency = 1,
        Parent = Workspace,
        CFrame = u25 * CFrame.new(0, 8, 0)
    });
    GameQueryUtil:setQueryIgnored(u26, true);
    u23:GiveTask(v27);
    local u28 = u3("Attachment", {
        Parent = v27
    });
    u23:GiveTask(u28);
    local u29 = u3("Part", {
        Anchored = true,
        Transparency = 1,
        CanCollide = false,
        Size = Vector3.new(1, 1, 1),
        Parent = Workspace,
        CFrame = p22 * CFrame.new(-5, 0, 0)
    });
    GameQueryUtil:setQueryIgnored(u29, true);
    u23:GiveTask(u29);
    local v30 = u3("Attachment", {
        Parent = u29
    });
    local u31 = u3("RopeConstraint", {
        Visible = false,
        Thickness = 0.2,
        Color = BrickColor.new("Bright red"),
        Parent = u28,
        Length = (u26.Position - u29.Position).Magnitude,
        Attachment0 = u28,
        Attachment1 = v30
    });
    local u32 = u3("Folder", {
        Parent = Workspace
    });
    u23:GiveTask(u32);
    local u33 = ReplicatedStorage.Assets.Effects.RopeSegment:Clone();
    GameQueryUtil:setQueryIgnored(u33, true);
    u33.Color = Color3.fromRGB(255, 0, 0);
    u33.Parent = Workspace;
    u23:GiveTask(u33);
    local u34 = {
        {
            position = u29.Position,
            relativePosition = u24.HumanoidRootPart.Position - u29.Position
        }
    };
    local u35 = math.random() * 500;
    local u36 = math.random() * 500;
    local u37 = 0;
    local u38 = 0;
    local u39 = false;
    u23:GiveTask(RunService.Heartbeat:Connect(function(p40) -- Line: 140
        -- upvalues: u37 (ref), u39 (ref), u31 (copy), u29 (copy), u24 (copy), u5 (ref), u23 (copy), u19 (copy), u25 (copy), u38 (ref), u35 (copy), u36 (copy), u26 (copy), u34 (copy), u32 (copy), Workspace (ref), ReplicatedStorage (ref), GameQueryUtil (ref), WeldUtil (ref), u28 (copy), u33 (copy)
        if u37 > 2.8 then
            if u39 == false then
                u39 = true;
                u31.Length = 10;
                u29:Destroy();
                u24.HumanoidRootPart.Anchored = false;
                u24.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);

                for _, descendant in u24:GetDescendants() do
                    if descendant:IsA("BasePart") then
                        descendant.CanCollide = false;
                    end;
                end;

                task.delay(0.05, function() -- Line: 153
                    -- upvalues: u24 (ref), u5 (ref)
                    u24.HumanoidRootPart:ApplyImpulse(Vector3.new(u24.HumanoidRootPart.AssemblyMass * 60, u24.HumanoidRootPart.AssemblyMass * 60, u24.HumanoidRootPart.AssemblyMass * 60) * (Vector3.new(0, 1, 0) + u5:NextUnitVector() * 0.1));
                end);
                task.delay(0.37, function() -- Line: 160
                    -- upvalues: u23 (ref)
                    u23:DoCleaning();
                end);
            end;
        else
            local Magnitude = (u19:calculateSourcePositionForTime(u25, u38 + p40 * 50, u35, u37 + p40, u36) - u26.Position).Magnitude;
            local v41 = u37 < 0.1 and 1 or math.floor(Magnitude / 0.5);
            local v42 = math.clamp(v41, 0, 20);
            local v43 = false;
            local v44 = 0;

            while true do
                if true then
                    if v43 then
                        v44 = v44 + 1;
                    else
                        v43 = true;
                    end;
                end;

                if v44 >= v42 then
                    break;
                end;

                local v45 = p40 * ((v44 + 1) / v42);
                local v46 = u19:calculateSourcePositionForTime(u25, u38 + v45 * 50, u35, u37 + v45, u36);
                u26.Position = v46;
                local v47 = u34[#u34 - 1 + 1];
                local v48 = v47.position - v46;
                local v49 = RaycastParams.new();
                v49.FilterType = Enum.RaycastFilterType.Whitelist;
                v49.FilterDescendantsInstances = { u24, u32 };
                local v50 = Workspace:Raycast(v46, v48, v49);

                if v50 and (v47 == nil or (v47.position - v50.Position).Magnitude > 0.2) then
                    local v51 = v50.Position + v50.Normal * 0.05;
                    table.insert(u34, {
                        position = v51,
                        relativePosition = v51 - u24.HumanoidRootPart.Position
                    });

                    if v47 and #u34 > 2 then
                        local v52 = ReplicatedStorage.Assets.Effects.RopeSegment:Clone();
                        GameQueryUtil:setQueryIgnored(v52, true);
                        v52.Color = Color3.fromRGB(255, 0, 0);
                        v52.Anchored = false;
                        local v53 = v47.position:Lerp(v51, 0.5);
                        v52.Size = Vector3.new(0.1, 0.1, (v47.position - v51).Magnitude);
                        v52:PivotTo(CFrame.lookAt(v53, v51));
                        v52.Parent = u32;
                        WeldUtil:weldPartsWithJoint(u24.HumanoidRootPart, v52, "Weld");
                        u23:GiveTask(v52);
                    end;
                end;
            end;
        end;

        u38 = u38 + p40 * 50;
        u37 = u37 + p40;
        local v54 = u34[#u34 - 1 + 1];
        local v55;

        if u37 > 2.8 then
            v55 = u28.WorldPosition;
        else
            v55 = u26.Position;
        end;

        if v54 then
            local v56 = u24.HumanoidRootPart.Position + v54.relativePosition;
            local v57 = v56:Lerp(v55, 0.5);
            u33.Size = Vector3.new(0.1, 0.1, (v56 - v55).Magnitude);
            u33:PivotTo(CFrame.lookAt(v57, v55));
        end;
    end));

    return u23;
end;

return u6;