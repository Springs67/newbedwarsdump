-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "WebbedUpKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 29
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, u11) -- Line: 33
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), u2 (copy), BedwarsImageId (copy), TweenService (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy), WeldUtil (copy)
    local u12 = u1.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13.HumanoidRootPart.CanTouch = false;
    u13.HumanoidRootPart.CFrame = u11;
    u13.Parent = Workspace;
    u12:GiveTask(u13);
    KillEffect.hideCharacter(p8, p10);
    local v14 = u13:GetDescendants();

    local function v16(p15) -- Line: 46
        if p15:IsA("GuiObject") then
            p15.Transparency = 1;

            return;
        end;

        if p15:IsA("UIStroke") then
            p15.Transparency = 1;

            return;
        end;

        if p15:IsA("Decal") then
            p15.Transparency = 1;

            return;
        end;

        if p15.Name == "_DamageHighlight_" then
            p15:Destroy();
        end;
    end;

    for i, v in v14 do
        v16(v, i - 1, v14);
    end;

    local u17 = ReplicatedStorage.Assets.Effects.WebEffectFolder:Clone();
    u12:GiveTask(u17);
    local v18 = u2("Attachment", {
        Name = "WebRootAttachment",
        Parent = u13.HumanoidRootPart,
        CFrame = CFrame.new(Vector3.new(0, 30, 0))
    });
    local v19 = u2("Attachment", {
        Parent = u13.HumanoidRootPart,
        CFrame = CFrame.new(Vector3.new(0, 30, 0))
    });
    u12:GiveTask((u2("Beam", {
        FaceCamera = true,
        TextureSpeed = 0.5,
        Parent = u13.HumanoidRootPart,
        Attachment0 = v18,
        Attachment1 = v19,
        Texture = BedwarsImageId.WEB_FLAT,
        TextureMode = Enum.TextureMode.Stretch,
        Transparency = NumberSequence.new(0)
    })));
    local v20 = TweenService:Create(v18, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        WorldCFrame = u13.HumanoidRootPart.CFrame
    });
    local u21 = TweenService:Create(u13.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
        Transparency = 1,
        CFrame = v19.WorldCFrame
    });
    u12:GiveTask(v20);
    u12:GiveTask(u21);
    local u22 = RuntimeLib.Promise.delay(0.5):andThen(function() -- Line: 94
        -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u11 (copy)
        u12:GiveTask(SoundManager:playSound(GameSound.SPIDER_WEB, {
            position = u11.Position
        }));
    end);
    u12:GiveTask(function() -- Line: 100
        -- upvalues: u22 (copy)
        return u22:cancel();
    end);
    v20:Play();
    v20.Completed:Once(function() -- Line: 104
        -- upvalues: WeldUtil (ref), u13 (copy), u17 (copy), u21 (copy)
        WeldUtil:weldCharacterAccessories(u13, u17);
        u13.HumanoidRootPart.Anchored = false;
        u21:Play();
    end);
    u21.Completed:Once(function() -- Line: 111
        -- upvalues: u12 (copy)
        return u12:DoCleaning();
    end);
    task.delay(1.8, function() -- Line: 114
        -- upvalues: u12 (copy)
        return u12:DoCleaning();
    end);

    return u12;
end;

return u4;