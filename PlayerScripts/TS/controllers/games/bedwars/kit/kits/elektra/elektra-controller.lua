-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = RunService:IsStudio() and false;
local u6 = u3("Folder", {
    Name = "ElektraEffectFolder",
    Parent = Workspace
});
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "ElektraController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 49
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 53
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), BedwarsImageId (copy), GameSound (copy), AnimationType (copy)
    BaseKitController.constructor(p9, BedwarsKit.ELEKTRA, {
        imageIds = { BedwarsImageId.ELECTRIC_DASH_ICON },
        sounds = {
            GameSound.ELECTRIC_DASH,
            GameSound.ELECTRIC_DASH_DAMAGE,
            GameSound.ELECTRIC_DASH_READY,
            GameSound.ELECTRIC_DASH_FOOTSTEP_1,
            GameSound.ELECTRIC_DASH_FOOTSTEP_2,
            GameSound.ELECTRIC_DASH_FOOTSTEP_3,
            GameSound.ELECTRIC_DASH_FOOTSTEP_4
        },
        animations = { AnimationType.ELEKTRA_DASH }
    });
    p9.Name = "ElektraController";
    p9.crownMap = {};
    p9.hairMap = {};
    p9.lastDash = -1;
    p9.dashReadyTime = -1;
end;

function u7.onKitLocalActivated(u10, p11) -- Line: 65
    -- upvalues: KnitClient2 (copy), GameSound (copy), ClientSyncEvents (copy), AbilityId (copy), EntityUtil (copy), Players (copy), Workspace (copy), SyncEventPriority (copy), BalanceFile (copy), SoundManager (copy), default (copy)
    KnitClient2.Controllers.FootstepsController.footstepModifier:addModifier({
        soundConfig = {
            overlay = {
                GameSound.ELECTRIC_DASH_FOOTSTEP_1,
                GameSound.ELECTRIC_DASH_FOOTSTEP_2,
                GameSound.ELECTRIC_DASH_FOOTSTEP_3,
                GameSound.ELECTRIC_DASH_FOOTSTEP_4
            }
        }
    });
    p11:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p12) -- Line: 71
        -- upvalues: AbilityId (ref), EntityUtil (ref)
        if p12.ability ~= AbilityId.ELECTRIC_DASH then
            return nil;
        end;

        local v13 = EntityUtil:getEntity(p12.userCharacter);

        if v13 ~= nil then
            v13 = v13:isAlive();
        end;

        if not v13 then
            p12:setCancelled(true);
        end;
    end));
    p11:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p14) -- Line: 84
        -- upvalues: AbilityId (ref), Players (ref), Workspace (ref), u10 (copy)
        if p14.ability ~= AbilityId.ELECTRIC_DASH then
            return nil;
        end;

        if not Players:GetPlayerFromCharacter(p14.userCharacter) then
            return nil;
        end;

        if Workspace:GetServerTimeNow() < u10.dashReadyTime then
            p14:setCancelled(true);

            return nil;
        end;
    end));
    p11:GiveTask(ClientSyncEvents.AbilityUsed:setPriority(SyncEventPriority.LOWEST):connect(function(u15) -- Line: 97
        -- upvalues: AbilityId (ref), Players (ref), EntityUtil (ref), Workspace (ref), ClientSyncEvents (ref), BalanceFile (ref), u10 (copy), SoundManager (ref), GameSound (ref), default (ref)
        if u15:isCancelled() then
            return nil;
        end;

        if u15.ability ~= AbilityId.ELECTRIC_DASH then
            return nil;
        end;

        local u16 = Players:GetPlayerFromCharacter(u15.userCharacter);

        if not u16 then
            return nil;
        end;

        if u16 ~= Players.LocalPlayer then
            return nil;
        end;

        local u17 = EntityUtil:getEntity(u15.userCharacter);

        if not u17 then
            return nil;
        end;

        local u18 = u17:getInstance():GetPivot();

        if not u15.userCharacter.PrimaryPart then
            return nil;
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if not CurrentCamera then
            return nil;
        end;

        local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(BalanceFile.ELEKTRA.ELECTRIC_DASH_COOLDOWN).cooldown;

        if Workspace:GetServerTimeNow() - u10.lastDash < 1 then
            u10.dashReadyTime = Workspace:GetServerTimeNow() + 1;
        else
            u10.dashReadyTime = Workspace:GetServerTimeNow() + BalanceFile.ELEKTRA.ELECTRIC_DASH_DURATION + cooldown;
        end;

        u10.lastDash = Workspace:GetServerTimeNow();
        local LookVector = CurrentCamera.CFrame.LookVector;
        local Unit = Vector3.new(LookVector.X, 0, LookVector.Z).Unit;
        local v19 = CFrame.lookAt(Vector3.new(0, 0, 0), Unit);
        local v20 = u10:getDashInfo(u17:getInstance(), v19);
        local u21 = CFrame.new(u18.Position + v20) * (v19 * CFrame.Angles(0, 6.283185307179586, 0));
        task.spawn(function() -- Line: 141
            -- upvalues: u10 (ref), u16 (copy), u18 (copy), u21 (copy), u15 (copy), BalanceFile (ref), SoundManager (ref), GameSound (ref), default (ref), u17 (copy), CurrentCamera (copy)
            u10:createDashEndpointVFX(u16, u18, u21);
            local u22 = u10:addVFXToCharacter(u15.userCharacter);
            task.delay(BalanceFile.ELEKTRA.ELECTRIC_DASH_DURATION, function() -- Line: 144
                -- upvalues: u22 (copy)
                local function _(p23) -- Line: 145
                    return p23:Destroy();
                end;

                for i, v in u22 do
                    local _ = i - 1;
                    v:Destroy();
                end;
            end);
            SoundManager:playSound(GameSound.ELECTRIC_DASH, {
                playbackSpeedMultiplier = 1.27
            });
            default.Client:Get("ElectricDash"):CallServer({
                electricDasher = u17:getInstance(),
                cameraCFrame = CurrentCamera.CFrame,
                startCFrame = u18,
                destCFrame = u21
            });
        end);
    end));
end;

function u7.onInnateAbilityEnabled(p24, p25, p26) -- Line: 164
end;

function u7.onKitLocalDeactivated(p27) -- Line: 166
end;

function u7.onKitReplicationActivated(u28, u29) -- Line: 168
    -- upvalues: WatchCharacter (copy), KnitClient (copy), BedwarsKit (copy), CollectionService (copy), ClientSyncEvents (copy), AbilityId (copy), AbilityState (copy), SoundManager (copy), GameSound (copy), Players (copy), default (copy), BalanceFile (copy)
    u29:GiveTask(WatchCharacter(function(u30, u31) -- Line: 169
        -- upvalues: KnitClient (ref), BedwarsKit (ref), CollectionService (ref), u28 (copy)
        if KnitClient.Controllers.KitController:isUsingKit(u30, BedwarsKit.ELEKTRA) then
            task.spawn(function() -- Line: 171
                -- upvalues: u31 (copy), CollectionService (ref), u28 (ref), u30 (copy)
                local function _(p32) -- Line: 173
                    -- upvalues: CollectionService (ref)
                    return CollectionService:AddTag(p32, "FirstPersonHidden");
                end;

                for i, v in { u31:WaitForChild("3DClothing"):WaitForChild("LeftShoe"):WaitForChild("ElectricDashEffect"), u31:WaitForChild("3DClothing"):WaitForChild("RightShoe"):WaitForChild("ElectricDashEffect") } do
                    local _ = i - 1;
                    CollectionService:AddTag(v, "FirstPersonHidden");
                end;

                local v33 = { u31:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("crown1"), u31:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("crown") };
                local hair = u31:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("hair");
                u28.crownMap[u30.UserId] = v33;
                u28.hairMap[u30.UserId] = hair;
            end);
        end;
    end));
    u29:GiveTask(ClientSyncEvents.AbilityEnabled:connect(function(p34) -- Line: 190
        -- upvalues: AbilityId (ref), AbilityState (ref), SoundManager (ref), GameSound (ref), u28 (copy), Players (ref)
        if p34.ability.abilityId ~= AbilityId.ELECTRIC_DASH then
            return nil;
        end;

        p34.ability.stateChangeSignal:Connect(function(p35) -- Line: 194
            -- upvalues: AbilityState (ref), SoundManager (ref), GameSound (ref), u28 (ref), Players (ref)
            if p35 == AbilityState.PARTIALLY_CHARGED or p35 == AbilityState.READY then
                SoundManager:playSound(GameSound.ELECTRIC_DASH_READY, nil);
                local v36 = u28.crownMap[Players.LocalPlayer.UserId];

                if v36 then
                    local function _(p37) -- Line: 201
                        p37.Color = Color3.fromRGB(106, 132, 172);
                    end;

                    for i, v in v36 do
                        local _ = i - 1;
                        v.Color = Color3.fromRGB(106, 132, 172);
                    end;
                end;

                local v38 = u28.hairMap[Players.LocalPlayer.UserId];

                if v38 then
                    v38.Material = Enum.Material.Neon;
                end;
            else
                local v39 = u28.crownMap[Players.LocalPlayer.UserId];

                if v39 then
                    local function _(p40) -- Line: 219
                        p40.Color = Color3.fromRGB(25, 33, 38);
                    end;

                    for i, v in v39 do
                        local _ = i - 1;
                        v.Color = Color3.fromRGB(25, 33, 38);
                    end;
                end;

                local v41 = u28.hairMap[Players.LocalPlayer.UserId];

                if v41 then
                    v41.Material = Enum.Material.SmoothPlastic;
                end;
            end;
        end);
    end));
    default.Client:OnEvent("ValidatedElectricDash", function(p42) -- Line: 236
        -- upvalues: u28 (copy), BalanceFile (ref), SoundManager (ref), GameSound (ref)
        u28:createDashEndpointVFX(p42.player, p42.startCFrame, p42.destCFrame);

        if p42.player.Character then
            local u43 = u28:addVFXToCharacter(p42.player.Character);
            task.delay(BalanceFile.ELEKTRA.ELECTRIC_DASH_DURATION, function() -- Line: 240
                -- upvalues: u43 (copy)
                local function _(p44) -- Line: 241
                    return p44:Destroy();
                end;

                for i, v in u43 do
                    local _ = i - 1;
                    v:Destroy();
                end;
            end);
        end;

        SoundManager:playSound(GameSound.ELECTRIC_DASH, {
            rollOffMaxDistance = 45,
            rollOffMinDistance = 20,
            playbackSpeedMultiplier = 1.27,
            position = p42.destCFrame.Position
        });
    end):andThen(function(p45) -- Line: 255
        -- upvalues: u29 (copy)
        u29:GiveTask(p45);
    end);
end;

function u7.onKitReplicationDeactivated(p46) -- Line: 259
end;

function u7.onAbilityUsed(p47, p48, p49) -- Line: 261
end;

function u7.getDashInfo(p50, p51, p52) -- Line: 263
    -- upvalues: BalanceFile (copy), BLOCK_SIZE (copy)
    local PrimaryPart = p51.PrimaryPart;
    local v53 = PrimaryPart.Size + Vector3.new(1, 2.5, 1);
    local v54 = PrimaryPart.CFrame + Vector3.new(0, -0.75, 0);
    local ELECTRIC_DASH_DEPTH_GOAL = BalanceFile.ELEKTRA.ELECTRIC_DASH_DEPTH_GOAL;
    local ELECTRIC_DASH_HEIGHT_LIMIT = BalanceFile.ELEKTRA.ELECTRIC_DASH_HEIGHT_LIMIT;
    local v55 = p50:performHorizontalRaycast(v54, p52, ELECTRIC_DASH_DEPTH_GOAL, v53);
    local v56 = 0;
    local v57 = 0;

    while true do
        if math.ceil(v55) >= ELECTRIC_DASH_DEPTH_GOAL or (math.ceil(v56) >= ELECTRIC_DASH_HEIGHT_LIMIT or v57 >= 6) then
            local v58 = math.min(-v55 + 1, 0);

            return p52 * Vector3.new(0, v56, v58) + v54.Position - v54.Position;
        end;

        v57 = v57 + 1;
        local v59 = false;
        local v60 = 0;
        local v61 = 0;
        local v62 = 0;

        while true do
            if true then
                if v59 then
                    v60 = v60 + 1;
                else
                    v59 = true;
                end;
            end;

            if v60 >= 3 then
                break;
            end;

            local v63;

            if p50:performVerticalRaycast(v54, v53, v60) then
                v63 = p50:performHorizontalRaycast(v54 + Vector3.new(0, v60 * BLOCK_SIZE, 0), p52, ELECTRIC_DASH_DEPTH_GOAL, v53);

                if v62 < math.ceil(v63) then
                    v61 = v60 * BLOCK_SIZE;
                else
                    v63 = v62;
                end;
            else
                v63 = v62;
            end;

            v62 = v63;
        end;

        if v55 < v62 then
            v56 = v56 + v61;
        else
            v62 = v55;
        end;

        v55 = v62;
    end;
end;

function u7.performHorizontalRaycast(p64, p65, p66, p67, p68) -- Line: 321
    -- upvalues: u3 (copy), u5 (copy), Workspace (copy)
    local Z = p68.Z;
    local Y = p68.Y;
    local v69 = false;
    local v70 = 0;
    local v71 = 0;

    while true do
        if v69 then
            v70 = v70 + 1;
        else
            v69 = true;
        end;

        if v70 >= 10 then
            return v71;
        end;

        local v72 = (v71 + p67) / 2;
        local v73 = Vector3.new(Z * 0.9, Y * 0.9, v72);
        local v74 = Vector3.new(0, 0, -v72 / 2);
        local v75 = u3("Part", {
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            Name = "HorizontalDashDirection",
            Size = v73,
            CFrame = CFrame.new(p66 * v74 + p65.Position) * p66,
            Transparency = u5 and 0.5 or 1,
            Parent = Workspace
        });
        local v76 = OverlapParams.new();
        v76.CollisionGroup = "Players";
        v76.MaxParts = 0;

        local function _(p77) -- Line: 360
            local v78 = p77:IsA("BasePart") and p77.CanCollide;

            return v78;
        end;

        local v79 = 0;
        local v80 = {};

        for i, v in Workspace:GetPartsInPart(v75, v76) do
            local _ = i - 1;
            local v81 = v:IsA("BasePart") and v.CanCollide;

            if v81 == true then
                v79 = v79 + 1;
                v80[v79] = v;
            end;
        end;

        v75:Destroy();

        if #v80 == 0 then
            v71 = v72;
            v72 = p67;
        end;

        p67 = v72;
    end;
end;

function u7.performVerticalRaycast(p82, p83, p84, p85) -- Line: 384
    -- upvalues: BLOCK_SIZE (copy), u3 (copy), u5 (copy), Theme (copy), Workspace (copy)
    local v86 = p83 + Vector3.new(0, p85 * BLOCK_SIZE, 0);
    local v87 = {
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        Name = "VerticalDashDirection",
        Size = Vector3.new(p84.Z * 0.9, p84.Y * 0.9, p84.Z * 0.9),
        CFrame = v86,
        Transparency = u5 and 0.5 or 1
    };
    local v88;

    if u5 then
        v88 = Theme.mcRed;
    else
        v88 = nil;
    end;

    v87.Color = v88;
    v87.Parent = Workspace;
    local v89 = u3("Part", v87);
    local v90 = OverlapParams.new();
    v90.CollisionGroup = "Players";

    local function _(p91) -- Line: 403
        local v92 = p91:IsA("BasePart") and p91.CanCollide;

        return v92;
    end;

    local v93 = 0;
    local v94 = {};

    for i, v in Workspace:GetPartsInPart(v89, v90) do
        local _ = i - 1;
        local v95 = v:IsA("BasePart") and v.CanCollide;

        if v95 == true then
            v93 = v93 + 1;
            v94[v93] = v;
        end;
    end;

    v89:Destroy();

    return #v94 == 0;
end;

function u7.createDashEndpointVFX(p96, p97, u98, u99) -- Line: 424
    -- upvalues: EntityUtil (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), BalanceFile (copy)
    local u100 = EntityUtil:getEntity(p97);

    if not u100 then
        return nil;
    end;

    task.spawn(function() -- Line: 430
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u98 (copy), EffectUtil (ref), u100 (copy)
        local v101 = ReplicatedStorage.Assets.Effects.ElectricDashStart:Clone();
        v101.Parent = Workspace;
        v101.CFrame = u98;
        local v102 = {};
        local v103 = v101:GetDescendants();
        table.move(v103, 1, #v103, #v102 + 1, v102);
        EffectUtil:playEffects(v102, u100:getInstance(), {
            destroyAfterSec = 2
        });
        task.wait(2);
        v101:Destroy();
    end);
    task.delay(BalanceFile.ELEKTRA.ELECTRIC_DASH_DURATION * 0.75, function() -- Line: 446
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u99 (copy), EffectUtil (ref), u100 (copy)
        local v104 = ReplicatedStorage.Assets.Effects.ElectricDashBurst:Clone();
        v104.Parent = Workspace;
        v104.CFrame = u99;
        local v105 = {};
        local v106 = v104:GetDescendants();
        table.move(v106, 1, #v106, #v105 + 1, v105);
        EffectUtil:playEffects(v105, u100:getInstance(), {
            destroyAfterSec = 2
        });
        task.wait(2);
        v104:Destroy();
    end);
end;

function u7.addVFXToCharacter(p107, u108) -- Line: 462
    -- upvalues: ReplicatedStorage (copy), u6 (copy)
    local u109 = {};
    task.spawn(function() -- Line: 464
        -- upvalues: ReplicatedStorage (ref), u108 (copy), u6 (ref), u109 (copy)
        local ElectricDashTrail = ReplicatedStorage.Assets.Effects.ElectricDashTrail;
        local ElectricFillerTrail = ReplicatedStorage.Assets.Effects.ElectricFillerTrail;

        if u108:WaitForChild("LeftLowerArm") then
            local v110 = ElectricDashTrail:Clone();
            local v111 = ElectricFillerTrail:Clone();
            v110.Parent = u6;
            v110.Attachment0 = u108.LeftLowerArm.LeftElbowRigAttachment;
            v110.Attachment1 = u108.LeftLowerArm.LeftWristRigAttachment;
            v111.Parent = u6;
            v111.Attachment0 = u108.LeftLowerArm.LeftElbowRigAttachment;
            v111.Attachment1 = u108.LeftLowerArm.LeftWristRigAttachment;
            table.insert(u109, v110);
            table.insert(u109, v111);
        end;

        if u108:WaitForChild("RightLowerArm") then
            local v112 = ElectricDashTrail:Clone();
            local v113 = ElectricFillerTrail:Clone();
            v112.Parent = u6;
            v112.Attachment0 = u108.RightLowerArm.RightElbowRigAttachment;
            v112.Attachment1 = u108.RightLowerArm.RightWristRigAttachment;
            v113.Parent = u6;
            v113.Attachment0 = u108.RightLowerArm.RightElbowRigAttachment;
            v113.Attachment1 = u108.RightLowerArm.RightWristRigAttachment;
            table.insert(u109, v112);
            table.insert(u109, v113);
        end;

        if u108:WaitForChild("LeftLowerLeg") then
            local v114 = ElectricDashTrail:Clone();
            local v115 = ElectricFillerTrail:Clone();
            v114.Parent = u6;
            v114.Attachment0 = u108.LeftLowerLeg.LeftKneeRigAttachment;
            v114.Attachment1 = u108.LeftLowerLeg.LeftAnkleRigAttachment;
            v115.Parent = u6;
            v115.Attachment0 = u108.LeftLowerLeg.LeftKneeRigAttachment;
            v115.Attachment1 = u108.LeftLowerLeg.LeftAnkleRigAttachment;
            table.insert(u109, v114);
            table.insert(u109, v115);
        end;

        if u108:WaitForChild("RightLowerLeg") then
            local v116 = ElectricDashTrail:Clone();
            local v117 = ElectricFillerTrail:Clone();
            v116.Parent = u6;
            v116.Attachment0 = u108.RightLowerLeg.RightKneeRigAttachment;
            v116.Attachment1 = u108.RightLowerLeg.RightAnkleRigAttachment;
            v117.Parent = u6;
            v117.Attachment0 = u108.RightLowerLeg.RightKneeRigAttachment;
            v117.Attachment1 = u108.RightLowerLeg.RightAnkleRigAttachment;
            table.insert(u109, v116);
            table.insert(u109, v117);
        end;
    end);

    return u109;
end;

KnitClient.CreateController(u7.new());

return nil;