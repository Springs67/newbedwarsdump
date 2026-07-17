-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local OwlUtil = RuntimeLib.import(script, script.Parent, "owl-util").OwlUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "OwlCameraController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: KnitController (copy), u2 (copy), Workspace (copy)
    KnitController.constructor(p7);
    p7.Name = "OwlCameraController";
    p7.maid = u2.new();
    p7.isActive = false;
    p7.camera = Workspace.CurrentCamera;
end;

function u5.KnitStart(u8) -- Line: 49
    -- upvalues: KnitController (copy), default (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy)
    KnitController.KnitStart(u8);
    default.Client:Get("OwlSummoned"):Connect(function(p9, p10) -- Line: 51
        -- upvalues: u8 (copy), Players (ref)
        u8:SummonOwl(p9, p10);

        if p9 == Players.LocalPlayer then
            u8.isActive = true;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p11) -- Line: 57
        -- upvalues: Players (ref), AbilityId (ref), u8 (copy), default (ref)
        if p11.userCharacter == Players.LocalPlayer.Character and p11.ability == AbilityId.DEACTIVE_OWL then
            u8:deactiveOwl();
            default.Client:Get("RemoveOwl"):SendToServer();
        end;
    end);
    ClientSyncEvents.NewHandItem:connect(function(p12) -- Line: 63
        -- upvalues: u8 (copy)
        if u8.isActive then
            p12:setCancelled(true);
        end;
    end);
    default.Client:Get("OwlDeattached"):Connect(function(p13) -- Line: 68
        -- upvalues: Players (ref), u8 (copy)
        if p13 == Players.LocalPlayer then
            u8:deactiveOwl();
        end;
    end);
end;

function u5.activeOwl(p14, p15, p16) -- Line: 74
    -- upvalues: OwlUtil (copy), ClientSyncEvents (copy), Players (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    if not p15.Character then
        return nil;
    end;

    local v17 = OwlUtil:getOwlClientModelByUser(p16);

    if not v17 then
        return nil;
    end;

    local PrimaryPart = v17.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    p14.camera.CameraSubject = PrimaryPart;
    ClientSyncEvents.OwlNewTarget:fire(p15);
    p14.owl = OwlUtil:getOwlClientModelByUser(Players.LocalPlayer);
    p14:enableFirstPersonController();
    task.wait(0.5);
    p14.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.DEACTIVE_OWL, {
        abilityType = "KitTertiary",
        abilityButton = {
            icon = BedwarsImageId.OWL_IMAGE
        }
    }):expect());
end;

function u5.SummonOwl(u18, u19, u20) -- Line: 99
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), Players (copy), u3 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    local v21 = u18:getKitSkinData(u19.Character);
    local v22;

    if v21 == nil then
        v22 = v21;
    else
        v22 = v21.owlModel;
    end;

    local v23;

    if v21 == nil then
        v23 = v21;
    else
        v23 = v21.owlModel;
    end;

    local u24;

    if v23 then
        u24 = v21.owlModel:Clone();
    else
        u24 = ReplicatedStorage.Assets.Effects.OwlShooter:Clone();
    end;

    u24.Name = "TweenOwl";
    u24.Archivable = true;
    u24.Parent = Workspace;
    local PrimaryPart = u24.PrimaryPart;

    if u19 == Players.LocalPlayer then
        u3("BodyForce", {
            Name = "owlForce",
            Force = Vector3.new(0, Workspace.Gravity * PrimaryPart.Mass, 0),
            Parent = PrimaryPart
        });
        u18.camera.CameraSubject = PrimaryPart;
        Players.LocalPlayer.CameraMinZoomDistance = 5;
        Players.LocalPlayer.CameraMinZoomDistance = 0.5;
    end;

    AnimationUtil:playAnimation(u24, GameAnimationUtil:getAssetId(AnimationType.OWL_FLY));
    local Character = u19.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local Character2 = u20.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;
    end;

    if not (PrimaryPart and (Character and Character2)) then
        return nil;
    end;

    PrimaryPart.Position = Character.Position;
    SoundManager:playSound(GameSound.OWL_HOOT, {
        rollOffMaxDistance = 220,
        position = PrimaryPart.Position
    });
    PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position, Character2.Position + Vector3.new(1, 3, 1));
    local v25 = TweenInfo.new(0.5);
    local Character3 = u20.Character;

    if Character3 ~= nil then
        Character3 = Character3:FindFirstChild("LeftUpperArm");

        if Character3 ~= nil then
            Character3 = Character3:FindFirstChild("LeftShoulderAttachment");
        end;
    end;

    local v26 = Character3.WorldPosition + Vector3.new(0, 0.5, 0);
    local Character4 = u20.Character;

    if Character4 ~= nil then
        Character4 = Character4:GetPrimaryPartCFrame().LookVector.Unit;
    end;

    local v27 = TweenService:Create(PrimaryPart, v25, {
        CFrame = CFrame.new(v26, v26 + Character4 * 6)
    });
    v27:Play();
    v27.Completed:Connect(function() -- Line: 174
        -- upvalues: u24 (copy), u19 (copy), Players (ref), u18 (copy), u20 (copy)
        u24:Destroy();

        if u19 == Players.LocalPlayer then
            u18:activeOwl(u20, u19);
        end;
    end);
end;

function u5.deactiveOwl(p28) -- Line: 181
    -- upvalues: ClientSyncEvents (copy), Players (copy), ClientStore (copy)
    p28.maid:DoCleaning();
    ClientSyncEvents.OwlNewTarget:fire(nil);
    local Character = Players.LocalPlayer.Character;

    if Character then
        p28.camera.CameraSubject = Character.Humanoid;
        p28.isActive = false;
        p28:disableFirstPersonController();
        ClientStore:dispatch({
            type = "UnequipItemInHand",
            equip = true
        });
    end;
end;

function u5.enableFirstPersonController(u29) -- Line: 195
    -- upvalues: OwlUtil (copy), Players (copy), EntityUtil (copy), RunService (copy)
    local owl = u29.owl;

    if owl ~= nil then
        local function _(p30) -- Line: 199
            return p30:IsA("MeshPart") or (p30:IsA("Decal") or p30:IsA("ParticleEmitter"));
        end;

        local v31 = 0;
        owl = {};

        for i, descendant in owl:GetDescendants() do
            local _ = i - 1;

            if (descendant:IsA("MeshPart") or (descendant:IsA("Decal") or descendant:IsA("ParticleEmitter"))) == true then
                v31 = v31 + 1;
                owl[v31] = descendant;
            end;
        end;
    end;

    local v32 = OwlUtil:getOwlTarget(Players.LocalPlayer);

    if not v32 then
        return nil;
    end;

    local u33 = EntityUtil:getEntity(v32);
    u29.FirstPersonController = RunService.Heartbeat:Connect(function() -- Line: 220
        -- upvalues: u29 (copy), owl (copy), u33 (copy)
        local owl2 = u29.owl;

        if owl2 ~= nil then
            owl2 = owl2:GetAttribute("TransparencyOverride");
        end;

        if owl2 ~= 0 and (owl2 == owl2 and (owl2 ~= "" and owl2)) then
            return nil;
        end;

        local camera = u29.camera;

        if camera ~= nil then
            camera = (camera.Focus.Position - u29.camera.CFrame.Position).Magnitude;
        end;

        if camera == 0 or (camera ~= camera or not (camera and (u29.owl and owl))) then
            return nil;
        end;

        if camera >= 0.6 then
            if camera < 3 then
                local function _(p34) -- Line: 256
                    if p34:IsA("MeshPart") or p34:IsA("Decal") then
                        p34.Transparency = 0.7;
                    end;
                end;

                for i, v in owl do
                    local _ = i - 1;

                    if v:IsA("MeshPart") or v:IsA("Decal") then
                        v.Transparency = 0.7;
                    end;
                end;

                u29.owl:SetAttribute("FirstPerson", false);

                return;
            end;

            u29.owl:SetAttribute("FirstPerson", false);

            local function _(p35) -- Line: 267
                if p35:IsA("MeshPart") or p35:IsA("Decal") then
                    p35.Transparency = 0;
                end;

                if p35:IsA("ParticleEmitter") then
                    p35.Enabled = false;
                end;
            end;

            for i, v in owl do
                local _ = i - 1;

                if v:IsA("MeshPart") or v:IsA("Decal") then
                    v.Transparency = 0;
                end;

                if v:IsA("ParticleEmitter") then
                    v.Enabled = false;
                end;
            end;

            if u33 then
                u33:showNametag();
            end;

            return;
        end;

        local function _(p36) -- Line: 239
            if p36:IsA("MeshPart") or p36:IsA("Decal") then
                p36.Transparency = 1;
            end;
        end;

        for i, v in owl do
            local _ = i - 1;

            if v:IsA("MeshPart") or v:IsA("Decal") then
                v.Transparency = 1;
            end;
        end;

        local v37 = u33;

        if v37 ~= nil then
            v37:hideNametag();
        end;

        u29.owl:SetAttribute("FirstPerson", true);
        local v38 = CFrame.new(u29.owl.PrimaryPart.Position);
        u29.owl.PrimaryPart.CFrame = v38 * u29.camera.CFrame.Rotation;
    end);
end;

function u5.disableFirstPersonController(p39) -- Line: 284
    local FirstPersonController = p39.FirstPersonController;

    if FirstPersonController ~= nil then
        FirstPersonController:Disconnect();
    end;
end;

function u5.getKitSkinData(p40, p41) -- Line: 290
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p41 then
        return nil;
    end;

    local v42 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p41)];

    if v42.owl then
        return v42.owl;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;