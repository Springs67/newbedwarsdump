-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local CommonEffectsUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "util", "common-effects-util").CommonEffectsUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local StarCollectorDisplay = RuntimeLib.import(script, script.Parent, "ui", "star-collector-display").StarCollectorDisplay;
local StarCollectorNotification = RuntimeLib.import(script, script.Parent, "ui", "star-collector-notification").StarCollectorNotification;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "StarConsumableController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p5);
    p5.Name = "StarConsumableController";
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), EffectUtil (copy), default (copy), EntityUtil (copy), Flamework (copy), u1 (copy), StarCollectorNotification (copy), KnitClient (copy), StarCollectorDisplay (copy)
    HandKnitController.KnitStart(u6);
    ClientSyncEvents.ItemConsumed:connect(function(p7) -- Line: 41
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), EffectUtil (ref)
        if p7.itemType == ItemType.VITALITY_STAR or p7.itemType == ItemType.CRIT_STAR then
            local v8 = p7.entity:getInstance();
            local v9 = {};

            if v8 then
                SoundManager:playSound(GameSound.STAR_CRUSH, {
                    position = v8.HumanoidRootPart.Position
                });

                for _, child in ReplicatedStorage.Assets.Effects.ConsumeStarEffect:Clone():GetChildren() do
                    child.Parent = v8.HumanoidRootPart;
                    table.insert(v9, child);
                end;
            end;

            if p7.itemType == ItemType.VITALITY_STAR then
                for _, v in v9 do
                    for _, child in v:GetChildren() do
                        if child:IsA("ParticleEmitter") then
                            child.Color = ColorSequence.new(Color3.fromRGB(85, 255, 127));
                        end;
                    end;
                end;
            elseif p7.itemType == ItemType.CRIT_STAR then
                for _, v in v9 do
                    for _, child in v:GetChildren() do
                        if child:IsA("ParticleEmitter") then
                            child.Color = ColorSequence.new(Color3.fromRGB(253, 166, 91));
                        end;
                    end;
                end;
            end;

            EffectUtil:playEffects(v9, v8, {
                destroyAfterSec = 2
            });
        end;
    end);
    default.Client:OnEvent("StarBuff", function(p10) -- Line: 78
        -- upvalues: EntityUtil (ref), ItemType (ref), Flamework (ref), u1 (ref), StarCollectorNotification (ref), u6 (copy), KnitClient (ref), StarCollectorDisplay (ref)
        if EntityUtil:getEntity(p10.player) == nil then
            return nil;
        end;

        if p10.starType == ItemType.VITALITY_STAR then
            local u11 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u1.createElement(StarCollectorNotification, {
                text = "Max Health +" .. tostring(p10.buff) .. "!",
                textColor3 = Color3.fromRGB(85, 255, 127)
            }));
            task.delay(3, function() -- Line: 90
                -- upvalues: u11 (copy)
                u11:DoCleaning();
            end);
        elseif p10.starType == ItemType.CRIT_STAR then
            local v12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController");
            local createElement = u1.createElement;
            local v13 = {};
            local v14 = math.round(p10.buff * 100);
            v13.text = "Crit Rate +" .. tostring(v14) .. "%!";
            v13.textColor3 = Color3.fromRGB(252, 201, 92);
            local u15 = v12:addComponent(createElement(StarCollectorNotification, v13));
            task.delay(3, function() -- Line: 99
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end);
        end;

        if u6.starCollectorTree then
            u1.update(u6.starCollectorTree, u1.createElement(StarCollectorDisplay, {
                greenStars = p10.stats.greenStars,
                yellowStars = p10.stats.yellowStars
            }));

            return;
        end;

        u6.starCollectorTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u1.createElement(StarCollectorDisplay, {
            greenStars = p10.stats.greenStars,
            yellowStars = p10.stats.yellowStars
        }));
    end);
end;

function u3.isRelevantItem(p16, p17) -- Line: 116
    -- upvalues: ItemType (copy)
    return p17.itemType == ItemType.CRIT_STAR and true or p17.itemType == ItemType.VITALITY_STAR;
end;

function u3.onEnable(p18) -- Line: 119
    -- upvalues: Players (copy), CommonEffectsUtil (copy), BalanceFile (copy)
    local Character = Players.LocalPlayer.Character;
    local v19;

    if Character == nil then
        v19 = Character;
    else
        v19 = Character.PrimaryPart;
    end;

    if v19 then
        local v20 = Character:FindFirstChildOfClass("Humanoid");

        if v20 ~= nil then
            v20 = v20.HipHeight;
        end;

        local v21 = {
            positionOverride = (v19:GetPivot() - Vector3.new(0, v20 == nil and 0 or v20, 0)).Position,
            size = BalanceFile.StarCollectorStella.TEAM_BUFF_RANGE * 2
        };
        p18.ringAuraEffect = CommonEffectsUtil.attachRingAura(v19, v21);
    end;
end;

function u3.onDisable(p22) -- Line: 146
    local ringAuraEffect = p22.ringAuraEffect;

    if ringAuraEffect ~= nil then
        ringAuraEffect:Destroy();
    end;
end;

KnitClient.CreateController(u3.new());

return nil;