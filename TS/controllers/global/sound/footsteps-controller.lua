-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local StatusModifier = v1.StatusModifier;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds");
local BlockFootstepSound = v5.BlockFootstepSound;
local DefaultFootstepSound = v5.DefaultFootstepSound;
local FootstepSounds = v5.FootstepSounds;
local TerrainFootstepSounds = v5.TerrainFootstepSounds;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "FootstepsController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 35
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(u8) -- Line: 39
    -- upvalues: KnitController (copy), u3 (copy), Workspace (copy), StatusModifier (copy), MathExtras (copy)
    KnitController.constructor(u8);
    u8.Name = "FootstepsController";
    u8.footstepSoundFolder = u3("Folder", {
        Name = "FootstepSounds",
        Parent = Workspace
    });
    u8.localFoostepVolumeMultiplier = 1;
    u8.mutedPlayers = {};
    u8.particleAttachment = u3("Attachment", {
        Parent = Workspace.Terrain
    });
    u8.footstepModifier = StatusModifier.new(function(p9) -- Line: 51
        -- upvalues: u8 (copy), MathExtras (ref)
        u8.footstepSoundConfig = nil;
        u8.localFootstepFrequency = nil;
        local v10 = 0;

        for _, v in p9 do
            if v.localVolumeMultiplier ~= nil and v.localVolumeMultiplier ~= 0 then
                v10 = v10 + MathExtras:getPercentFromMultiplier(v.localVolumeMultiplier);
            end;

            if v.soundConfig then
                u8.footstepSoundConfig = v.soundConfig;
            end;

            if v.localFootstepFrequency ~= nil then
                u8.localFootstepFrequency = v.localFootstepFrequency;
            end;

            if v.particles ~= nil then
                u8.particles = v.particles;
                u8.particles.Parent = u8.particleAttachment;
                u8.particles.Enabled = false;
            end;
        end;

        u8.localFoostepVolumeMultiplier = MathExtras:getMultiplierFromPercent(v10);
    end);
end;

function u6.KnitStart(u11) -- Line: 76
    -- upvalues: Players (copy), ReplicatedStorage (copy)
    Players.PlayerAdded:Connect(function(p12) -- Line: 77
        -- upvalues: u11 (copy)
        u11:hookPlayer(p12);
    end);

    local function _(p13) -- Line: 81
        -- upvalues: u11 (copy)
        return u11:hookPlayer(p13);
    end;

    for i, v in Players:GetPlayers() do
        local _ = i - 1;
        u11:hookPlayer(v);
    end;

    Players.PlayerRemoving:Connect(function(p14) -- Line: 87
        -- upvalues: u11 (copy)
        u11:unmuteFootsteps(p14);
    end);
    u11.particles = ReplicatedStorage.Assets.Effects.FootstepParticles:Clone();
    u11.particles.Parent = u11.particleAttachment;
    u11.particles.Enabled = false;
end;

function u6.hookPlayer(u15, u16) -- Line: 94
    -- upvalues: RuntimeLib (copy)
    local Character = u16.Character;
    RuntimeLib.Promise.defer(function() -- Line: 96
        -- upvalues: Character (copy), u15 (copy), u16 (copy)
        if Character then
            u15:hookCharacter(u16, Character);
        end;
    end);
    u16.CharacterAdded:Connect(function(p17) -- Line: 101
        -- upvalues: u15 (copy), u16 (copy)
        u15:hookCharacter(u16, p17);
    end);
end;

function u6.hookCharacter(u18, u19, u20, u21) -- Line: 105
    -- upvalues: u2 (copy), Players (copy), Workspace (copy), RandomUtil (copy), getItemMeta (copy), DefaultFootstepSound (copy), FootstepSounds (copy), TerrainFootstepSounds (copy), BlockFootstepSound (copy), SoundManager (copy)
    local v22 = u2.new();
    local u23 = true;
    local Humanoid = u20:WaitForChild("Humanoid");
    local HumanoidRootPart = u20:WaitForChild("HumanoidRootPart");
    local u24;

    if u19 then
        u24 = u19 == Players.LocalPlayer;
    else
        u24 = false;
    end;

    u18:muteHumanoidSound(HumanoidRootPart, "Running");
    u18:muteHumanoidSound(HumanoidRootPart, "Landing");
    u18:muteHumanoidSound(HumanoidRootPart, "Jumping");
    u18:muteHumanoidSound(HumanoidRootPart, "Landing");
    v22:GiveTask(function() -- Line: 117
        -- upvalues: u18 (copy), HumanoidRootPart (copy), u23 (ref)
        u18:unmuteHumanoidSound(HumanoidRootPart, "Running");
        u18:unmuteHumanoidSound(HumanoidRootPart, "Landing");
        u18:unmuteHumanoidSound(HumanoidRootPart, "Jumping");
        u18:unmuteHumanoidSound(HumanoidRootPart, "Landing");
        u23 = false;
    end);
    local v25 = u20:GetAttribute("NoFootstepSounds");

    if v25 == nil then
        v25 = false;
    end;

    local u26 = v25;
    u20:GetAttributeChangedSignal("NoFootstepSounds"):Connect(function() -- Line: 129
        -- upvalues: u20 (copy), u26 (ref)
        local v27 = u20:GetAttribute("NoFootstepSounds");

        if v27 == nil then
            v27 = false;
        end;

        u26 = v27;
    end);
    local v28 = u20:GetAttribute("EnableFootstepParticles");

    if v28 == nil then
        v28 = false;
    end;

    local u29 = v28;
    u20:GetAttributeChangedSignal("EnableFootstepParticles"):Connect(function() -- Line: 141
        -- upvalues: u20 (copy), u29 (ref)
        local v30 = u20:GetAttribute("EnableFootstepParticles");

        if v30 == nil then
            v30 = false;
        end;

        u29 = v30;
    end);
    local u31 = os.clock();
    task.spawn(function() -- Line: 149
        -- upvalues: u23 (ref), u20 (copy), Workspace (ref), HumanoidRootPart (copy), u26 (ref), Humanoid (copy), u18 (copy), u19 (copy), Players (ref), u31 (ref), u21 (copy), RandomUtil (ref), getItemMeta (ref), DefaultFootstepSound (ref), FootstepSounds (ref), TerrainFootstepSounds (ref), BlockFootstepSound (ref), u24 (copy), u29 (ref), SoundManager (ref)
        while true do
            local v32 = u23;

            if v32 then
                v32 = task.wait(0.1);

                if v32 ~= 0 and (v32 == v32 and v32) then
                    v32 = u20.Parent ~= nil;
                end;
            end;

            if v32 == 0 or (v32 ~= v32 or not v32) then
                return;
            end;

            if Workspace.CurrentCamera then
                local CurrentCamera = Workspace.CurrentCamera;

                if CurrentCamera ~= nil then
                    CurrentCamera = (CurrentCamera.CFrame.Position - HumanoidRootPart.Position).Magnitude;
                end;

                if CurrentCamera <= 80 and not u26 then
                    local v33 = Vector3.new(HumanoidRootPart.AssemblyLinearVelocity.X, 0, HumanoidRootPart.AssemblyLinearVelocity.Z);
                    local v34 = HumanoidRootPart.Anchored and Vector3.new(0, 0, 0) or v33;
                    local v35 = "standing";
                    local v36 = Humanoid:GetState();

                    if v36 == Enum.HumanoidStateType.Running or v36 == Enum.HumanoidStateType.RunningNoPhysics then
                        v35 = v34.Magnitude > 17 and "running" or (v34.Magnitude > 1 and "walking" or v35);
                    end;

                    if v35 ~= "standing" then
                        local v37 = v35 == "running" and 0.2 or 0.3;

                        if u18.localFootstepFrequency ~= nil and u19 == Players.LocalPlayer then
                            v37 = 1 / (u18.localFootstepFrequency * (math.ceil(v34.Magnitude * 4) / 4));
                        end;

                        if os.clock() - u31 >= v37 then
                            debug.profilebegin("footstep");
                            local v38 = u18:findPlatform(HumanoidRootPart);
                            local v39 = nil;
                            local v40 = u21 or u18.footstepSoundConfig;
                            local v41;

                            if v40 == nil then
                                v41 = v40;
                            else
                                v41 = v40.volume;
                            end;

                            local v42 = v41 == nil and 0.13 or v41;

                            if v40 and (v40.walk or v40.run) then
                                if v35 == "walking" and v40.walk then
                                    v39 = RandomUtil.fromList(unpack(v40.walk));
                                elseif v35 == "running" and v40.run then
                                    v39 = RandomUtil.fromList(unpack(v40.run));
                                end;
                            elseif v38.block then
                                local footstepSound = getItemMeta(v38.block.Name).footstepSound;

                                if footstepSound == nil then
                                    footstepSound = DefaultFootstepSound;
                                end;

                                local v43 = FootstepSounds[footstepSound];

                                if v43.volume ~= nil then
                                    v42 = v43.volume;
                                end;

                                if v35 == "walking" and v43.walk then
                                    v39 = RandomUtil.fromList(unpack(v43.walk));
                                elseif v35 == "running" and v43.run then
                                    v39 = RandomUtil.fromList(unpack(v43.run));
                                end;
                            elseif v38.terrainMaterial then
                                local v44 = TerrainFootstepSounds[v38.terrainMaterial];

                                if v44 == nil then
                                    v44 = BlockFootstepSound.WOOD;
                                end;

                                local v45 = FootstepSounds[v44];

                                if v45.volume ~= nil then
                                    v42 = v45.volume;
                                end;

                                if v35 == "walking" and v45.walk then
                                    v39 = RandomUtil.fromList(unpack(v45.walk));
                                elseif v35 == "running" and v45.run then
                                    v39 = RandomUtil.fromList(unpack(v45.run));
                                end;
                            end;

                            if u24 then
                                v42 = v42 * u18.localFoostepVolumeMultiplier;
                            end;

                            local v46;

                            if v39 == "" or not v39 then
                                v46 = v39;
                            else
                                v46 = v38.raycastResult;
                            end;

                            if v46 ~= "" and v46 then
                                u31 = os.clock();
                                local v47 = 0.85 + math.random() * 0.2;
                                local particles = u18.particles;

                                if particles then
                                    local v48 = u20:GetAttribute("Transparency");
                                    particles = (v48 == nil and 0 or v48) ~= 0 or u29;

                                    if particles then
                                        local v49 = u20:GetAttribute("DisableInvisibilityFootstepParticles");

                                        if v49 == 0 or v49 ~= v49 then
                                            v49 = false;
                                        elseif v49 == "" then
                                            v49 = false;
                                        end;

                                        particles = not v49;
                                    end;
                                end;

                                if particles then
                                    u18.particleAttachment.CFrame = CFrame.new(v38.raycastResult.Position + Vector3.new(0, 0.1, 0));
                                    u18.particles:Emit(1);
                                end;

                                local v50 = not u19;

                                if not v50 then
                                    v50 = not (u18.mutedPlayers[u19] ~= nil);
                                end;

                                if v50 then
                                    if u24 then
                                        SoundManager:playSound(v39, {
                                            playbackSpeedMultiplier = v47,
                                            volumeMultiplier = v42 / 0.5,
                                            parent = u18.footstepSoundFolder
                                        });
                                        local v51;

                                        if v40 == nil then
                                            v51 = v40;
                                        else
                                            v51 = v40.overlay;
                                        end;

                                        if v51 then
                                            SoundManager:playSound(RandomUtil.fromList(unpack(v40.overlay)), {
                                                playbackSpeedMultiplier = 0.85 + math.random() * 0.2,
                                                volumeMultiplier = v42 / 0.5,
                                                parent = u18.footstepSoundFolder
                                            });
                                        end;
                                    else
                                        local v52 = {
                                            playbackSpeedMultiplier = v47,
                                            volumeMultiplier = v42 == nil and 0.75 or v42
                                        };
                                        local v53;

                                        if v40 == nil then
                                            v53 = v40;
                                        else
                                            v53 = v40.rollOffMaxDistance;
                                        end;

                                        v52.rollOffMaxDistance = v53 == nil and 50 or v53;
                                        v52.position = v38.raycastResult.Position;
                                        SoundManager:playSound(v39, v52);
                                        local v54;

                                        if v40 == nil then
                                            v54 = v40;
                                        else
                                            v54 = v40.overlay;
                                        end;

                                        if v54 then
                                            local v55 = RandomUtil.fromList(unpack(v40.overlay));
                                            local v56 = {
                                                playbackSpeedMultiplier = 0.85 + math.random() * 0.2,
                                                volumeMultiplier = v42 * 0.75 / 0.5
                                            };

                                            if v40 ~= nil then
                                                v40 = v40.rollOffMaxDistance;
                                            end;

                                            v56.rollOffMaxDistance = v40 == nil and 50 or v40;
                                            v56.position = v38.raycastResult.Position;
                                            SoundManager:playSound(v55, v56);
                                        end;
                                    end;
                                end;
                            end;

                            debug.profileend();
                        end;
                    end;
                end;
            end;
        end;
    end);

    return v22;
end;

function u6.findPlatform(p57, p58, p59) -- Line: 367
    -- upvalues: Workspace (copy), BlockEngine (copy)
    local v60 = p59 == nil and {} or p59;
    local v61 = RaycastParams.new();
    v61.CollisionGroup = "Players";
    v61.FilterDescendantsInstances = v60;
    v61.FilterType = Enum.RaycastFilterType.Exclude;
    local v62 = Workspace:Raycast(p58.Position, Vector3.new(0, -9, 0), v61);

    if v62 then
        if v62.Instance:IsA("Terrain") then
            return {
                block = nil,
                raycastResult = v62,
                terrainMaterial = v62.Material
            };
        end;

        if v62.Instance:IsA("BasePart") then
            if v62.Instance.CanCollide then
                local v63 = BlockEngine:getBlockInstanceFromChild(v62.Instance);

                return v63 and {
                    terrainMaterial = nil,
                    raycastResult = v62,
                    block = v63
                } or {
                    block = nil,
                    raycastResult = v62,
                    terrainMaterial = v62.Instance.Material
                };
            end;

            table.insert(v60, v62.Instance);

            return p57:findPlatform(p58, v60);
        end;
    end;

    return {
        block = nil,
        terrainMaterial = nil,
        raycastResult = v62
    };
end;

function u6.muteHumanoidSound(p64, p65, p66) -- Line: 412
    local v67 = p65:FindFirstChild(p66);

    if v67 then
        v67.Volume = 0;
    end;
end;

function u6.unmuteHumanoidSound(p68, p69, p70) -- Line: 418
    local v71 = p69:FindFirstChild(p70);

    if v71 then
        v71.Volume = 1;
    end;
end;

function u6.muteFootsteps(p72, p73) -- Line: 424
    p72.mutedPlayers[p73] = true;
end;

function u6.unmuteFootsteps(p74, p75) -- Line: 429
    p74.mutedPlayers[p75] = nil;
end;

return {
    FootstepsController = KnitClient.CreateController(u6.new())
};