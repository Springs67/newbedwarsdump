-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "NewYearsLuckyBlockController";
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
    p4.Name = "NewYearsLuckyBlockController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), KnitClient (copy), FireworkType (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("NewYearsLuckyBlockSpawn", function(p6) -- Line: 32
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), TweenService (ref), KnitClient (ref), FireworkType (ref)
        local u7 = ReplicatedStorage.Assets.Effects.NewYearsFireworkRocket:Clone();
        u7.Parent = Workspace;
        u7:PivotTo(CFrame.new(p6.blockPosition));
        TweenService:Create(u7, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
            Transparency = 1,
            CFrame = CFrame.new(p6.fireworkPosition)
        }):Play();
        task.delay(1.5, function() -- Line: 40
            -- upvalues: u7 (copy)
            u7:Destroy();
        end);
        KnitClient.Controllers.FireworkController:playFireworkEffect(p6.fireworkPosition, FireworkType.NEW_YEARS, {
            sizeMultiplier = 0.7,
            volumeMultiplier = 0.25
        });
    end);
    WatchCollectionTag("NewYearsLuckyBlock", function(p8) -- Line: 48
        -- upvalues: ReplicatedStorage (ref)
        for _, child in ReplicatedStorage.Assets.Effects.NewYearsLuckyBlockParticles:Clone():GetChildren() do
            if child:IsA("ParticleEmitter") then
                child.Parent = p8;
                child.Enabled = true;
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;