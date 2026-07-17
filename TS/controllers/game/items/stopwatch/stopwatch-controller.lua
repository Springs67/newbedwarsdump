-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "catrom", "src");
local InOutCubic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutCubic;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local StopwatchConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "stopwatch", "stopwatch-constants").StopwatchConstants;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "StopwatchController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 33
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "StopwatchController";
    p8.stopwatchAbilities = {};
end;

function u6.KnitStart(u9) -- Line: 42
    -- upvalues: KnitController (copy), RunService (copy), default2 (copy), Players (copy), SoundManager (copy), GameSound (copy), u3 (copy), Flamework (copy), CooldownId (copy), StopwatchConstants (copy), RuntimeLib (copy), CollectionService (copy), Workspace (copy), u2 (copy), default (copy), InOutCubic (copy)
    KnitController.KnitStart(u9);
    RunService.Heartbeat:Connect(function() -- Line: 44
        -- upvalues: u9 (copy)
        for i, v in u9.stopwatchAbilities do
            if i.PrimaryPart and time() > v.nextCaptureCheckpoint then
                local v10 = u9:getCurrentAnimationOfCharacter(i);

                if v10 ~= nil then
                    v.nextCaptureCheckpoint = time() + 1;
                    local checkpoints = v.checkpoints;
                    local v11 = {
                        cframe = i:GetPrimaryPartCFrame(),
                        animation = v10
                    };
                    table.insert(checkpoints, v11);
                end;
            end;
        end;
    end);
    default2.Client:OnEvent("StopwatchActivated", function(p12) -- Line: 61
        -- upvalues: u9 (copy), Players (ref), SoundManager (ref), GameSound (ref), u3 (ref), Flamework (ref), CooldownId (ref), StopwatchConstants (ref)
        local character = p12.character;
        local v13 = u9:createOriginMarker(p12.cframe);
        local v14 = Players:GetPlayerFromCharacter(character);
        local v15 = u9:getCurrentAnimationOfCharacter(character);

        if v15 == nil then
            return nil;
        end;

        local STOPWATCH_ACTIVATED = GameSound.STOPWATCH_ACTIVATED;
        local v16 = {};
        local PrimaryPart = character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        v16.position = PrimaryPart;
        v16.parent = character.PrimaryPart;
        v16.rollOffMaxDistance = 150;
        v16.volumeMultiplier = 1.5;
        local v17 = SoundManager:playSound(STOPWATCH_ACTIVATED, v16);
        local STOPWATCH_TICKING = GameSound.STOPWATCH_TICKING;
        local v18 = {};
        local PrimaryPart2 = character.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        v18.position = PrimaryPart2;
        v18.parent = character.PrimaryPart;
        v18.rollOffMaxDistance = 150;
        v18.looped = true;
        local v19 = SoundManager:playSound(STOPWATCH_TICKING, v18);

        if v19 and v17 then
            local v20 = u3.new();
            v20:GiveTask(v19);
            v20:GiveTask(u9:attachActiveEffects(character));

            if Players.LocalPlayer == v14 then
                v20:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.STOPWATCH));
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.STOPWATCH, StopwatchConstants.DURATION, {
                    cooldownBar = {
                        color = Color3.fromRGB(81, 134, 180)
                    }
                });
            end;

            u9.stopwatchAbilities[character] = {
                marker = v13,
                nextCaptureCheckpoint = time() + 1,
                activeMaid = v20,
                checkpoints = {
                    {
                        cframe = p12.cframe,
                        animation = v15
                    }
                }
            };
        end;
    end);
    default2.Client:OnEvent("StopwatchExpired", RuntimeLib.async(function(p21) -- Line: 120
        -- upvalues: u9 (copy), CollectionService (ref), Workspace (ref), Players (ref), SoundManager (ref), GameSound (ref), u2 (ref), default (ref), InOutCubic (ref)
        local character = p21.character;
        local v22 = u9:getCurrentAnimationOfCharacter(character);

        if v22 == nil then
            return nil;
        end;

        local v23 = u9.stopwatchAbilities[character];

        if v23 == nil then
            return nil;
        end;

        v23.activeMaid:DoCleaning();

        if p21.effect == false then
            u9:clearAbility(character);

            return nil;
        end;

        local checkpoints = v23.checkpoints;
        local v24 = {
            cframe = character:GetPrimaryPartCFrame(),
            animation = v22
        };
        table.insert(checkpoints, v24);
        local u25 = u9:cleanCheckpoints(v23.checkpoints);
        character.Archivable = true;
        local u26 = character:Clone();
        u26.HumanoidRootPart.Anchored = true;
        CollectionService:RemoveTag(u26, "entity");
        CollectionService:RemoveTag(u26, "inventory-entity");
        local v27 = u26:FindFirstChildOfClass("Shirt");

        if v27 ~= nil then
            v27:Destroy();
        end;

        local v28 = u26:FindFirstChildOfClass("Pants");

        if v28 ~= nil then
            v28:Destroy();
        end;

        for _, descendant in u26:GetDescendants() do
            if descendant:IsA("BasePart") and descendant ~= u26.PrimaryPart then
                descendant.Color = Color3.fromRGB(81, 134, 180);
                descendant.Material = Enum.Material.Neon;
                descendant.Transparency = 0.7;

                if descendant:IsA("MeshPart") then
                    descendant.TextureID = "";
                end;
            elseif descendant:IsA("Decal") and descendant.Name ~= "face" or (descendant:IsA("Texture") or (descendant:IsA("BillboardGui") or (descendant:IsA("Beam") or descendant:IsA("ParticleEmitter")))) then
                descendant:Destroy();
            elseif descendant:IsA("SpecialMesh") then
                descendant.TextureId = "";
            end;
        end;

        u26.Parent = Workspace;
        local u29 = nil;
        local u30 = {};
        local Animator = u26.Humanoid.Animator;
        character:SetAttribute("Transparency", 1);
        local v31 = p21.teleportBackTime - Workspace:GetServerTimeNow() + 0.1;

        if p21.player == Players.LocalPlayer then
            if u26.Humanoid == nil then
                return nil;
            end;

            Workspace.CurrentCamera.CameraSubject = u26.Humanoid;
            SoundManager:playSound(GameSound.STOPWATCH_REWINDING, {
                volumeMultiplier = 2,
                playbackSpeedMultiplier = 1 / v31
            });
        end;

        local u32 = #u25;

        local function _(p33) -- Line: 187
            return p33.cframe;
        end;

        local v34 = table.create(#u25);

        for i, v in u25 do
            local _ = i - 1;
            v34[i] = v.cframe;
        end;

        local u35 = u2.new(v34, 0.5, 0);
        local success, _ = pcall(function() -- Line: 198
            -- upvalues: u35 (copy)
            u35:SolvePosition(0.5);
        end);

        if success == true then
            default(v31, InOutCubic, function(p36) -- Line: 202
                -- upvalues: u35 (copy), u26 (copy), u29 (ref), u30 (copy), u25 (copy), u32 (ref), Animator (copy)
                local v37 = math.clamp(p36, 0, 1);
                local v38 = u35:SolvePosition(v37);
                local v39 = v38 + u35:SolveVelocity(v37) * Vector3.new(1, 0, 1);
                u26:PivotTo(CFrame.lookAt(v38, v39));

                if u29 then
                    local v40 = u30[u29];

                    if v40 ~= nil then
                        v40:AdjustSpeed(v37 * 2);
                    end;
                end;

                local v41 = u25[u32 - 1 + 1];

                if v41 == nil then
                    return nil;
                end;

                if (v38 - v41.cframe.Position).Magnitude < 3 then
                    u32 = u32 - 1;

                    if u29 == v41.animation then
                        return nil;
                    end;

                    if u29 then
                        local v42 = u30[u29];

                        if v42 ~= nil then
                            v42:Stop();
                        end;
                    end;

                    local v43;

                    if u30[v41.animation] == nil then
                        v43 = Animator:LoadAnimation(v41.animation);
                        u30[v41.animation] = v43;
                    else
                        v43 = u30[v41.animation];
                    end;

                    if v43 ~= nil then
                        v43:Play();
                    end;

                    u29 = v41.animation;
                end;
            end, 1, 0):Wait();
        end;

        u26:Destroy();
        character.Archivable = false;
        character:SetAttribute("Transparency", 0);

        if p21.player == Players.LocalPlayer then
            Workspace.CurrentCamera.CameraSubject = character.Humanoid;
        end;

        u9:clearAbility(character);
    end));
end;

function u6.clearAbility(p44, p45) -- Line: 267
    local v46 = p44.stopwatchAbilities[p45];

    if v46 == nil then
        error("cannot clear ability that doesn\'t exist");
    end;

    v46.marker:Destroy();
    v46.activeMaid:DoCleaning();
    p44.stopwatchAbilities[p45] = nil;
end;

function u6.cleanCheckpoints(p47, p48) -- Line: 280
    -- upvalues: u1 (copy)
    local v49 = u1.copy(p48);

    for i, v in pairs(p48) do
        local v50 = p48[i + 1];

        if v50 ~= nil and (v.cframe.Position - v50.cframe.Position).Magnitude < 0.25 then
            table.remove(v49, i + 1);
        end;
    end;

    return v49;
end;

function u6.getCurrentAnimationOfCharacter(p51, p52) -- Line: 295
    local v53 = p52.Humanoid.Animator:GetPlayingAnimationTracks();
    table.sort(v53, function(p54, p55) -- Line: 297
        return p54.WeightCurrent > p55.WeightCurrent;
    end);

    return v53[1].Animation;
end;

function u6.createOriginMarker(p56, p57) -- Line: 305
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local v58 = ReplicatedStorage.Assets.Effects.StopwatchEffects.StopwatchMarker:Clone();
    v58.Position = (p57 * CFrame.new(0, -2, 0)).Position;
    v58.Parent = Workspace;

    return v58;
end;

function u6.attachActiveEffects(p59, p60) -- Line: 313
    -- upvalues: u4 (copy), ReplicatedStorage (copy), StopwatchConstants (copy), u3 (copy)
    local v61 = u4("Attachment", {
        Position = Vector3.new(0, -1.65, 0),
        Parent = p60.HumanoidRootPart
    });
    local v62 = u4("Attachment", {
        Position = Vector3.new(0, 1.1, 0),
        Parent = p60.HumanoidRootPart
    });
    local v63 = ReplicatedStorage.Assets.Effects.StopwatchEffects.Trail:Clone();
    v63.Lifetime = StopwatchConstants.DURATION;
    v63.Parent = p60.HumanoidRootPart;
    v63.Attachment0 = v61;
    v63.Attachment1 = v62;
    local v64 = ReplicatedStorage.Assets.Effects.StopwatchEffects.TrailParticles:Clone();
    v64.Parent = p60.HumanoidRootPart;
    local v65 = u3.new();
    v65:GiveTask(v61);
    v65:GiveTask(v62);
    v65:GiveTask(v63);
    v65:GiveTask(v64);

    return v65;
end;

KnitClient.CreateController(u6.new());

return nil;