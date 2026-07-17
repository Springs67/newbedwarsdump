-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local StarterPlayer = v3.StarterPlayer;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local AgniKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "agni", "agni-util").AgniKitUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "AgniController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u2 (copy)
    BaseKitController.constructor(p6, BedwarsKit.AGNI);
    p6.Name = "AgniController";
    p6.maid = u2.new();
end;

function u4.onKitLocalActivated(p7, p8) -- Line: 41
    -- upvalues: ClientSyncEvents (copy), Players (copy), KnitClient (copy), BedwarsKit (copy), EntityUtil (copy), AbilityId (copy)
    p8:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p9) -- Line: 42
        -- upvalues: Players (ref), KnitClient (ref), BedwarsKit (ref), EntityUtil (ref), AbilityId (ref)
        if p9.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.AGNI) then
            return nil;
        end;

        local v10 = EntityUtil:getEntity(Players.LocalPlayer);

        if not v10 then
            return nil;
        end;

        if p9.ability == AbilityId.ROCKET_DETONATE then
            if v10 ~= nil then
                v10 = v10:isAlive();
            end;

            if not v10 then
                p9:setCancelled(true);

                return nil;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            if not Character then
                p9:setCancelled(true);

                return nil;
            end;

            if Players.LocalPlayer.Character:HasTag("zipline-attached") then
                p9:setCancelled(true);

                return nil;
            end;
        end;
    end));
end;

function u4.onKitLocalDeactivated(p11) -- Line: 78
end;

function u4.onKitReplicationActivated(u12, u13) -- Line: 80
    -- upvalues: default (copy), CollectionService (copy), AgniKitUtil (copy), KnitClient2 (copy), StarterPlayer (copy), EntityUtil (copy), BedwarsKitSkin (copy), BedwarsKitSkinMeta (copy), GameSound (copy), SoundManager (copy), Players (copy)
    default.Client:OnEvent("RocketDetonateEvent", function(p14) -- Line: 81
        -- upvalues: u12 (copy), CollectionService (ref), AgniKitUtil (ref), KnitClient2 (ref), StarterPlayer (ref), EntityUtil (ref), BedwarsKitSkin (ref), BedwarsKitSkinMeta (ref), GameSound (ref), SoundManager (ref), Players (ref)
        if p14.player then
            u12:detonateRocketAbility();
            local Character = p14.player.Character;

            if not Character then
                return nil;
            end;

            local PrimaryPart = Character.PrimaryPart;

            if not PrimaryPart then
                return nil;
            end;

            local Humanoid = Character:FindFirstChild("Humanoid");
            Humanoid.JumpHeight = 3;
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
            local UpperTorso = Character:FindFirstChild("UpperTorso");

            if UpperTorso ~= nil then
                UpperTorso = UpperTorso:FindFirstChild("BodyBackAttachment");
            end;

            local function _(p15) -- Line: 102
                return p15:IsA("ParticleEmitter");
            end;

            local v16 = 0;
            local u17 = {};

            for i, child in UpperTorso:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") == true then
                    v16 = v16 + 1;
                    u17[v16] = child;
                end;
            end;

            local function _(p18) -- Line: 116
                -- upvalues: CollectionService (ref)
                return CollectionService:AddTag(p18, "FirstPersonHidden");
            end;

            for i, v in u17 do
                local _ = i - 1;
                CollectionService:AddTag(v, "FirstPersonHidden");
            end;

            local u19 = nil;
            u19 = Humanoid.Jumping:Connect(function() -- Line: 124
                -- upvalues: PrimaryPart (copy), AgniKitUtil (ref), u19 (ref), KnitClient2 (ref), StarterPlayer (ref)
                PrimaryPart:ApplyImpulse(AgniKitUtil.ROCKET_UPDRAFT_IMPULSE * PrimaryPart.AssemblyMass);
                u19:Disconnect();
                KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
            end);
            u12.maid:GiveTask(u19);
            u12.maid:GiveTask(function() -- Line: 133
                -- upvalues: KnitClient2 (ref), StarterPlayer (ref)
                KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
            end);
            local v20 = EntityUtil:getEntity(p14.player);
            local v21;

            if KnitClient2.Controllers.KitSkinController:getKitSkin(p14.player) == BedwarsKitSkin.SPIRIT_AGNI then
                v21 = BedwarsKitSkinMeta[BedwarsKitSkin.SPIRIT_AGNI].agni.satchelSound;
            else
                v21 = GameSound.PYRO_ROCKET;
            end;

            local v22 = {};

            if p14.player == Players.LocalPlayer then
                v20 = nil;
            elseif v20 ~= nil then
                v20 = v20:getInstance():GetPrimaryPartCFrame().Position;
            end;

            v22.position = v20;
            v22.rollOffMaxDistance = 100;
            local u23 = SoundManager:playSound(v21, v22);
            task.delay(1.5, function() -- Line: 154
                -- upvalues: u23 (copy), CollectionService (ref), u17 (copy)
                u23:Destroy();

                local function _(p24) -- Line: 156
                    -- upvalues: CollectionService (ref)
                    return CollectionService:RemoveTag(p24, "FirstPersonHidden");
                end;

                for i, v in u17 do
                    local _ = i - 1;
                    CollectionService:RemoveTag(v, "FirstPersonHidden");
                end;
            end);
        end;
    end):andThen(function(p25) -- Line: 165
        -- upvalues: u13 (copy)
        u13:GiveTask(p25);
    end);
end;

function u4.onKitReplicationDeactivated(p26) -- Line: 170
end;

function u4.onInnateAbilityEnabled(p27, p28, p29) -- Line: 172
end;

function u4.onAbilityUsed(p30, p31, p32) -- Line: 174
end;

function u4.KnitStart(p33) -- Line: 176
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p33);
end;

function u4.detonateRocketAbility(p34) -- Line: 179
    local activateRocketAbilityMaid = p34.activateRocketAbilityMaid;

    if activateRocketAbilityMaid ~= nil then
        activateRocketAbilityMaid:DoCleaning();
    end;
end;

KnitClient.CreateController(u4.new());

return nil;