-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local CloudEnchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent.Parent, "armor-augment-controller").ArmorAugmentController;
local CloudEnergyComponent = RuntimeLib.import(script, script.Parent, "cloud-energy-component").CloudEnergyComponent;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "CloudEnchantController";
    end,

    __index = ArmorAugmentController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 40
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy), u2 (copy)
    ArmorAugmentController.constructor(p7, ArmorEnchantType.CLOUD, StatusEffectType.ENCHANT_CLOUD);
    p7.Name = "CloudEnchantController";
    p7.cloudMap = {};
    p7.uiMaid = u2.new();
end;

function u5.KnitStart(u8) -- Line: 46
    -- upvalues: ArmorAugmentController (copy), ClientSyncEvents (copy), StatusEffectType (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), u2 (copy), Players (copy), Flamework (copy), u3 (copy), CloudEnergyComponent (copy), RunService (copy), MapUtil (copy), EntityUtil (copy), BlockEngine (copy), CloudEnchantUtil (copy), GameWorldUtil (copy)
    ArmorAugmentController.KnitStart(u8);
    ClientSyncEvents.StatusEffectAdded:connect(function(p9) -- Line: 48
        -- upvalues: StatusEffectType (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), u8 (copy), u2 (ref), Players (ref), Flamework (ref), u3 (ref), CloudEnergyComponent (ref)
        if p9.statusEffect ~= StatusEffectType.ENCHANT_CLOUD then
            return nil;
        end;

        local v10 = ReplicatedStorage.Assets.Effects.Cloud:Clone();
        v10.Material = Enum.Material.Snow;
        GameQueryUtil:setQueryIgnored(v10, true);
        v10.Parent = Workspace;
        u8.cloudMap[p9.entityInstance] = {
            yPos = 0,
            cloudIsActive = false,
            heightLimit = nil,
            cloud = v10,
            cloudVisibleMaid = u2.new()
        };

        if p9.entityInstance == Players.LocalPlayer.Character then
            u8.uiMaid:DoCleaning();
            u8.uiMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(CloudEnergyComponent, {
                character = p9.entityInstance
            }));
            u8.uiMaid:GiveTask(p9.entityInstance.AncestryChanged:Connect(function() -- Line: 71
                -- upvalues: u8 (ref)
                u8.uiMaid:DoCleaning();
            end));
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p11) -- Line: 76
        -- upvalues: StatusEffectType (ref), Players (ref), u8 (copy)
        if p11.statusEffect ~= StatusEffectType.ENCHANT_CLOUD then
            return nil;
        end;

        if p11.entityInstance == Players.LocalPlayer.Character then
            u8.uiMaid:DoCleaning();
        end;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 84
        -- upvalues: MapUtil (ref), u8 (copy), EntityUtil (ref), BlockEngine (ref), Players (ref), CloudEnchantUtil (ref), GameWorldUtil (ref)
        for _, v in MapUtil.entries(u8.cloudMap) do
            local v12 = v[1];
            local v13 = v[2];
            local cloud = v13.cloud;
            local v14 = EntityUtil:getEntity(v12);
            local v15 = not v12:IsA("Model");

            if not v15 then
                local v16;

                if v12 == nil then
                    v16 = v12;
                else
                    v16 = v12.PrimaryPart;
                end;

                v15 = not (v16 and (cloud.Parent and v14));
            end;

            if v15 then
                v13.cloudVisibleMaid:DoCleaning();
                v13.cloud:Destroy();
                u8.cloudMap[v12] = nil;
            else
                local yPos = v13.yPos;
                local Position = v12:GetPrimaryPartCFrame().Position;

                if Position then
                    local v17 = BlockEngine:getBlockPosition(Position) - Vector3.new(0, 1, 0);
                    local Y = BlockEngine:getWorldPosition(v17).Y;
                    local v18 = Position * Vector3.new(1, 0, 1) + Vector3.new(0, Y, 0);
                    local v19 = v12:GetAttribute("CloudEnergy");
                    local v20 = (v19 == nil and 0 or v19) > 0;
                    local v21 = v12:GetAttribute("CloudActive") == true;

                    if v12 == Players.LocalPlayer.Character then
                        v21 = CloudEnchantUtil:isAboveVoid(v14:getInstance()) and v20;
                        local v22 = GameWorldUtil.raycastDownToClosestFloor(v12.PrimaryPart.Position);

                        if v22 and v22.Distance < 4 then
                            v13.heightLimit = nil;
                        end;
                    end;

                    if v21 then
                        if yPos < v18.Y then
                            local v23 = Vector3.new(0, yPos, 0);
                            v18 = v18 * Vector3.new(1, 0, 1) + v23;
                        end;

                        cloud.Position = v18;
                    end;

                    v13.yPos = cloud.Position.Y;

                    if not v21 then
                        v13.yPos = v18.Y;
                    end;

                    if v13.cloudIsActive ~= v21 then
                        if v12 == Players.LocalPlayer.Character and (v21 and v13.heightLimit == nil) then
                            v13.heightLimit = v12.PrimaryPart.Position.Y;
                        end;

                        if v12 ~= Players.LocalPlayer.Character or (v13.heightLimit == nil or (not v21 or v12.PrimaryPart.Position.Y <= v13.heightLimit)) then
                            u8:setCloudEnabled(v12, v21);
                        end;
                    end;
                end;
            end;
        end;
    end);
end;

function u5.onArmorAugmentUpgraded(p24, p25) -- Line: 164
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(p25);
end;

function u5.onArmorAugmentProced(p26, p27, p28) -- Line: 167
end;

function u5.onArmorEnchantRemoved(p29, p30) -- Line: 169
end;

function u5.setCloudEnabled(p31, p32, p33) -- Line: 171
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), KnitClient (copy)
    local v34 = p31.cloudMap[p32];

    if not v34 then
        return nil;
    end;

    local cloud = v34.cloud;

    if cloud:GetAttribute("Enabled") == p33 then
        return nil;
    end;

    cloud:SetAttribute("Enabled", p33);
    v34.cloudIsActive = p33;

    local function _(p35) -- Line: 185
        return p35:IsA("ParticleEmitter");
    end;

    local v36 = 0;
    local u37 = {};

    for i, child in cloud:GetChildren() do
        local _ = i - 1;

        if child:IsA("ParticleEmitter") == true then
            v36 = v36 + 1;
            u37[v36] = child;
        end;
    end;

    local v38 = p32 == Players.LocalPlayer.Character;

    if v38 or cloud.Position then
        local v39;

        if p33 then
            v39 = GameSound.CLOUD_ENCHANT_SPAWN;
        else
            v39 = GameSound.CLOUD_ENCHANT_DESPAWN;
        end;

        local v40 = {};
        local v41;

        if v38 then
            v41 = nil;
        else
            v41 = cloud.Position;
        end;

        v40.position = v41;
        SoundManager:playSound(v39, v40);
    end;

    if not p33 then
        v34.cloudVisibleMaid:DoCleaning();

        return nil;
    end;

    local CLOUD_ENCHANT_LOOP = GameSound.CLOUD_ENCHANT_LOOP;
    local v42 = {};
    local v43;

    if v38 then
        v43 = nil;
    else
        v43 = cloud;
    end;

    v42.parent = v43;
    local u44 = SoundManager:playSound(CLOUD_ENCHANT_LOOP, v42);
    v34.cloudVisibleMaid:GiveTask(function() -- Line: 213
        -- upvalues: u44 (copy)
        local v45 = u44;

        if v45 ~= nil then
            v45:Stop();
        end;

        local v46 = u44;

        if v46 ~= nil then
            v46:Destroy();
        end;
    end);
    cloud.CanCollide = v38;

    local function _(p47) -- Line: 224
        p47.Enabled = true;

        return p47.Enabled;
    end;

    for i, v in u37 do
        local _ = i - 1;
        v.Enabled = true;
        local _ = v.Enabled;
    end;

    v34.cloudVisibleMaid:GiveTask(function() -- Line: 231
        -- upvalues: cloud (copy), u37 (copy)
        cloud.CanCollide = false;

        local function _(p48) -- Line: 233
            p48.Enabled = false;

            return p48.Enabled;
        end;

        for i, v in u37 do
            local _ = i - 1;
            v.Enabled = false;
            local _ = v.Enabled;
        end;
    end);

    if v38 then
        v34.cloudVisibleMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = 1.2
        }));
    end;
end;

KnitClient.CreateController(u5.new());

return nil;