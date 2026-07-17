-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ContractChangeReason = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-assassin-util").ContractChangeReason;
local BloodUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local ContractSelectApp = RuntimeLib.import(script, script.Parent, "ui", "contract-select-app").ContractSelectApp;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "BloodAssassinController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u2 (copy)
    BaseKitController.constructor(p7, BedwarsKit.BLOOD_ASSASSIN);
    p7.Name = "BloodAssassinController";
    p7.activeContractMaid = u2.new();
    p7.bleedingInstances = {};
    p7.thrillOfHuntActive = false;
end;

function u5.onKitLocalActivated(u8, p9) -- Line: 50
    -- upvalues: ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), ClientStore (copy), BloodUpgrade (copy), default (copy), u2 (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), Flamework (copy), ContractChangeReason (copy)
    p9:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p10) -- Line: 51
        -- upvalues: StatusEffectType (ref), Players (ref), ClientStore (ref), BloodUpgrade (ref), u8 (copy)
        if p10.statusEffect ~= StatusEffectType.BLEED then
            return nil;
        end;

        if p10.entityInstance:GetAttribute("BleedSource") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        local v11 = ClientStore:getState().Kit.bloodUpgrades[BloodUpgrade.THRILL_OF_THE_HUNT];

        if v11 == 0 or (v11 ~= v11 or not v11) then
            return nil;
        end;

        u8.bleedingInstances[p10.entityInstance] = true;
    end));
    p9:GiveTask(ClientSyncEvents.StatusEffectRemoved:connect(function(p12) -- Line: 68
        -- upvalues: StatusEffectType (ref), u8 (copy)
        if p12.statusEffect == StatusEffectType.BLEED then
            u8.bleedingInstances[p12.entityInstance] = nil;
        end;
    end));
    p9:GiveTask((default.Client:Get("BloodAssassinUpdateUpgrades"):Connect(function(p13) -- Line: 75
        -- upvalues: ClientStore (ref), BloodUpgrade (ref), u8 (copy), Players (ref), u2 (ref), KnitClient (ref)
        ClientStore:dispatch({
            type = "SetBloodUpgrades",
            upgrades = p13.upgrades
        });
        local v14 = p13.upgrades[BloodUpgrade.THRILL_OF_THE_HUNT];

        if v14 ~= 0 and (v14 == v14 and v14) then
            v14 = not u8.thrillOfHuntActive;
        end;

        if v14 ~= 0 and (v14 == v14 and v14) then
            u8.thrillOfHuntActive = true;
            local v15 = nil;

            while true do
                local v16 = task.wait(0.05);

                if v16 == 0 or (v16 ~= v16 or not v16) then
                    break;
                end;

                local v17 = false;
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.CFrame;
                    end;
                end;

                if Character then
                    for i in u8.bleedingInstances do
                        local PrimaryPart = i.PrimaryPart;

                        if PrimaryPart ~= nil then
                            PrimaryPart = PrimaryPart.Position;
                        end;

                        if PrimaryPart then
                            v17 = v17 or Character.LookVector:Dot((PrimaryPart - Character.Position).Unit) > 0.7071067811865476;

                            if v17 then
                                break;
                            end;
                        end;
                    end;

                    if v17 and not v15 then
                        v15 = u2.new();
                        v15:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                            moveSpeedMultiplier = 1.15
                        }));
                    elseif v15 == nil then
                        v15 = nil;
                    else
                        v15:DoCleaning();
                        v15 = nil;
                    end;
                elseif v15 == nil then
                    v15 = nil;
                else
                    v15:DoCleaning();
                    v15 = nil;
                end;
            end;
        end;
    end)));
    p9:GiveTask((default.Client:Get("BloodAssassinUpdateAvailableContracts"):Connect(function(p18) -- Line: 147
        -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), ClientStore (ref)
        if #p18.contracts > 0 then
            SoundManager:playSound(GameSound.SHIELD_BLOCKED);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                message = "New contracts are available"
            });
        end;

        ClientStore:dispatch({
            type = "SetAvailableContracts",
            contracts = p18.contracts
        });
    end)));
    p9:GiveTask((default.Client:Get("BloodAssassinSetActiveContract"):Connect(function(p19) -- Line: 160
        -- upvalues: SoundManager (ref), GameSound (ref), ContractChangeReason (ref), u8 (copy)
        if p19.activeContract then
            SoundManager:playSound(GameSound.CAITLYN_CONTRACT_ACCEPT);
        end;

        if p19.changeReason == ContractChangeReason.CONTRACT_SUCCESS then
            SoundManager:playSound(GameSound.CAITLYN_CONTRACT_FINISH, {
                volumeMultiplier = 0.4
            });
        end;

        u8:updateActiveContract(p19.activeContract, false);
    end)));
end;

function u5.onKitLocalDeactivated(p20) -- Line: 173
end;

function u5.onKitReplicationActivated(p21, p22) -- Line: 175
    -- upvalues: EntityDamageEventZap (copy), DamageType (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local u38 = EntityDamageEventZap.On(function(p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36) -- Line: 176
        -- upvalues: DamageType (ref), ReplicatedStorage (ref), EffectUtil (ref)
        if p25 == DamageType.BLEED then
            local v37 = ReplicatedStorage.Assets.Effects.BloodAssassinDecay:Clone();
            v37.Parent = p23.PrimaryPart;
            EffectUtil:playEffects({ v37 }, p23, {
                destroyAfterSec = 2
            });
        end;
    end);
    p22:GiveTask(function() -- Line: 185
        -- upvalues: u38 (copy)
        u38();
    end);
end;

function u5.onKitReplicationDeactivated(p39) -- Line: 189
end;

function u5.onInnateAbilityEnabled(p40, p41, p42) -- Line: 191
end;

function u5.onAbilityUsed(p43, p44, p45) -- Line: 193
    -- upvalues: Players (copy), AbilityId (copy), Flamework (copy), ContractSelectApp (copy), UILayers (copy)
    if p44 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    if p45.ability ~= AbilityId.BLOOD_ASSASSIN_MENU then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "ContractSelect",
        app = ContractSelectApp,
        layer = UILayers.MAIN
    }, {
        AppId = "ContractSelect"
    });
end;

function u5.updateActiveContract(u46, p47, p48) -- Line: 208
    -- upvalues: default (copy), Workspace (copy), ClientStore (copy), WatchPlayerCharacter (copy), u3 (copy)
    u46.activeContractMaid:DoCleaning();

    if p48 then
        local v49 = default.Client:Get("BloodAssassinSelectContract");
        local v50 = {};
        local v51;

        if p47 == nil then
            v51 = p47;
        else
            v51 = p47.id;
        end;

        v50.contractId = v51;
        v49:SendToServer(v50);
    end;

    local v52;

    if p47 then
        local activationTime = p47.activationTime;

        if activationTime == 0 then
            activationTime = false;
        elseif activationTime ~= activationTime then
            activationTime = false;
        end;

        v52 = not activationTime;
    else
        v52 = p47;
    end;

    if v52 then
        p47.activationTime = Workspace:GetServerTimeNow();
    end;

    ClientStore:dispatch({
        type = "SetActiveContract",
        activeContract = p47
    });

    if p47 then
        u46.activeContractMaid:GiveTask(WatchPlayerCharacter(p47.target, function(p53) -- Line: 234
            -- upvalues: u3 (ref), u46 (copy)
            local v54 = u3("Highlight", {
                FillTransparency = 0.7,
                OutlineTransparency = 0.2,
                FillColor = Color3.fromRGB(255, 29, 0),
                OutlineColor = Color3.fromRGB(243, 128, 108),
                Parent = p53
            });
            u46.activeContractMaid:GiveTask(v54);
        end));
    end;
end;

KnitClient.CreateController(u5.new());

return nil;