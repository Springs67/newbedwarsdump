-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = {
    {
        time = 0.4,
        color = Color3.fromRGB(255, 0, 255)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(3, 77, 253)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(41, 246, 255)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(43, 255, 14)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(249, 243, 28)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(250, 105, 9)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(254, 41, 174)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(112, 0, 255)
    },
    {
        time = 0.4,
        color = Color3.fromRGB(140, 255, 0)
    }
};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 49, Name: __tostring
        return "RaveKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 55
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 59
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.onKill(p10, p11, p12, p13) -- Line: 63
    -- upvalues: u2 (copy), ReplicatedStorage (copy), WeldUtil (copy), u3 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u5 (copy), TweenService (copy)
    local u14 = u2.new();
    p12.Archivable = true;
    local v15 = p12:Clone();
    v15:PivotTo(p13);
    local u16 = {};

    for _, descendant in v15:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Material = Enum.Material.ForceField;
            descendant.Color = Color3.fromRGB(0, 0, 0);

            if descendant:IsA("MeshPart") then
                descendant.TextureID = "";
            end;

            table.insert(u16, descendant);
        elseif descendant:IsA("Texture") then
            descendant:Destroy();
        elseif descendant:IsA("Shirt") then
            descendant:Destroy();
        end;
    end;

    local u17 = ReplicatedStorage.Assets.Effects.RaveHelmet:Clone();
    u17.Parent = v15;
    v15:WaitForChild("Humanoid"):AddAccessory(u17);
    WeldUtil:weldCharacterAccessories(v15);
    local u18 = u3("Highlight", {
        FillTransparency = 1,
        OutlineTransparency = 0,
        Parent = v15,
        OutlineColor = Color3.fromRGB(255, 255, 255),
        FillColor = Color3.fromRGB(255, 255, 255),
        DepthMode = Enum.HighlightDepthMode.Occluded
    });
    v15.Parent = Workspace;
    KillEffect.hideCharacter(p10, p12);
    local u19 = SoundManager:playSound(GameSound.RAVE_MUSIC, {
        position = v15:GetPivot().Position
    });
    local u20 = AnimationUtil:playAnimation(v15:WaitForChild("Humanoid"):WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.WIGGLE), {
        looped = true
    });

    if u20 ~= nil then
        u20:AdjustSpeed(2);
    end;

    u14:GiveTask(function() -- Line: 109
        -- upvalues: u19 (copy)
        if u19 then
            u19:Destroy();
        end;
    end);
    u14:GiveTask(function() -- Line: 114
        -- upvalues: u20 (copy)
        if u20 then
            u20:Destroy();
        end;
    end);
    u14:GiveTask(v15);
    task.spawn(function() -- Line: 120
        -- upvalues: u5 (ref), TweenService (ref), u18 (copy), u16 (copy), u17 (copy)
        local v21 = false;
        local v22 = 0;

        while true do
            if v21 then
                v22 = v22 + 1;
            else
                v21 = true;
            end;

            if v22 >= #u5 then
                return;
            end;

            TweenService:Create(u18, TweenInfo.new(u5[v22 + 1].time), {
                OutlineColor = u5[v22 + 1].color
            }):Play();

            for _, v in u16 do
                TweenService:Create(v, TweenInfo.new(u5[v22 + 1].time), {
                    Color = u5[v22 + 1].color
                }):Play();
            end;

            for _, descendant in u17:GetDescendants() do
                if descendant:IsA("BasePart") and descendant.Name ~= "Handle" then
                    TweenService:Create(descendant, TweenInfo.new(u5[v22 + 1].time), {
                        Color = u5[v22 + 1].color
                    }):Play();
                end;
            end;

            task.wait(u5[v22 + 1].time);
        end;
    end);
    task.delay(2.7, function() -- Line: 152
        -- upvalues: u16 (copy), TweenService (ref), u17 (copy)
        for _, v in u16 do
            TweenService:Create(v, TweenInfo.new(0.5), {
                Transparency = 1
            }):Play();
        end;

        for _, descendant in u17:GetDescendants() do
            if descendant:IsA("BasePart") then
                TweenService:Create(descendant, TweenInfo.new(0.5), {
                    Transparency = 1
                }):Play();
            end;
        end;
    end);
    task.delay(#u5 * 0.4, function() -- Line: 166
        -- upvalues: u14 (copy)
        u14:DoCleaning();
    end);

    return u14;
end;

return u6;