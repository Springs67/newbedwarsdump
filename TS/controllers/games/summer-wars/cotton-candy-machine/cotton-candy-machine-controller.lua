-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local CottonCandyMachineConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "cotton-candy-machine", "cotton-candy-machine-config").CottonCandyMachineConfig;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local CottonCandyMachineBillboard = RuntimeLib.import(script, script.Parent, "ui", "cotton-candy-machine-billboard").CottonCandyMachineBillboard;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "CottonCandyMachineController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.SUMMER_WARS });
    p5.Name = "CottonCandyMachineController";
    p5.billboardMap = {};
    p5.giveRadiusRingMap = {};
    p5.productionBounceConnectionMap = {};
    p5.productionBounceTweenMap = {};
    p5.productionBounceOriginalTransformMap = {};
    p5.productionLoopSoundMap = {};
    p5.nextGiveTimeMap = {};
end;

function u3.onGameInit(u6) -- Line: 41
    -- upvalues: CollectionService (copy)
    local function _(p7) -- Line: 43
        -- upvalues: u6 (copy)
        return u6:mountBillboard(p7);
    end;

    for i, v in CollectionService:GetTagged("CottonCandyMachine") do
        local _ = i - 1;
        u6:mountBillboard(v);
    end;

    CollectionService:GetInstanceAddedSignal("CottonCandyMachine"):Connect(function(p8) -- Line: 49
        -- upvalues: u6 (copy)
        u6:mountBillboard(p8);
    end);
    CollectionService:GetInstanceRemovedSignal("CottonCandyMachine"):Connect(function(p9) -- Line: 52
        -- upvalues: u6 (copy)
        u6:unmountBillboard(p9);
    end);
end;

function u3.mountBillboard(p10, p11) -- Line: 56
    -- upvalues: u1 (copy), CottonCandyMachineBillboard (copy)
    if p10.billboardMap[p11] ~= nil then
        return nil;
    end;

    if not p11:IsA("BasePart") then
        return nil;
    end;

    local v12 = u1.mount(u1.createElement(CottonCandyMachineBillboard, {
        cottonCandyMachine = p11
    }), p11);
    p10.billboardMap[p11] = v12;
    p10:mountGiveRadiusRing(p11);
    p10:watchProductionBounce(p11);
    p10:startProductionLoop(p11);
end;

function u3.unmountBillboard(p13, p14) -- Line: 75
    -- upvalues: u1 (copy)
    local v15 = p13.billboardMap[p14];

    if v15 then
        u1.unmount(v15);
        p13.billboardMap[p14] = nil;
    end;

    local v16 = p13.productionBounceConnectionMap[p14];

    if v16 ~= nil then
        v16:Disconnect();
    end;

    p13.productionBounceConnectionMap[p14] = nil;
    p13:unmountGiveRadiusRing(p14);
    p13:resetProductionBounce(p14);
    p13:stopProductionLoop(p14);
    p13.nextGiveTimeMap[p14] = nil;
end;

function u3.mountGiveRadiusRing(p17, p18) -- Line: 101
    -- upvalues: ReplicatedStorage (copy), CottonCandyMachineConfig (copy), EffectUtil (copy)
    if p17.giveRadiusRingMap[p18] ~= nil then
        return nil;
    end;

    local v19 = ReplicatedStorage.Assets.Effects.CircleRing:Clone();
    local v20 = CottonCandyMachineConfig.BLOCK_GIVE_RADIUS * 2;
    local v21 = math.max(v19.Size.X, v19.Size.Z);
    v19.Name = "CottonCandyMachineGiveRadiusRing";
    v19.Anchored = true;
    v19.CanCollide = false;
    v19.CanQuery = false;
    v19.CanTouch = false;
    v19.Size = Vector3.new(v20, 0.01, v20);
    EffectUtil:scaleEffect({ v19 }, v21 <= 0 and 1 or v20 / v21);
    v19:PivotTo(p18.CFrame - Vector3.new(0, p18.Size.Y / 2 - 0.05, 0));
    v19.Parent = p18;
    p17.giveRadiusRingMap[p18] = v19;
end;

function u3.unmountGiveRadiusRing(p22, p23) -- Line: 127
    local v24 = p22.giveRadiusRingMap[p23];

    if v24 ~= nil then
        v24:Destroy();
    end;

    p22.giveRadiusRingMap[p23] = nil;
end;

function u3.startProductionLoop(p25, p26) -- Line: 138
    -- upvalues: SoundManager (copy), GameSound (copy)
    if p25.productionLoopSoundMap[p26] ~= nil then
        return nil;
    end;

    local v27 = SoundManager:playSound(GameSound.SNOW_CONE_MACHINE_MAKING, {
        rollOffMaxDistance = 100,
        looped = true,
        volumeMultiplier = 0.35,
        position = p26.Position
    });

    if v27 then
        p25.productionLoopSoundMap[p26] = v27;
    end;
end;

function u3.stopProductionLoop(p28, p29) -- Line: 156
    local v30 = p28.productionLoopSoundMap[p29];

    if v30 then
        v30:Stop();
        v30:Destroy();
        p28.productionLoopSoundMap[p29] = nil;
    end;
end;

function u3.watchProductionBounce(u31, u32) -- Line: 168
    -- upvalues: CottonCandyMachineConfig (copy)
    u31.nextGiveTimeMap[u32] = u31:getNextGiveTime(u32);
    local v35 = u32:GetAttributeChangedSignal(CottonCandyMachineConfig.BLOCK_GIVE_NEXT_TIME_ATTRIBUTE):Connect(function() -- Line: 173
        -- upvalues: u31 (copy), u32 (copy)
        local v33 = u31.nextGiveTimeMap[u32];
        local v34 = u31:getNextGiveTime(u32);
        u31.nextGiveTimeMap[u32] = v34;

        if v33 == nil or v34 == nil then
            return nil;
        end;

        if v34 <= v33 then
            return nil;
        end;

        u31:playProductionBounce(u32);
    end);
    u31.productionBounceConnectionMap[u32] = v35;
end;

function u3.getNextGiveTime(p36, p37) -- Line: 193
    -- upvalues: CottonCandyMachineConfig (copy)
    return p37:GetAttribute(CottonCandyMachineConfig.BLOCK_GIVE_NEXT_TIME_ATTRIBUTE);
end;

function u3.playProductionBounce(u38, u39) -- Line: 196
    -- upvalues: SoundManager (copy), GameSound (copy), TweenService (copy)
    u38:resetProductionBounce(u39);
    local v40 = u38:getProductionBounceParts(u39);

    if #v40 == 0 then
        return nil;
    end;

    SoundManager:playSound(GameSound.WAND_BUBBLE_POP, {
        position = u39.Position
    });
    local v41 = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v42 = TweenInfo.new(0.13, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
    local v43 = TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out);
    local v44 = {};
    local u45 = {};

    for _, v in v40 do
        local u46 = {
            cframe = v.CFrame,
            size = v.Size
        };
        u45[v] = u46;
        local v47 = u38:getSquashStretchTransform(u39.CFrame, u46, Vector3.new(1.1, 0.78, 1.1), -0.05);
        local v48 = u38:getSquashStretchTransform(u39.CFrame, u46, Vector3.new(0.94, 1.12, 0.94), 0.35);
        local v49 = TweenService:Create(v, v41, {
            CFrame = v47.cframe,
            Size = v47.size
        });
        local u50 = TweenService:Create(v, v42, {
            CFrame = v48.cframe,
            Size = v48.size
        });
        local u51 = TweenService:Create(v, v43, {
            CFrame = u46.cframe,
            Size = u46.size
        });
        v49.Completed:Connect(function(p52) -- Line: 232
            -- upvalues: v (copy), u50 (copy)
            if p52 ~= Enum.PlaybackState.Completed then
                return nil;
            end;

            if v.Parent == nil then
                return nil;
            end;

            u50:Play();
        end);
        u50.Completed:Connect(function(p53) -- Line: 241
            -- upvalues: v (copy), u51 (copy)
            if p53 ~= Enum.PlaybackState.Completed then
                return nil;
            end;

            if v.Parent == nil then
                return nil;
            end;

            u51:Play();
        end);
        u51.Completed:Connect(function(p54) -- Line: 250
            -- upvalues: v (copy), u46 (copy)
            if p54 ~= Enum.PlaybackState.Completed then
                return nil;
            end;

            if v.Parent ~= nil then
                v.CFrame = u46.cframe;
                v.Size = u46.size;
            end;
        end);
        table.insert(v44, v49);
        table.insert(v44, u50);
        table.insert(v44, u51);
        v49:Play();
    end;

    u38.productionBounceOriginalTransformMap[u39] = u45;
    u38.productionBounceTweenMap[u39] = v44;
    task.delay(0.6, function() -- Line: 272
        -- upvalues: u38 (copy), u39 (copy), u45 (copy)
        if u38.productionBounceOriginalTransformMap[u39] ~= u45 then
            return nil;
        end;

        u38.productionBounceOriginalTransformMap[u39] = nil;
        u38.productionBounceTweenMap[u39] = nil;
    end);
end;

function u3.getSquashStretchTransform(p55, p56, p57, p58, p59) -- Line: 286
    local v60 = p56:ToObjectSpace(p57.cframe);
    local Position = v60.Position;
    local v61 = Vector3.new(Position.X * p58.X, Position.Y * p58.Y + p59, Position.Z * p58.Z);

    return {
        cframe = p56 * CFrame.new(v61) * (v60 - Position),
        size = p57.size * p58
    };
end;

function u3.getProductionBounceParts(p62, p63) -- Line: 302
    local function _(p64) -- Line: 304
        local v65 = p64:IsA("BasePart") and p64.Transparency < 1;

        return v65;
    end;

    local v66 = 0;
    local v67 = {};

    for i, descendant in p63:GetDescendants() do
        local _ = i - 1;
        local v68 = descendant:IsA("BasePart") and descendant.Transparency < 1;

        if v68 == true then
            v66 = v66 + 1;
            v67[v66] = descendant;
        end;
    end;

    return v67;
end;

function u3.resetProductionBounce(p69, p70) -- Line: 319
    local v71 = p69.productionBounceTweenMap[p70];

    if v71 ~= nil then
        local function _(p72) -- Line: 324
            return p72:Cancel();
        end;

        for i, v in v71 do
            local _ = i - 1;
            v:Cancel();
        end;
    end;

    p69.productionBounceTweenMap[p70] = nil;
    local v73 = p69.productionBounceOriginalTransformMap[p70];

    if not v73 then
        return nil;
    end;

    local function _(p74, p75) -- Line: 340
        if p75.Parent ~= nil then
            p75.CFrame = p74.cframe;
            p75.Size = p74.size;
        end;
    end;

    for i, v in v73 do
        if i.Parent ~= nil then
            i.CFrame = v.cframe;
            i.Size = v.size;
        end;
    end;

    p69.productionBounceOriginalTransformMap[p70] = nil;
end;

KnitClient.CreateController(u3.new());

return nil;