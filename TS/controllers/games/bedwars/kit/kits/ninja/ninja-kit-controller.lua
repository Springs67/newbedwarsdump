-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = { GameSound.NINJA_SMOKE_1, GameSound.NINJA_SMOKE_2, GameSound.NINJA_SMOKE_3 };
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "NinjaKitController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 37
    -- upvalues: BedwarsKit (copy), u4 (copy), AnimationType (copy), BaseKitController (copy), u2 (copy)
    local NINJA = BedwarsKit.NINJA;
    local v8 = {};
    local v9 = {};
    table.move(u4, 1, #u4, #v9 + 1, v9);
    v8.sounds = v9;
    v8.animations = { AnimationType.NINJA_RUN };
    BaseKitController.constructor(p7, NINJA, v8);
    p7.Name = "NinjaKitController";
    p7.animationMaid = u2.new();
end;

function u5.KnitStart(p10) -- Line: 50
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u5.onKitLocalActivated(p11, p12) -- Line: 53
end;

function u5.onKitLocalDeactivated(p13) -- Line: 55
end;

function u5.onKitReplicationActivated(u14, p15) -- Line: 57
    -- upvalues: WatchCharacter (copy), KnitClient (copy), BedwarsKit (copy), default (copy), ClientSyncEvents (copy), StatusEffectType (copy)
    WatchCharacter(function(p16, p17) -- Line: 58
        -- upvalues: KnitClient (ref), BedwarsKit (ref)
        if not KnitClient.Controllers.KitController:isUsingKit(p16, BedwarsKit.NINJA) then
            return nil;
        end;

        local Animate = p17:WaitForChild("Animate");

        if not Animate then
            return nil;
        end;

        local run = Animate:WaitForChild("run");

        if not run then
            return nil;
        end;

        if run ~= nil then
            run = run:WaitForChild("RunAnim");
        end;

        if not run then
            return nil;
        end;

        run.AnimationId = "http://www.roblox.com/asset/?id=15516100146";
    end);
    default.Client:OnEvent("NinjaSubstitutionActivated", function(p18) -- Line: 82
        -- upvalues: u14 (copy)
        if not p18.player then
            return nil;
        end;

        u14:playerActivateSubstitution(p18.player);
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p19) -- Line: 89
        -- upvalues: StatusEffectType (ref), u14 (copy)
        if p19.statusEffect ~= StatusEffectType.NINJA_INVISIBLE then
            return nil;
        end;

        u14:removeInvisibility(p19.entityInstance);
    end);
end;

function u5.onKitReplicationDeactivated(p20) -- Line: 96
end;

function u5.onInnateAbilityEnabled(p21, p22, p23) -- Line: 98
end;

function u5.onAbilityUsed(p24, p25, p26) -- Line: 100
end;

function u5.playerActivateSubstitution(p27, p28) -- Line: 102
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), u4 (copy), Players (copy)
    local v29;

    if p28 == nil then
        v29 = p28;
    else
        v29 = p28.Character;

        if v29 ~= nil then
            v29 = v29.PrimaryPart;
        end;
    end;

    if not v29 then
        return nil;
    end;

    local Position = p28.Character.PrimaryPart.Position;
    local v30 = CFrame.new(Position);
    local u31 = ReplicatedStorage.Assets.Effects.NinjaSmoke:Clone();
    u31.Parent = Workspace;
    u31:PivotTo(v30);
    task.delay(0.5, function() -- Line: 120
        -- upvalues: EffectUtil (ref), u31 (copy)
        EffectUtil:disableEffects(u31:GetDescendants());
    end);
    task.delay(4, function() -- Line: 123
        -- upvalues: u31 (copy)
        u31:Destroy();
    end);
    local u32 = ReplicatedStorage.Assets.Misc.NinjaLog:Clone();
    u32.Parent = Workspace;
    local v33 = math.random(-360, 360);
    local v34 = math.random(-360, 360);
    local v35 = Vector3.new(v33, v34, math.random(-360, 360));
    u32.PrimaryPart:PivotTo(v30);
    u32.PrimaryPart.Orientation = v35;
    task.delay(8, function() -- Line: 134
        -- upvalues: u32 (copy)
        u32:Destroy();
    end);
    task.delay(0.5, function() -- Line: 138
        -- upvalues: u32 (copy)
        u32.PrimaryPart.Anchored = false;
        local v36 = math.random(-1, 1);
        local v37 = Vector3.new(v36, 0, math.random(-1, 1));
        local PrimaryPart = u32.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart:ApplyImpulse(v37 * 5);
        end;
    end);
    SoundManager:playSound(u4[math.random(0, #u4 - 1) + 1], {
        position = Position
    });
    local _ = p28 == Players.LocalPlayer;
end;

function u5.removeInvisibility(p38, p39) -- Line: 155
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), u4 (copy)
    local v40 = p39:GetPivot();

    if v40 ~= nil then
        v40 = v40.Position;
    end;

    if not v40 then
        return nil;
    end;

    local v41 = CFrame.new(v40);
    local u42 = ReplicatedStorage.Assets.Effects.NinjaSmoke:Clone();
    u42.Parent = Workspace;
    u42:PivotTo(v41);
    task.delay(0.5, function() -- Line: 170
        -- upvalues: EffectUtil (ref), u42 (copy)
        EffectUtil:disableEffects(u42:GetDescendants());
    end);
    task.delay(4, function() -- Line: 173
        -- upvalues: u42 (copy)
        u42:Destroy();
    end);
    SoundManager:playSound(u4[math.random(0, #u4 - 1) + 1], {
        position = v40
    });
end;

function u5.setUpAnimation(p43, u44, p45) -- Line: 181
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Humanoid = p45:WaitForChild("Humanoid");

    if not Humanoid then
        return nil;
    end;

    local u46 = nil;
    p43.animationMaid:GiveTask(function() -- Line: 187
        -- upvalues: u46 (ref)
        local v47 = u46;

        if v47 ~= nil then
            v47:Stop();
        end;

        local v48 = u46;

        if v48 ~= nil then
            v48:Destroy();
        end;
    end);
    p43.animationMaid:GiveTask(Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 197
        -- upvalues: Humanoid (copy), u46 (ref), AnimationUtil (ref), u44 (copy), GameAnimationUtil (ref), AnimationType (ref)
        if Humanoid.WalkSpeed > 14 then
            local v49 = u46;

            if v49 ~= nil then
                v49:Stop();
            end;

            local v50 = u46;

            if v50 ~= nil then
                v50:Destroy();
            end;

            u46 = AnimationUtil:playAnimation(u44, GameAnimationUtil:getAssetId(AnimationType.NINJA_RUN), {
                looped = true
            });
            local v51 = u46;

            if v51 ~= nil then
                v51:AdjustSpeed(1);
            end;
        end;
    end));
    p43.animationMaid:GiveTask(Humanoid.StateChanged:Connect(function(p52, p53) -- Line: 223
    end));
end;

function u5.cleanUpAnimation(p54) -- Line: 225
    p54.animationMaid:DoCleaning();
end;

KnitClient.CreateController(u5.new());

return nil;