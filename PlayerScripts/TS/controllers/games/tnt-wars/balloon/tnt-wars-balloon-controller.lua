-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "TntWarsBalloonController";
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
    -- upvalues: KnitController (copy), u2 (copy), Workspace (copy)
    KnitController.constructor(p6);
    p6.Name = "TntWarsBalloonController";
    p6.TNTBalloonModelFolder = u2("Folder", {
        Name = "TNTBalloons",
        Parent = Workspace
    });
end;

function u4.KnitStart(p7) -- Line: 40
    -- upvalues: default (copy), u1 (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), BalanceFile (copy), RunService (copy), Players (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy)
    default.Client:OnEvent("CreatedTNTWarsBalloon", function(p8) -- Line: 41
        -- upvalues: u1 (ref), ReplicatedStorage (ref), Workspace (ref), TweenService (ref), BalanceFile (ref), RunService (ref)
        local u9 = u1.new();
        local u10 = ReplicatedStorage.Assets.Misc.TNTWarsBalloon:Clone();
        u10.Parent = Workspace;
        local hitbox = p8.hitbox;
        local originVector3 = p8.originVector3;
        local targetVector3 = p8.targetVector3;
        u10:PivotTo(CFrame.new(originVector3));

        for _, descendant in u10:GetDescendants() do
            task.spawn(function() -- Line: 50
                -- upvalues: descendant (copy), TweenService (ref)
                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                    TweenService:Create(descendant, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        Transparency = 0
                    }):Play();
                end;
            end);
        end;

        local u11 = 0;
        local TNT_WARS_BALLOON_TRAVEL_TIME = BalanceFile.TNT_WARS_BALLOON_TRAVEL_TIME;
        u9:GiveTask(function() -- Line: 61
            -- upvalues: u10 (copy)
            if u10 then
                u10:Destroy();
            end;
        end);
        u9:GiveTask(RunService.Heartbeat:Connect(function(p12) -- Line: 66
            -- upvalues: u10 (copy), u9 (copy), u11 (ref), TNT_WARS_BALLOON_TRAVEL_TIME (copy), originVector3 (copy), targetVector3 (copy), BalanceFile (ref)
            if u10.Parent == nil then
                u9:DoCleaning();

                return nil;
            end;

            if u10.PrimaryPart == nil then
                u9:DoCleaning();

                return nil;
            end;

            u11 = u11 + p12;
            local v13 = math.clamp(u11 / TNT_WARS_BALLOON_TRAVEL_TIME, 0, 1);
            local v14 = originVector3:Lerp(targetVector3, v13);
            local v15 = CFrame.Angles(0, 6.283185307179586 * BalanceFile.TNT_WARS_BALLOON_NUMBER_ROTATIONS * v13, 0);
            u10:PivotTo(CFrame.new(v14) * v15);

            if TNT_WARS_BALLOON_TRAVEL_TIME <= u11 then
                u9:DoCleaning();

                return nil;
            end;
        end));
        hitbox.AncestryChanged:Connect(function() -- Line: 86
            -- upvalues: u9 (copy)
            u9:DoCleaning();

            return nil;
        end);
    end);
    default.Client:OnEvent("PoppedTNTWarsBalloon", function(p16) -- Line: 91
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), EffectUtil (ref)
        local poppedVector3 = p16.poppedVector3;

        if p16.shooter.Character == Players.LocalPlayer.Character then
            SoundManager:playSound(GameSound.ARROW_HIT, {
                volumeMultiplier = 0.7,
                position = poppedVector3
            });
        end;

        SoundManager:playSound(GameSound.BALLOON_POP, {
            position = nil,
            volumeMultiplier = 3,
            playbackSpeedMultiplier = 0.9
        });
        local u17 = ReplicatedStorage.Assets.Effects.PopEffectRed:Clone();
        u17:PivotTo(CFrame.new(poppedVector3 + Vector3.new(0, 10, 0)));
        EffectUtil:playEffects({ u17 }, nil, {
            particleMultiplier = 2
        });
        task.delay(2, function() -- Line: 111
            -- upvalues: u17 (copy)
            u17:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;