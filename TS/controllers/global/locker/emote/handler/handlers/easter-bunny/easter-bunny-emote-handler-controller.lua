-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = ConstantManager.registerConstants(script, {
    PlayerAnimStartTime = 0.5
});
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "EasterBunnyEmoteHandlerController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "EasterBunnyEmoteHandlerController";
end;

function u4.KnitStart(p7) -- Line: 36
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), u3 (copy)
    KnitController.KnitStart(p7);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local EASTER_BUNNY = EmoteType.EASTER_BUNNY;
    local u8 = EmoteHandler;
    local u9 = setmetatable({}, {
        __tostring = function() -- Line: 44, Name: __tostring
            return "Anonymous";
        end,

        __index = u8
    });
    u9.__index = u9;

    function u9.new(...) -- Line: 50
        -- upvalues: u9 (ref)
        local v10 = setmetatable({}, u9);

        return v10:constructor(...) or v10;
    end;

    function u9.constructor(p11, ...) -- Line: 54
        -- upvalues: u8 (copy)
        u8.constructor(p11, ...);
    end;

    function u9.onEnable(p12, p13, p14, p15, p16) -- Line: 57
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), u3 (ref)
        if not p14.PrimaryPart then
            return nil;
        end;

        local u17 = ReplicatedStorage.Assets.Misc.EasterBunny:Clone();

        for _, descendant in u17:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        u17.Parent = Workspace;
        local u18 = u17:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.EASTER_BUNNY_EMOTE_BUNNY));
        local u19 = p14:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.EASTER_BUNNY_EMOTE_PLAYER));
        u17:PivotTo(p14.PrimaryPart.CFrame - Vector3.new(0, p14.Humanoid.HipHeight + p14.PrimaryPart.Size.Y / 2, 0) + Vector3.new(0, 0.2, 0));
        u18:Play();
        u19:Play();
        u19.TimePosition = u3.PlayerAnimStartTime;
        p16:GiveTask(function() -- Line: 81
            -- upvalues: u17 (copy), u18 (copy), u19 (copy)
            u17:Destroy();
            u18:Stop();
            u18:Destroy();
            u19:Stop();
            u19:Destroy();
        end);
    end;

    function u9.onDisable(p20, p21, p22, p23) -- Line: 89
    end;

    EmoteHandlerController:registerHandler(EASTER_BUNNY, u9);
end;

KnitClient.CreateController(u4.new());

return nil;