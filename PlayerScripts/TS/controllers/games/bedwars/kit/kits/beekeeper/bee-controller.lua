-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "BeeController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u3 (copy), ReplicatedStorage (copy)
    BaseKitController.constructor(p7, BedwarsKit.BEEKEEPER);
    p7.Name = "BeeController";
    local v8 = u3("Part", {
        Name = "Root",
        Size = Vector3.new(1, 1, 1),
        Anchored = false,
        CanCollide = false
    });
    p7.beelessModel = u3("Model", {
        PrimaryPart = v8,
        Children = { v8 },
        Parent = ReplicatedStorage
    });
end;

function u5.KnitStart(p9) -- Line: 49
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p9);
end;

function u5.onKitLocalActivated(u10, u11) -- Line: 52
    -- upvalues: default (copy), KnitClient (copy), Players (copy), GameSound (copy), CollectionService (copy)
    default.Client:OnEvent("BeeSpawn", function(p12) -- Line: 53
        -- upvalues: KnitClient (ref), Players (ref), u10 (copy), GameSound (ref)
        local v13 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(Players.LocalPlayer);
        local v14 = {
            maxDistanceFromOrigin = 6,
            includeProximityPrompt = true,
            id = p12.beeId,
            origin = p12.position
        };
        local v15;

        if p12.useBeeModel then
            v15 = u10:getCollectibleBeeModel();
        else
            v15 = u10.beelessModel:Clone();
        end;

        v14.beeModel = v15;

        if p12.useBeeModel then
            if v13 ~= nil then
                v13 = v13.beekeeper;

                if v13 ~= nil then
                    v13 = v13.sounds;

                    if v13 ~= nil then
                        v13 = v13.beeLoop;
                    end;
                end;
            end;

            if v13 == nil then
                v13 = GameSound.BEE_LOOP;
            end;
        else
            v13 = nil;
        end;

        v14.beeLoopSound = v13;
        u10:createLocalBee(v14);
    end):andThen(function(u16) -- Line: 87
        -- upvalues: u11 (copy)
        return u11:GiveTask(function() -- Line: 88
            -- upvalues: u16 (copy)
            return u16:Disconnect();
        end);
    end);
    default.Client:OnEvent("BeeRemoved", function(u17) -- Line: 93
        -- upvalues: CollectionService (ref)
        local function _(p18) -- Line: 95
            -- upvalues: u17 (copy)
            return p18:GetAttribute("BeeId") == u17.beeId;
        end;

        local v19 = nil;

        for i, v in CollectionService:GetTagged("bee") do
            local _ = i - 1;

            if v:GetAttribute("BeeId") == u17.beeId == true then
                v19 = v;
                break;
            end;
        end;

        if v19 ~= nil then
            v19:Destroy();
        end;
    end):andThen(function(u20) -- Line: 114
        -- upvalues: u11 (copy)
        return u11:GiveTask(function() -- Line: 115
            -- upvalues: u20 (copy)
            return u20:Disconnect();
        end);
    end);
end;

function u5.onKitLocalDeactivated(p21) -- Line: 121
end;

function u5.onKitReplicationActivated(p22, p23) -- Line: 123
end;

function u5.onKitReplicationDeactivated(p24) -- Line: 125
end;

function u5.onInnateAbilityEnabled(p25, p26, p27) -- Line: 127
end;

function u5.onAbilityUsed(p28, p29, p30) -- Line: 129
end;

function u5.getCollectibleBeeModel(p31) -- Line: 131
    -- upvalues: KnitClient (copy), Players (copy), ReplicatedStorage (copy)
    local v32 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(Players.LocalPlayer);

    if v32 ~= nil then
        v32 = v32.beekeeper;

        if v32 ~= nil then
            v32 = v32.beeModel;

            if v32 ~= nil then
                v32 = v32:Clone();
            end;
        end;
    end;

    if v32 == nil then
        v32 = ReplicatedStorage.Assets.Effects.Bee:Clone();
    end;

    return v32;
end;

function u5.createLocalBee(p33, p34) -- Line: 148
    -- upvalues: u3 (copy), Workspace (copy), KnitClient (copy), u2 (copy), SoundManager (copy), GameQueryUtil (copy), GameAnimationUtil (copy), AnimationType (copy), CollectionService (copy)
    local u35 = p34.beeModel:Clone();

    if p34.scale ~= nil then
        u35:ScaleTo(p34.scale);
    end;

    u35:PivotTo(CFrame.new(p34.origin));
    local Root = u35.Root;
    local v36 = u3("Attachment", {
        Name = "BeeMovementAttachment",
        Parent = Root
    });
    u3("LinearVelocity", {
        Parent = Root,
        Attachment0 = v36,
        MaxForce = Root.AssemblyMass * 100000,
        RelativeTo = Enum.ActuatorRelativeTo.World
    });
    u3("VectorForce", {
        Parent = Root,
        Attachment0 = v36,
        Force = Vector3.new(0, Root.AssemblyMass * Workspace.Gravity, 0),
        RelativeTo = Enum.ActuatorRelativeTo.World
    });
    u3("AlignOrientation", {
        Responsiveness = 15,
        Parent = Root,
        Attachment0 = v36,
        Mode = Enum.OrientationAlignmentMode.OneAttachment,
        MaxTorque = Root.AssemblyMass * 100000
    });

    if p34.includeProximityPrompt then
        KnitClient.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Pick Up",
            ObjectText = "Bee",
            HoldDuration = 0.1,
            RequiresLineOfSight = false,
            Enabled = false,
            MaxActivationDistance = 10,

            Triggered = function(p37) -- Line: 186, Name: Triggered
                -- upvalues: KnitClient (ref), u35 (copy)
                KnitClient.Controllers.BeeNetController:trigger(p37, u35);
            end,

            Parent = Root
        });
    end;

    u35.Parent = Workspace;

    if p34.beeLoopSound ~= nil then
        local u38 = u2.new();
        u38:GiveTask(SoundManager:playSound(p34.beeLoopSound, {
            looped = true,
            parent = Root
        }));
        u35.Destroying:Once(function() -- Line: 199
            -- upvalues: u38 (copy)
            return u38:DoCleaning();
        end);
    end;

    u35:SetAttribute("BeeId", p34.id);
    u35:SetAttribute("BeeOrigin", p34.origin);
    u35:SetAttribute("MaxDistanceFromOrigin", p34.maxDistanceFromOrigin);
    u35:SetAttribute("NextUpdateDirection", -1);

    for _, descendant in u35:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    local v39 = u35:FindFirstChildOfClass("AnimationController");

    if v39 ~= nil then
        local v40 = v39:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BEE_FLAP));
        v40.Looped = true;
        v40:Play();
    end;

    local v41 = p33:makePulseEffect();
    v41.Parent = Root;
    v41.Enabled = true;
    CollectionService:AddTag(u35, "bee");

    return u35;
end;

function u5.makePulseEffect(p42) -- Line: 224
    -- upvalues: u3 (copy)
    return u3("ParticleEmitter", {
        LightEmission = 1,
        Acceleration = Vector3.new(0, 4, 0),
        Drag = 3.5,
        Rate = 0.3,
        TimeScale = 1,
        Texture = "rbxassetid://10553903882",
        ZOffset = 0.11,
        Color = ColorSequence.new(Color3.fromRGB(255, 189, 0)),
        Orientation = Enum.ParticleOrientation.FacingCamera,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.265, 6.5, 0.383), NumberSequenceKeypoint.new(1, 9, 0) }),
        Transparency = NumberSequence.new(0.412, 1),
        EmissionDirection = Enum.NormalId.Top,
        Lifetime = NumberRange.new(0.35, 0.55)
    });
end;

KnitClient.CreateController(u5.new());

return nil;