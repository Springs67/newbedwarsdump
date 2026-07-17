-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "GenieLampKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, p10) -- Line: 31
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), TweenService (copy), RunService (copy), RuntimeLib (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local v12 = p9:Clone();
    v12.Parent = Workspace;
    u11:GiveTask(v12);
    KillEffect.hideCharacter(p7, p9);

    local function _(p13) -- Line: 40
        if p13:IsA("Highlight") then
            p13:Destroy();
        end;
    end;

    for i, descendant in v12:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Highlight") then
            descendant:Destroy();
        end;
    end;

    local u14 = ReplicatedStorage.Assets.Effects.GenieLamp:Clone();
    u14.Parent = Workspace;
    u14:PivotTo(v12:GetPivot() + v12:GetPivot().LookVector.Unit * 8);
    u11:GiveTask(u14);
    local u15 = {};
    local v16 = {};
    local v17 = #v16;
    local v18 = v12:FindFirstChild("3DClothing");

    if v18 ~= nil then
        v18 = v18:GetChildren();
    end;

    local v19 = v18 == nil and {} or v18;
    local v20 = #v19;
    table.move(v19, 1, v20, v17 + 1, v16);
    local v21 = v12:GetChildren();
    table.move(v21, 1, #v21, v17 + v20 + 1, v16);

    for _, v in v16 do
        if v:IsA("BasePart") then
            for _, child in v:GetChildren() do
                if child:IsA("Motor6D") then
                    child:Destroy();
                end;
            end;

            v.Anchored = true;
            local v22 = {
                part = v,
                start = v:GetPivot()
            };
            table.insert(u15, v22);
        end;
    end;

    if #u15 == 0 then
        return u11;
    end;

    u11:GiveTask(SoundManager:playSound(GameSound.GENIE_LAMP_KILL_EFFECT, {
        rollOffMaxDistance = 150,
        rollOffMinDistance = 50,
        playbackSpeedMultiplier = 0.7,
        position = u14:GetPivot().Position
    }));
    local Position = u14:GetPivot().Position;
    local u23 = 1.5 / #u15;
    local u24 = u23 * 2;
    local u25 = u1.new();
    local v26 = u14.Cap:GetChildren();

    local function v30(u27) -- Line: 103
        -- upvalues: TweenService (ref), u14 (copy), u25 (copy)
        if u27:IsA("MeshPart") then
            local u28 = u27:GetPivot().UpVector.Unit * 1.2;
            local v29 = TweenService:Create(u27, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {
                Position = u27.Position + u28
            });
            v29:Play();
            u14.Cap.Glass.Smoke.Enabled = true;
            u25:GiveTask(function() -- Line: 111
                -- upvalues: u14 (ref)
                local Smoke = u14.Cap.Glass.Smoke;
                Smoke.Enabled = false;

                return Smoke.Enabled;
            end);
            u25:GiveTask(v29);
            u25:GiveTask(function() -- Line: 117
                -- upvalues: TweenService (ref), u27 (copy), u28 (copy)
                TweenService:Create(u27, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
                    Position = u27.Position - u28
                }):Play();
            end);
        end;
    end;

    local u31 = -0.75;

    for i, v in v26 do
        v30(v, i - 1, v26);
    end;

    task.delay(2.4, function() -- Line: 128
        -- upvalues: u25 (copy)
        return u25:DoCleaning();
    end);
    u11:GiveTask(RunService.Heartbeat:Connect(function(p32) -- Line: 131
        -- upvalues: u31 (ref), u15 (copy), u23 (copy), u24 (copy), TweenService (ref), Position (copy)
        u31 = u31 + p32;

        if u31 < 0 then
            return nil;
        end;

        local v33 = false;
        local v34 = 0;

        while true do
            if v33 then
                v34 = v34 + 1;
            else
                v33 = true;
            end;

            if v34 >= #u15 then
                return;
            end;

            local v35 = u15[v34 + 1];

            if v35.part.Parent ~= nil then
                local v36 = math.clamp(u31 - u23 * v34, 0, u24);

                if u24 <= v36 then
                    v35.part.Transparency = 1;
                    local tween = v35.tween;

                    if tween ~= nil then
                        tween:Destroy();
                    end;

                    v35.part:Destroy();
                else
                    if v36 > 0.1 and v35.tween == nil then
                        v35.tween = TweenService:Create(v35.part, TweenInfo.new(u24 * 2, Enum.EasingStyle.Linear), {
                            Size = v35.part.Size * 0.5
                        });
                        v35.tween:Play();
                    end;

                    local v37 = v36 / u24;
                    local v38 = math.sin(v37 * 3);
                    local v39 = math.pow(v37 * 2 - 1, 2) * -1 + 1;
                    local v40 = Vector3.new(0, v39, v38) * 5;
                    v35.part.CFrame = v35.start + ((Position - v35.start.Position) * v37 + v40);
                end;
            end;
        end;
    end));
    RuntimeLib.Promise.delay(3):andThen(function() -- Line: 178
        -- upvalues: u11 (copy)
        return u11:DoCleaning();
    end);

    return u11;
end;

return u3;