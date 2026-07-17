-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "MeteorsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 29
    -- upvalues: KnitController (copy), u2 (copy), Workspace (copy)
    KnitController.constructor(p6);
    p6.Name = "MeteorsController";
    p6.meteorsFolder = u2("Folder", {
        Name = "Meteors",
        Parent = Workspace
    });
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), default (copy), u1 (copy), ReplicatedStorage (copy), u2 (copy), SoundManager (copy), GameSound (copy), RunService (copy), Workspace (copy), EffectUtil (copy)
    KnitController.KnitStart(u7);
    default.Client:GetNamespace("Disaster"):OnEvent("SpawnMeteor", function(p8, u9, u10, u11, p12, p13) -- Line: 39
        -- upvalues: u1 (ref), ReplicatedStorage (ref), u7 (copy), u2 (ref), SoundManager (ref), GameSound (ref), RunService (ref), Workspace (ref), EffectUtil (ref)
        local v14 = Random.new(p12);
        local u15 = u1.new();
        local u16 = CFrame.new(p8) * CFrame.Angles(v14:NextNumber() * 3.141592653589793 * 2, v14:NextNumber() * 3.141592653589793 * 2, v14:NextNumber() * 3.141592653589793 * 2);
        local u17 = CFrame.new(u9);
        local u18 = ReplicatedStorage.Assets.Effects.Meteor:Clone();
        u18:PivotTo(u16);
        u18.Parent = u7.meteorsFolder;
        local u19 = u2("Part", {
            Anchored = true,
            Name = "Meteor",
            Size = Vector3.new(4, 4, 4),
            CanCollide = false,
            CFrame = u16,
            Color = Color3.fromRGB(0, 0, 0),
            Material = Enum.Material.Rock,
            Parent = u18
        });

        if p13 then
            SoundManager:playSound(GameSound.METEOR_LOOP, {
                rollOffMinDistance = 175,
                rollOffMaxDistance = 350,
                parent = u19
            });
        end;

        local u20 = v14:NextNumber(0.2, 0.5);
        local u21 = v14:NextNumber(0.2, 0.5);
        local u22 = v14:NextNumber(0.2, 0.5);
        local u23 = 0;
        u15:GiveTask(RunService.Heartbeat:Connect(function(p24) -- Line: 73
            -- upvalues: u23 (ref), u16 (copy), u17 (copy), Workspace (ref), u10 (copy), u11 (copy), u9 (copy), u18 (copy), u20 (copy), u21 (copy), u22 (copy), u19 (copy), u15 (copy)
            u23 = u23 + p24;
            local v25 = u16:Lerp(u17, (Workspace:GetServerTimeNow() - u10) / (u11 - u10));
            local v26 = CFrame.new(v25.Position, u9) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966);
            u18:PivotTo(v26);
            u19.CFrame = v26 * CFrame.Angles(u23 * 3.141592653589793 * 2 * u20, u23 * 3.141592653589793 * 2 * u21, u23 * 3.141592653589793 * 2 * u22);

            if u11 <= Workspace:GetServerTimeNow() then
                u15:DoCleaning();
            end;
        end));
        u15:GiveTask(function() -- Line: 88
            -- upvalues: u18 (copy), Workspace (ref), u9 (copy), ReplicatedStorage (ref), u17 (copy), u7 (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
            task.spawn(function() -- Line: 89
                -- upvalues: u18 (ref), Workspace (ref), u9 (ref), ReplicatedStorage (ref), u17 (ref), u7 (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                u18:Destroy();
                local v27 = not Workspace.CurrentCamera and 0 or (u9 - Workspace.CurrentCamera.CFrame.Position).Magnitude;
                local v28 = ReplicatedStorage.Assets.Effects.MeteorHitEffect:Clone();
                v28.CFrame = u17;
                v28.Parent = u7.meteorsFolder;
                EffectUtil:playEffects({ v28 }, nil, {
                    destroyAfterSec = 3,
                    particleMultiplier = v27 > 200 and 0.2 or 1
                });
                SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                    rollOffMaxDistance = 300,
                    position = u9
                });
                SoundManager:playSound(GameSound.CARROT_LAUNCHER_IMPACT, {
                    rollOffMaxDistance = 300,
                    position = u9
                });
            end);
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;