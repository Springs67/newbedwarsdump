-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SkeletonKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "skeleton", "skeleton-kit-balance").SkeletonKitBalance;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local SkeletonKitReviveBarGUI = RuntimeLib.import(script, script.Parent, "skeleton-kit-revive-bar-gui").SkeletonKitReviveBarGUI;
local SkeletonKitReviveCooldownBarGUI = RuntimeLib.import(script, script.Parent, "skeleton-kit-revive-cooldown-bar-gui").SkeletonKitReviveCooldownBarGUI;
local v6 = {};
local u7 = setmetatable({}, {
    __index = v6
});
u7.Leather = 0;
v6[0] = "Leather";
u7.Iron = 1;
v6[1] = "Iron";
u7.Diamond = 2;
v6[2] = "Diamond";
u7.Emerald = 3;
v6[3] = "Emerald";
local u8 = {
    [u7.Leather] = "rbxassetid://109332518176712",
    [u7.Iron] = "rbxassetid://114619942907625",
    [u7.Diamond] = "rbxassetid://74381834739852",
    [u7.Emerald] = "rbxassetid://73530637208617"
};
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 57, Name: __tostring
        return "SkeletonKitController";
    end,

    __index = BaseKitController
});
u9.__index = u9;

function u9.new(...) -- Line: 63
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 67
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), u2 (copy)
    BaseKitController.constructor(p11, BedwarsKit.SKELETON, {
        sounds = { GameSound.SKELETON_KIT_DISASSEMBLE, GameSound.SKELETON_KIT_REASSEMBLE, GameSound.SKELETON_KIT_SMOKE_LOOP }
    });
    p11.Name = "SkeletonKitController";
    p11.playerReviveStateData = {};
    p11.playerReviveMeterMaids = {};
    p11.localReviveCooldownMaid = u2.new();
    p11.poisonStatusMaid = u2.new();
end;

function u9.KnitStart(p12) -- Line: 77
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p12);
end;

function u9.onKitLocalActivated(p13, p14) -- Line: 80
end;

function u9.onKitLocalDeactivated(p15) -- Line: 82
end;

function u9.onKitReplicationActivated(u16, u17) -- Line: 84
    -- upvalues: default2 (copy), SkeletonKitBalance (copy), Players (copy), Workspace (copy), KnitClient (copy), u2 (copy), SoundManager (copy), GameSound (copy), MathUtil (copy), RunService (copy), CFrameUtil (copy), u3 (copy), SkeletonKitReviveBarGUI (copy), Flamework (copy), ClientSyncEvents (copy), SkeletonKitReviveCooldownBarGUI (copy), default (copy), InQuad (copy), ReplicatedStorage (copy), KnitClient2 (copy), AbilityId (copy), EntityUtil (copy), isUsingKit (copy), BedwarsKit (copy), ArmorSlot (copy)
    default2.Client:Get("SkeletonKit_StartReviveState"):Connect(function(u18) -- Line: 85
        -- upvalues: u16 (copy), SkeletonKitBalance (ref), Players (ref), Workspace (ref), KnitClient (ref), u2 (ref), SoundManager (ref), GameSound (ref), MathUtil (ref), RunService (ref), CFrameUtil (ref), u3 (ref), SkeletonKitReviveBarGUI (ref), Flamework (ref), u17 (copy)
        local Character = u18.player.Character;

        if not Character then
            return nil;
        end;

        local v19 = u16.playerReviveStateData[u18.player];

        if v19 then
            local transparencyMaid = v19.transparencyMaid;

            if transparencyMaid ~= nil then
                transparencyMaid:DoCleaning();
            end;

            local headFollowMaid = v19.headFollowMaid;

            if headFollowMaid ~= nil then
                headFollowMaid:DoCleaning();
            end;
        end;

        local u20 = {};
        u16.playerReviveStateData[u18.player] = u20;

        if SkeletonKitBalance.FreezeMovementDuration > 0 and (u18.player == Players.LocalPlayer and Workspace:GetServerTimeNow() < u18.stoppedMovementEndTime) then
            local u21 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = 0,
                blockSprint = true
            });
            task.delay(u18.stoppedMovementEndTime - Workspace:GetServerTimeNow(), function() -- Line: 115
                -- upvalues: u21 (copy)
                u21.Destroy();
            end);
        end;

        if u18.player == Players.LocalPlayer then
            if SkeletonKitBalance.DisableSprintDuringReviveState ~= true then
                local _ = SkeletonKitBalance.SpeedMultiplierDuringReviveState == 1;
            end;

            local u22 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = SkeletonKitBalance.DisableSprintDuringReviveState,
                moveSpeedMultiplier = SkeletonKitBalance.SpeedMultiplierDuringReviveState
            });
            local v23 = u2.new();
            v23:GiveTask(function() -- Line: 128
                -- upvalues: u22 (copy)
                u22.Destroy();
            end);
            u20.disableSprintMaid = v23;
        end;

        SoundManager:playSound(GameSound.SKELETON_KIT_DISASSEMBLE, {
            position = Character:GetPivot().Position,
            parent = Character
        });
        Character.Archivable = true;

        local function _(p24) -- Line: 141
            return p24:IsA("BasePart");
        end;

        local v25 = 0;
        local v26 = {};

        for i, child in Character:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") == true then
                v25 = v25 + 1;
                v26[v25] = child;
            end;
        end;

        local v27 = Character:FindFirstChild("3DClothing");

        if v27 ~= nil then
            local function _(p28) -- Line: 158
                return p28:IsA("BasePart");
            end;

            local v29 = 0;
            v27 = {};

            for i, child in v27:GetChildren() do
                local _ = i - 1;

                if child:IsA("BasePart") == true then
                    v29 = v29 + 1;
                    v27[v29] = child;
                end;
            end;
        end;

        local u30 = {};
        local u31 = {};
        local u32 = {};

        if v27 ~= nil then
            local function _(p33) -- Line: 179
                -- upvalues: u31 (copy), Workspace (ref)
                if p33.Name == "Head" then
                    return nil;
                end;

                local v34 = p33:Clone();
                v34:SetAttribute("NoSuffocation", true);
                table.insert(u31, v34);
                v34:ClearAllChildren();
                v34.Parent = Workspace;
                v34.Anchored = false;
                v34.CanCollide = true;
                v34.CollisionGroup = "DisablePlayerCollisions";
            end;

            for i, v in v27 do
                local _ = i - 1;

                if v.Name ~= "Head" then
                    local v35 = v:Clone();
                    v35:SetAttribute("NoSuffocation", true);
                    table.insert(u31, v35);
                    v35:ClearAllChildren();
                    v35.Parent = Workspace;
                    v35.Anchored = false;
                    v35.CanCollide = true;
                    v35.CollisionGroup = "DisablePlayerCollisions";
                end;
            end;
        end;

        local function v42(u36) -- Line: 196
            -- upvalues: u30 (copy), u32 (copy), Workspace (ref), u31 (copy), MathUtil (ref)
            if u36.Name == "HumanoidRootPart" then
                return nil;
            end;

            if u36.Name == "Head" then
                return nil;
            end;

            local v37 = u36:Clone();
            v37:SetAttribute("NoSuffocation", true);
            table.insert(u30, v37);
            u32[v37] = u36;
            v37:ClearAllChildren();
            v37.Parent = Workspace;
            v37.Anchored = false;
            v37.CanCollide = true;
            v37.CollisionGroup = "DisablePlayerCollisions";

            local function _(p38) -- Line: 215
                -- upvalues: u36 (copy)
                return p38.Name == u36.Name;
            end;

            local v39 = nil;

            for i, v in u31 do
                local _ = i - 1;

                if v.Name == u36.Name == true then
                    v39 = v;
                    break;
                end;
            end;

            if v39 then
                local WeldConstraint = Instance.new("WeldConstraint");
                WeldConstraint.Part0 = v39;
                WeldConstraint.Part1 = v37;
                WeldConstraint.Parent = v39;
            end;

            local v40 = MathUtil.randomFloatMaxInclusive(-1, 1);
            local v41 = MathUtil.randomFloatMaxInclusive(0, 1);
            v37:ApplyImpulse(Vector3.new(v40, v41, MathUtil.randomFloatMaxInclusive(-1, 1)).Unit * MathUtil.randomFloatMaxInclusive(5, 8) * v37.Mass);
        end;

        for i, v in v26 do
            v42(v, i - 1, v26);
        end;

        u20.clonedBodyParts = u30;
        u20.clonedClothingParts = u31;
        u20.clonedBodyPartToOriginalMap = u32;
        local Head = Character:FindFirstChild("Head");
        local u43;

        if Character == nil then
            u43 = Character;
        else
            u43 = Character:FindFirstChild("HumanoidRootPart");
        end;

        if Head and u43 then
            local u44 = Head:Clone();
            u44.Anchored = false;
            u44.CanCollide = false;
            u44.CanTouch = false;
            u44.CanQuery = false;
            u44:SetAttribute("NoSuffocation", true);
            u44.Name = "SkeletonKit_HeadClone";

            local function _(p45) -- Line: 268
                if p45:IsA("SpecialMesh") then
                    return nil;
                end;

                p45:Destroy();
            end;

            for i, child in u44:GetChildren() do
                local _ = i - 1;

                if not child:IsA("SpecialMesh") then
                    child:Destroy();
                end;
            end;

            u44.Parent = Workspace;
            u20.head = u44;
            local v46 = Character:FindFirstChild("3DClothing");

            if v46 ~= nil then
                v46 = v46:FindFirstChild("Head");
            end;

            if v46 then
                local v47 = v46:Clone();
                v47.CanCollide = false;
                v47.CanTouch = false;
                v47.CanQuery = false;
                v47.Parent = u44;
                v47.Name = "SkeletonKit_HeadClothingClone";
                u20.headClothing = v47;
                local WeldConstraint = Instance.new("WeldConstraint");
                WeldConstraint.Part0 = v47;
                WeldConstraint.Part1 = u44;
                WeldConstraint.Parent = v47;
            end;

            local u48 = 0;
            local u49 = false;
            local u50 = nil;
            u50 = RunService.Heartbeat:Connect(function(p51) -- Line: 304
                -- upvalues: Character (copy), u43 (copy), u50 (ref), u44 (copy), u48 (ref), CFrameUtil (ref), u18 (copy), Players (ref), KnitClient (ref), u49 (ref)
                local v52 = Character;

                if v52 ~= nil then
                    v52 = v52.Parent;
                end;

                local v53 = v52 == nil;

                if not v53 then
                    local v54 = u43;

                    if v54 ~= nil then
                        v54 = v54.Parent;
                    end;

                    v53 = v54 == nil;
                end;

                if v53 then
                    u50:Disconnect();

                    return nil;
                end;

                u44:PivotTo(u43.CFrame);
                local v55 = u43:GetPivot().Position - Vector3.new(0, 1.6, 0);
                local v56 = (math.sin(u48 * 13) + 1) / 2 * 2 + 0.5;
                local v57 = v55 + Vector3.new(0, v56, 0);
                CFrameUtil.setPosition(u44, v57);
                u48 = u48 + p51;

                if u18.player == Players.LocalPlayer then
                    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and not u49 then
                        u49 = true;

                        local function _(p58) -- Line: 338
                            if p58:IsA("BasePart") then
                                p58.Transparency = 1;
                            end;
                        end;

                        for i, descendant in u44:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("BasePart") then
                                descendant.Transparency = 1;
                            end;
                        end;

                        return;
                    end;

                    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 and u49 then
                        u49 = false;

                        local function _(p59) -- Line: 349
                            if p59:IsA("BasePart") then
                                p59.Transparency = 0;
                            end;
                        end;

                        for i, descendant in u44:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("BasePart") then
                                descendant.Transparency = 0;
                            end;
                        end;
                    end;
                end;
            end);
            u20.headFollowMaid = u2.new();
            u20.headFollowMaid:GiveTask(function() -- Line: 362
                -- upvalues: u50 (ref)
                u50:Disconnect();
            end);
        end;

        Character.Archivable = false;
        local u60 = {
            transparency = 1
        };
        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):addModifier(u60);

        if Character ~= nil then
            Character:SetAttribute("DisableInvisibilityFootstepParticles", true);
        end;

        local v61 = u2.new();
        v61:GiveTask(function() -- Line: 379
            -- upvalues: KnitClient (ref), Character (copy), u60 (copy)
            KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):removeModifier(u60);
            local v62 = Character;

            if v62 ~= nil then
                v62:SetAttribute("DisableInvisibilityFootstepParticles", false);
            end;
        end);
        u20.transparencyMaid = v61;

        if u18.player == Players.LocalPlayer then
            KnitClient.Controllers.ViewmodelController:setHandItemVisibilityMode(false);
            v61:GiveTask(function() -- Line: 390
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.ViewmodelController:setHandItemVisibilityMode(true);
            end);
        end;

        if u16.playerReviveMeterMaids[u18.player] ~= nil then
            local v63 = u16.playerReviveMeterMaids[u18.player];

            if v63 ~= nil then
                v63:DoCleaning();
            end;

            u16.playerReviveMeterMaids[u18.player] = nil;
        end;

        if u18.player == Players.LocalPlayer then
            local v64 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(SkeletonKitReviveBarGUI, {
                IsOnActionBar = true,
                Target = Character:FindFirstChild("HumanoidRootPart"),
                StartServerTime = u18.startServerTime,
                EndServerTime = u18.reviveEndServerTime
            }));
            local v65 = u2.new();
            v65:GiveTask(v64);
            u16.playerReviveMeterMaids[u18.player] = v65;
        else
            local v66 = u18.reviveEndServerTime - Workspace:GetServerTimeNow();
            local _ = Workspace:GetServerTimeNow() + v66;
            local u67 = u3.mount(u3.createElement(SkeletonKitReviveBarGUI, {
                IsOnActionBar = false,
                Target = Character:FindFirstChild("HumanoidRootPart"),
                StartServerTime = u18.startServerTime,
                EndServerTime = u18.reviveEndServerTime
            }), Players.LocalPlayer:WaitForChild("PlayerGui"), "SkeletonKitReviveBarGUI");
            local v68 = u2.new();
            v68:GiveTask(function() -- Line: 419
                -- upvalues: u3 (ref), u67 (copy)
                u3.unmount(u67);
            end);
            u16.playerReviveMeterMaids[u18.player] = v68;
        end;

        u17:GiveTask(function() -- Line: 439
            -- upvalues: u20 (copy)
            local transparencyMaid = u20.transparencyMaid;

            if transparencyMaid ~= nil then
                transparencyMaid:DoCleaning();
            end;

            local headFollowMaid = u20.headFollowMaid;

            if headFollowMaid ~= nil then
                headFollowMaid:DoCleaning();
            end;

            local disableSprintMaid = u20.disableSprintMaid;

            if disableSprintMaid ~= nil then
                disableSprintMaid:DoCleaning();
            end;

            local clonedBodyParts = u20.clonedBodyParts;

            if clonedBodyParts ~= nil then
                local function _(p69) -- Line: 454
                    return p69:Destroy();
                end;

                for i, v in clonedBodyParts do
                    local _ = i - 1;
                    v:Destroy();
                end;
            end;

            local clonedClothingParts = u20.clonedClothingParts;

            if clonedClothingParts ~= nil then
                local function _(p70) -- Line: 463
                    return p70:Destroy();
                end;

                for i, v in clonedClothingParts do
                    local _ = i - 1;
                    v:Destroy();
                end;
            end;
        end);
        task.delay(SkeletonKitBalance.ReviveStateDuration + 5, function() -- Line: 472
            -- upvalues: u16 (ref), u18 (copy), u20 (copy)
            if u16.playerReviveStateData[u18.player] == u20 then
                local transparencyMaid = u20.transparencyMaid;

                if transparencyMaid ~= nil then
                    transparencyMaid:DoCleaning();
                end;

                local headFollowMaid = u20.headFollowMaid;

                if headFollowMaid ~= nil then
                    headFollowMaid:DoCleaning();
                end;

                local disableSprintMaid = u20.disableSprintMaid;

                if disableSprintMaid ~= nil then
                    disableSprintMaid:DoCleaning();
                end;

                local clonedBodyParts = u20.clonedBodyParts;

                if clonedBodyParts ~= nil then
                    local function _(p71) -- Line: 491
                        return p71:Destroy();
                    end;

                    for i, v in clonedBodyParts do
                        local _ = i - 1;
                        v:Destroy();
                    end;
                end;

                local clonedClothingParts = u20.clonedClothingParts;

                if clonedClothingParts ~= nil then
                    local function _(p72) -- Line: 500
                        return p72:Destroy();
                    end;

                    for i, v in clonedClothingParts do
                        local _ = i - 1;
                        v:Destroy();
                    end;
                end;
            end;
        end);
    end);
    default2.Client:Get("SkeletonKit_EndReviveState"):Connect(function(u73) -- Line: 511
        -- upvalues: u16 (copy), Players (ref), KnitClient (ref), SkeletonKitBalance (ref), ClientSyncEvents (ref), Flamework (ref), u3 (ref), SkeletonKitReviveCooldownBarGUI (ref), Workspace (ref), SoundManager (ref), GameSound (ref), default (ref), InQuad (ref)
        task.spawn(function() -- Line: 512
            -- upvalues: u16 (ref), u73 (copy), Players (ref), KnitClient (ref), SkeletonKitBalance (ref), ClientSyncEvents (ref), Flamework (ref), u3 (ref), SkeletonKitReviveCooldownBarGUI (ref), Workspace (ref), SoundManager (ref), GameSound (ref), default (ref), InQuad (ref)
            if u16.playerReviveMeterMaids[u73.player] ~= nil then
                local v74 = u16.playerReviveMeterMaids[u73.player];

                if v74 ~= nil then
                    v74:DoCleaning();
                end;

                u16.playerReviveMeterMaids[u73.player] = nil;
            end;

            local u75 = u16.playerReviveStateData[u73.player];

            if not u75 then
                return nil;
            end;

            if u73.successfulRevive then
                if u73.player == Players.LocalPlayer then
                    local u76 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        moveSpeedMultiplier = 0,
                        blockSprint = true
                    });
                    task.delay(SkeletonKitBalance.ReviveReassembleDuration + 0.1, function() -- Line: 542
                        -- upvalues: u76 (copy)
                        u76.Destroy();
                    end);
                    local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(SkeletonKitBalance.ReviveCooldown).cooldown;
                    local v77 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(SkeletonKitReviveCooldownBarGUI, {
                        StartServerTime = u73.serverStartTime,
                        EndServerTime = u73.serverStartTime + cooldown
                    }));
                    u16.localReviveCooldownMaid:GiveTask(v77);
                    local v78 = u73.serverStartTime + cooldown - Workspace:GetServerTimeNow();
                    task.delay(v78, function() -- Line: 554
                        -- upvalues: u16 (ref)
                        u16.localReviveCooldownMaid:DoCleaning();
                    end);
                end;

                local v79 = u73.serverStartTime + SkeletonKitBalance.ReviveReassembleDuration - Workspace:GetServerTimeNow();
                local headFollowMaid = u75.headFollowMaid;

                if headFollowMaid ~= nil then
                    headFollowMaid:DoCleaning();
                end;

                if u75.head then
                    u75.head.CanCollide = false;
                    u75.head.CanTouch = false;
                    u75.head.CanQuery = false;
                    u75.head.Anchored = true;
                end;

                local clonedBodyParts = u75.clonedBodyParts;

                if clonedBodyParts ~= nil then
                    local function _(p80) -- Line: 575
                        p80.CanCollide = false;
                        p80.CanTouch = false;
                        p80.CanQuery = false;
                        p80.Anchored = true;
                    end;

                    for i, v in clonedBodyParts do
                        local _ = i - 1;
                        v.CanCollide = false;
                        v.CanTouch = false;
                        v.CanQuery = false;
                        v.Anchored = true;
                    end;
                end;

                if v79 < 1 then
                    v79 = 1;
                    local _ = Workspace:GetServerTimeNow() + v79;
                end;

                local headFollowMaid2 = u75.headFollowMaid;

                if headFollowMaid2 ~= nil then
                    headFollowMaid2:DoCleaning();
                end;

                local Character = u73.player.Character;

                if Character then
                    SoundManager:playSound(GameSound.SKELETON_KIT_REASSEMBLE, {
                        position = Character:GetPivot().Position,
                        parent = Character
                    });
                end;

                local Character2 = u73.player.Character;

                if Character2 ~= nil then
                    Character2 = Character2:FindFirstChild("Head");
                end;

                local u81 = {};

                if u75.head then
                    u81[u75.head] = u75.head:GetPivot();
                end;

                local clonedBodyParts2 = u75.clonedBodyParts;

                if clonedBodyParts2 ~= nil then
                    local function _(p82) -- Line: 617
                        -- upvalues: u81 (copy)
                        u81[p82] = p82:GetPivot();
                    end;

                    for i, v in clonedBodyParts2 do
                        local _ = i - 1;
                        u81[v] = v:GetPivot();
                    end;
                end;

                default(v79, InQuad, function(u83) -- Line: 626
                    -- upvalues: u75 (copy), Character2 (copy), u81 (copy)
                    if u75.head and Character2 then
                        u75.head:PivotTo(u81[u75.head]:Lerp(Character2:GetPivot(), u83));
                    end;

                    local clonedBodyParts3 = u75.clonedBodyParts;

                    if clonedBodyParts3 ~= nil then
                        local function _(p84) -- Line: 636
                            -- upvalues: u75 (ref), u81 (ref), u83 (copy)
                            local clonedBodyPartToOriginalMap = u75.clonedBodyPartToOriginalMap;

                            if clonedBodyPartToOriginalMap ~= nil then
                                clonedBodyPartToOriginalMap = clonedBodyPartToOriginalMap[p84];
                            end;

                            if clonedBodyPartToOriginalMap then
                                p84:PivotTo(u81[p84]:Lerp(clonedBodyPartToOriginalMap:GetPivot(), u83));
                            end;
                        end;

                        for i, v in clonedBodyParts3 do
                            local _ = i - 1;
                            local clonedBodyPartToOriginalMap = u75.clonedBodyPartToOriginalMap;

                            if clonedBodyPartToOriginalMap ~= nil then
                                clonedBodyPartToOriginalMap = clonedBodyPartToOriginalMap[v];
                            end;

                            if clonedBodyPartToOriginalMap then
                                v:PivotTo(u81[v]:Lerp(clonedBodyPartToOriginalMap:GetPivot(), u83));
                            end;
                        end;
                    end;
                end, 0, 1):Play();
                task.wait(v79 + 0.1);
                local transparencyMaid = u75.transparencyMaid;

                if transparencyMaid ~= nil then
                    transparencyMaid:DoCleaning();
                end;

                local disableSprintMaid = u75.disableSprintMaid;

                if disableSprintMaid ~= nil then
                    disableSprintMaid:DoCleaning();
                end;

                local head = u75.head;

                if head ~= nil then
                    head:Destroy();
                end;

                local clonedBodyParts3 = u75.clonedBodyParts;

                if clonedBodyParts3 ~= nil then
                    local function _(p85) -- Line: 670
                        return p85:Destroy();
                    end;

                    for i, v in clonedBodyParts3 do
                        local _ = i - 1;
                        v:Destroy();
                    end;
                end;

                local clonedClothingParts = u75.clonedClothingParts;

                if clonedClothingParts ~= nil then
                    local function _(p86) -- Line: 679
                        return p86:Destroy();
                    end;

                    for i, v in clonedClothingParts do
                        local _ = i - 1;
                        v:Destroy();
                    end;
                end;
            else
                local transparencyMaid = u75.transparencyMaid;

                if transparencyMaid ~= nil then
                    transparencyMaid:DoCleaning();
                end;

                local headFollowMaid = u75.headFollowMaid;

                if headFollowMaid ~= nil then
                    headFollowMaid:DoCleaning();
                end;

                local disableSprintMaid = u75.disableSprintMaid;

                if disableSprintMaid ~= nil then
                    disableSprintMaid:DoCleaning();
                end;

                local clonedBodyParts = u75.clonedBodyParts;

                if clonedBodyParts ~= nil then
                    local function _(p87) -- Line: 702
                        return p87:Destroy();
                    end;

                    for i, v in clonedBodyParts do
                        local _ = i - 1;
                        v:Destroy();
                    end;
                end;

                local clonedClothingParts = u75.clonedClothingParts;

                if clonedClothingParts ~= nil then
                    local function _(p88) -- Line: 711
                        return p88:Destroy();
                    end;

                    for i, v in clonedClothingParts do
                        local _ = i - 1;
                        v:Destroy();
                    end;
                end;

                local head = u75.head;

                if head ~= nil then
                    head:Destroy();
                end;
            end;

            u16.playerReviveStateData[u73.player] = nil;
        end);
    end);
    default2.Client:Get("SkeletonKit_SpawnPoisonCloud"):Connect(function(p89) -- Line: 730
        -- upvalues: Workspace (ref), ReplicatedStorage (ref)
        local v90 = p89.endServerTime - Workspace:GetServerTimeNow();

        if v90 <= 0 then
            return nil;
        end;

        local u91 = ReplicatedStorage.Assets.Effects.SkeletonKit_Smoke:Clone();
        u91:PivotTo(CFrame.new(p89.position));
        u91.Parent = Workspace;
        u91.Smoke:Emit(10);
        task.delay(v90, function() -- Line: 739
            -- upvalues: u91 (copy)
            u91:Destroy();
        end);
    end);
    default2.Client:Get("SkeletonKit_PlayerEnteredPoisonCloud"):Connect(function(p92) -- Line: 744
        -- upvalues: Players (ref), u16 (copy), SkeletonKitBalance (ref), KnitClient2 (ref)
        if p92.player ~= Players.LocalPlayer then
            return nil;
        end;

        u16.poisonStatusMaid:DoCleaning();

        if SkeletonKitBalance.PoisonDisablesJump then
            u16.poisonStatusMaid:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                jumpHeightMultiplier = 0,
                airJumps = 0
            }));
        end;

        if SkeletonKitBalance.PoisonDisablesSprint or SkeletonKitBalance.PoisonMoveSpeedMultiplier ~= 1 then
            u16.poisonStatusMaid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = SkeletonKitBalance.PoisonDisablesSprint,
                moveSpeedMultiplier = SkeletonKitBalance.PoisonMoveSpeedMultiplier
            }));
        end;
    end);
    default2.Client:Get("SkeletonKit_PlayerExitedPoisonCloud"):Connect(function(p93) -- Line: 764
        -- upvalues: Players (ref), u16 (copy)
        if p93.player ~= Players.LocalPlayer then
            return nil;
        end;

        u16.poisonStatusMaid:DoCleaning();
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p94) -- Line: 771
        -- upvalues: Players (ref), AbilityId (ref)
        if p94.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p94.ability ~= AbilityId.SKELETON_ABILITY then
            return nil;
        end;

        if p94.userCharacter:GetAttribute("SkeletonKit_IsInReviveState") == true then
            p94:setCancelled(true);
        end;
    end);
    ClientSyncEvents.PlaceBlock:connect(function(p95) -- Line: 784
        -- upvalues: u16 (copy), Players (ref)
        if not u16:isPlayerInReviveState(Players.LocalPlayer) then
            return nil;
        end;

        p95:setCancelled(true);
    end);
    ClientSyncEvents.EntityEquipArmorVisuals:connect(function(p96) -- Line: 791
        -- upvalues: EntityUtil (ref), isUsingKit (ref), BedwarsKit (ref)
        local v97 = p96.entity:getInstance();

        if not v97 then
            return nil;
        end;

        local v98 = EntityUtil:getPlayerFromEntityInstance(v97);

        if not v98 then
            return nil;
        end;

        if not isUsingKit(v98, BedwarsKit.SKELETON) then
            return nil;
        end;

        if v98:GetAttribute("UsingKitSkinModel") ~= true then
            return nil;
        end;

        p96.hideArmor = true;
    end);
    default2.Client:Get("EntityDeathEvent"):Connect(function(p99) -- Line: 811
        -- upvalues: Players (ref), u16 (copy)
        if not Players:GetPlayerFromCharacter(p99.entityInstance) then
            return nil;
        end;

        u16.localReviveCooldownMaid:DoCleaning();
    end);
    ClientSyncEvents.EntityChangeArmorSlotItem:connect(function(p100) -- Line: 818
        -- upvalues: ArmorSlot (ref), EntityUtil (ref), isUsingKit (ref), BedwarsKit (ref), u16 (copy)
        if p100.item == nil then
            return nil;
        end;

        if p100.armorSlot ~= ArmorSlot.CHESTPLATE then
            return nil;
        end;

        local v101 = p100.entity:getInstance();

        if not v101 then
            return nil;
        end;

        local v102 = EntityUtil:getPlayerFromEntityInstance(v101);

        if not v102 then
            return nil;
        end;

        if not isUsingKit(v102, BedwarsKit.SKELETON) then
            return nil;
        end;

        local v103 = u16:getArmorTypeFromItemName(p100.item.Name);

        if v103 == nil then
            return nil;
        end;

        if v102:GetAttribute("UsingKitSkinModel") ~= true then
            return nil;
        end;

        u16:setCharacterArmorTexture(v101, v103);
    end);
    u17:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p104) -- Line: 847
        -- upvalues: u16 (copy), Players (ref)
        u16:cancelEventIfPlayerIsInReviveState(Players.LocalPlayer, p104);
    end));
    u17:GiveTask(ClientSyncEvents.ProjectileTargetingEnded:connect(function(p105) -- Line: 855
        -- upvalues: u16 (copy), Players (ref)
        u16:cancelEventIfPlayerIsInReviveState(Players.LocalPlayer, p105);
    end));
    u17:GiveTask(ClientSyncEvents.ProjectileLaunched:connect(function(p106) -- Line: 858
        -- upvalues: EntityUtil (ref), u16 (copy)
        if not p106.shooter then
            return nil;
        end;

        local v107 = EntityUtil:getPlayerFromEntityInstance(p106.shooter);

        if not v107 then
            return nil;
        end;

        u16:cancelEventIfPlayerIsInReviveState(v107, p106);
    end));
    u17:GiveTask(ClientSyncEvents.StartLaunchProjectile:connect(function(p108) -- Line: 868
        -- upvalues: u16 (copy), Players (ref)
        u16:cancelEventIfPlayerIsInReviveState(Players.LocalPlayer, p108);
    end));
    u17:GiveTask(ClientSyncEvents.StartConsuming:connect(function(p109) -- Line: 871
        -- upvalues: u16 (copy), Players (ref)
        u16:cancelEventIfPlayerIsInReviveState(Players.LocalPlayer, p109);
    end));
end;

function u9.onKitReplicationDeactivated(p110) -- Line: 875
end;

function u9.onInnateAbilityEnabled(p111, p112, p113) -- Line: 877
end;

function u9.onAbilityUsed(p114, p115, p116) -- Line: 879
end;

function u9.isPlayerInReviveState(p117, p118) -- Line: 881
    return p117.playerReviveStateData[p118] ~= nil;
end;

function u9.setCharacterArmorTexture(p119, p120, p121) -- Line: 886
    -- upvalues: u8 (copy)
    local v122 = p120:FindFirstChild("3DClothing");

    if v122 ~= nil then
        v122 = v122:FindFirstChild("UpperTorso");
    end;

    local v123 = u8[p121];
    local v124 = v122 and v123;

    if v124 ~= "" and v124 then
        v122.TextureID = v123;
    end;
end;

function u9.getArmorTypeFromItemName(p125, p126) -- Line: 899
    -- upvalues: u5 (copy), u7 (ref)
    local v127 = string.lower(p126);

    if u5.includes(v127, "leather") then
        return u7.Leather;
    end;

    if u5.includes(v127, "iron") then
        return u7.Iron;
    end;

    if u5.includes(v127, "diamond") then
        return u7.Diamond;
    end;

    if u5.includes(v127, "emerald") then
        return u7.Emerald;
    end;
end;

function u9.cancelEventIfPlayerIsInReviveState(p128, p129, p130) -- Line: 914
    -- upvalues: Players (copy), isUsingKit (copy), BedwarsKit (copy)
    if not p129 then
        return nil;
    end;

    if Players.LocalPlayer ~= p129 then
        return nil;
    end;

    if not isUsingKit(p129, BedwarsKit.SKELETON) then
        return nil;
    end;

    if p128:isPlayerInReviveState(p129) then
        p130:setCancelled(true);
    end;
end;

KnitClient.CreateController(u9.new());

return nil;