-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "VipHoverboardController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "VipHoverboardController";
end;

function u3.KnitStart(p6) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.mountHoverboard(p7, p8) -- Line: 34
    -- upvalues: u1 (copy), Workspace (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v9 = u1.new();
    local v10 = p7:getHoverboardModel();
    v10.Parent = Workspace;
    v9:GiveTask(v10);
    local HumanoidRootPart = p8.HumanoidRootPart;
    local CFrame2 = HumanoidRootPart.CFrame;
    local v11 = CFrame.new(0, -(0.5 * HumanoidRootPart.Size.Y + p8.Humanoid.HipHeight) + 2, 0);
    local v12 = CFrame.Angles(0, 3.141592653589793, 0);
    v10.CFrame = CFrame2 * v11 * v12;
    HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 2, 0);
    WeldUtil:weldParts(HumanoidRootPart, v10);
    local viphoverboard = v10:WaitForChild("viphoverboard", 3);

    if viphoverboard then
        AnimationUtil:playAnimation(viphoverboard, GameAnimationUtil:getAssetId(AnimationType.HOVERBOARD_IDLE));
    end;

    local u13 = AnimationUtil:playAnimation(p8, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_IDLE));
    v9:GiveTask(function() -- Line: 55
        -- upvalues: u13 (copy)
        local v14 = u13;

        if v14 ~= nil then
            v14 = v14:Stop();
        end;

        return v14;
    end);

    return v9;
end;

function u3.getHoverboardModel(p15) -- Line: 64
    -- upvalues: ReplicatedStorage (copy)
    return ReplicatedStorage.Assets.Misc.VipHoverboard:Clone();
end;

KnitClient.CreateController(u3.new());

return nil;