-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "ConfettiBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u6.__index = u6;

function u6.new(...) -- Line: 33
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 37
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p8, BedBreakEffectType.CONFETTI);
    p8.Name = "ConfettiBedBreakEffectController";
end;

function u6.KnitStart(p9) -- Line: 41
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p9);
end;

function u6.onBedBreak(u10, p11, u12, u13, u14) -- Line: 44
    task.spawn(function() -- Line: 45
        -- upvalues: u10 (copy), u12 (copy), u14 (copy), u13 (copy)
        u10:createEffect(u12, u14, u13);
    end);
end;

function u6.createEffect(u15, p16, u17, u18) -- Line: 49
    -- upvalues: u3 (copy), ReplicatedStorage (copy), Workspace (copy), PlaceUtil (copy), KnitClient2 (copy), ColorUtil (copy), TeamColorHex (copy), u5 (copy), SoundManager (copy), GameSound (copy), MathUtil (copy), default (copy), OutQuad (copy), CFrameUtil (copy)
    local u19 = u3.new();
    local u20 = u3.new();
    u15.maid:GiveTask(u19);
    u15.maid:GiveTask(u20);
    local u21 = ReplicatedStorage.Assets.Effects.ConfettiBedBreakParticle:Clone();
    u21:PivotTo(p16);
    u21.Parent = Workspace;
    u21.ConfettiParticle:Emit(80);
    u19:GiveTask(task.delay(3, function() -- Line: 59
        -- upvalues: u21 (copy)
        u21:Destroy();
    end));
    u15.maid:GiveTask(u21);
    local u22 = ReplicatedStorage.Assets.Misc.SlicedBed:Clone();
    u15.maid:GiveTask(u22);
    u19:GiveTask(task.spawn(function() -- Line: 67
        -- upvalues: PlaceUtil (ref), KnitClient2 (ref), u18 (copy), ColorUtil (ref), TeamColorHex (ref), u22 (copy), u5 (ref)
        local u23;

        if PlaceUtil.isLobbyServer() then
            u23 = ColorUtil.hexColor(TeamColorHex.red);
        else
            u23 = KnitClient2.Controllers.TeamController:getTeamById(u18);

            if u23 ~= nil then
                u23 = u23.color;
            end;
        end;

        if not u23 then
            return nil;
        end;

        local v24 = u22.Pivot.Align:GetChildren();

        local function v26(p25) -- Line: 83
            -- upvalues: u5 (ref), ColorUtil (ref), u23 (copy)
            if not p25:IsA("MeshPart") then
                return nil;
            end;

            if u5.includes(string.lower(p25.Name), "blanket") then
                p25.Color = ColorUtil.brighten(u23, 0.2);

                return nil;
            end;

            if u5.includes(string.lower(p25.Name), "mattress") then
                p25.Color = u23;
            end;
        end;

        for i, v in v24 do
            v26(v, i - 1, v24);
        end;
    end));
    u22:PivotTo(p16);
    u22.Parent = Workspace;

    local function _(p27) -- Line: 102
        return p27:IsA("MeshPart");
    end;

    local v28 = 0;
    local u29 = {};

    for i, child in u22.Pivot.Align:GetChildren() do
        local _ = i - 1;

        if child:IsA("MeshPart") == true then
            v28 = v28 + 1;
            u29[v28] = child;
        end;
    end;

    local u30 = 0;
    local u31 = 0;
    local u32 = nil;
    u15.maid:GiveTask(task.spawn(function() -- Line: 120
        -- upvalues: u29 (copy), u32 (ref), u19 (copy), u30 (ref), SoundManager (ref), GameSound (ref), u22 (copy), MathUtil (ref), u17 (copy), default (ref), OutQuad (ref), CFrameUtil (ref), u15 (copy), u31 (ref), ReplicatedStorage (ref), Workspace (ref)
        for _, v in u29 do
            if u32 == nil then
                u32 = v;
            end;

            u19:GiveTask(task.spawn(function() -- Line: 126
                -- upvalues: v (copy), u30 (ref), u19 (ref), SoundManager (ref), GameSound (ref), u22 (ref), MathUtil (ref), u17 (ref), default (ref), OutQuad (ref), CFrameUtil (ref), u15 (ref), u31 (ref), ReplicatedStorage (ref), Workspace (ref)
                local Position = v.Position;

                if tick() - u30 > 0.5 then
                    u19:GiveTask(SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
                        position = Position,
                        parent = u22.PrimaryPart,
                        playbackSpeedMultiplier = MathUtil.randomFloatMaxInclusive(0.8, 1.2)
                    }));
                    u30 = tick();
                end;

                local v33 = MathUtil.randomFloatMaxInclusive(-5, 5);
                local v34 = MathUtil.randomFloatMaxInclusive(-5, 5);
                local v35 = 5 + MathUtil.randomFloatMaxInclusive(0, 6);
                local u36 = u17 + Vector3.new(v33, v35, v34);
                local u37 = (u36 - Position).Magnitude / MathUtil.randomFloatMaxInclusive(18, 24);
                local v38 = MathUtil.randomFloatMaxInclusive(-1, 1) * 200;
                local v39 = MathUtil.randomFloatMaxInclusive(-1, 1) * 200;
                local v40 = MathUtil.randomFloatMaxInclusive(-1, 1) * 200;
                local u41 = Vector3.new(v38, v39, v40);
                local u42 = 0;
                local u43 = tick();
                default(u37, OutQuad, function(p44) -- Line: 151
                    -- upvalues: u42 (ref), u43 (ref), Position (copy), u36 (copy), CFrameUtil (ref), v (ref), u41 (copy)
                    u42 = tick() - u43;
                    u43 = tick();
                    local v45 = Position:Lerp(u36, p44);
                    CFrameUtil.setPosition(v, v45);
                    CFrameUtil.rotateLocalDegrees(v, u41 * u42);
                end, 0, 1);
                u15.maid:GiveTask(task.spawn(function() -- Line: 160
                    -- upvalues: u37 (copy), v (ref), u31 (ref), u15 (ref), SoundManager (ref), GameSound (ref), u36 (copy), u22 (ref), MathUtil (ref), ReplicatedStorage (ref), Workspace (ref)
                    task.wait(u37 * 0.9);
                    v:Destroy();

                    if tick() - u31 > 0.5 then
                        u15.maid:GiveTask(SoundManager:playSound(GameSound.CONFETTI, {
                            position = u36,
                            parent = u22.PrimaryPart,
                            playbackSpeedMultiplier = MathUtil.randomFloatMaxInclusive(0.8, 1.2)
                        }));
                        u31 = tick();
                    end;

                    local u46 = ReplicatedStorage.Assets.Effects.ConfettiBedBreakParticle:Clone();
                    u46:PivotTo(CFrame.new(u36));
                    u46.Parent = Workspace;
                    u46.ConfettiParticle:Emit(50);
                    u15.maid:GiveTask(u46);
                    u15.maid:GiveTask(task.delay(3, function() -- Line: 180
                        -- upvalues: u46 (copy)
                        u46:Destroy();
                    end));
                end));
            end));
            task.wait(0.05);
        end;
    end));
    u15.maid:GiveTask(task.spawn(function() -- Line: 189
        -- upvalues: u20 (copy), u19 (copy)
        task.wait(6);
        u20:DoCleaning();
        u19:DoCleaning();
    end));
end;

KnitClient.CreateController(u6.new());

return nil;