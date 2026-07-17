-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v1.InExpo;
local OutExpo = v1.OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;

local function _(p5, p6, p7) -- Line: 17
    -- upvalues: TweenService (copy)
    local v8 = TweenService:Create(p5, TweenInfo.new(p7), {
        Color = p6
    });
    v8:Play();

    return v8;
end;

local function u13(p9, p10) -- Line: 24
    -- upvalues: TweenService (copy)
    local v11 = false;
    local v12 = 0;

    while true do
        if v11 then
            v12 = v12 + 1;
        else
            v11 = true;
        end;

        if v12 >= #p10 then
            return;
        end;

        local color = p10[v12 + 1].color;
        TweenService:Create(p9, TweenInfo.new(p10[v12 + 1].time), {
            Color = color
        }):Play();
        task.wait(p10[v12 + 1].time);
    end;
end;

local u14 = {
    {
        time = 0.3,
        color = Color3.fromRGB(194, 212, 250)
    },
    {
        time = 0.3,
        color = Color3.fromRGB(13, 105, 172)
    },
    {
        time = 0.5,
        color = Color3.fromRGB(51, 92, 168)
    }
};
local u15 = setmetatable({}, {
    __tostring = function() -- Line: 56, Name: __tostring
        return "AtomicKillEffect";
    end,

    __index = KillEffect
});
u15.__index = u15;

function u15.new(...) -- Line: 62
    -- upvalues: u15 (copy)
    local v16 = setmetatable({}, u15);

    return v16:constructor(...) or v16;
end;

function u15.constructor(p17, p18) -- Line: 66
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p17, p18);
    KillEffect.setPlayDefaultKillEffect(p17, false);
end;

function u15.onKill(p19, p20, p21, p22) -- Line: 70
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), KillEffect (copy), u3 (copy), SoundManager (copy), GameSound (copy), u13 (copy), u14 (copy), default (copy), OutExpo (copy), ModelUtil (copy), TweenService (copy), InExpo (copy)
    local u23 = u2.new();
    p21.Archivable = true;
    local u24 = p21:Clone();
    u24:PivotTo(p22);
    local u25 = ReplicatedStorage.Assets.Effects.AtomicBall:Clone();
    u25.Parent = Workspace;
    u23:GiveTask(u25);
    u25:PivotTo(u24:GetPivot());
    u24.Parent = Workspace;
    u23:GiveTask(u24);
    local u26 = {};

    for _, descendant in u24:GetDescendants() do
        if descendant:IsA("BasePart") then
            table.insert(u26, descendant);
        end;
    end;

    KillEffect.hideCharacter(p19, p21);
    u3("PointLight", {
        Brightness = 0.3,
        Range = 5,
        Shadows = false,
        Enabled = true,
        Color = Color3.fromRGB(191, 222, 255),
        Parent = u24
    });
    local u27 = SoundManager:playSound(GameSound.ATOMIC_SHRINK, {
        position = u24:GetPivot().Position
    });
    u23:GiveTask(function() -- Line: 100
        -- upvalues: u27 (copy)
        if u27 then
            u27:Destroy();
        end;
    end);
    local Frame = u25:WaitForChild("Frame");
    u25.PrimaryPart = Frame;

    local function _(p28) -- Line: 109
        return p28:IsA("BasePart");
    end;

    local v29 = 0;
    local u30 = {};

    for i, child in u25:WaitForChild("Container"):GetChildren() do
        local _ = i - 1;

        if child:IsA("BasePart") == true then
            v29 = v29 + 1;
            u30[v29] = child;
        end;
    end;

    for _, v in u30 do
        task.delay(0.7000000000000001, function() -- Line: 127
            -- upvalues: u13 (ref), v (copy), u14 (ref)
            u13(v, u14);
        end);
    end;

    local v31 = u25:GetPivot();
    local v32 = u24:GetPivot();
    default(0.8, OutExpo, function(p33) -- Line: 134
        -- upvalues: u25 (copy)
        u25:PivotTo(p33);
    end, v31, v31 * CFrame.Angles(0, 5.235987755982989, 0)):Play();
    default(0.8, OutExpo, function(p34) -- Line: 139
        -- upvalues: u24 (copy)
        u24:PivotTo(p34);
    end, v32, v32 + Vector3.new(0, 0.3, 0)):Play();
    ModelUtil.tweenModelSize(u25, 0.8, OutExpo, 3.3);

    for _, v in u30 do
        TweenService:Create(v, TweenInfo.new(0.8), {
            Transparency = 0
        }):Play();
    end;

    task.delay(0.8, function() -- Line: 152
        -- upvalues: ModelUtil (ref), u25 (copy), InExpo (ref), u24 (copy), TweenService (ref), default (ref), u26 (copy), Frame (copy), u30 (copy)
        ModelUtil.tweenModelSize(u25, 0.75, InExpo, 0);
        ModelUtil.tweenModelSize(u24, 0.75, InExpo, 0.1);

        for _, descendant in u24:GetDescendants() do
            if descendant:IsA("BasePart") then
                TweenService:Create(descendant, TweenInfo.new(0.5), {
                    Color = Color3.fromRGB(120, 173, 252)
                }):Play();
                descendant.Material = Enum.Material.Neon;
            end;

            if descendant:IsA("MeshPart") then
                descendant.TextureID = "";
            elseif descendant:IsA("Texture") then
                descendant:Destroy();
            elseif descendant:IsA("Shirt") then
                descendant:Destroy();
            end;
        end;

        default(0.75, InExpo, function(p35) -- Line: 170
            -- upvalues: u25 (ref)
            u25:PivotTo(p35);
        end, u25:GetPivot(), u25:GetPivot() * CFrame.Angles(0, -5.235987755982989, 0)):Play();

        local function _(p36) -- Line: 177
            -- upvalues: TweenService (ref)
            TweenService:Create(p36, TweenInfo.new(0.75), {
                Transparency = 1
            }):Play();
        end;

        for i, v in u26 do
            local _ = i - 1;
            TweenService:Create(v, TweenInfo.new(0.75), {
                Transparency = 1
            }):Play();
        end;

        TweenService:Create(Frame, TweenInfo.new(0.75), {
            Transparency = 0.25
        }):Play();

        for _, v in u30 do
            TweenService:Create(v, TweenInfo.new(0.75), {
                Transparency = 0.5
            }):Play();
        end;
    end);
    task.delay(1.55, function() -- Line: 195
        -- upvalues: TweenService (ref), u30 (copy)
        local function _(p37) -- Line: 196
            -- upvalues: TweenService (ref)
            TweenService:Create(p37, TweenInfo.new(0.3), {
                Transparency = 1
            }):Play();
        end;

        for i, v in u30 do
            local _ = i - 1;
            TweenService:Create(v, TweenInfo.new(0.3), {
                Transparency = 1
            }):Play();
        end;
    end);
    task.delay(2, function() -- Line: 205
        -- upvalues: u23 (copy)
        u23:DoCleaning();
    end);

    return u23;
end;

return u15;