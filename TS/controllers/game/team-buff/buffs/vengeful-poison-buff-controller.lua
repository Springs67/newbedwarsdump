-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "VengefulPoisonBuffController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "VengefulPoisonBuffController";
end;

function u3.KnitStart(u6) -- Line: 29
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("SnakePoisonNova"):Connect(function(p7) -- Line: 31
        -- upvalues: u6 (copy)
        u6:playFartEffect(p7.position);
    end);
end;

function u3.playFartEffect(p8, p9) -- Line: 35
    -- upvalues: u1 (copy), u2 (copy), Workspace (copy), BedwarsImageId (copy), PlaceUtil (copy)
    local u10 = u1.new();
    local v11 = u2("Part", {
        Size = Vector3.new(4, 4, 4),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        Shape = Enum.PartType.Ball,
        Position = p9,
        Parent = Workspace
    });
    u10:GiveTask(v11);
    local v12 = u2("ParticleEmitter", {
        Enabled = false,
        Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        Texture = BedwarsImageId.SMOKE,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3, 0.5), NumberSequenceKeypoint.new(1, 5, 1) }),
        Lifetime = NumberRange.new(5, 10),
        SpreadAngle = Vector2.new(180, 180),
        Speed = NumberRange.new(1, 2),
        Parent = v11
    });
    local v13 = u2("Attachment", {
        Position = Vector3.new(0, -1, 0),
        Orientation = Vector3.new(90, 0, 0),
        Parent = v11
    });
    local v14 = u2("ParticleEmitter", {
        Enabled = false,
        Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        Texture = BedwarsImageId.SMOKE,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 0.5), NumberSequenceKeypoint.new(1, 4, 1) }),
        Lifetime = NumberRange.new(3, 6),
        SpreadAngle = Vector2.new(10, 180),
        Speed = NumberRange.new(3, 7),
        Parent = v13
    });
    local v15 = PlaceUtil.isLobbyServer() and 20 or 100;
    v12:Emit(v15);
    v14:Emit(v15);
    task.delay(2, function() -- Line: 81
        -- upvalues: u10 (copy)
        u10:DoCleaning();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;