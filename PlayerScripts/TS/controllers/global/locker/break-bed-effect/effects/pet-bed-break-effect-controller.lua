-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuad = v2.InOutQuad;
local InQuad = v2.InQuad;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "PetBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p6, BedBreakEffectType.PET);
    p6.Name = "PetBreakEffectController";
end;

function u4.KnitStart(p7) -- Line: 40
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p7);
end;

function u4.onBedBreak(u8, u9, u10, u11, p12) -- Line: 43
    task.spawn(function() -- Line: 44
        -- upvalues: u8 (copy), u10 (copy), u9 (copy), u11 (copy)
        u8:createEffect(u10, u9, u11);
    end);
end;

function u4.createEffect(u13, p14, p15, p16) -- Line: 48
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), RunService (copy), default (copy), InOutQuad (copy), MathExtras (copy), PlaceUtil (copy), InQuad (copy)
    local u17 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p16);

    if not u17 then
        return nil;
    end;

    u13.maid:GiveTask(u17);
    u17.Name = "BedBreakEffectBedClone";
    u17:PivotTo(p14);
    u17.Parent = Workspace;

    local function _(p18) -- Line: 60
        if p18:IsA("BasePart") or p18:IsA("MeshPart") then
            p18.CanCollide = false;
            p18.CanQuery = false;
            p18.CanTouch = false;
        end;
    end;

    for i, descendant in u17:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    local u19 = ReplicatedStorage.Assets.Misc.PetBedWings:Clone();
    local u20 = u19:GetScale() / u17:GetScale();
    local u21 = u19:GetScale();
    local v22 = u17:GetPivot();
    local v23 = CFrame.new(Vector3.new(0, 1.303, 1.384));
    local v24 = CFrame.Angles(0, 0, 0);
    u19:PivotTo(v22 * v23 * v24);
    u19.Parent = Workspace;
    u13.maid:GiveTask(u19);
    u13.maid:GiveTask(task.spawn(function() -- Line: 83
        -- upvalues: u19 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), u13 (copy)
        local v25 = u19;

        if v25 ~= nil then
            v25 = v25:WaitForChild("AnimationController", 3);

            if v25 ~= nil then
                v25 = v25:WaitForChild("Animator", 3);
            end;
        end;

        if v25 then
            local u26 = GameAnimationUtil:playAnimation(v25, AnimationType.FLYING_LUCKY_BLOCK_FLAP);

            if u26 ~= nil then
                u26:AdjustSpeed(2);
            end;

            if u26 ~= nil then
                u26 = u26.DidLoop:Connect(function() -- Line: 100
                    -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u19 (ref), u13 (ref)
                    local v27 = SoundManager:playSound(RandomUtil.fromList(GameSound.FLYING_LUCKY_BLOCK_WING_FLAP_1, GameSound.FLYING_LUCKY_BLOCK_WING_FLAP_2), {
                        volumeMultiplier = 0.05,
                        position = u19:GetPivot().Position,
                        playbackSpeedMultiplier = math.random(7, 10)
                    });
                    u13.maid:GiveTask(v27);
                end);
            end;

            u13.maid:GiveTask(function() -- Line: 110
                -- upvalues: u26 (copy)
                local v28 = u26;

                if v28 ~= nil then
                    v28 = v28:Disconnect();
                end;

                return v28;
            end);
        end;
    end));
    local u33 = RunService.Heartbeat:Connect(function() -- Line: 120
        -- upvalues: u19 (copy), u17 (copy), u20 (copy), u21 (copy)
        u19:ScaleTo(u17:GetScale() * u20);
        local v29 = u17:GetPivot();
        local v30 = u19:GetScale() / u21;
        local v31 = CFrame.new(Vector3.new(0, 1.303, 1.384) * v30);
        local v32 = CFrame.Angles(0, 0, 0);
        u19:PivotTo(v29 * v31 * v32);
    end);
    u13.maid:GiveTask(u33);
    local u34 = u17:GetScale();
    default(2, InOutQuad, function(p35) -- Line: 133
        -- upvalues: u17 (copy), MathExtras (ref), u34 (copy)
        u17:ScaleTo(MathExtras:lerp(u34, 0.2, p35));
    end, 0, 1):Play();
    local u36;

    if PlaceUtil.isLobbyServer() then
        u36 = Workspace:FindFirstChild("LockerPreview");

        if u36 ~= nil then
            u36 = u36:FindFirstChild("CameraSubject");
        end;
    else
        u36 = p15.Character;

        if u36 ~= nil then
            u36 = u36.PrimaryPart;
        end;
    end;

    if not u36 then
        task.delay(2, function() -- Line: 154
            -- upvalues: u17 (copy)
            return u17:Destroy();
        end);

        return nil;
    end;

    local Position = u17:GetPivot().Position;
    local Rotation = u17:GetPivot().Rotation;
    default(2, InQuad, function(p37) -- Line: 164
        -- upvalues: u36 (copy), Position (copy), Rotation (copy), u17 (copy)
        local v38 = Position:Lerp(u36.Position + Vector3.new(5, 2, 0), p37);
        local v39 = Rotation:Lerp(CFrame.lookAt(v38, u36.Position + Vector3.new(0, 2, 0)).Rotation, p37);
        u17:PivotTo(CFrame.new(v38) * v39);
    end, 0, 1):Play():Wait();
    local u40 = 0;
    local u48 = RunService.Heartbeat:Connect(function(p41) -- Line: 180
        -- upvalues: u36 (copy), u40 (ref), u17 (copy)
        local v42 = u36.Position + Vector3.new(0, 2, 0);
        u40 = u40 + 100 * p41;
        local v43 = math.rad(u40);
        local v44 = u36.Position + Vector3.new(0, 2, 0);
        local v45 = v42.X + math.cos(v43) * 5;
        local v46 = v42.Z + math.sin(v43) * 5;
        local v47 = v42.Y + math.sin(u40 * 0.05) * 0.5;
        u17:PivotTo(CFrame.new(Vector3.new(v45, v47, v46), v44));
    end);
    u13.maid:GiveTask(u48);
    u13.maid:GiveTask(task.delay(20, function() -- Line: 196
        -- upvalues: u48 (copy), u17 (copy), u33 (copy), u19 (copy)
        u48:Disconnect();
        u17:Destroy();
        u33:Disconnect();
        u19:Destroy();
    end));
end;

KnitClient.CreateController(u4.new());

return nil;