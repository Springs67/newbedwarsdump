-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.GROUND = 0;
v4[0] = "GROUND";
u5.FLYING = 1;
v4[1] = "FLYING";
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "GoldenGooseBehavior";
    end
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 43
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), CollectionService (copy), EffectUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u5 (ref)
    p8.maid = u2.new();
    p8.gooseModel = ReplicatedStorage.Assets.Misc.GoldenGoose:Clone();
    p8.gooseModel:PivotTo(p9);
    p8.gooseModel.Parent = Workspace;
    p8.maid:GiveTask(p8.gooseModel);
    SoundManager:playSound(GameSound.GOLDEN_GOOSE_AMBIENT, {
        fadeInTime = 3,
        looped = true,
        parent = p8.gooseModel.PrimaryPart
    });
    CollectionService:AddTag(p8.gooseModel, "ActiveGoose");
    local v10 = ReplicatedStorage.Assets.Effects.GooseTeleport:Clone();
    v10.Position = p9.Position;
    EffectUtil:playEffects({ v10 }, nil, {
        destroyAfterSec = 5
    });
    local v11, v12 = p8.gooseModel:GetBoundingBox();
    p8.groundOffset = (p8.gooseModel.PrimaryPart.Position - (v11.Position - v12 / 2)).Y;
    GameAnimationUtil:playAnimation(p8.gooseModel, AnimationType.GOLDEN_GOOSE_IDLE, {
        looped = true
    });
    local v13 = GameAnimationUtil:playAnimation(p8.gooseModel, AnimationType.GOLDEN_GOOSE_FLY, {
        looped = true
    });
    p8.currentGooseState = {
        state = u5.FLYING,
        track = v13,
        startedAt = os.clock() - 4
    };

    if v13 then
        p8:hookFlightParticles(v13);
    end;

    p8:initializeBubbleMovement();
end;

function u6.initializeBubbleMovement(u14) -- Line: 82
    -- upvalues: RunService (copy), BLOCK_SIZE (copy), GameQueryUtil (copy)
    local u15 = nil;
    u14.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 84
        -- upvalues: u14 (copy), u15 (ref), BLOCK_SIZE (ref), GameQueryUtil (ref)
        if not u14.owner then
            return nil;
        end;

        local Character = u14.owner.Character;

        if Character ~= nil then
            Character = Character:GetPivot();
        end;

        if not Character then
            return nil;
        end;

        local v16 = u14.gooseModel:GetPivot();

        if not u15 then
            u15 = u14:snapPositionToBubble(v16.Position, Character.Position, 1 * BLOCK_SIZE);
        end;

        u15 = u14:snapPositionToBubble(u15, Character.Position, 3 * BLOCK_SIZE);

        if not u14.currentObjective then
            local Position = u14.gooseModel:GetPivot().Position;

            if u14:snapPositionToBubble(Position, u15, 3 * BLOCK_SIZE) == Position then
                return nil;
            end;

            local v17 = u15;
            RaycastParams.new().CollisionGroup = "Players";
            local v18 = GameQueryUtil:raycast(u15, (Vector3.new(0, -3 * BLOCK_SIZE, 0)));
            local v19;

            if v18 then
                v19 = v18.Position;
            else
                local Character2 = u14.owner.Character;

                if Character2 ~= nil then
                    Character2 = Character2:FindFirstChildWhichIsA("Humanoid");

                    if Character2 ~= nil then
                        Character2 = Character2.HipHeight;
                    end;
                end;

                local Character3 = u14.owner.Character;

                if Character3 ~= nil then
                    Character3 = Character3.PrimaryPart;

                    if Character3 ~= nil then
                        Character3 = Character3.Size.Y;
                    end;
                end;

                v19 = v17 - Vector3.new(0, (Character2 == nil and 2 or Character2) + (Character3 == nil and 2 or Character3) / 2, 0);
            end;

            u14:updateObjective(CFrame.new(v19));
        end;
    end));
end;

function u6.updateObjective(u20, u21) -- Line: 151
    -- upvalues: BLOCK_SIZE (copy), GameQueryUtil (copy), u5 (ref), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy)
    local u22 = u20.gooseModel:GetPivot();
    local Magnitude = (u21.Position - u22.Position).Magnitude;

    if BLOCK_SIZE * 15 < Magnitude then
        u20.gooseModel:PivotTo(u21);

        return nil;
    end;

    local v23 = false;
    local v24 = 5;
    local v25 = false;
    local v26 = false;

    while true do
        if v23 then
            v24 = v24 - 1;
        else
            v23 = true;
        end;

        if v24 < 0 then
            local v27 = u20.currentGooseState.state == u5.FLYING;

            if os.clock() - u20.currentGooseState.startedAt > 5 + math.random() * 5 then
                v27 = not v27;
            end;

            local u28 = v25 and true or v27;
            local v29 = u28 == (u20.currentGooseState.state == u5.GROUND);
            local v30 = u28 or u20.currentGooseState.state == u5.FLYING;
            local u31 = nil;
            local track = u20.currentGooseState.track;

            if track ~= nil then
                track = track.IsPlaying;
            end;

            if not track or v29 then
                local v32;

                if v30 then
                    v32 = AnimationType.GOLDEN_GOOSE_FLY;
                else
                    v32 = AnimationType.GOLDEN_GOOSE_WALKING;
                end;

                u31 = GameAnimationUtil:playAnimation(u20.gooseModel, v32, {
                    looped = true
                });

                if u31 then
                    if v30 then
                        u20:hookFlightParticles(u31);
                    else
                        u20:hookFootstepSounds(u31);
                    end;
                end;
            end;

            if v29 then
                local track2 = u20.currentGooseState.track;

                if track2 ~= nil then
                    track2:Stop();
                end;

                local track3 = u20.currentGooseState.track;

                if track3 ~= nil then
                    track3:Destroy();
                end;

                local v33 = {};
                local v34;

                if u28 then
                    v34 = u5.FLYING;
                else
                    v34 = u5.GROUND;
                end;

                v33.state = v34;
                v33.track = u31;
                v33.startedAt = os.clock();
                u20.currentGooseState = v33;
            end;

            if not u28 then
                local v35 = u31;

                if v35 ~= nil then
                    v35:AdjustSpeed(3);
                end;
            end;

            if u28 then
                u28 = not v26 or v25 == false;
            end;

            if u28 then
                u21 = u21 + Vector3.new(0, 4, 0);
            end;

            u20.currentObjective = u21;
            local u36 = CFrame.lookAt(Vector3.new(0, 0, 0), (u21.Position - u22.Position) * Vector3.new(1, 0, 1));
            local u43 = default(Magnitude / (6 * BLOCK_SIZE), Linear, function(p37) -- Line: 260
                -- upvalues: u22 (copy), u21 (ref), u36 (copy), u20 (copy)
                local v38 = u22:Lerp(u21 * u36, p37);
                local Y = (u21.Position - u22.Position).Y;

                if math.abs(Y) > 2 then
                    local v39 = -math.sign(Y);
                    local v40 = math.pow(2, v39);
                    local v41 = math.pow(p37, v40);
                    local Y2 = u22.Position:Lerp(u21.Position, v41).Y;
                    local Position = v38.Position;
                    local v42 = Vector3.new(0, Y2, 0);
                    v38 = CFrame.new(Position * Vector3.new(1, 0, 1) + v42) * (v38 - v38.Position);
                end;

                u20.gooseModel:PivotTo(v38);
            end);
            task.spawn(function() -- Line: 281
                -- upvalues: u43 (copy), u28 (copy), u31 (ref), u20 (copy), GameAnimationUtil (ref), AnimationType (ref)
                u43:Wait();

                if not u28 then
                    local v44 = u31;

                    if v44 ~= nil then
                        v44:Stop();
                    end;

                    local v45 = u31;

                    if v45 ~= nil then
                        v45:Destroy();
                    end;

                    local v46 = u20.gooseModel:FindFirstChildWhichIsA("AnimationController");

                    if v46 ~= nil then
                        v46 = v46:FindFirstChildWhichIsA("Animator");
                    end;

                    if v46 then
                        local u47 = false;

                        local function _(p48) -- Line: 302
                            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), u47 (ref)
                            local Animation = p48.Animation;

                            if Animation ~= nil then
                                Animation = Animation.AnimationId;
                            end;

                            if Animation == GameAnimationUtil:getAssetId(AnimationType.GOLDEN_GOOSE_IDLE) then
                                if p48.IsPlaying and p48.WeightTarget ~= 0 then
                                    u47 = true;

                                    return nil;
                                end;

                                p48:Stop();
                                p48:Destroy();
                            end;
                        end;

                        for i, v in v46:GetPlayingAnimationTracks() do
                            local _ = i - 1;
                            local Animation = v.Animation;

                            if Animation ~= nil then
                                Animation = Animation.AnimationId;
                            end;

                            if Animation == GameAnimationUtil:getAssetId(AnimationType.GOLDEN_GOOSE_IDLE) then
                                if v.IsPlaying and v.WeightTarget ~= 0 then
                                    u47 = true;
                                else
                                    v:Stop();
                                    v:Destroy();
                                end;
                            end;
                        end;

                        if not u47 then
                            GameAnimationUtil:playAnimation(u20.gooseModel, AnimationType.GOLDEN_GOOSE_IDLE, {
                                looped = true
                            });
                        end;
                    end;
                end;

                u20.currentObjective = nil;
            end);

            return;
        end;

        local v49 = u22.Position:Lerp(u21.Position, v24 / 5);
        RaycastParams.new().CollisionGroup = "Players";
        local v50 = GameQueryUtil:raycast(v49, (Vector3.new(0, -3 * BLOCK_SIZE, 0)));

        if v50 then
            if v24 == 5 and v50 then
                v26 = true;
            end;
        else
            v25 = true;
        end;
    end;
end;

function u6.snapPositionToBubble(p51, p52, p53, p54) -- Line: 329
    local v55 = p52 - p53;

    if v55.Magnitude <= p54 then
        return p52;
    end;

    return p53 + v55.Unit * p54;
end;

function u6.updateOwner(p56, p57) -- Line: 341
    p56.owner = p57;
end;

function u6.Destroy(p58) -- Line: 344
    -- upvalues: ReplicatedStorage (copy), EffectUtil (copy)
    local Position = p58.gooseModel:GetPivot().Position;
    local v59 = ReplicatedStorage.Assets.Effects.GooseTeleport:Clone();
    v59.Position = Position;
    EffectUtil:playEffects({ v59 }, nil, {
        destroyAfterSec = 5
    });
    p58.maid:DoCleaning();
end;

function u6.hookFootstepSounds(u60, p61) -- Line: 353
    -- upvalues: SoundManager (copy), RandomUtil (copy), GameSound (copy)
    p61:GetMarkerReachedSignal("footstep"):Connect(function() -- Line: 354
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u60 (copy)
        SoundManager:playSound(RandomUtil.fromList(GameSound.GOLDEN_GOOSE_FOOTSTEP_1, GameSound.GOLDEN_GOOSE_FOOTSTEP_2, GameSound.GOLDEN_GOOSE_FOOTSTEP_3, GameSound.GOLDEN_GOOSE_FOOTSTEP_4), {
            position = u60.gooseModel:GetPivot().Position
        });
    end);
end;

function u6.hookFlightParticles(u62, p63) -- Line: 360
    -- upvalues: SoundManager (copy), GameSound (copy)
    local u64 = 0;
    p63:GetMarkerReachedSignal("flap"):Connect(function() -- Line: 362
        -- upvalues: SoundManager (ref), GameSound (ref), u64 (ref), u62 (copy)
        SoundManager:playSound(({ GameSound.GOLDEN_GOOSE_FLAP_1, GameSound.GOLDEN_GOOSE_FLAP_2 })[u64 + 1], {
            position = u62.gooseModel:GetPivot().Position
        });
        u64 = (u64 + 1) % 2;
        local PrimaryPart = u62.gooseModel.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:GetChildren();
        end;

        for _, v in PrimaryPart == nil and {} or PrimaryPart do
            local GoldAttachment = v:FindFirstChild("GoldAttachment");

            if GoldAttachment ~= nil then
                GoldAttachment = GoldAttachment:FindFirstChild("Gold");
            end;

            if GoldAttachment then
                GoldAttachment:Emit(10);
            end;
        end;
    end);
end;

return {
    GoldenGooseBehavior = u6
};