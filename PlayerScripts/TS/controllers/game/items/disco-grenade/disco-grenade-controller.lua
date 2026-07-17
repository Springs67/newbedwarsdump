-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local DiscoGrenadeBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").DiscoGrenadeBalance;
local ConquerorBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "conqueror-balance").ConquerorBalance;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "DiscoGrenadeController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "DiscoGrenadeController";
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("DiscoExplode"):Connect(function(p7) -- Line: 37
        -- upvalues: SoundManager (ref), GameSound (ref), u6 (copy)
        local u8 = SoundManager:playSound(GameSound.DISCO_BEAT, {
            looped = true,
            position = p7.position
        });
        task.delay(5, function() -- Line: 43
            -- upvalues: u8 (copy)
            u8:Stop();
            u8:Destroy();
        end);
        u6:createDiscoBallEffect(p7.position, p7.radius);
    end);
    default.Client:Get("DiscoDancing"):Connect(function(p9) -- Line: 49
    end);
end;

function u3.createDiscoBallEffect(p10, p11, p12) -- Line: 51
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), DiscoGrenadeBalance (copy)
    local u13 = ReplicatedStorage.Assets.Effects.DiscoBall:Clone();
    u13:PivotTo(CFrame.new(p11 + Vector3.new(0, 9, 0)));
    u13.Parent = Workspace;
    local u14 = p10:createBuffRadius(p11, p12);
    local u15 = 0;
    local u16 = nil;
    u16 = RunService.Heartbeat:Connect(function(p17) -- Line: 61
        -- upvalues: u13 (copy), u16 (ref), u15 (ref)
        if not u13.PrimaryPart then
            u16:Disconnect();

            return nil;
        end;

        local CFrame2 = u13.PrimaryPart.CFrame;
        local v18 = CFrame.Angles(0, math.rad(u15 * 3.141592653589793), 0);
        u13.PrimaryPart.CFrame = CFrame2 * v18;
        u15 = u15 + p17;
    end);
    task.delay(DiscoGrenadeBalance.DURATION, function() -- Line: 71
        -- upvalues: u13 (copy), u16 (ref), u14 (copy)
        u13:Destroy();
        u16:Disconnect();
        u14:Destroy();
    end);
end;

function u3.createBuffRadius(p19, p20, p21) -- Line: 77
    -- upvalues: Workspace (copy), BLOCK_SIZE (copy), u1 (copy), TweenService (copy), ConquerorBalance (copy)
    local v22 = Color3.fromRGB(107, 255, 255);
    local u23 = u1("Part", {
        Size = Vector3.new(0.2, 0, 0),
        Parent = Workspace,
        CFrame = CFrame.new(p20) - Vector3.new(0, BLOCK_SIZE / 2, 0),
        Orientation = Vector3.new(0, 0, 90),
        Shape = Enum.PartType.Cylinder,
        Color = v22,
        Transparency = 0.5,
        CastShadow = false,
        Material = Enum.Material.ForceField,
        Reflectance = 0,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false
    });
    local v24 = TweenService:Create(u23, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        Size = Vector3.new(0.2, ConquerorBalance.CONQUEROR_FLAG_RADIUS, ConquerorBalance.CONQUEROR_FLAG_RADIUS)
    });
    v24:Play();
    local u25 = nil;
    u25 = v24.Completed:Connect(function() -- Line: 104
        -- upvalues: TweenService (ref), u23 (copy), ConquerorBalance (ref), u25 (ref)
        TweenService:Create(u23, TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
            Size = Vector3.new(0.5, ConquerorBalance.CONQUEROR_FLAG_RADIUS, ConquerorBalance.CONQUEROR_FLAG_RADIUS),
            Position = Vector3.new(u23.Position.X, u23.Position.Y + 0.25 + 0.1, u23.Position.Z)
        }):Play();
        u25:Disconnect();
    end);

    return u23;
end;

KnitClient.CreateController(u3.new());

return nil;