-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local OutBack = v2.OutBack;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "ToiletKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 37
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    p7.totalToiletHeight = 7.9;
    p7.topOfToiletSeatOffset = 3.4;
    p7.insideToiletRelativePositionOffest = Vector3.new(0, 1.38, 0.38);
    p7.characterFloorOffset = 3;
    p7.playerPopUpDuration = 0.4;
    p7.toiletRiseDuration = 1;
    p7.headRiseDuration = 1.2;
    p7.playerGoIntoToiletDuration = 1;
    p7.playerSpinSpeed = 0.5;
    p7.headSize = 3;
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, p11, p12) -- Line: 51
    -- upvalues: u3 (copy), Players (copy), ReplicatedStorage (copy), Workspace (copy), CFrameUtil (copy), EntityUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy), default (copy), InQuad (copy), MathExtras (copy), OutBack (copy)
    local u13 = u3.new();
    local v14 = p12.Position - Vector3.new(0, u9.characterFloorOffset, 0);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character == nil then
        Character = Vector3.new();
    end;

    local Unit = (Vector3.new(Character.X, 0, Character.Z) - Vector3.new(v14.X, 0, v14.Z)).Unit;
    local u15 = math.atan2(Unit.X, Unit.Z) + 3.141592653589793;
    local v16 = v14 - Vector3.new(0, u9.totalToiletHeight, 0);
    local u17 = v14 + Vector3.new(0, 0, 0);
    local u18 = v14 + Vector3.new(0, u9.topOfToiletSeatOffset, 0);
    local u19 = u17 + CFrame.Angles(0, u15, 0) * u9.insideToiletRelativePositionOffest;
    local u20 = ReplicatedStorage.Assets.Misc.Toilet:Clone();
    u13:GiveTask(u20);
    u20.Parent = Workspace;
    CFrameUtil.setPositionAndGlobalRotationRadians(u20, v16, (Vector3.new(0, u15, 0)));
    p11.Archivable = true;
    local u21 = p11:Clone();
    u21.HumanoidRootPart.Anchored = true;
    u13:GiveTask(u21);
    u21.Parent = Workspace;

    if u21.PrimaryPart then
        u21.PrimaryPart.CFrame = p12;
    end;

    local _DamageHighlight_ = u21:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local v22 = EntityUtil:getEntity(u21);

    if v22 then
        v22:hideNametag();
    end;

    local Head = u21:FindFirstChild("Head");

    if Head ~= nil then
        Head = Head:FindFirstChild("Nametag");
    end;

    if Head then
        Head:Destroy();
    end;

    local Head2 = u21:FindFirstChild("Head");

    if Head2 ~= nil then
        Head2 = Head2:FindFirstChild("StatusEffectTagGui");
    end;

    if Head2 then
        Head2:Destroy();
    end;

    u9:hideCharacter(p11);
    local u23 = AnimationUtil:playAnimation(u21, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_FLOATING));

    if u23 then
        u13:GiveTask(u23);
    end;

    local PrimaryPart = u21.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position + Vector3.new(0, 7, 0);
    end;

    if PrimaryPart == nil then
        PrimaryPart = Vector3.new();
    end;

    local v24 = TweenInfo.new(u9.playerPopUpDuration, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
    local v25 = TweenService:Create(u21.PrimaryPart, v24, {
        CFrame = CFrame.new(PrimaryPart)
    });
    v25:Play();
    u13:GiveTask(v25);
    local u45 = RuntimeLib.Promise.new(function() -- Line: 150
        -- upvalues: u9 (copy), TweenService (ref), u20 (copy), u17 (copy), u13 (copy), SoundManager (ref), GameSound (ref), u18 (copy), u21 (copy), default (ref), InQuad (ref), PrimaryPart (copy), u19 (copy), MathExtras (ref), u23 (copy), OutBack (ref), u15 (copy)
        local v26 = TweenInfo.new(u9.toiletRiseDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
        local v27 = TweenService:Create(u20.PrimaryPart, v26, {
            CFrame = CFrame.new(u17) * u20:GetPivot().Rotation
        });
        v27:Play();
        u13:GiveTask(v27);
        v27.Completed:Wait();
        u13:GiveTask(SoundManager:playSound(GameSound.TOILET_FLUSH, {
            volumeMultiplier = 5,
            position = u18
        }));
        local PrimaryPart2 = u21.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Rotation.Y;
        end;

        local u28 = PrimaryPart2 == nil and 0 or PrimaryPart2;
        local u29 = u21:GetScale();
        default(u9.playerGoIntoToiletDuration, InQuad, function(p30) -- Line: 181
            -- upvalues: PrimaryPart (ref), u19 (ref), u28 (ref), u9 (ref), u21 (ref), MathExtras (ref), u29 (copy)
            local v31 = PrimaryPart:Lerp(u19, p30);
            u28 = u28 + u9.playerSpinSpeed * p30;
            local v32 = Vector3.new(0, u28, 0);
            local v33 = CFrame.new(v31) * CFrame.Angles(v32.X, v32.Y, v32.Z);

            if u21.PrimaryPart then
                u21.PrimaryPart.CFrame = v33;
            end;

            u21:ScaleTo(MathExtras:lerp(u29, 0.1, p30));
        end):Play():Wait();
        local Head3 = u21:FindFirstChild("Head");
        local u34 = u21:FindFirstChild("3DClothing");

        if u34 ~= nil then
            u34 = u34:FindFirstChild("Head");
        end;

        local v35 = u21:GetDescendants();

        local function v37(p36) -- Line: 202
            -- upvalues: Head3 (copy), u34 (copy)
            if Head3 and (p36:IsDescendantOf(Head3) or p36 == Head3) then
                return nil;
            end;

            if u34 and (p36:IsDescendantOf(u34) or p36 == u34) then
                return nil;
            end;

            if p36:IsA("BasePart") then
                p36.Transparency = 1;
                p36.CanCollide = false;

                return;
            end;

            if p36:IsA("Decal") then
                p36.Transparency = 1;

                return;
            end;

            if p36:IsA("BillboardGui") then
                p36:Destroy();
            end;
        end;

        for i, v in v35 do
            v37(v, i - 1, v35);
        end;

        task.wait(0.4);
        local v38 = u23;

        if v38 ~= nil then
            v38:Destroy();
        end;

        local u39 = u19 + Vector3.new(0, 0, 0);
        local u40 = u18 + Vector3.new(0, -2, 0);
        local u44 = default(u9.headRiseDuration, OutBack, function(p41) -- Line: 238
            -- upvalues: u39 (copy), u40 (copy), u15 (ref), u21 (ref), MathExtras (ref)
            local v42 = u39:Lerp(u40, p41);
            local v43 = Vector3.new(0, u15, 0);
            u21:PivotTo(CFrame.new(v42) * CFrame.fromEulerAnglesYXZ(v43.X, v43.Y, v43.Z));
            u21:ScaleTo(MathExtras:lerp(0.1, 2, p41));
        end);
        u13:GiveTask(function() -- Line: 249
            -- upvalues: u44 (copy)
            return u44:Cancel();
        end);
        u44:Play():Wait();
        task.delay(4, function() -- Line: 254
            -- upvalues: u13 (ref)
            u13:DoCleaning();
        end);
    end);
    u13:GiveTask(function() -- Line: 258
        -- upvalues: u45 (copy)
        return u45:cancel();
    end);

    return u13;
end;

return u5;