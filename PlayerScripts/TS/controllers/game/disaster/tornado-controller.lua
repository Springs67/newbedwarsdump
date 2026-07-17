-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "TornadoController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "TornadoController";
    p6.random = Random.new();
end;

function u4.KnitStart(u7) -- Line: 40
    -- upvalues: KnitController (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), GameQueryUtil (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), RunService (copy), Linear (copy), default (copy), EntityUtil (copy), u2 (copy), Players (copy), GameWorldUtil (copy)
    KnitController.KnitStart(u7);
    CollectionService:GetInstanceAddedSignal("Tornado"):Connect(function(u8) -- Line: 42
        -- upvalues: SoundManager (ref), GameSound (ref), GameQueryUtil (ref), ReplicatedStorage (ref), scaleModel (ref), Workspace (ref), RunService (ref), Linear (ref)
        local u9 = SoundManager:playSound(GameSound.DISASTER_TORNADO_LOOP, {
            playbackSpeedMultiplier = 2,
            rollOffMaxDistance = 1000,
            looped = true,
            parent = u8,
            position = u8.Position
        });
        GameQueryUtil:setQueryIgnored(u8, true);
        local u10 = ReplicatedStorage.Assets.Effects.Tornado:Clone();

        for _, descendant in u10:GetDescendants() do
            if descendant:IsA("Weld") then
                descendant:Destroy();
            end;

            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        scaleModel(u10, 0.1);
        u10:PivotTo(u8.CFrame);
        u10.Parent = Workspace;
        local u11 = u8:GetAttribute("EndScalingTime");
        local u12 = Workspace:GetServerTimeNow();
        local v13 = u10:GetDescendants();

        local function v15(p14) -- Line: 69
            -- upvalues: u8 (copy)
            if p14:IsA("BasePart") then
                return {
                    p14,
                    {
                        size = p14.Size,
                        positionOffset = p14.Position - u8.Position
                    }
                };
            end;
        end;

        local v16 = 0;
        local v17 = {};
        local u18 = 0;

        for i, v in v13 do
            local v19 = v15(v, i - 1, v13);

            if v19 ~= nil then
                v16 = v16 + 1;
                v17[v16] = v19;
            end;
        end;

        local u20 = {};

        for _, v in v17 do
            u20[v[1]] = v[2];
        end;

        local u21 = math.random() * 5000;
        local u30 = RunService.Heartbeat:Connect(function(p22) -- Line: 99
            -- upvalues: u18 (ref), Workspace (ref), u12 (copy), u11 (copy), Linear (ref), u10 (copy), u20 (copy), u8 (copy), u21 (copy)
            u18 = u18 + p22;
            local v23 = (Workspace:GetServerTimeNow() - u12) / (u11 - u12);
            local v24 = math.min(v23, 1);
            Linear(v24, 6, 54, 1);

            for _, descendant in u10:GetDescendants() do
                if descendant:IsA("BasePart") then
                    local v25 = u20[descendant];

                    if v25 ~= nil then
                        local v26 = Linear(v24, 1, 9, 1);
                        descendant.Position = u8.Position:Lerp(u8.Position + v25.positionOffset, v26);
                        descendant.Size = v25.size * v26;
                    end;
                end;
            end;

            local CFrame2 = u8.CFrame;
            local Angles = CFrame.Angles;
            local v27 = math.noise(u18, u21) * 15;
            local v28 = math.rad(v27);
            local v29 = math.noise(u18, -u21) * 15;
            u10:PivotTo(CFrame2 * Angles(v28, u18 * 20, (math.rad(v29))));
        end);
        u8.AncestryChanged:Connect(function(p31, p32) -- Line: 129
            -- upvalues: u30 (copy), u9 (copy), u10 (copy)
            if p32 == nil then
                u30:Disconnect();
                local v33 = u9;

                if v33 ~= nil then
                    v33:Destroy();
                end;

                u10:Destroy();
            end;
        end);
    end);
    default.Client:GetNamespace("Disaster"):OnEvent("TornadoSucked", function(u34, p35) -- Line: 140
        -- upvalues: EntityUtil (ref), Workspace (ref), u2 (ref), Players (ref), u7 (copy), RunService (ref), Linear (ref), GameWorldUtil (ref)
        local u36 = EntityUtil:getLocalPlayerEntity();

        if u36 == nil then
            return nil;
        end;

        local u37 = u34:GetAttribute("EndScalingTime");
        local u38 = Workspace:GetServerTimeNow();
        local u39 = u2("BodyPosition", {
            D = 100,
            MaxForce = Vector3.new(50000000, 50000000, 50000000),
            Position = u34.Position,
            Parent = Players.LocalPlayer.Character.PrimaryPart
        });
        u36:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
        local u40 = u7.random:NextNumber(-5000, 5000);
        local u41 = p35 - Workspace:GetServerTimeNow();
        local u42 = 0;
        local u56 = RunService.Heartbeat:Connect(function(p43) -- Line: 157
            -- upvalues: u42 (ref), Workspace (ref), u38 (copy), u37 (copy), Linear (ref), u41 (copy), u40 (copy), u34 (copy), u39 (copy)
            u42 = u42 + p43;
            local v44 = (Workspace:GetServerTimeNow() - u38) / (u37 - u38);
            local v45 = Linear(math.min(v44, 1), 6, 30, 1);
            local v46 = Linear(u42, 0, v45, u41);
            local v47 = math.noise(u42 * 3, 0, u40) * 8;
            local v48 = math.noise(u42 * 1, 0, -u40) * 4;
            local v49 = math.noise(u42 * 3, 0, u40 + u40) * 8;
            local v50 = math.noise(u42, u40, 0) * 4;
            local v51 = math.noise(u42, -u40, 0) * 4;
            local Position = u34.Position;
            local v52 = math.sin(u42 * 7) * (v45 + v50);
            local v53 = math.cos(u42 * 7) * (v45 + v51);
            local v54 = Vector3.new(v52, 0, v53);
            local v55 = Vector3.new(v47, v46 + v48, v49);
            u39.Position = Position + v54 + v55;
        end);
        task.delay(u41, function() -- Line: 172
            -- upvalues: u56 (copy), u39 (copy), u36 (copy), GameWorldUtil (ref)
            u56:Disconnect();
            u39:Destroy();
            local HumanoidRootPart = u36:getInstance().HumanoidRootPart;

            if HumanoidRootPart == nil then
                return nil;
            end;

            HumanoidRootPart:ApplyImpulse(GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 6.283185307179586) * HumanoidRootPart.AssemblyMass * 10);
            task.wait(1);
            u36:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Running);
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;