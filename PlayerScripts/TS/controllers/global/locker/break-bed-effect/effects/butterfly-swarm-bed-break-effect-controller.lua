-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = {
    UDim2.fromScale(0, 0),
    UDim2.fromScale(-1, 0),
    UDim2.fromScale(0, -1),
    UDim2.fromScale(-1, -1)
};
local u6 = {
    Color3.fromRGB(71, 245, 125),
    Color3.fromRGB(255, 99, 99),
    Color3.fromRGB(255, 171, 36),
    Color3.fromRGB(71, 166, 255),
    Color3.fromRGB(194, 122, 250),
    Color3.fromRGB(255, 122, 196)
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "ButterflySwarmBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u7.__index = u7;

function u7.new(...) -- Line: 43
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 47
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy), u3 (copy)
    BreakBedEffectController.constructor(p9, BedBreakEffectType.BUTTERFLY_SWARM);
    p9.Name = "ButterflySwarmBedBreakEffectController";
    p9.tweenMaid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 52
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p10);
end;

function u7.onBedBreak(u11, p12, u13, u14, u15) -- Line: 55
    task.spawn(function() -- Line: 56
        -- upvalues: u11 (copy), u13 (copy), u15 (copy), u14 (copy)
        u11:createEffect(u13, u15, u14);
    end);
end;

function u7.createEffect(u16, p17, u18, p19) -- Line: 60
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), RandomUtil (copy), u6 (copy), MathUtil (copy), SoundManager (copy), GameSound (copy), RunService (copy), u5 (copy), MathExtras (copy), default (copy), InQuad (copy), Linear (copy)
    local u20 = true;
    u16.maid:GiveTask(function() -- Line: 62
        -- upvalues: u20 (ref)
        u20 = false;
    end);
    u16.maid:GiveTask(u16.tweenMaid);
    local v21 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p19);

    if not v21 then
        return nil;
    end;

    v21.Name = "BedBreakEffectBedClone";
    v21:PivotTo(p17);
    local Root = v21:FindFirstChild("Root");

    if Root ~= nil then
        local function _(p22) -- Line: 75
            if p22:IsA("BasePart") then
                p22.Transparency = 0.55;
            end;
        end;

        for i, child in Root:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") then
                child.Transparency = 0.55;
            end;
        end;
    end;

    v21.Parent = Workspace;
    u16.maid:GiveTask(v21);
    local u23 = ReplicatedStorage.Assets.Effects.BedButterflies:Clone();
    u23:PivotTo(CFrame.new(u18));
    u23.Parent = Workspace;
    u16.maid:GiveTask(u23);
    local BedCube = u23.BedCube;
    local v24 = BedCube.Position.Y - BedCube.Size.Y / 2;
    local v25 = (BedCube.Position.Y + BedCube.Size.Y / 2 + v24) / 2;
    local X = BedCube.Size.X;
    local Z = BedCube.Size.Z;
    local v26 = false;
    local v27 = 0;
    local v28 = {};

    while true do
        if v26 then
            v27 = v27 + 1;
        else
            v26 = true;
        end;

        if v27 >= 20 then
            break;
        end;

        local v29 = math.floor(v27 / 4);
        local v30 = Vector3.new(BedCube.Position.X - X / 2 + X / 4 * (v27 % 4 + 0.5), v25 + BedCube.Size.Y / 2, BedCube.Position.Z - Z / 2 + Z / 5 * (v29 + 0.5));
        table.insert(v28, v30);
    end;

    local v31 = false;
    local v32 = 0;

    while true do
        if v31 then
            v32 = v32 + 1;
        else
            v31 = true;
        end;

        if v32 >= 24 then
            local u33 = {};

            local function _(u34) -- Line: 166
                -- upvalues: u16 (copy), ReplicatedStorage (ref), RandomUtil (ref), u6 (ref), u23 (copy), MathUtil (ref), u33 (copy)
                u16.maid:GiveTask(task.spawn(function() -- Line: 167
                    -- upvalues: ReplicatedStorage (ref), RandomUtil (ref), u6 (ref), u23 (ref), u34 (ref), MathUtil (ref), u33 (ref), u16 (ref)
                    local u35 = ReplicatedStorage.Assets.Effects.BedButterfly:Clone();
                    local BillboardGui = u35:FindFirstChild("BillboardGui");

                    if not BillboardGui then
                        return nil;
                    end;

                    local ImageLabel = BillboardGui:FindFirstChild("ImageLabel");

                    if not ImageLabel then
                        return nil;
                    end;

                    ImageLabel.ImageColor3 = RandomUtil.fromList(unpack(u6));
                    u35.Parent = u23;
                    local v36 = MathUtil.randomFloatMaxInclusive(8, 14);
                    local v37 = u34 + Vector3.new(0, v36, 0);
                    u35:PivotTo(CFrame.new(v37));
                    local v38 = MathUtil.randomFloatMaxInclusive(-0.1, 0.1);
                    local v39 = MathUtil.randomFloatMaxInclusive(-0.1, 0.1);
                    u34 = u34 + Vector3.new(v38, v39, MathUtil.randomFloatMaxInclusive(-0.1, 0.1));
                    local v40 = {
                        moveProgress = 0,
                        part = u35,
                        startPosition = v37,
                        endPosition = u34,
                        moveDuration = MathUtil.randomFloatMaxInclusive(2.5, 3.5),
                        spiralRadius = MathUtil.randomFloatMaxInclusive(9, 14),
                        spiralSpeed = MathUtil.randomFloatMaxInclusive(0.5, 1),
                        spinProgress = MathUtil.randomFloatMaxInclusive(0, 1),
                        animationFrameIndex = math.random(0, 3),
                        animationFrameChangeInterval = MathUtil.randomFloatMaxInclusive(0.03, 0.05),
                        lastAnimationFrameChangeTime = tick()
                    };
                    table.insert(u33, v40);
                    u16.maid:GiveTask(function() -- Line: 200
                        -- upvalues: u35 (copy)
                        u35:Destroy();
                    end);
                end));
            end;

            for i, v in v28 do
                local u41 = v;
                local _ = i - 1;
                u16.maid:GiveTask(task.spawn(function() -- Line: 167
                    -- upvalues: ReplicatedStorage (ref), RandomUtil (ref), u6 (ref), u23 (copy), u41 (ref), MathUtil (ref), u33 (copy), u16 (copy)
                    local u42 = ReplicatedStorage.Assets.Effects.BedButterfly:Clone();
                    local BillboardGui = u42:FindFirstChild("BillboardGui");

                    if not BillboardGui then
                        return nil;
                    end;

                    local ImageLabel = BillboardGui:FindFirstChild("ImageLabel");

                    if not ImageLabel then
                        return nil;
                    end;

                    ImageLabel.ImageColor3 = RandomUtil.fromList(unpack(u6));
                    u42.Parent = u23;
                    local v43 = MathUtil.randomFloatMaxInclusive(8, 14);
                    local v44 = u41 + Vector3.new(0, v43, 0);
                    u42:PivotTo(CFrame.new(v44));
                    local v45 = MathUtil.randomFloatMaxInclusive(-0.1, 0.1);
                    local v46 = MathUtil.randomFloatMaxInclusive(-0.1, 0.1);
                    u41 = u41 + Vector3.new(v45, v46, MathUtil.randomFloatMaxInclusive(-0.1, 0.1));
                    local v47 = {
                        moveProgress = 0,
                        part = u42,
                        startPosition = v44,
                        endPosition = u41,
                        moveDuration = MathUtil.randomFloatMaxInclusive(2.5, 3.5),
                        spiralRadius = MathUtil.randomFloatMaxInclusive(9, 14),
                        spiralSpeed = MathUtil.randomFloatMaxInclusive(0.5, 1),
                        spinProgress = MathUtil.randomFloatMaxInclusive(0, 1),
                        animationFrameIndex = math.random(0, 3),
                        animationFrameChangeInterval = MathUtil.randomFloatMaxInclusive(0.03, 0.05),
                        lastAnimationFrameChangeTime = tick()
                    };
                    table.insert(u33, v47);
                    u16.maid:GiveTask(function() -- Line: 200
                        -- upvalues: u42 (copy)
                        u42:Destroy();
                    end);
                end));
            end;

            local u48 = ReplicatedStorage.Assets.Effects.BedButterfly:Clone();
            local u49 = math.random(1, #u6 - 1);
            local BillboardGui = u48:FindFirstChild("BillboardGui");

            if not BillboardGui then
                return nil;
            end;

            local ImageLabel = BillboardGui:FindFirstChild("ImageLabel");

            if not ImageLabel then
                return nil;
            end;

            ImageLabel.ImageColor3 = u6[u49 + 1];
            BillboardGui.Size = UDim2.fromScale(5, 5);
            u48:PivotTo(CFrame.new(u18 + Vector3.new(0, 3, 0)));
            u48.Parent = u23;
            u16.maid:GiveTask(function() -- Line: 226
                -- upvalues: u48 (copy)
                u48:Destroy();
            end);
            local u50 = {
                moveProgress = 0,
                animationFrameChangeInterval = 0.05,
                part = u48,
                startPosition = u48:GetPivot().Position,
                endPosition = u48:GetPivot().Position,
                moveDuration = MathUtil.randomFloatMaxInclusive(2.5, 3.5),
                spiralRadius = MathUtil.randomFloatMaxInclusive(9, 14),
                spiralSpeed = MathUtil.randomFloatMaxInclusive(0.5, 1),
                spinProgress = MathUtil.randomFloatMaxInclusive(0, 1),
                animationFrameIndex = math.random(0, 3),
                lastAnimationFrameChangeTime = tick()
            };
            local u51 = {};
            local v52 = SoundManager:playModifiableSound(GameSound.BUTTERFLY_SWARM_BED_BREAK_FLUTTER, {
                looped = true,
                playbackSpeedMultiplier = 2.4,
                position = p17.Position,
                parent = Workspace
            });
            table.insert(u51, v52);
            local v53 = SoundManager:playModifiableSound(GameSound.BUTTERFLY_SWARM_BED_BREAK_FLUTTER, {
                looped = true,
                playbackSpeedMultiplier = 2.6,
                position = p17.Position,
                parent = Workspace
            });
            table.insert(u51, v53);
            local v54 = SoundManager:playModifiableSound(GameSound.BUTTERFLY_SWARM_BED_BREAK_FLUTTER, {
                looped = true,
                playbackSpeedMultiplier = 2.8,
                position = p17.Position,
                parent = Workspace
            });
            table.insert(u51, v54);
            u16.maid:GiveTask(function() -- Line: 266
                -- upvalues: u51 (copy)
                local v55 = u51;

                if (v55 ~= nil and #v55 or v55) > 0 then
                    local function _(p56) -- Line: 272
                        p56:Stop();
                        p56:Destroy();
                    end;

                    for i, v in u51 do
                        local _ = i - 1;
                        v:Stop();
                        v:Destroy();
                    end;

                    table.clear(u51);
                end;
            end);
            local u57 = 0;
            local u66 = RunService.Heartbeat:Connect(function(p58) -- Line: 284
                -- upvalues: u5 (ref), u33 (copy), u50 (copy), u57 (ref), u6 (ref), u49 (ref)
                local function v63(p59) -- Line: 286
                    -- upvalues: u5 (ref)
                    if not p59 then
                        return nil;
                    end;

                    local v60;

                    if p59 == nil then
                        v60 = p59;
                    else
                        v60 = p59.part;

                        if v60 ~= nil then
                            v60 = v60:FindFirstChild("BillboardGui");
                        end;
                    end;

                    local v61 = not v60;

                    if not v61 then
                        local part = p59.part;

                        if part ~= nil then
                            part = part.Parent;
                        end;

                        v61 = part == nil;
                    end;

                    if v61 then
                        return nil;
                    end;

                    if tick() - p59.lastAnimationFrameChangeTime > p59.animationFrameChangeInterval then
                        p59.lastAnimationFrameChangeTime = tick();
                        p59.animationFrameIndex = (p59.animationFrameIndex + 1) % 4;
                        local v62;

                        if p59 == nil then
                            v62 = p59;
                        else
                            v62 = p59.part;

                            if v62 ~= nil then
                                v62 = v62:FindFirstChild("BillboardGui");

                                if v62 ~= nil then
                                    v62 = v62:FindFirstChild("ImageLabel");
                                end;
                            end;
                        end;

                        if not v62 then
                            return nil;
                        end;

                        v62.Position = u5[p59.animationFrameIndex + 1];
                    end;
                end;

                for i, v in u33 do
                    v63(v, i - 1, u33);
                end;

                local v64 = u50;

                if v64 ~= nil then
                    v64 = v64.part;

                    if v64 ~= nil then
                        v64 = v64:FindFirstChild("BillboardGui");
                    end;
                end;

                if v64 then
                    local part = u50.part;

                    if part ~= nil then
                        part = part.Parent;
                    end;

                    v64 = part ~= nil;
                end;

                if v64 then
                    local BillboardGui2 = u50.part:FindFirstChild("BillboardGui");
                    local v65;

                    if BillboardGui2 == nil then
                        v65 = BillboardGui2;
                    else
                        v65 = BillboardGui2:FindFirstChild("ImageLabel");
                    end;

                    if not BillboardGui2 then
                        return nil;
                    end;

                    if not v65 then
                        return nil;
                    end;

                    if tick() - u50.lastAnimationFrameChangeTime > u50.animationFrameChangeInterval then
                        u50.lastAnimationFrameChangeTime = tick();
                        u50.animationFrameIndex = (u50.animationFrameIndex + 1) % 4;
                        v65.Position = u5[u50.animationFrameIndex + 1];
                    end;

                    u57 = u57 + p58 * 0.8;
                    v65.ImageColor3 = u6[u49 + 1]:Lerp(u6[(u49 + 1) % #u6 + 1], (math.clamp(u57, 0, 1)));

                    if u57 >= 1 then
                        u49 = (u49 + 1) % #u6;
                        u57 = 0;
                    end;
                end;
            end);
            u16.maid:GiveTask(function() -- Line: 380
                -- upvalues: u66 (copy)
                if u66.Connected then
                    u66:Disconnect();
                end;
            end);
            local u79 = RunService.Heartbeat:Connect(function(u67) -- Line: 386
                -- upvalues: MathExtras (ref), u33 (copy)
                local function v78(p68) -- Line: 389
                    -- upvalues: u67 (copy), MathExtras (ref)
                    local v69;

                    if p68 == nil then
                        v69 = p68;
                    else
                        v69 = p68.part;

                        if v69 ~= nil then
                            v69 = v69:FindFirstChild("BillboardGui");
                        end;
                    end;

                    local v70 = not v69;

                    if not v70 then
                        local v71;

                        if p68 == nil then
                            v71 = p68;
                        else
                            v71 = p68.part;

                            if v71 ~= nil then
                                v71 = v71.Parent;
                            end;
                        end;

                        v70 = v71 == nil;
                    end;

                    if v70 then
                        return nil;
                    end;

                    if p68.moveProgress >= 1 then
                        return nil;
                    end;

                    p68.moveProgress = p68.moveProgress + u67 / p68.moveDuration;
                    p68.spinProgress = p68.spinProgress + u67 * p68.spiralSpeed;
                    local v72 = MathExtras:lerp(p68.startPosition.Y, p68.endPosition.Y, (math.clamp(p68.moveProgress, 0, 1)));
                    local v73 = p68.spinProgress * 2 * 3.141592653589793;
                    local v74 = p68.spiralRadius * (1 - p68.moveProgress);
                    local v75 = p68.endPosition.X + v74 * math.cos(v73);
                    local v76 = p68.endPosition.Z + v74 * math.sin(v73);
                    local v77 = Vector3.new(v75, v72, v76);
                    p68.part:PivotTo(CFrame.new(v77));
                end;

                for i, v in u33 do
                    v78(v, i - 1, u33);
                end;
            end);
            u16.maid:GiveTask(function() -- Line: 429
                -- upvalues: u79 (copy)
                if u79.Connected then
                    u79:Disconnect();
                end;
            end);
            task.wait(3.5);
            task.wait(0.5);
            v21:Destroy();

            local function _(u80) -- Line: 441
                -- upvalues: u16 (copy), MathUtil (ref), u18 (copy), default (ref), InQuad (ref), u20 (ref)
                u16.maid:GiveTask(task.spawn(function() -- Line: 442
                    -- upvalues: u80 (copy), MathUtil (ref), u18 (ref), default (ref), InQuad (ref), u16 (ref), u20 (ref)
                    if not u80 then
                        return nil;
                    end;

                    if u80.part.Parent == nil then
                        return nil;
                    end;

                    local v81 = MathUtil.randomFloatMaxInclusive(-15, 15);
                    local v82 = MathUtil.randomFloatMaxInclusive(-15, 15);
                    local v83 = 30 + MathUtil.randomFloatMaxInclusive(0, 8);
                    local u84 = u18 + Vector3.new(v81, v83, v82);
                    local v85 = MathUtil.randomFloatMaxInclusive(2, 3);
                    local u86 = nil;
                    u86 = default(v85, InQuad, function(p87) -- Line: 458
                        -- upvalues: u80 (ref), u86 (ref), u84 (copy)
                        if u80 == nil or (u80.part == nil or u80.part.Parent == nil) then
                            u86:Cancel();

                            return nil;
                        end;

                        local v88 = u80.endPosition:Lerp(u84, p87);
                        u80.part:PivotTo(CFrame.new(v88));
                    end, 0, 1);
                    u86:Play();
                    u16.tweenMaid:GiveTask(function() -- Line: 467
                        -- upvalues: u86 (ref)
                        if u86 then
                            u86:Cancel();
                        end;
                    end);
                    task.wait(v85 - 1);
                    local u89 = nil;
                    u89 = default(1, InQuad, function(p90) -- Line: 475
                        -- upvalues: u80 (ref), u89 (ref), u20 (ref)
                        local part = u80.part;

                        if part ~= nil then
                            part = part:FindFirstChild("BillboardGui");
                        end;

                        local v91 = not part;

                        if not v91 then
                            local part2 = u80.part;

                            if part2 ~= nil then
                                part2 = part2.Parent;
                            end;

                            v91 = part2 == nil;
                        end;

                        if v91 then
                            u89:Cancel();

                            return nil;
                        end;

                        if u20 then
                            local BillboardGui2 = u80.part:FindFirstChild("BillboardGui");
                            local v92 = BillboardGui2 and BillboardGui2:FindFirstChild("ImageLabel");

                            if v92 then
                                v92.ImageTransparency = p90;
                            end;
                        end;
                    end, 0, 1);
                    u89:Play():Wait();
                    u16.tweenMaid:GiveTask(function() -- Line: 502
                        -- upvalues: u89 (ref)
                        if u89 then
                            u89:Cancel();
                        end;
                    end);
                end));
            end;

            for i, v in u33 do
                local _ = i - 1;
                u16.maid:GiveTask(task.spawn(function() -- Line: 442
                    -- upvalues: v (copy), MathUtil (ref), u18 (copy), default (ref), InQuad (ref), u16 (copy), u20 (ref)
                    if not v then
                        return nil;
                    end;

                    if v.part.Parent == nil then
                        return nil;
                    end;

                    local v93 = MathUtil.randomFloatMaxInclusive(-15, 15);
                    local v94 = MathUtil.randomFloatMaxInclusive(-15, 15);
                    local v95 = 30 + MathUtil.randomFloatMaxInclusive(0, 8);
                    local u96 = u18 + Vector3.new(v93, v95, v94);
                    local v97 = MathUtil.randomFloatMaxInclusive(2, 3);
                    local u98 = nil;
                    u98 = default(v97, InQuad, function(p99) -- Line: 458
                        -- upvalues: v (ref), u98 (ref), u96 (copy)
                        if v == nil or (v.part == nil or v.part.Parent == nil) then
                            u98:Cancel();

                            return nil;
                        end;

                        local v100 = v.endPosition:Lerp(u96, p99);
                        v.part:PivotTo(CFrame.new(v100));
                    end, 0, 1);
                    u98:Play();
                    u16.tweenMaid:GiveTask(function() -- Line: 467
                        -- upvalues: u98 (ref)
                        if u98 then
                            u98:Cancel();
                        end;
                    end);
                    task.wait(v97 - 1);
                    local u101 = nil;
                    u101 = default(1, InQuad, function(p102) -- Line: 475
                        -- upvalues: v (ref), u101 (ref), u20 (ref)
                        local part = v.part;

                        if part ~= nil then
                            part = part:FindFirstChild("BillboardGui");
                        end;

                        local v103 = not part;

                        if not v103 then
                            local part2 = v.part;

                            if part2 ~= nil then
                                part2 = part2.Parent;
                            end;

                            v103 = part2 == nil;
                        end;

                        if v103 then
                            u101:Cancel();

                            return nil;
                        end;

                        if u20 then
                            local BillboardGui2 = v.part:FindFirstChild("BillboardGui");
                            local v104 = BillboardGui2 and BillboardGui2:FindFirstChild("ImageLabel");

                            if v104 then
                                v104.ImageTransparency = p102;
                            end;
                        end;
                    end, 0, 1);
                    u101:Play():Wait();
                    u16.tweenMaid:GiveTask(function() -- Line: 502
                        -- upvalues: u101 (ref)
                        if u101 then
                            u101:Cancel();
                        end;
                    end);
                end));
            end;

            u16.maid:GiveTask(task.spawn(function() -- Line: 513
                -- upvalues: u18 (copy), default (ref), InQuad (ref), u50 (copy), u16 (copy), u20 (ref)
                local u105 = u18 + Vector3.new(0, 30, 0);
                local u106 = nil;
                u106 = default(4, InQuad, function(p107) -- Line: 521
                    -- upvalues: u50 (ref), u106 (ref), u105 (copy)
                    if u50 == nil or (u50.part == nil or u50.part.Parent == nil) then
                        u106:Cancel();

                        return nil;
                    end;

                    local v108 = u50.endPosition:Lerp(u105, p107);
                    u50.part:PivotTo(CFrame.new(v108));
                end, 0, 1);
                u106:Play();
                u16.tweenMaid:GiveTask(function() -- Line: 530
                    -- upvalues: u106 (ref)
                    if u106 then
                        u106:Cancel();
                    end;
                end);
                task.wait(3);
                local u109 = nil;
                u109 = default(1, InQuad, function(p110) -- Line: 538
                    -- upvalues: u50 (ref), u109 (ref), u20 (ref)
                    local part = u50.part;

                    if part ~= nil then
                        part = part:FindFirstChild("BillboardGui");
                    end;

                    local v111 = not part;

                    if not v111 then
                        local part2 = u50.part;

                        if part2 ~= nil then
                            part2 = part2.Parent;
                        end;

                        v111 = part2 == nil;
                    end;

                    if v111 then
                        u109:Cancel();

                        return nil;
                    end;

                    if u20 then
                        local BillboardGui2 = u50.part:FindFirstChild("BillboardGui");
                        local v112 = BillboardGui2 and BillboardGui2:FindFirstChild("ImageLabel");

                        if v112 then
                            v112.ImageTransparency = p110;
                        end;
                    end;
                end, 0, 1);
                u109:Play():Wait();
                u16.tweenMaid:GiveTask(function() -- Line: 566
                    -- upvalues: u109 (ref)
                    if u109 then
                        u109:Cancel();
                    end;
                end);
            end));
            u16.maid:GiveTask(task.spawn(function() -- Line: 573
                -- upvalues: default (ref), Linear (ref), u51 (copy)
                default(4, Linear, function(u113) -- Line: 574
                    -- upvalues: u51 (ref)
                    local function _(p114) -- Line: 575
                        -- upvalues: u113 (copy)
                        p114.Volume = 1 - u113;
                    end;

                    for i, v in u51 do
                        local _ = i - 1;
                        v.Volume = 1 - u113;
                    end;
                end, 0, 1):Play();
            end));
            u16.maid:GiveTask(task.spawn(function() -- Line: 585
                -- upvalues: u16 (copy)
                task.wait(10);
                u16.tweenMaid:DoCleaning();
                u16.maid:DoCleaning();
            end));

            return;
        end;

        local v115, v116;

        if v32 < 4 then
            v115 = BedCube.Position.X - X / 2 + X / 4 * v32;
            v116 = BedCube.Position.Z - Z / 2;
        elseif v32 < 12 then
            v115 = BedCube.Position.X + X / 2;
            v116 = BedCube.Position.Z - Z / 2 + Z / 8 * (v32 - 4);
        elseif v32 < 16 then
            v115 = BedCube.Position.X + X / 2 - X / 4 * (v32 - 4 - 8);
            v116 = BedCube.Position.Z + Z / 2;
        else
            v115 = BedCube.Position.X - X / 2;
            v116 = BedCube.Position.Z + Z / 2 - Z / 8 * (v32 - 8 - 8);
        end;

        local v117 = Vector3.new(v115, v25, v116);
        table.insert(v28, v117);
        local v118 = Vector3.new(v115, v24 - 1, v116);
        table.insert(v28, v118);
    end;
end;

KnitClient.CreateController(u7.new());

return nil;