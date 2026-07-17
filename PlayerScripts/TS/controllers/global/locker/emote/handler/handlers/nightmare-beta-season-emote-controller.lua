-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "NightmareBetaSeasonEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "NightmareBetaSeasonEmoteController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), TweenService (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local NIGHTMARE_1 = EmoteType.NIGHTMARE_1;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 38, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 44
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 48
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, p12, p13, p14) -- Line: 51
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), TweenService (ref)
        local u15 = ReplicatedStorage.Assets.Effects.NightmareEmote:Clone();
        u15.Parent = Workspace;
        u15:PivotTo(p12.LowerTorso.CFrame + Vector3.new(0, -2, 0));

        local function _(p16) -- Line: 59
            -- upvalues: GameQueryUtil (ref)
            if p16:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p16, true);
                p16.CanCollide = false;
                p16.Anchored = true;
            end;
        end;

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
                descendant.CanCollide = false;
                descendant.Anchored = true;
            end;
        end;

        local Outer = u15:FindFirstChild("Outer");

        if Outer then
            TweenService:Create(Outer, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Orientation = Outer.Orientation + Vector3.new(0, 360, 0)
            }):Play();
        end;

        local Middle = u15:FindFirstChild("Middle");

        if Middle then
            TweenService:Create(Middle, TweenInfo.new(12.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Orientation = Middle.Orientation + Vector3.new(0, -360, 0)
            }):Play();
        end;

        p14:GiveTask(function() -- Line: 93
            -- upvalues: u15 (copy)
            u15:Destroy();
        end);
    end;

    function u7.onDisable(p17, p18, p19, p20) -- Line: 97
    end;

    EmoteHandlerController:registerHandler(NIGHTMARE_1, u7);
end;

KnitClient.CreateController(u2.new());

return nil;