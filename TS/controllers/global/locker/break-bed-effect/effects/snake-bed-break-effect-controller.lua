-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ColorUtil = v1.ColorUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "SnakeBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u7.__index = u7;

function u7.new(...) -- Line: 46
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 50
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy), LoggerProvider (copy)
    BreakBedEffectController.constructor(p9, BedBreakEffectType.SNAKE);
    p9.Name = "SnakeBedBreakEffectController";
    p9.snakePool = {};
    p9.logger = LoggerProvider.getLogger("SnakeBedBreakEffectController");
    p9.teamEffectState = {};
end;

function u7.KnitStart(p10) -- Line: 57
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p10);
end;

function u7.onBedBreak(u11, p12, u13, u14, p15) -- Line: 60
    task.defer(function() -- Line: 61
        -- upvalues: u11 (copy), u13 (copy), u14 (copy)
        return u11:playEffect(u13, u14);
    end);
end;

function u7.playEffect(u16, u17, u18) -- Line: 65
    -- upvalues: u3 (copy), SoundManager (copy), GameSound (copy), Workspace (copy), RandomUtil (copy), TweenService (copy), ReplicatedStorage (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), MapUtil (copy), ModelUtil (copy)
    local u19 = u3.new();
    u16.maid:GiveTask(u19);
    u16.maid:GiveTask(function() -- Line: 68
        -- upvalues: u16 (copy), u18 (copy)
        local function _(p20) -- Line: 70
            p20.model:Destroy();
            p20.pickupPart:Destroy();
        end;

        for i, v in u16.snakePool do
            local _ = i - 1;
            v.model:Destroy();
            v.pickupPart:Destroy();
        end;

        table.clear(u16.snakePool);
        u16.teamEffectState[u18] = "Smoke";
    end);
    u19:GiveTask(SoundManager:playSound(GameSound.SNAKE_BED_BREAK, {
        volumeMultiplier = 0.3,
        position = u17.Position
    }));
    local v21 = u16:getBedClone(u18);

    if not v21 then
        return nil;
    end;

    v21.Name = "BedBreakEffectBedClone";
    v21.Parent = Workspace;
    v21:PivotTo(u17);

    local function _(p22) -- Line: 95
        if p22:IsA("BasePart") or p22:IsA("MeshPart") then
            p22.CanCollide = false;
            p22.CanQuery = false;
            p22.CanTouch = false;
        end;
    end;

    for i, descendant in v21:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    u19:GiveTask(v21);

    local function _(p23) -- Line: 107
        if p23:IsA("MeshPart") then
            return p23;
        end;

        return nil;
    end;

    local v24 = 0;
    local v25 = {};

    for i, child in v21.Pivot.Align:GetChildren() do
        local _ = i - 1;

        if not child:IsA("MeshPart") then
            local child = nil;
        end;

        if child ~= nil then
            v24 = v24 + 1;
            v25[v24] = child;
        end;
    end;

    local u26 = v25 == nil and {} or v25;

    local function _(p27, p28) -- Line: 127
        return p28 < 20;
    end;

    local v29 = 0;
    local u30 = {};

    for i, v in RandomUtil.shuffleArray(u26) do
        if i - 1 < 20 == true then
            v29 = v29 + 1;
            u30[v29] = v;
        end;
    end;

    u19:GiveTask(task.delay(0, function() -- Line: 141
        -- upvalues: u30 (copy), u26 (copy), TweenService (ref)
        local function _(p31) -- Line: 142
            -- upvalues: u30 (ref)
            return table.find(u30, p31) == nil;
        end;

        local v32 = 0;
        local v33 = {};

        for i, v in u26 do
            local _ = i - 1;

            if table.find(u30, v) == nil == true then
                v32 = v32 + 1;
                v33[v32] = v;
            end;
        end;

        local function _(p34) -- Line: 156
            -- upvalues: TweenService (ref)
            TweenService:Create(p34, TweenInfo.new(0.5), {
                Transparency = 1
            }):Play();
        end;

        for i, v in v33 do
            local _ = i - 1;
            TweenService:Create(v, TweenInfo.new(0.5), {
                Transparency = 1
            }):Play();
        end;
    end));

    local function v46(p35, p36) -- Line: 165
        -- upvalues: ReplicatedStorage (ref), u19 (copy), u17 (copy), u16 (copy), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v37 = ReplicatedStorage.Assets.Pets.GoldenSnake:Clone();
        v37.Name = "bedbreak-snake-" .. tostring(p36);
        v37:ScaleTo(0.3);
        u19:GiveTask(p35);
        local v38 = u17.Position + u16:getRandomizedEqualMagnitudeVector3(2);
        v37.Parent = Workspace;

        local function _(p39) -- Line: 176
            if p39:IsA("BasePart") or p39:IsA("MeshPart") then
                p39.CanCollide = false;
                p39.CanQuery = false;
                p39.CanTouch = false;
            end;
        end;

        for i, descendant in v37:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.CanTouch = false;
            end;
        end;

        local PrimaryPart = v37.PrimaryPart;

        if PrimaryPart then
            PrimaryPart.Anchored = true;
        end;

        local function _(p40) -- Line: 192
            return p40:IsA("MeshPart");
        end;

        local v41 = nil;

        for i, child in v37:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") == true then
                v41 = child;
                break;
            end;
        end;

        if v41 then
            v41.Transparency = 1;
        end;

        local v42 = v37:FindFirstChildWhichIsA("Animator", true);

        if v42 then
            local u43 = AnimationUtil:playAnimation(v42, GameAnimationUtil:getAssetId(AnimationType.GOLDEN_SNAKE_WALK), {
                looped = true
            });

            if u43 ~= nil then
                u43:Stop();
            end;

            u16.maid:GiveTask(task.delay(0.5 + math.random(), function() -- Line: 219
                -- upvalues: u43 (copy)
                local v44 = u43;

                if v44 ~= nil then
                    v44 = v44:Play();
                end;

                return v44;
            end));
        end;

        local v45 = u16:getRandomizedEqualMagnitudeVector3(20);
        v37:PivotTo(CFrame.new(v38) * CFrame.lookAlong(Vector3.new(0, 0, 0), v45.Unit));
        u19:GiveTask(v37);
        table.insert(u16.snakePool, {
            model = v37,
            pickupPart = p35,
            runawayLocationDelta = v45
        });
    end;

    for i, v in u30 do
        v46(v, i - 1, u30);
    end;

    local u47 = 0;
    local v48 = u16:getSmokeParticleOnBed(u17.Position);
    v48:Emit(100);
    u19:GiveTask(v48);
    u19:GiveTask(RunService.Heartbeat:Connect(function(u49) -- Line: 250
        -- upvalues: u47 (ref), MapUtil (ref), u16 (copy), u18 (copy), TweenService (ref)
        u47 = u47 + u49;
        local v50 = MapUtil.getOrCreate(u16.teamEffectState, u18, "Smoke");

        if v50 == "Smoke" then
            if u47 >= 0.5 then
                u16.teamEffectState[u18] = "RunAway";
                local snakePool = u16.snakePool;

                local function v54(p51) -- Line: 262
                    -- upvalues: TweenService (ref)
                    local function _(p52) -- Line: 264
                        return p52:IsA("MeshPart");
                    end;

                    local v53 = nil;

                    for i, child in p51.model:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("MeshPart") == true then
                            v53 = child;
                            break;
                        end;
                    end;

                    if v53 then
                        TweenService:Create(v53, TweenInfo.new(2, Enum.EasingStyle.Exponential), {
                            Transparency = 0
                        }):Play();
                    end;

                    p51.model:PivotTo(CFrame.new(p51.pickupPart.Position) * CFrame.lookAlong(Vector3.new(0, 0, 0), p51.runawayLocationDelta.Unit));
                end;

                for i, v in snakePool do
                    v54(v, i - 1, snakePool);
                end;
            end;
        elseif v50 == "RunAway" then
            local function _(p55) -- Line: 295
                -- upvalues: u49 (copy)
                local v56 = p55.runawayLocationDelta * (u49 / 3.5);
                p55.model:PivotTo(p55.model:GetPivot() + v56);
                p55.pickupPart:PivotTo(p55.model:GetPivot() + Vector3.new(0, 0.5, 0));
            end;

            for i, v in u16.snakePool do
                local _ = i - 1;
                local v57 = v.runawayLocationDelta * (u49 / 3.5);
                v.model:PivotTo(v.model:GetPivot() + v57);
                v.pickupPart:PivotTo(v.model:GetPivot() + Vector3.new(0, 0.5, 0));
            end;
        end;
    end));
    u16.maid:GiveTask(task.delay(3.5, function() -- Line: 312
        -- upvalues: u16 (copy), ModelUtil (ref), TweenService (ref)
        local snakePool = u16.snakePool;

        local function v59(p58) -- Line: 314
            -- upvalues: ModelUtil (ref), TweenService (ref)
            ModelUtil.tweenModelTransparency(p58.model, 1, 0.5);
            TweenService:Create(p58.pickupPart, TweenInfo.new(0.5), {
                Transparency = 1
            }):Play();
        end;

        for i, v in snakePool do
            v59(v, i - 1, snakePool);
        end;
    end));
    u16.maid:GiveTask(task.delay(4, function() -- Line: 325
        -- upvalues: u19 (copy)
        u19:DoCleaning();
    end));
end;

function u7.getRandomizedEqualMagnitudeVector3(p60, p61) -- Line: 329
    local v62 = math.random(-p61, p61);
    local v63 = math.sqrt(p61 * p61 - v62 * v62);
    local v64 = math.random() > 0.5 and 1 or -1;

    return Vector3.new(v62, 0, v63 * v64);
end;

function u7.getBedClone(p65, p66) -- Line: 336
    -- upvalues: ReplicatedStorage (copy), PlaceUtil (copy), KnitClient2 (copy), ColorUtil (copy), TeamColorHex (copy), u6 (copy)
    local v67 = ReplicatedStorage.Assets.Misc.SlicedBed:Clone();
    local u68;

    if PlaceUtil.isLobbyServer() then
        u68 = ColorUtil.hexColor(TeamColorHex.red);
    else
        u68 = KnitClient2.Controllers.TeamController:getTeamById(p66);

        if u68 ~= nil then
            u68 = u68.color;
        end;
    end;

    if not u68 then
        return v67;
    end;

    local v69 = v67.Pivot.Align:GetChildren();

    local function v71(p70) -- Line: 353
        -- upvalues: u6 (ref), ColorUtil (ref), u68 (copy)
        if not p70:IsA("MeshPart") then
            return nil;
        end;

        if u6.includes(string.lower(p70.Name), "blanket") then
            p70.Color = ColorUtil.brighten(u68, 0.2);

            return nil;
        end;

        if u6.includes(string.lower(p70.Name), "mattress") then
            p70.Color = u68;
        end;
    end;

    for i, v in v69 do
        v71(v, i - 1, v69);
    end;

    return v67;
end;

function u7.getSmokeParticleOnBed(p72, p73) -- Line: 369
    -- upvalues: u4 (copy), Workspace (copy)
    local v74 = u4("Part", {
        Size = Vector3.new(4, 4, 4),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        Shape = Enum.PartType.Ball,
        Position = p73,
        Parent = Workspace
    });

    return u4("ParticleEmitter", {
        LightEmission = 0.2,
        Texture = "rbxasset://textures/particles/sparkles_main.dds",
        Enabled = false,
        ShapePartial = 0,
        Acceleration = Vector3.new(-5, -1, -15),
        Drag = 3,
        Color = ColorSequence.new(Color3.new(0.76, 0.07, 0.07)),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(0.3, 0.8),
            NumberSequenceKeypoint.new(0.5, 0.9),
            NumberSequenceKeypoint.new(1, 1)
        }),
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3), NumberSequenceKeypoint.new(1, 0.3) }),
        Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, -1.7, 0.4) }),
        Lifetime = NumberRange.new(2, 4),
        SpreadAngle = Vector2.new(180, 180),
        Shape = Enum.ParticleEmitterShape.Sphere,
        Speed = NumberRange.new(15, 20),
        Parent = v74
    });
end;

KnitClient.CreateController(u7.new());

return nil;