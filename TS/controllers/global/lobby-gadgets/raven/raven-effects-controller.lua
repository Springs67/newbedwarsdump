-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "RavenEffectsController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 37
    -- upvalues: KnitController (copy), u3 (copy), Workspace (copy)
    KnitController.constructor(p7, ...);
    p7.Name = "RavenEffectsController";
    p7.ravenEffectsFolder = u3("Folder", {
        Name = "RavenEffects",
        Parent = Workspace
    });
end;

function u5.KnitStart(u8) -- Line: 45
    -- upvalues: KnitController (copy), KnitClient2 (copy), AnimationType (copy), WatchCharacter (copy), Players (copy), ReplicatedStorage (copy), RuntimeLib (copy), default (copy), SoundManager (copy), GameSound (copy), GameQueryUtil (copy), WatchCollectionTag (copy), AnimationUtil (copy), GameAnimationUtil (copy), RandomUtil (copy), u3 (copy)
    KnitController.KnitStart(u8);
    KnitClient2.Controllers.PreloadController:runPreload({
        animations = { AnimationType.RAVEN_SPAWN, AnimationType.RAVEN_LOOP }
    });
    WatchCharacter(function(u9, u10, u11) -- Line: 51
        -- upvalues: Players (ref), ReplicatedStorage (ref), RuntimeLib (ref)
        if u9 == Players.LocalPlayer then
            return nil;
        end;

        local u12 = nil;
        local u13 = nil;

        local function handlePoison(p14) -- Line: 57
            -- upvalues: u13 (ref), u10 (copy), ReplicatedStorage (ref), u12 (ref), RuntimeLib (ref), u11 (copy)
            if p14 == 0 or (p14 ~= p14 or (not p14 or p14 < os.time())) then
                local v15 = u13;

                if v15 ~= nil then
                    v15 = v15.Parent;
                end;

                if v15 then
                    u13:Destroy();
                end;

                return nil;
            end;

            local Head = u10:FindFirstChild("Head");

            if not Head then
                return nil;
            end;

            local v16 = u13;

            if v16 ~= nil then
                v16 = v16.Parent;
            end;

            if not v16 then
                u13 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("PoisonParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
                u13.Parent = Head;
            end;

            if u12 then
                u12:cancel();
            end;

            u12 = RuntimeLib.Promise.delay(p14 - os.time()):andThen(function() -- Line: 84
                -- upvalues: u13 (ref)
                local v17 = u13;

                if v17 ~= nil then
                    v17:Destroy();
                end;
            end);
            u11:GiveTask(function() -- Line: 91
                -- upvalues: u12 (ref), u13 (ref)
                local v18 = u12;

                if v18 ~= nil then
                    v18:cancel();
                end;

                local v19 = u13;

                if v19 ~= nil then
                    v19:Destroy();
                end;
            end);
        end;

        handlePoison(u9:GetAttribute("RavenPoisonEndTime"));
        u11:GiveTask(u9:GetAttributeChangedSignal("RavenPoisonEndTime"):Connect(function() -- Line: 103
            -- upvalues: handlePoison (copy), u9 (copy)
            handlePoison(u9:GetAttribute("RavenPoisonEndTime"));
        end));
    end);
    default.Client:WaitFor("DetonateRaven"):andThen(function(p20) -- Line: 108
        -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), GameQueryUtil (ref), u8 (copy), RuntimeLib (ref)
        return p20:Connect(function(p21) -- Line: 109
            -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), GameQueryUtil (ref), u8 (ref), RuntimeLib (ref)
            local position = p21.position;
            SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                position = position
            });
            local u22 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Explosion"):Clone();
            GameQueryUtil:setQueryIgnored(u22, true);
            u22.Position = position;
            u22.Parent = u8.ravenEffectsFolder;

            for _, descendant in u22:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(descendant.Rate);
                end;
            end;

            RuntimeLib.Promise.delay(5):andThen(function() -- Line: 124
                -- upvalues: u22 (copy)
                u22:Destroy();
            end);
        end);
    end);
    WatchCollectionTag("raven", function(u23) -- Line: 131
        -- upvalues: SoundManager (ref), GameSound (ref), Players (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), RandomUtil (ref), u3 (ref)
        local Animator = u23:WaitForChild("AnimationController"):WaitForChild("Animator");
        local RAVEN_CAW = GameSound.RAVEN_CAW;
        local v24 = {};
        local v25;

        if u23:GetAttribute("PlayerUserId") == Players.LocalPlayer.UserId then
            v25 = nil;
        else
            v25 = u23:GetPrimaryPartCFrame().Position;
        end;

        v24.position = v25;
        SoundManager:playSound(RAVEN_CAW, v24);
        local v26 = (u23:GetAttribute("FromKillEffect") == false or u23:GetAttribute("FromKillEffect") == nil) and AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.RAVEN_SPAWN));

        if v26 then
            v26.Stopped:Wait();
        end;

        if Animator.Parent and u23.Parent then
            local v27 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.RAVEN_LOOP), {
                fadeInTime = 0.01
            });

            if v27 ~= nil then
                v27:GetMarkerReachedSignal("flap"):Connect(function() -- Line: 148
                    -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u23 (copy), Players (ref)
                    local v28 = RandomUtil.fromList(GameSound.RAVEN_WING_FLAP_1, GameSound.RAVEN_WING_FLAP_2, GameSound.RAVEN_WING_FLAP_3);
                    local v29 = {};
                    local v30;

                    if u23:GetAttribute("PlayerUserId") == Players.LocalPlayer.UserId then
                        v30 = nil;
                    else
                        v30 = u23:GetPivot().Position;
                    end;

                    v29.position = v30;
                    SoundManager:playSound(v28, v29);
                end);
            end;

            u23:PivotTo(u23:GetPivot() * CFrame.new(Vector3.new(-0.33429432, 7.173812, -2.5612288)));
            u3("BoolValue", {
                Name = "Flying",
                Value = true,
                Parent = u23
            });
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;