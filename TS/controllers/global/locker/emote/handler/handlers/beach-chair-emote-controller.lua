-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BeachChairEmoteController";
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
    p4.Name = "BeachChairEmoteController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), Workspace (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy)
    KnitController.KnitStart(p5);

    local function _(p6) -- Line: 34
        if p6.Name == "BlueBeachChair" and p6:IsA("Model") then
            local PrimaryPart = p6.PrimaryPart;

            if PrimaryPart ~= nil then
                local _ = PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
            end;
        end;
    end;

    for i, child in Workspace:GetChildren() do
        local _ = i - 1;

        if child.Name == "BlueBeachChair" and child:IsA("Model") then
            local PrimaryPart = child.PrimaryPart;

            if PrimaryPart ~= nil then
                local _ = PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
            end;
        end;
    end;

    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local BEACH_VACATION = EmoteType.BEACH_VACATION;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 53, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 59
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 63
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, p13, p14, p15) -- Line: 66
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), WeldUtil (ref)
        ReplicatedStorage.Assets.Misc.BlueBeachChair:Clone();
        local u16 = ReplicatedStorage.Assets.Misc.BlueBeachChair:Clone();
        local u17 = ReplicatedStorage.Assets.Misc.CoconutDrink:Clone();
        u16.Parent = Workspace;
        local CFrame2 = p13.LowerTorso.CFrame;
        local v18 = CFrame.Angles(0, 3.141592653589793, 0);
        u16:PivotTo((CFrame2 + Vector3.new(0, 1.3, 0)) * v18);

        local function _(p19) -- Line: 77
            -- upvalues: GameQueryUtil (ref)
            if p19:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p19, true);
                p19.CanCollide = false;
                p19.Anchored = true;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
                descendant.CanCollide = false;
                descendant.Anchored = true;
            end;
        end;

        u17.Parent = p13;
        WeldUtil:weldCharacterAccessories(p13);
        p15:GiveTask(function() -- Line: 89
            -- upvalues: u16 (copy), u17 (copy)
            u16:Destroy();
            u17:Destroy();
        end);
    end;

    function u8.onDisable(p20, p21, p22, p23) -- Line: 94
    end;

    EmoteHandlerController:registerHandler(BEACH_VACATION, u8);
end;

KnitClient.CreateController(u2.new());

return nil;