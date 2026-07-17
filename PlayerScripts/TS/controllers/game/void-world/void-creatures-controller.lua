-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local Linear = v2.Linear;
local OutBack = v2.OutBack;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic");
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local VoidInvasionBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-invasion-balance", "void-invasion-balance").VoidInvasionBalance;
local snapBlockRotation = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").snapBlockRotation;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "VoidCreaturesController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 40
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 44
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "VoidCreaturesController";
end;

function u7.KnitStart(u10) -- Line: 48
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), default2 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), u4 (copy), Lighting (copy), default (copy), InQuad (copy), VoidInvasionBalance (copy)
    KnitController.KnitStart(u10);
    WatchCollectionTag("void-creature-portal", function(p11) -- Line: 50
    end);
    default2.Client:Get("VoidPortalSpawnMonster"):Connect(function(p12) -- Line: 51
        -- upvalues: u10 (copy)
        u10:portalEffect(p12.part.CFrame, p12.part.Position, p12.part);
    end);
    WatchCollectionTag("VoidHound", function(p13) -- Line: 54
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local Humanoid = p13:WaitForChild("Humanoid", 3);
        local u14;

        if Humanoid == nil then
            u14 = Humanoid;
        else
            u14 = Humanoid:WaitForChild("Animator", 3);
        end;

        if u14 and Humanoid then
            local u15 = AnimationUtil:playAnimation(u14, GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_WALK), {
                looped = true
            });
            Humanoid.Running:Connect(function(p16) -- Line: 85
                -- upvalues: u15 (ref), GameAnimationUtil (ref), AnimationType (ref), AnimationUtil (ref), u14 (copy)
                local v17 = p16 > 0;

                if v17 then
                    local v18 = u15;

                    if v18 ~= nil then
                        v18 = v18.Animation;

                        if v18 ~= nil then
                            v18 = v18.AnimationId;
                        end;
                    end;

                    v17 = v18 ~= GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_WALK);
                end;

                if v17 then
                    u15 = AnimationUtil:playAnimation(u14, GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_WALK), {
                        looped = true
                    });
                end;

                local v19 = p16 == 0;

                if v19 then
                    local v20 = u15;

                    if v20 ~= nil then
                        v20 = v20.Animation;

                        if v20 ~= nil then
                            v20 = v20.AnimationId;
                        end;
                    end;

                    v19 = v20 ~= GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_IDLE);
                end;

                if v19 then
                    u15 = AnimationUtil:playAnimation(u14, GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_IDLE), {
                        looped = true
                    });
                end;
            end);
        end;
    end);
    default2.Client:Get("VoidPortalSchedule"):Connect(function(u21) -- Line: 122
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u4 (ref), Lighting (ref), default (ref), InQuad (ref), u10 (copy), VoidInvasionBalance (ref)
        SoundManager:playSound(GameSound.VOID_INVASION_FORCAST);
        local u22 = KnitClient.Controllers.VoidWorldMusicController:playVoidWorldMusic();
        local u23 = u4("ColorCorrectionEffect", {
            Parent = Lighting
        });
        local u24 = Lighting:FindFirstChildWhichIsA("Atmosphere") or u4("Atmosphere", {
            Parent = Lighting
        });
        default(10, InQuad, function(p25) -- Line: 132
            -- upvalues: u23 (copy), u24 (copy)
            u23.Brightness = -0.05 * p25;
            u23.Contrast = 0.05 * p25;
            u23.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(222, 186, 255), p25);
            u24.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p25);
            u24.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p25);
            u24.Glare = p25;
            u24.Haze = 4.5 * p25;
        end, 0, 1);
        task.delay(15, function() -- Line: 143
            -- upvalues: default (ref), InQuad (ref), u23 (copy), u24 (copy), u22 (copy)
            default(4, InQuad, function(p26) -- Line: 144
                -- upvalues: u23 (ref), u24 (ref)
                u23.Brightness = -0.05 * p26;
                u23.Contrast = 0.05 * p26;
                u23.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 255, 255), p26);
                u24.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p26);
                u24.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p26);
                u24.Glare = 1 * p26;
                u24.Haze = 4.5 * p26;
            end, 1, 0);
            u22:Stop();
            u22:Destroy();
        end);
        task.spawn(function() -- Line: 158
            -- upvalues: u21 (copy), u10 (ref)
            local function _(p27) -- Line: 160
                -- upvalues: u10 (ref)
                u10:createTornado(p27);
                task.wait(1);
            end;

            for i, v in u21.positions do
                local _ = i - 1;
                u10:createTornado(v);
                task.wait(1);
            end;
        end);
        task.delay(VoidInvasionBalance.portalSpawnDelay, function() -- Line: 168
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.VOID_INVASION_START);
        end);
    end);
end;

function u7.createTornado(p28, u29) -- Line: 173
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), VoidInvasionBalance (copy), TweenService (copy)
    local v30 = math.random(200, 300);
    local v31 = u29 + Vector3.new(0, v30, 0);
    local u32 = ReplicatedStorage.Assets.Effects.VoidTornado:Clone();
    u32:PivotTo(CFrame.new(v31));
    u32.Parent = Workspace;
    local Part = u32:WaitForChild("Part", 1);

    if Part then
        task.delay(VoidInvasionBalance.portalSpawnDelay, function() -- Line: 182
            -- upvalues: TweenService (ref), Part (copy), u29 (copy)
            TweenService:Create(Part, TweenInfo.new(1), {
                CFrame = CFrame.new(u29)
            }):Play();
        end);
    end;

    task.delay(90, function() -- Line: 190
        -- upvalues: u32 (copy)
        u32:Destroy();
    end);
end;

function u7.portalEffect(p33, p34, p35, p36) -- Line: 194
    -- upvalues: u3 (copy), u4 (copy), GameQueryUtil (copy), u6 (copy), snapBlockRotation (copy), ReplicatedStorage (copy), GameSound (copy), SoundManager (copy), default (copy), OutBack (copy), EffectUtil (copy), Linear (copy)
    local v37 = u3.new();
    local u38 = u4("Part", {
        Size = Vector3.new(0.0001, 7, 7),
        Rotation = Vector3.new(0, -90, -90),
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Shape = Enum.PartType.Cylinder,
        Position = p35,
        Parent = p36
    });
    GameQueryUtil:setQueryIgnored(u38, true);
    v37:GiveTask(u38);
    local Size = u38.Size;
    u6.createFaces(u38, nil, { Enum.NormalId.Left });
    local v39 = { p34:ToOrientation() };
    local v40 = CFrame.new(p34.Position);
    local Angles = CFrame.Angles;
    local v41 = snapBlockRotation((math.deg(v39[2])));
    local _ = v40 * Angles(0, math.rad(v41), 0);
    local u42 = ReplicatedStorage.Assets.Effects.VoidPortal:Clone();
    v37:GiveTask(u42);
    u42:PivotTo(CFrame.new(u38:GetPivot().Position) * CFrame.Angles(0, 0, 0));
    u42.Parent = u38;
    SoundManager:playSound(GameSound.VOID_PORTAL_SPAWN, {
        position = u38:GetPivot().Position
    });
    local u43 = SoundManager:playSound(GameSound.VOID_PORTAL_LOOP, {
        rollOffMaxDistance = 100,
        looped = true,
        position = u38:GetPivot().Position
    });
    v37:GiveTask(function() -- Line: 237
        -- upvalues: u43 (copy)
        local v44 = u43;

        if v44 ~= nil then
            v44:Stop();
        end;

        local v45 = u43;

        if v45 ~= nil then
            v45:Destroy();
        end;
    end);
    default(0.7, OutBack, function(p46) -- Line: 248
        -- upvalues: u38 (copy), Size (copy)
        local v47 = math.noise(os.clock() * 15) * 1.5;
        u38.Size = Vector3.new((Size.X + v47) * p46, (Size.Y + v47) * p46, Size.Z);
    end, 0, 1):Wait();
    EffectUtil:playEffects({ u42.OnOpen }, nil);
    EffectUtil:playEffects({ u42.OnOpened }, nil);
    task.spawn(function() -- Line: 255
        -- upvalues: u42 (copy), default (ref), Linear (ref)
        task.wait(3);
        task.delay(5, function() -- Line: 257
            -- upvalues: u42 (ref)
            u42:Destroy();
        end);
        local u48 = nil;
        u48 = default(1, Linear, function(u49) -- Line: 262
            -- upvalues: u42 (ref), u48 (ref)
            if not u42.OnOpened then
                u48:Cancel();

                return nil;
            end;

            local v50 = u42.OnOpened:GetDescendants();

            local function v54(p51) -- Line: 268
                -- upvalues: u49 (copy)
                if not (p51:IsA("ParticleEmitter") or p51:IsA("Beam")) then
                    if p51:IsA("ImageLabel") and p51.ImageTransparency < u49 then
                        p51.ImageTransparency = u49;
                    end;

                    return;
                end;

                local u52 = 1;

                local function _(p53) -- Line: 272
                    -- upvalues: u52 (ref)
                    if p53.Value < u52 then
                        u52 = p53.Value;
                    end;
                end;

                for i, v in p51.Transparency.Keypoints do
                    local _ = i - 1;

                    if v.Value < u52 then
                        u52 = v.Value;
                    end;
                end;

                if u52 < u49 then
                    p51.Transparency = NumberSequence.new(u49);
                end;
            end;

            for i, v in v50 do
                v54(v, i - 1, v50);
            end;

            local Ring = u42:WaitForChild("Ring", 3);

            if Ring ~= nil then
                local v55 = Ring:GetDescendants();

                local function v59(p56) -- Line: 295
                    -- upvalues: u49 (copy)
                    if not (p56:IsA("ParticleEmitter") or p56:IsA("Beam")) then
                        if p56:IsA("ImageLabel") and p56.ImageTransparency < u49 then
                            p56.ImageTransparency = u49;
                        end;

                        return;
                    end;

                    local u57 = 1;

                    local function _(p58) -- Line: 299
                        -- upvalues: u57 (ref)
                        if p58.Value < u57 then
                            u57 = p58.Value;
                        end;
                    end;

                    for i, v in p56.Transparency.Keypoints do
                        local _ = i - 1;

                        if v.Value < u57 then
                            u57 = v.Value;
                        end;
                    end;

                    if u57 < u49 then
                        p56.Transparency = NumberSequence.new(u49);
                    end;
                end;

                for i, v in v55 do
                    v59(v, i - 1, v55);
                end;
            end;
        end);
    end);

    return v37;
end;

KnitClient.CreateController(u7.new());

return nil;