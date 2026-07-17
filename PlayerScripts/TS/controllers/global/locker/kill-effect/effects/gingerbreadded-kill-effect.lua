-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local InOutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = { GameSound.COOKIE_BITE_01, GameSound.COOKIE_BITE_02, GameSound.COOKIE_BITE_03 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "GingerbreaddedKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 29
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.onKill(u10, p11, u12, p13) -- Line: 37
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), default (copy), InOutExpo (copy), MathExtras (copy), KillEffect (copy), SoundManager (copy), RandomUtil (copy), u5 (copy)
    local u14 = u2.new();
    local u15 = ReplicatedStorage.Assets.Misc.GingerbreadKillEffect:Clone();
    u15:PivotTo(p13);
    u15.Parent = Workspace;
    u15:ScaleTo(0.01);
    u14:GiveTask(u15);
    local u16 = u12:GetScale();
    local u18 = default(2, InOutExpo, function(p17) -- Line: 46
        -- upvalues: u12 (copy), MathExtras (ref), u16 (copy), u15 (copy)
        u12:ScaleTo(MathExtras:lerp(u16, 0.01, p17));
        u15:ScaleTo(MathExtras:lerp(0.01, 1, p17));
    end);
    u14:GiveTask(function() -- Line: 50
        -- upvalues: u18 (copy)
        return u18:Cancel();
    end);
    u14:GiveTask(task.delay(2, function() -- Line: 53
        -- upvalues: KillEffect (ref), u10 (copy), u12 (copy), u15 (copy), u14 (copy), SoundManager (ref), RandomUtil (ref), u5 (ref)
        KillEffect.hideCharacter(u10, u12);

        local function _(p19) -- Line: 56
            if p19:IsA("BasePart") then
                return true;
            end;

            p19:Destroy();

            return false;
        end;

        local v20 = 0;
        local u21 = {};

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;
            local v22;

            if descendant:IsA("BasePart") then
                v22 = true;
            else
                descendant:Destroy();
                v22 = false;
            end;

            if v22 == true then
                v20 = v20 + 1;
                u21[v20] = descendant;
            end;
        end;

        table.sort(u21, function(p23, p24) -- Line: 73
            return p23.Name < p24.Name;
        end);
        u14:GiveTask(task.spawn(function() -- Line: 78
            -- upvalues: u21 (copy), u10 (ref), SoundManager (ref), RandomUtil (ref), u5 (ref), u15 (ref)
            for _, v in u21 do
                task.wait(math.random() + 0.5);
                u10:spawnCrumbs(math.random(8, 12), math.random() * 0.25 + 0.25, v.Position, 2, 1);
                v:Destroy();
                SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
                    position = v.Position
                });
            end;

            u15:Destroy();
        end));
    end));

    return u14;
end;

function u6.spawnCrumbs(p25, p26, p27, p28, p29, p30) -- Line: 92
    -- upvalues: RandomUtil (copy), Workspace (copy), u3 (copy), TweenService (copy), Debris (copy)
    local v31 = { Color3.fromRGB(237, 189, 135), Color3.fromRGB(171, 140, 105), Color3.fromRGB(199, 135, 64) };
    local v32 = false;
    local v33 = 0;

    while true do
        if v32 then
            v33 = v33 + 1;
        else
            v32 = true;
        end;

        if v33 >= p26 then
            return;
        end;

        local v34 = u3("Part", {
            Anchored = false,
            Size = Vector3.new(p27, p27, p27),
            CFrame = CFrame.new(p28) * CFrame.Angles(math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793),
            CanCollide = false,
            Color = RandomUtil.fromList(unpack(v31)),
            Parent = Workspace
        });
        local v35 = (math.random() - 0.5) * p29;
        local v36 = (math.random() - 0.5) * p29;
        local v37 = (math.random() - 0.5) * p29;
        v34:ApplyImpulse((Vector3.new(v35, v36, v37)));
        TweenService:Create(v34, TweenInfo.new(p30, Enum.EasingStyle.Linear), {
            Transparency = 1
        }):Play();
        Debris:AddItem(v34, p30);
    end;
end;

return u6;