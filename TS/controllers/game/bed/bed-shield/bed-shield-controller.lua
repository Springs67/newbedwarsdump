-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuint = v2.InQuint;
local OutExpo = v2.OutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "BedShieldController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "BedShieldController";
end;

function u5.KnitStart(u8) -- Line: 38
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), Workspace (copy)
    KnitController.KnitStart(u8);
    WatchCollectionTag("bed", function(u9) -- Line: 40
        -- upvalues: Workspace (ref), u8 (copy)
        local function _(p10) -- Line: 41
            -- upvalues: Workspace (ref), u8 (ref), u9 (copy)
            if p10 ~= nil and Workspace:GetServerTimeNow() < p10 then
                u8:hookBedShield(u9);
            end;
        end;

        local v11 = u9:GetAttribute("BedShieldEndTime");

        if v11 ~= nil and Workspace:GetServerTimeNow() < v11 then
            u8:hookBedShield(u9);
        end;

        u9:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function() -- Line: 47
            -- upvalues: u9 (copy), Workspace (ref), u8 (ref)
            local v12 = u9:GetAttribute("BedShieldEndTime");

            if v12 ~= nil and Workspace:GetServerTimeNow() < v12 then
                u8:hookBedShield(u9);
            end;
        end);
    end);
end;

function u5.hookBedShield(p13, u14) -- Line: 52
    -- upvalues: u3 (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), default2 (copy), OutExpo (copy), ModelUtil (copy), GameQueryUtil (copy), RunService (copy), default (copy), InQuint (copy)
    local u15 = u3.new();
    u14:GetAttribute("BedShieldEndTime");
    u14:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function() -- Line: 55
        -- upvalues: u14 (copy), u15 (copy)
        if u14:GetAttribute("BedShieldEndTime") == nil then
            u15:DoCleaning();
        end;
    end);
    u14.Destroying:Connect(function() -- Line: 61
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);
    local u16 = u14.CFrame + Vector3.new(0, 1, 1.5);
    local u17 = ReplicatedStorage.Assets.Effects.BedShield:Clone();
    u17:PivotTo(u16);
    scaleModel(u17, 0.1);
    u17.Parent = Workspace;
    default2(1.1, OutExpo, function(p18) -- Line: 71
        -- upvalues: u17 (copy)
        u17.Shields.Transparency = p18;
    end, 1, 0);
    ModelUtil.tweenModelSize(u17, 1.1, OutExpo, 10);

    for _, child in u17:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    local u19 = 0;
    u15:GiveTask(RunService.Heartbeat:Connect(function(p20) -- Line: 81
        -- upvalues: u19 (ref), u17 (copy), default (ref), u16 (copy)
        u19 = u19 + p20;

        if u17.PrimaryPart == nil then
            default.Error("Shield effect has no primary part");

            return nil;
        end;

        local v21 = CFrame.Angles(0, u19 * 0.8, 0);
        u17.Shields.CFrame = u16 * v21;
    end));
    u15:GiveTask(function() -- Line: 90
        -- upvalues: ModelUtil (ref), u17 (copy), InQuint (ref)
        ModelUtil.tweenModelSize(u17, 0.75, InQuint, 0):andThen(function() -- Line: 92
            -- upvalues: u17 (ref)
            u17:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;