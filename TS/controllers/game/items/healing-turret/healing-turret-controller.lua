-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ConquerorBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "conqueror-balance").ConquerorBalance;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u3 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u4 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut);
local _ = ReplicatedStorage.Assets.Effects.BannerPoint;
local _ = ReplicatedStorage.Assets.Effects.BannerConnection;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "HealingTurretController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 40
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "HealingTurretController";
end;

function u5.KnitStart(u8) -- Line: 44
    -- upvalues: KnitController (copy), CollectionService (copy)
    KnitController.KnitStart(u8);
    CollectionService:GetInstanceAddedSignal("HealingTurret"):Connect(function(p9) -- Line: 46
        -- upvalues: u8 (copy)
        u8:createRadius(p9);
    end);
end;

function u5.createRadius(p10, p11) -- Line: 50
    -- upvalues: BLOCK_SIZE (copy), u1 (copy), TweenService (copy), u3 (copy), ConquerorBalance (copy), u4 (copy)
    local v12 = Color3.fromRGB(112, 189, 92);
    local u13 = u1("Part", {
        Size = Vector3.new(0.2, 0, 0),
        Parent = p11,
        CFrame = CFrame.new(p11.Position) - Vector3.new(0, BLOCK_SIZE / 2, 0),
        Orientation = Vector3.new(0, 0, 90),
        Shape = Enum.PartType.Cylinder,
        Color = v12,
        Transparency = 0,
        CastShadow = false,
        Material = Enum.Material.ForceField,
        Reflectance = 0,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false
    });
    local v14 = TweenService:Create(u13, u3, {
        Size = Vector3.new(0.2, ConquerorBalance.CONQUEROR_FLAG_RADIUS, ConquerorBalance.CONQUEROR_FLAG_RADIUS)
    });
    v14:Play();
    local u15 = nil;
    u15 = v14.Completed:Connect(function() -- Line: 77
        -- upvalues: TweenService (ref), u13 (copy), u4 (ref), ConquerorBalance (ref), u15 (ref)
        TweenService:Create(u13, u4, {
            Size = Vector3.new(0.5, ConquerorBalance.CONQUEROR_FLAG_RADIUS, ConquerorBalance.CONQUEROR_FLAG_RADIUS),
            Position = Vector3.new(u13.Position.X, u13.Position.Y + 0.25 + 0.1, u13.Position.Z)
        }):Play();
        u15:Disconnect();
    end);

    return u13;
end;

KnitClient.CreateController(u5.new());

return nil;