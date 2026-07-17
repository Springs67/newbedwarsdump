-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BackpackKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "backpack-knit-controller").BackpackKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local FireworkBackpackBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "firework-backpack", "firework-backpack-balance").FireworkBackpackBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "FireworkBackpackController";
    end,

    __index = BackpackKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: BackpackKnitController (copy), u1 (copy)
    BackpackKnitController.constructor(p4);
    p4.Name = "FireworkBackpackController";
    p4.abilityMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 36
    -- upvalues: BackpackKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), default (copy), Players (copy), Flamework (copy), CooldownId (copy), FireworkBackpackBalance (copy), SoundManager (copy), FireworkType (copy)
    BackpackKnitController.KnitStart(p5);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.FIREWORK_BACKPACK, {
        sounds = { GameSound.FIREWORK_LAUNCH }
    });
    default.Client:Get("FireFireworkBackpack"):Connect(function(p6) -- Line: 41
        -- upvalues: Players (ref), Flamework (ref), CooldownId (ref), FireworkBackpackBalance (ref), SoundManager (ref), GameSound (ref), KnitClient (ref), FireworkType (ref)
        local Character = p6.player.Character;

        if not Character then
            return nil;
        end;

        local PrimaryPart = Character.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        if p6.player == Players.LocalPlayer then
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Humanoid");
            end;

            local AssemblyMass = PrimaryPart.AssemblyMass;
            local v7 = PrimaryPart.AssemblyLinearVelocity.Y * AssemblyMass;

            if Character2 ~= nil then
                Character2 = Character2:GetState();
            end;

            local v8 = Character2 == Enum.HumanoidStateType.Landed and 0 or v7;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.BACKPACK, FireworkBackpackBalance.COOLDOWN);
            PrimaryPart:ApplyImpulse((Vector3.new(0, p6.power * AssemblyMass - v8, 0)));
            SoundManager:playSound(GameSound.FIREWORK_LAUNCH);
        else
            SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
                position = PrimaryPart.Position
            });
        end;

        KnitClient.Controllers.ExplosionController:playExplodeEffect(PrimaryPart.Position, 1, {
            disableSound = true
        });
        local Character2 = p6.player.Character;

        if Character2 ~= nil then
            Character2 = Character2:FindFirstChild("firework_backpack");
        end;

        if Character2 then
            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Handle");

                if Character2 ~= nil then
                    Character2 = Character2:FindFirstChild("EffectsAttachment");
                end;
            end;

            if Character2 ~= nil then
                local function _(p9) -- Line: 96
                    if p9:IsA("ParticleEmitter") or (p9:IsA("PointLight") or p9:IsA("Trail")) then
                        p9.Enabled = true;
                    end;
                end;

                for i, child in Character2:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") or (child:IsA("PointLight") or child:IsA("Trail")) then
                        child.Enabled = true;
                    end;
                end;
            end;

            task.delay(FireworkBackpackBalance.FLIGHT_DURATION, function() -- Line: 105
                -- upvalues: Character (copy), KnitClient (ref), PrimaryPart (copy), FireworkType (ref), Character2 (copy)
                if Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                    KnitClient.Controllers.FireworkController:playFireworkEffect(PrimaryPart.Position + Vector3.new(0, 5, 0), FireworkType.NEW_YEARS, {
                        sizeMultiplier = 0.4,
                        volumeMultiplier = 1
                    });
                end;

                local v10 = Character2;

                if v10 ~= nil then
                    local function _(p11) -- Line: 118
                        if p11:IsA("ParticleEmitter") or (p11:IsA("PointLight") or p11:IsA("Trail")) then
                            p11.Enabled = false;
                        end;
                    end;

                    for i, child in v10:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("ParticleEmitter") or (child:IsA("PointLight") or child:IsA("Trail")) then
                            child.Enabled = false;
                        end;
                    end;
                end;
            end);
        end;
    end);
end;

function u2.isRelevantItem(p12, p13) -- Line: 131
    -- upvalues: ItemType (copy)
    return p13.itemType == ItemType.FIREWORK_BACKPACK;
end;

function u2.onEnable(u14, p15, p16) -- Line: 134
    -- upvalues: Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy)
    local u17 = true;
    u14.abilityMaid:GiveTask(function() -- Line: 136
        -- upvalues: u17 (ref)
        u17 = false;

        return u17;
    end);
    task.spawn(function() -- Line: 140
        -- upvalues: Flamework (ref), AbilityId (ref), getItemMeta (ref), ItemType (ref), u17 (ref), u14 (copy)
        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local FIREWORK_BACKPACK = AbilityId.FIREWORK_BACKPACK;
        local v19 = {};
        local v20 = {};
        local image = getItemMeta(ItemType.FIREWORK_BACKPACK).image;
        v20.icon = image == nil and "" or image;
        v19.abilityButton = v20;
        v19.abilityType = "MiscPrimary";
        local v21 = v18:enableAbility(FIREWORK_BACKPACK, v19):expect();

        if u17 then
            u14.abilityMaid:GiveTask(v21);

            return;
        end;

        v21.Destroy();
    end);
end;

function u2.onDisable(p22) -- Line: 162
    p22.abilityMaid:DoCleaning();
end;

KnitClient.CreateController(u2.new());

return nil;