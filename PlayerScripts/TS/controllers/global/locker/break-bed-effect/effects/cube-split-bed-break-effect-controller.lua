-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "CubeSplitBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p7, BedBreakEffectType.CUBE_SPLIT);
    p7.Name = "CubeSplitBedBreakEffectController";
end;

function u5.KnitStart(p8) -- Line: 39
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p8);
end;

function u5.onBedBreak(u9, p10, u11, u12, u13) -- Line: 42
    task.spawn(function() -- Line: 43
        -- upvalues: u9 (copy), u11 (copy), u12 (copy), u13 (copy)
        u9:createEffect(u11, u12, u13);
    end);
end;

function u5.createEffect(u14, u15, u16, u17) -- Line: 47
    -- upvalues: ReplicatedStorage (copy), PlaceUtil (copy), KnitClient2 (copy), ColorUtil (copy), TeamColorHex (copy), u4 (copy), Workspace (copy), RunService (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    local u18 = ReplicatedStorage.Assets.Misc.SlicedBed:Clone();
    u14.maid:GiveTask(u18);
    u14.maid:GiveTask(task.spawn(function() -- Line: 52
        -- upvalues: PlaceUtil (ref), KnitClient2 (ref), u16 (copy), ColorUtil (ref), TeamColorHex (ref), u18 (copy), u4 (ref)
        local u19;

        if PlaceUtil.isLobbyServer() then
            u19 = ColorUtil.hexColor(TeamColorHex.red);
        else
            u19 = KnitClient2.Controllers.TeamController:getTeamById(u16);

            if u19 ~= nil then
                u19 = u19.color;
            end;
        end;

        if not u19 then
            return nil;
        end;

        local v20 = u18.Pivot.Align:GetChildren();

        local function v22(p21) -- Line: 68
            -- upvalues: u4 (ref), ColorUtil (ref), u19 (copy)
            if not p21:IsA("MeshPart") then
                return nil;
            end;

            if u4.includes(string.lower(p21.Name), "blanket") then
                p21.Color = ColorUtil.brighten(u19, 0.2);

                return nil;
            end;

            if u4.includes(string.lower(p21.Name), "mattress") then
                p21.Color = u19;
            end;
        end;

        for i, v in v20 do
            v22(v, i - 1, v20);
        end;
    end));
    u18.Parent = Workspace;
    u18:PivotTo(u15);
    u14.maid:GiveTask(task.spawn(function() -- Line: 86
        -- upvalues: KnitClient2 (ref), u16 (copy), u18 (copy), u4 (ref), ColorUtil (ref)
        local u23 = KnitClient2.Controllers.TeamController:getTeamById(u16);

        if u23 ~= nil then
            u23 = u23.color;
        end;

        if not u23 then
            return nil;
        end;

        local v24 = u18.Pivot.Align:GetChildren();

        local function v26(p25) -- Line: 96
            -- upvalues: u4 (ref), ColorUtil (ref), u23 (copy)
            if not p25:IsA("MeshPart") then
                return nil;
            end;

            if u4.includes(string.lower(p25.Name), "blanket") then
                p25.Color = ColorUtil.brighten(u23, 0.2);

                return nil;
            end;

            if u4.includes(string.lower(p25.Name), "mattress") then
                p25.Color = u23;
            end;
        end;

        for i, v in v24 do
            v26(v, i - 1, v24);
        end;
    end));
    local u27 = {};

    local function _(p28) -- Line: 115
        -- upvalues: u27 (copy)
        if not p28:IsA("ParticleEmitter") then
            return nil;
        end;

        table.insert(u27, p28);
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            table.insert(u27, descendant);
        end;
    end;

    u14.maid:GiveTask(task.spawn(function() -- Line: 125
        -- upvalues: u27 (copy)
        local function _(p29) -- Line: 126
            p29.Enabled = true;
            task.wait(0.1);
        end;

        for i, v in u27 do
            local _ = i - 1;
            v.Enabled = true;
            task.wait(0.1);
        end;
    end));
    u14.maid:GiveTask(task.delay(0.6, function() -- Line: 135
        -- upvalues: RunService (ref), SoundManager (ref), GameSound (ref), u15 (copy)
        local u30 = 1;
        local u33 = RunService.Heartbeat:Connect(function(p31) -- Line: 137
            -- upvalues: u30 (ref), SoundManager (ref), GameSound (ref), u15 (ref)
            u30 = u30 + p31;

            if u30 >= 0.1 then
                local v32 = math.random() + math.random(2, 3);
                SoundManager:playSound(GameSound.KILL_EFFECT_SLASH, {
                    position = u15.Position,
                    playbackSpeedMultiplier = v32
                });
                u30 = 0;
            end;
        end);
        task.delay(0.9, function() -- Line: 148
            -- upvalues: u33 (copy)
            u33:Disconnect();
        end);
    end));
    u14.maid:GiveTask(task.delay(1.5, function() -- Line: 153
        -- upvalues: u27 (copy), u18 (copy), u17 (copy), u14 (copy), SoundManager (ref), GameSound (ref), u15 (copy), TweenService (ref)
        local function _(p34) -- Line: 154
            p34.Enabled = false;

            return p34.Enabled;
        end;

        for i, v in u27 do
            local _ = i - 1;
            v.Enabled = false;
            local _ = v.Enabled;
        end;

        local function _(p35) -- Line: 164
            -- upvalues: u17 (ref)
            if not p35:IsA("MeshPart") then
                return nil;
            end;

            p35.Anchored = false;
            p35.CanCollide = true;
            local Unit = (p35.Position - u17).Unit;
            Vector3.new(Unit.X, 0, Unit.Z);
        end;

        for i, child in u18.Pivot.Align:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                child.Anchored = false;
                child.CanCollide = true;
                local Unit = (child.Position - u17).Unit;
                Vector3.new(Unit.X, 0, Unit.Z);
            end;
        end;

        u14.maid:GiveTask(SoundManager:playSound(GameSound.SPLIT_BED_BREAK_FALL_APART, {
            playbackSpeedMultiplier = 0.5,
            position = u15.Position
        }));
        u14.maid:GiveTask(task.delay(2.5, function() -- Line: 187
            -- upvalues: u18 (ref), TweenService (ref)
            local v36 = u18.Pivot.Align:GetChildren();

            local function v38(p37) -- Line: 189
                -- upvalues: TweenService (ref)
                if not p37:IsA("MeshPart") then
                    return nil;
                end;

                TweenService:Create(p37, TweenInfo.new(1), {
                    Size = Vector3.new(0, 0, 0),
                    Transparency = 1
                }):Play();
            end;

            for i, v in v36 do
                v38(v, i - 1, v36);
            end;
        end));
    end));
end;

KnitClient.CreateController(u5.new());

return nil;