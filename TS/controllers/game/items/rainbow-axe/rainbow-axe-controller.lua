-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local v3 = {};
local u4 = setmetatable({}, {
    __index = v3
});
u4.Red = 0;
v3[0] = "Red";
u4.Orange = 1;
v3[1] = "Orange";
u4.Yellow = 2;
v3[2] = "Yellow";
u4.Green = 3;
v3[3] = "Green";
u4.Blue = 4;
v3[4] = "Blue";
u4.Indigo = 5;
v3[5] = "Indigo";
u4.Violet = 6;
v3[6] = "Violet";
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "RainbowAxeController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 56
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 60
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p7);
    p7.Name = "RainbowAxeController";
    p7.axeTargetMap = {};
    p7.prismModelMap = {};
    p7.prismCountMap = {};
end;

function u5.KnitStart(u8) -- Line: 67
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), TweenService (copy), BalanceFile (copy), default (copy), ReplicatedStorage (copy), WeldUtil (copy), CollectionService (copy)
    HandKnitController.KnitStart(u8);
    ClientSyncEvents.AbilityUsed:connect(function(p9) -- Line: 69
        -- upvalues: AbilityId (ref), Players (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), u8 (copy), TweenService (ref), BalanceFile (ref)
        if p9.ability == AbilityId.RAINBOW_AXE then
            local v10 = Players:GetPlayerFromCharacter(p9.userCharacter);

            if not v10 then
                return nil;
            end;

            if v10 == Players.LocalPlayer then
                AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.WINTER_BOSS_RAISE_AXE));
                SoundManager:playSound(GameSound.RAINBOW_AXE_ABILITY);
            end;

            local v11 = u8.axeTargetMap[v10];

            if not v11 then
                return nil;
            end;

            for _, v in v11 do
                task.spawn(function() -- Line: 84
                    -- upvalues: u8 (ref), v (copy), TweenService (ref), BalanceFile (ref)
                    local v12 = u8.prismModelMap[v];

                    if not v12 then
                        return nil;
                    end;

                    local v13 = u8.prismCountMap[v];

                    if v13 == 0 or (v13 ~= v13 or not v13) then
                        return nil;
                    end;

                    local Handle = v12:WaitForChild("Handle");
                    local v14 = u8:returnPrismColorNames(v13);
                    local v15 = false;
                    local v16 = 0;

                    while true do
                        if v15 then
                            v16 = v16 + 1;
                        else
                            v15 = true;
                        end;

                        if v16 >= #v14 then
                            v12:Destroy();
                            u8.prismModelMap[v] = nil;
                            u8.prismCountMap[v] = nil;

                            return;
                        end;

                        for _, descendant in Handle:GetDescendants() do
                            if descendant:IsA("MeshPart") and descendant.Name == v14[v16 + 1] then
                                TweenService:Create(descendant, TweenInfo.new(BalanceFile.RAINBOW_AXE_PRISM_INTERVAL - 0.05), {
                                    Transparency = 1
                                }):Play();
                                local Beam = descendant:WaitForChild("Beam");

                                if Beam then
                                    Beam.Enabled = false;
                                end;

                                task.wait(BalanceFile.RAINBOW_AXE_PRISM_INTERVAL - 0.05);
                            end;
                        end;
                    end;
                end);
            end;

            u8.axeTargetMap[v10] = nil;
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(u17) -- Line: 129
        -- upvalues: u8 (copy)
        if u8.prismCountMap[u17.entityInstance] ~= nil then
            u8.prismCountMap[u17.entityInstance] = nil;
        end;

        if u8.prismModelMap[u17.entityInstance] ~= nil then
            u8.prismModelMap[u17.entityInstance] = nil;
        end;

        local function _(p18) -- Line: 145
            -- upvalues: u17 (copy)
            if table.find(p18, u17.entityInstance) ~= nil then
                local v19 = (table.find(p18, u17.entityInstance) or 0) - 1;
                table.remove(p18, v19 + 1);
            end;
        end;

        for _, v in u8.axeTargetMap do
            if table.find(v, u17.entityInstance) ~= nil then
                local v20 = (table.find(v, u17.entityInstance) or 0) - 1;
                table.remove(v, v20 + 1);
            end;
        end;
    end);
    default.Client:OnEvent("AddRainbowPrism", function(p21) -- Line: 159
        -- upvalues: u8 (copy), ReplicatedStorage (ref), WeldUtil (ref), Players (ref), CollectionService (ref), TweenService (ref)
        u8.prismCountMap[p21.targetEntity] = p21.prismCount;
        local v22 = u8.prismModelMap[p21.targetEntity];

        if v22 == nil then
            v22 = ReplicatedStorage.Assets.Misc.RainbowAxePrisms:Clone();
            u8.prismModelMap[p21.targetEntity] = v22;

            local function _(p23) -- Line: 175
                if p23:IsA("BasePart") then
                    p23.Transparency = 1;

                    return;
                end;

                if p23:IsA("Beam") then
                    p23.Enabled = false;
                end;
            end;

            for i, descendant in v22:WaitForChild("Handle"):GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                elseif descendant:IsA("Beam") then
                    descendant.Enabled = false;
                end;
            end;

            p21.targetEntity.Humanoid:AddAccessory(v22);
            v22.Parent = p21.targetEntity;
            WeldUtil:weldCharacterAccessories(p21.targetEntity);

            if p21.targetEntity == Players.LocalPlayer.Character then
                CollectionService:AddTag(v22, "FirstPersonHidden");
            end;
        end;

        local Handle = v22:WaitForChild("Handle");
        local v24 = u8:returnPrismColorNames(p21.prismCount);
        local v25 = #v24;
        local u26 = v24[v25];
        v24[v25] = nil;
        local v27 = Handle:GetDescendants();

        local function v29(p28) -- Line: 202
            -- upvalues: u26 (copy), TweenService (ref)
            if p28:IsA("MeshPart") and p28.Name == u26 then
                TweenService:Create(p28, TweenInfo.new(0.6), {
                    Transparency = 0.25
                }):Play();
                local Beam = p28:WaitForChild("Beam");

                if Beam then
                    Beam.Enabled = true;
                end;
            end;
        end;

        for i, v in v27 do
            v29(v, i - 1, v27);
        end;

        local v30 = u8.axeTargetMap[p21.fromPlayer];
        local v31 = v30 == nil and {} or v30;

        if table.find(v31, p21.targetEntity) == nil then
            table.insert(v31, p21.targetEntity);
            u8.axeTargetMap[p21.fromPlayer] = v31;
        end;
    end);
end;

function u5.returnPrismColorNames(p32, p33) -- Line: 236
    -- upvalues: u4 (ref)
    local v34 = false;
    local v35 = 0;
    local v36 = {};

    while true do
        if v34 then
            v35 = v35 + 1;
        else
            v34 = true;
        end;

        if v35 >= p33 then
            return v36;
        end;

        table.insert(v36, u4[v35]);
    end;
end;

function u5.isRelevantItem(p37, p38) -- Line: 256
    -- upvalues: ItemType (copy)
    return p38.itemType == ItemType.RAINBOW_AXE;
end;

function u5.onEnable(p39, p40, p41) -- Line: 259
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy), AbilityState (copy)
    p39:setupDestroyableYield(function() -- Line: 260
        -- upvalues: Flamework (ref), AbilityId (ref), BedwarsImageId (ref), AbilityState (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.RAINBOW_AXE, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.CLOUD_ENCHANT,
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(247, 133, 212)
                }
            }
        }):expect();
    end);
end;

function u5.onDisable(p42) -- Line: 272
end;

KnitClient.CreateController(u5.new());

return nil;