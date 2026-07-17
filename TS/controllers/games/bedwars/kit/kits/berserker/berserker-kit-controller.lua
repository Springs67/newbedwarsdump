-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BerserkerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "berserker", "berserker-kit-balance").BerserkerKitBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local BerserkerKBStacksUI = RuntimeLib.import(script, script.Parent, "ui", "berserker-kb-stacks-ui").BerserkerKBStacksUI;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "BerserkerKitController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy), ReplicatedStorage (copy), BedwarsImageId (copy)
    BaseKitController.constructor(p8, BedwarsKit.BERSERKER, {
        sounds = { GameSound.BERSERKER_KIT_ACTIVATE, GameSound.BERSERKER_KIT_LOOP },
        animations = { AnimationType.FROSTY_SHIELD_SUMMON },
        instances = { ReplicatedStorage.Assets.Effects.BerserkerRageEffect },
        imageIds = { BedwarsImageId.BERSERKER_KIT_ABILITY }
    });
    p8.Name = "BerserkerKitController";
end;

function u6.KnitStart(p9) -- Line: 52
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p9);
end;

function u6.onKitLocalActivated(p10, p11) -- Line: 55
    -- upvalues: ClientStore (copy), ItemType (copy)
    ClientStore:dispatch({
        type = "BedwarsAddItemPurchased",
        itemType = ItemType.WOOD_AXE
    });
    p10:setUpTree();
end;

function u6.onKitLocalDeactivated(p12) -- Line: 62
    p12:unmountTree();
end;

function u6.onKitReplicationActivated(p13, p14) -- Line: 65
end;

function u6.onKitReplicationDeactivated(p15) -- Line: 67
end;

function u6.onInnateAbilityEnabled(p16, p17, p18) -- Line: 69
end;

function u6.onAbilityUsed(u19, p20, p21) -- Line: 71
    -- upvalues: AbilityId (copy), Players (copy)
    if p21.ability ~= AbilityId.BERSERKER_RAGE then
        return nil;
    end;

    local u22 = Players:GetPlayerFromCharacter(p20);

    if not u22 then
        return nil;
    end;

    task.spawn(function() -- Line: 79
        -- upvalues: u19 (copy), u22 (copy)
        u19:activateRageLogic(u22);
    end);
    task.spawn(function() -- Line: 82
        -- upvalues: u19 (copy), u22 (copy)
        u19:activateRageEffects(u22);
    end);
end;

function u6.activateRageLogic(p23, p24) -- Line: 86
    -- upvalues: u2 (copy), BlockEngine (copy), KnitClient (copy), BedwarsKit (copy), BerserkerKitBalance (copy), ClientSyncEvents (copy)
    local u25 = u2.new();
    u25:GiveTask(BlockEngine:getBlockDamageHook():connect(function(p26) -- Line: 89
        -- upvalues: KnitClient (ref), BedwarsKit (ref), BerserkerKitBalance (ref)
        if not KnitClient.Controllers.KitController:isUsingKit(p26.player, BedwarsKit.BERSERKER) then
            return nil;
        end;

        p26.damage = p26.damage * BerserkerKitBalance.RageBlockDamageBuff;
    end));
    local duration = ClientSyncEvents.BuffDurationModifierCheck:fire(BerserkerKitBalance.RageDuration).duration;
    task.delay(duration, function() -- Line: 96
        -- upvalues: u25 (copy)
        u25:DoCleaning();
    end);
    local Character = p24.Character;

    if Character ~= nil then
        Character.Destroying:Connect(function() -- Line: 101
            -- upvalues: u25 (copy)
            u25:DoCleaning();
        end);
    end;
end;

u6.highlightBeds = RuntimeLib.async(function(p27) -- Line: 106
    -- upvalues: u2 (copy), KnitClient2 (copy), Players (copy), u3 (copy)
    local u28 = u2.new();
    local u29 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    if not u29 then
        p27.logger:Info("No local player team");

        return u28;
    end;

    local function _(p30) -- Line: 114
        -- upvalues: u29 (copy)
        return not p30:HasTag("bed:" .. u29.id);
    end;

    local v31 = 0;
    local v32 = {};

    for i, v in KnitClient2.Controllers.BedwarsController:getAllBeds() do
        local _ = i - 1;

        if not v:HasTag("bed:" .. u29.id) == true then
            v31 = v31 + 1;
            v32[v31] = v;
        end;
    end;

    local function _(p33) -- Line: 127
        return p33:WaitForChild("Bed", 3);
    end;

    local v34 = 0;
    local v35 = {};

    for i, v in v32 do
        local _ = i - 1;
        local Bed = v:WaitForChild("Bed", 3);

        if Bed ~= nil then
            v34 = v34 + 1;
            v35[v34] = Bed;
        end;
    end;

    if #v35 == 0 then
        p27.logger:Info("No enemy team beds");

        return u28;
    end;

    local function v37(p36) -- Line: 146
        -- upvalues: u3 (ref), u28 (copy)
        u28:GiveTask((u3("Highlight", {
            FillTransparency = 0.5,
            OutlineTransparency = 0,
            Parent = p36,
            OutlineColor = Color3.fromRGB(255, 69, 105),
            FillColor = Color3.fromRGB(255, 69, 105),
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        })));
    end;

    for i, v in v35 do
        v37(v, i - 1, v35);
    end;

    return u28;
end);

function u6.activateRageEffects(u38, u39) -- Line: 162
    -- upvalues: u2 (copy), Players (copy), RuntimeLib (copy), ReplicatedStorage (copy), WeldUtil (copy), BerserkerKitBalance (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), default (copy), OutExpo (copy), ClientSyncEvents (copy)
    if not u39.Character then
        return nil;
    end;

    local u40 = u2.new();

    if u39 == Players.LocalPlayer then
        task.spawn(RuntimeLib.async(function() -- Line: 169
            -- upvalues: RuntimeLib (ref), u38 (copy), u40 (copy)
            local v41 = RuntimeLib.await(u38:highlightBeds());

            if u40 then
                u40:GiveTask(v41);

                return;
            end;

            v41:DoCleaning();
        end));
    end;

    local u42 = ReplicatedStorage.Assets.Effects.BerserkerRageEffect:Clone();
    u40:GiveTask(u42);
    u42.Parent = u39.Character;
    WeldUtil:weldAccessory(u39.Character, u42);
    local v43 = u42:GetDescendants();

    local function v46(u44) -- Line: 183
        -- upvalues: u40 (copy), u39 (copy), BerserkerKitBalance (ref)
        if u44:IsA("MeshPart") then
            u40:GiveTask(u39:GetAttributeChangedSignal(BerserkerKitBalance.KBStacksAttribute):Connect(function() -- Line: 185
                -- upvalues: u39 (ref), BerserkerKitBalance (ref), u44 (copy)
                local v45 = u39:GetAttribute(BerserkerKitBalance.KBStacksAttribute);

                if (v45 == 0 or (v45 ~= v45 or (v45 == "" or not v45))) and u44.Parent ~= nil then
                    u44.Transparency = 1;
                end;
            end));
        end;
    end;

    for i, v in v43 do
        v46(v, i - 1, v43);
    end;

    local u47 = GameAnimationUtil:playAnimation(u39.Character, AnimationType.FROSTY_SHIELD_SUMMON, {
        speed = 2
    });
    u40:GiveTask(function() -- Line: 200
        -- upvalues: u47 (copy)
        if u47 then
            u47:Destroy();
        end;
    end);
    local BERSERKER_KIT_ACTIVATE = GameSound.BERSERKER_KIT_ACTIVATE;
    local v48 = {};
    local v49;

    if u39 == Players.LocalPlayer then
        v49 = nil;
    else
        v49 = u39.Character:GetPivot().Position;
    end;

    v48.position = v49;
    local u50 = SoundManager:playSound(BERSERKER_KIT_ACTIVATE, v48);
    u40:GiveTask(function() -- Line: 209
        -- upvalues: u50 (copy)
        u50:Destroy();
    end);

    if u39 == Players.LocalPlayer then
        u40:GiveTask((SoundManager:playSound(GameSound.BERSERKER_KIT_LOOP, {
            position = nil,
            volumeMultiplier = 0.7,
            looped = true
        })));
    end;

    local function u55() -- Line: 220
        -- upvalues: u42 (copy), default (ref), OutExpo (ref), u40 (copy)
        local v51 = u42:GetDescendants();

        local function v54(u52) -- Line: 222
            -- upvalues: default (ref), OutExpo (ref)
            if u52:IsA("ParticleEmitter") or u52:IsA("MeshPart") then
                task.spawn(function() -- Line: 224
                    -- upvalues: default (ref), OutExpo (ref), u52 (copy)
                    default(1, OutExpo, function(p53) -- Line: 225
                        -- upvalues: u52 (ref)
                        u52.LocalTransparencyModifier = p53;
                    end, 0, 1):Play();
                end);

                if u52:IsA("ParticleEmitter") then
                    u52.Enabled = false;
                end;
            end;
        end;

        for i, v in v51 do
            v54(v, i - 1, v51);
        end;

        task.wait(1);
        u40:DoCleaning();
    end;

    local duration = ClientSyncEvents.BuffDurationModifierCheck:fire(BerserkerKitBalance.RageDuration).duration;
    task.delay(duration, function() -- Line: 241
        -- upvalues: u55 (copy)
        u55();
    end);
    u39.Character.Destroying:Connect(function() -- Line: 244
        -- upvalues: u55 (copy)
        u55();
    end);
end;

function u6.setUpTree(u56) -- Line: 248
    -- upvalues: Players (copy), BerserkerKitBalance (copy), KnitClient (copy), u4 (copy), BerserkerKBStacksUI (copy)
    u56:unmountTree();

    if not u56.stackTree then
        local v57 = Players.LocalPlayer:GetAttribute(BerserkerKitBalance.KBStacksAttribute);
        u56.stackTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u4.createElement(BerserkerKBStacksUI, {
            stacks = v57
        }));
    end;

    Players.LocalPlayer:GetAttributeChangedSignal(BerserkerKitBalance.KBStacksAttribute):Connect(function() -- Line: 256
        -- upvalues: u56 (copy)
        u56:updateTree();
    end);
end;

function u6.updateTree(p58) -- Line: 260
    -- upvalues: Players (copy), BerserkerKitBalance (copy), u4 (copy), BerserkerKBStacksUI (copy)
    if p58.stackTree then
        local v59 = Players.LocalPlayer:GetAttribute(BerserkerKitBalance.KBStacksAttribute);
        u4.update(p58.stackTree, u4.createElement(BerserkerKBStacksUI, {
            stacks = v59
        }));
    end;
end;

function u6.unmountTree(p60) -- Line: 268
    -- upvalues: u4 (copy)
    if p60.stackTree then
        u4.unmount(p60.stackTree);
        p60.stackTree = nil;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;