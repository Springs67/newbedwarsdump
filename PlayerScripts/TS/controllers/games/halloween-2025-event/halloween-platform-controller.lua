-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MapKnitController = RuntimeLib.import(script, script.Parent.Parent, "bedwars", "maps", "map-knit-controller").MapKnitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "HalloweenPlatformController";
    end,

    __index = MapKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: MapKnitController (copy)
    MapKnitController.constructor(p6, { "Halloween-Map-2025" });
    p6.Name = "HalloweenPlatformController";
    p6.isOnPlatform = false;
    p6.hasSpeedException = false;
end;

function u4.KnitStart(p7) -- Line: 38
    -- upvalues: MapKnitController (copy)
    MapKnitController.KnitStart(p7);
end;

function u4.onMapInit(p8) -- Line: 41
end;

function u4.onMatchStart(u9) -- Line: 43
    -- upvalues: RunService (copy), Players (copy), Workspace (copy), BLOCK_SIZE (copy), CollectionService (copy), default (copy), WatchCollectionTag (copy), ReplicatedStorage (copy), u2 (copy), ColorUtil (copy), GameSound (copy)
    RunService.Heartbeat:Connect(function() -- Line: 44
        -- upvalues: Players (ref), Workspace (ref), BLOCK_SIZE (ref), CollectionService (ref), u9 (copy), default (ref)
        local Character = Players.LocalPlayer.Character;

        if not (Character and Character.PrimaryPart) then
            return nil;
        end;

        local PrimaryPart = Character.PrimaryPart;
        local v10 = RaycastParams.new();
        v10.FilterType = Enum.RaycastFilterType.Exclude;
        v10.FilterDescendantsInstances = { Character };
        local v11 = Workspace:Raycast(PrimaryPart.CFrame.Position, Vector3.new(0, -BLOCK_SIZE * 5, 0), v10);

        if v11 ~= nil then
            v11 = v11.Instance;
        end;

        if not (v11 and CollectionService:HasTag(v11, "moving-platform")) then
            if u9.isOnPlatform then
                u9.lastPlatformCFrame = nil;
                u9.isOnPlatform = false;
                u9.hasSpeedException = false;
            end;

            return;
        end;

        if u9.lastPlatformCFrame == nil then
            u9.lastPlatformCFrame = v11.CFrame;
            u9.isOnPlatform = true;

            if not u9.hasSpeedException and default.Client:Get("RequestPlatformSpeedException"):CallServer() then
                u9.hasSpeedException = true;
            end;
        end;

        local CFrame = v11.CFrame;
        local Position = PrimaryPart.Position;
        local Position2 = v11.Position;
        local Size = v11.Size;
        local v12 = math.abs(Position.X - Position2.X);
        local v13 = math.abs(Position.Z - Position2.Z);
        local v14;

        if v12 <= Size.X / 2 and v13 <= Size.Z / 2 then
            v14 = Position.Y > Position2.Y + Size.Y / 2;
        else
            v14 = false;
        end;

        if v14 then
            if u9.lastPlatformCFrame then
                PrimaryPart.CFrame = CFrame * u9.lastPlatformCFrame:Inverse() * PrimaryPart.CFrame;
            end;

            u9.lastPlatformCFrame = v11.CFrame;

            return;
        end;

        local v15 = Position - Position2;
        local v16 = Vector3.new(v15.X, 0, v15.Z);

        if v16.Magnitude > 0 then
            local v17 = Position2 + v16.Unit * (Size.X / 2 + 2);
            local v18 = (Vector3.new(v17.X, Position.Y, v17.Z) - Position) * 10;
            PrimaryPart.AssemblyLinearVelocity = Vector3.new(v18.X, PrimaryPart.AssemblyLinearVelocity.Y, v18.Z);
        end;

        u9.lastPlatformCFrame = nil;
        u9.isOnPlatform = false;
        u9.hasSpeedException = false;
    end);
    WatchCollectionTag("moving-platform", function(p19) -- Line: 113
        -- upvalues: ReplicatedStorage (ref), u2 (ref), ColorUtil (ref), GameSound (ref), BLOCK_SIZE (ref)
        p19.Color = Color3.fromRGB(70, 255, 187);
        p19.Transparency = 0.5;
        p19.Material = Enum.Material.Neon;
        ReplicatedStorage.Assets.Effects.VoidSmokeParticle:Clone().Parent = p19;
        u2("PointLight", {
            Range = 16,
            Parent = p19,
            Color = ColorUtil.WHITE
        });
        u2("Sound", {
            Volume = 0.4,
            Looped = true,
            Playing = true,
            Parent = p19,
            SoundId = GameSound.GHOST_ORB_ACTIVE_LOOPED,
            RollOffMaxDistance = BLOCK_SIZE * 10
        });
    end);
end;

KnitClient.CreateController(u4.new());

return nil;