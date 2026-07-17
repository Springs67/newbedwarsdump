-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v2.Debris;
local Players = v2.Players;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = ConstantManager.registerConstants(script, {
    velX = 5,
    velY = 12,
    velZ = 5,
    gravity = 0.8
});
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "ShieldBlockEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 34
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ShieldBlockEffectController";
end;

function u4.KnitStart(u7) -- Line: 42
    -- upvalues: KnitController (copy), KnitClient (copy), AnimationType (copy), default (copy), ItemType (copy), Workspace (copy), SoundManager (copy), GameSound (copy), Players (copy)
    KnitController.KnitStart(u7);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.KNIGHT_SHIELD_RAISE_SHIELD }
    });
    default.Client:OnEvent("ShieldBlocked", function(p8) -- Line: 47
        -- upvalues: ItemType (ref), Workspace (ref), u7 (copy), SoundManager (ref), GameSound (ref), Players (ref)
        local v9 = p8.entity:FindFirstChild(ItemType.INFERNAL_SHIELD);

        if v9 and (v9.Handle.BlockEffectAttachment.WorldCFrame.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude <= 150 then
            u7:spawnShieldBlockParticles(v9.Handle.BlockEffectAttachment.WorldCFrame.Position, {
                amount = 5
            });
            local SHIELD_BLOCKED = GameSound.SHIELD_BLOCKED;
            local v10 = {};
            local v11;

            if p8.entity == Players.LocalPlayer.Character then
                v11 = nil;
            else
                v11 = p8.entity:GetPrimaryPartCFrame().Position;
            end;

            v10.position = v11;
            SoundManager:playSound(SHIELD_BLOCKED, v10);
        end;
    end);
end;

function u4.spawnShieldBlockParticles(p12, p13, p14) -- Line: 64
    -- upvalues: u3 (copy), RuntimeLib (copy), GameQueryUtil (copy), Workspace (copy), TweenService (copy), Debris (copy)
    local v15 = false;
    local v16 = 0;

    while true do
        if v15 then
            v16 = v16 + 1;
        else
            v15 = true;
        end;

        local v17;

        if p14 == nil then
            v17 = p14;
        else
            v17 = p14.amount;
        end;

        if v16 >= (v17 == nil and 1 or v17) then
            return;
        end;

        local v18 = math.random(-100, 100) / 100 * u3.velX;
        local v19 = math.random(50, 100) / 100 * u3.velY;
        local v20 = math.random(-100, 100) / 100 * u3.velZ;
        local v21 = Vector3.new(v18, v19, v20) * 0.75;
        local v22 = 0.18 * math.random(80, 150) / 100;
        local v23 = Color3.fromRGB(195, 43, 43);
        local Part = Instance.new("Part");
        Part.Size = Vector3.new(v22, v22, v22);
        Part.CFrame = CFrame.new(p13);
        Part.AssemblyLinearVelocity = v21;
        Part.Transparency = 0;
        Part.Material = Enum.Material.Neon;
        Part.Color = v23;
        Part.CanCollide = false;
        RuntimeLib.Promise.defer(function() -- Line: 101
            -- upvalues: Part (copy)
            task.wait(0.05);
            Part.CanCollide = true;
        end);
        Part.CollisionGroup = "BlockParticles";
        GameQueryUtil:setQueryIgnored(Part);
        local BodyForce = Instance.new("BodyForce");
        local v24 = Part:GetMass() * Workspace.Gravity * u3.gravity;
        BodyForce.Force = Vector3.new(0, v24, 0);
        BodyForce.Parent = Part;
        local BoolValue = Instance.new("BoolValue");
        BoolValue.Name = "Targettable";
        BoolValue.Value = false;
        BoolValue.Parent = Part;
        Part.Parent = Workspace;
        RuntimeLib.Promise.delay(0.3 + math.random() * 0.15):andThen(function() -- Line: 117
            -- upvalues: TweenService (ref), Part (copy)
            TweenService:Create(Part, TweenInfo.new(0.18), {
                Size = Vector3.new(0, 0, 0),
                Transparency = 1
            }):Play();
        end);
        Debris:AddItem(Part, 1.3);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;