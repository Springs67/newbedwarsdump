-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "FirewoodBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 32
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p7, BedBreakEffectType.FIREWOOD);
    p7.Name = "FirewoodBedBreakEffectController";
end;

function u5.KnitStart(p8) -- Line: 36
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p8);
end;

function u5.onBedBreak(u9, p10, p11, p12) -- Line: 39
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient (copy), TweenService (copy), RunService (copy), SoundManager (copy), GameSound (copy)
    local u13 = u2.new();
    u9.maid:GiveTask(u13);
    local u14 = ReplicatedStorage.Assets.Misc.StoneAxe:Clone();
    u14:PivotTo(p11 + Vector3.new(-9, 4, 1));
    u14:ScaleTo(5);
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    local u15 = ReplicatedStorage.Assets.Misc.Logs:Clone();
    u15:PivotTo(p11);
    u15.Parent = Workspace;
    u13:GiveTask(u15);

    local function _(p16) -- Line: 55
        return p16:IsA("BasePart");
    end;

    local v17 = 0;
    local u18 = {};

    for i, descendant in u15.logs:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") == true then
            v17 = v17 + 1;
            u18[v17] = descendant;
        end;
    end;

    table.sort(u18, function(p19, p20) -- Line: 68
        return p19.Name > p20.Name;
    end);

    local function _(p21) -- Line: 74
        p21.Transparency = 1;
    end;

    for i, v in u18 do
        local _ = i - 1;
        v.Transparency = 1;
    end;

    local function _(p22) -- Line: 81
        if p22:IsA("ParticleEmitter") then
            p22.Enabled = false;
        end;
    end;

    for i, descendant in u15.fire:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = false;
        end;
    end;

    local u23 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p12);

    if u23 then
        u23.Name = "BedBreakEffectBedClone";
        u23:PivotTo(p11);
        u23.Parent = Workspace;
        u13:GiveTask(u23);
        local v24 = u23:GetDescendants();

        local function v26(p25) -- Line: 97
            -- upvalues: TweenService (ref), u13 (copy), u23 (copy)
            if p25:IsA("MeshPart") then
                TweenService:Create(p25, TweenInfo.new(2.356194490192345), {
                    Transparency = 1
                }):Play();
                u13:GiveTask(task.delay(2.356194490192345, function() -- Line: 102
                    -- upvalues: u23 (ref)
                    u23:Destroy();
                end));
            end;
        end;

        for i, v in v24 do
            v26(v, i - 1, v24);
        end;

        u13:GiveTask(task.spawn(function() -- Line: 110
            -- upvalues: u23 (copy), u13 (copy), RunService (ref), u18 (copy), TweenService (ref), u9 (copy), SoundManager (ref), GameSound (ref), u15 (copy)
            task.wait(0.39269908169872414);
            local u27 = u23:GetPivot();
            local u28 = true;
            u13:GiveTask(task.delay(2.356194490192345, function() -- Line: 114
                -- upvalues: u28 (ref)
                u28 = false;
            end));

            while u28 do
                local u29 = 0;
                local u30 = nil;
                u30 = RunService.Heartbeat:Connect(function(p31) -- Line: 120
                    -- upvalues: u29 (ref), u23 (ref), u27 (copy), u30 (ref)
                    u29 = u29 + p31;
                    local v32 = math.pow(0.7853981633974483 - u29 + 1.5, 4);
                    local v33 = math.sin(v32) / 2 * 0.25;
                    u23:PivotTo(u27 + Vector3.new(v33, v33, v33));

                    if u29 >= 0.7853981633974483 then
                        u30:Disconnect();
                    end;
                end);
                u13:GiveTask(u30);
                local v34 = #u18;
                local v35 = u18[v34];
                u18[v34] = nil;

                if v35 then
                    TweenService:Create(v35, TweenInfo.new(0.5), {
                        Transparency = 0
                    }):Play();
                end;

                u9:spawnDebris(math.random(8, 12), math.random() * 0.25 + 0.25, u23:GetPivot().Position, 2, 1);
                u13:GiveTask(SoundManager:playSound(GameSound.WOOD_BREAK, {
                    position = u23:GetPivot().Position
                }));
                task.wait(0.7853981633974483);
            end;

            local function _(p36) -- Line: 149
                if p36:IsA("ParticleEmitter") then
                    p36.Enabled = true;
                end;
            end;

            for i, descendant in u15.fire:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = true;
                end;
            end;

            u13:GiveTask(SoundManager:playSound(GameSound.FIRE_START, {
                position = u23:GetPivot().Position
            }));
            u13:GiveTask(SoundManager:playSound(GameSound.FIRE_LOOP, {
                looped = true,
                position = u23:GetPivot().Position
            }));
        end));
    end;

    local u37 = 0;
    local u43 = RunService.Heartbeat:Connect(function(p38) -- Line: 167
        -- upvalues: u37 (ref), u14 (copy)
        u37 = u37 + p38;
        local v39 = CFrame.new(u14.Part.CFrame.Position);
        local Angles = CFrame.Angles;
        local v40 = math.sin(u37 * 4);
        local v41 = math.pow(v40, 4) * -90;
        local v42 = Angles(0, 0, (math.rad(v41)));
        u14.Part.CFrame = v39 * v42;
    end);
    u13:GiveTask(u43);
    u13:GiveTask(task.delay(2.356194490192345, function() -- Line: 174
        -- upvalues: TweenService (ref), u14 (copy), u43 (copy)
        TweenService:Create(u14.Handle, TweenInfo.new(1), {
            Transparency = 1
        }):Play();
        u43:Disconnect();
        task.delay(1, function() -- Line: 179
            -- upvalues: u14 (ref)
            u14:Destroy();
        end);
    end));
end;

function u5.spawnDebris(p44, p45, p46, p47, p48, p49) -- Line: 184
    -- upvalues: RandomUtil (copy), Workspace (copy), u3 (copy), TweenService (copy), Debris (copy)
    local v50 = { Color3.fromRGB(237, 189, 135), Color3.fromRGB(171, 140, 105), Color3.fromRGB(199, 135, 64) };
    local v51 = false;
    local v52 = 0;

    while true do
        if v51 then
            v52 = v52 + 1;
        else
            v51 = true;
        end;

        if v52 >= p45 then
            return;
        end;

        local v53 = u3("Part", {
            Anchored = false,
            Size = Vector3.new(p46, p46, p46),
            CFrame = CFrame.new(p47) * CFrame.Angles(math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793),
            CanCollide = false,
            Color = RandomUtil.fromList(unpack(v50)),
            Parent = Workspace
        });
        local v54 = (math.random() - 0.5) * p48;
        local v55 = (math.random() - 0.5) * p48;
        local v56 = (math.random() - 0.5) * p48;
        v53:ApplyImpulse((Vector3.new(v54, v55, v56)));
        TweenService:Create(v53, TweenInfo.new(p49, Enum.EasingStyle.Linear), {
            Transparency = 1
        }):Play();
        Debris:AddItem(v53, p49);
    end;
end;

KnitClient.CreateController(u5.new());

return nil;