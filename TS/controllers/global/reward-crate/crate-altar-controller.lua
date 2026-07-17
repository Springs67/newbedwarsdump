-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchComponent = v1.WatchComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CrateAltarComponent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "crate", "crate-altar-component").CrateAltarComponent;
local RewardCrateComponent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "crate", "reward-crate-component").RewardCrateComponent;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local CratePickerApp = RuntimeLib.import(script, script.Parent, "ui", "crate-picker").CratePickerApp;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "CrateAltarController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "CrateAltarController";
    p5.altars = {};
    p5.activeCrates = {};
end;

function u3.KnitStart(u6) -- Line: 41
    -- upvalues: KnitController (copy), default (copy), WatchCollectionTag (copy), ComponentUtil (copy), CrateAltarComponent (copy), Flamework (copy), CratePickerApp (copy), UILayers (copy), WatchComponent (copy), RewardCrateComponent (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u6);
    local v7 = default.Client:GetNamespace("RewardCrate");
    WatchCollectionTag("CrateAltar", function(p8) -- Line: 45
        -- upvalues: ComponentUtil (ref), CrateAltarComponent (ref), u6 (copy), Flamework (ref), CratePickerApp (ref), UILayers (ref)
        local u9 = ComponentUtil:waitForComponent(p8, CrateAltarComponent);

        if not u9 then
            return nil;
        end;

        u6.altars[u9.attributes.id] = u9;
        u9.instance.ProximityPart.ChooseCratePrompt.Triggered:Connect(function(p10) -- Line: 53
            -- upvalues: Flamework (ref), CratePickerApp (ref), UILayers (ref), u9 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "CratePicker",
                app = CratePickerApp,
                layer = UILayers.MAIN
            }, {
                AppId = "CratePicker",
                CrateAltarId = u9.attributes.id
            });
        end);
    end);
    WatchComponent(RewardCrateComponent, function(p11) -- Line: 64
        -- upvalues: u6 (copy)
        if p11.attributes.altarId == nil then
            return nil;
        end;

        local v12 = u6.activeCrates[p11.attributes.altarId];

        if not v12 then
            u6.activeCrates[p11.attributes.altarId] = { p11 };

            return;
        end;

        table.insert(v12, p11);
        u6.activeCrates[p11.attributes.altarId] = v12;
    end);
    v7:Get("CrateAltarDeactivated"):Connect(function(p13) -- Line: 86
        -- upvalues: u6 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        local u14 = u6.altars[p13.altarId];

        if u14 ~= nil then
            u14 = u14:getCratesFolder();

            if u14 ~= nil then
                u14 = u14:GetChildren();
            end;
        end;

        task.spawn(function() -- Line: 99
            -- upvalues: u14 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
            local v15 = u14;

            if v15 ~= nil then
                local function _(u16, p17) -- Line: 102
                    -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                    if not u16:IsA("Model") then
                        return nil;
                    end;

                    task.delay(p17 * 0.5, function() -- Line: 106
                        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u16 (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                        local v18 = ReplicatedStorage.Assets.Effects.DragonEmblemExplode:Clone();
                        v18.Parent = Workspace;
                        v18.CFrame = u16:GetPivot();
                        EffectUtil:playEffects({ v18 }, nil);
                        SoundManager:playSound(GameSound.KALIYAH_EXPLOSION, {
                            position = u16:GetPivot().Position
                        });
                        u16:Destroy();
                    end);
                end;

                for i, v in v15 do
                    local v19 = i - 1;

                    if v:IsA("Model") then
                        task.delay(v19 * 0.5, function() -- Line: 106
                            -- upvalues: ReplicatedStorage (ref), Workspace (ref), v (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                            local v20 = ReplicatedStorage.Assets.Effects.DragonEmblemExplode:Clone();
                            v20.Parent = Workspace;
                            v20.CFrame = v:GetPivot();
                            EffectUtil:playEffects({ v20 }, nil);
                            SoundManager:playSound(GameSound.KALIYAH_EXPLOSION, {
                                position = v:GetPivot().Position
                            });
                            v:Destroy();
                        end);
                    end;
                end;
            end;
        end);
        u6.activeCrates[p13.altarId] = nil;
    end);
    v7:Get("CrateOpened"):Connect(function(p21) -- Line: 127
        -- upvalues: ComponentUtil (ref), RewardCrateComponent (ref), u6 (copy)
        local _ = p21.openingPlayer;
        local _ = p21.reward;
        local v22 = ComponentUtil:getComponent(p21.crateModel, RewardCrateComponent);

        if v22 then
            local altarId = v22.attributes.altarId;

            if altarId ~= 0 and (altarId == altarId and altarId) then
                u6:onCrateOpened(altarId);
            end;
        end;
    end);
end;

function u3.pickCrate(p23, p24, p25, p26) -- Line: 140
    -- upvalues: default (copy)
    default.Client:GetNamespace("RewardCrate"):Get("SpawnRewardCrate"):SendToServer({
        crateType = p24,
        altarId = p25,
        useAltarUpgrade = p26
    });
end;

function u3.requestOpenCrate(p27, p28, p29) -- Line: 147
    -- upvalues: default (copy)
    default.Client:GetNamespace("RewardCrate"):Get("OpenRewardCrate"):SendToServer({
        crateId = p28,
        altarId = p29
    });
    p27:onCrateOpened(p29);
end;

function u3.onCrateOpened(p30, p31) -- Line: 154
    if p31 ~= 0 and (p31 == p31 and p31) then
        local v32 = p30.activeCrates[p31];

        if v32 ~= nil then
            local function _(p33) -- Line: 162
                local v34 = p33:getOpenCratePrompt();

                if v34 ~= nil then
                    v34:Destroy();
                end;
            end;

            for i, v in v32 do
                local _ = i - 1;
                local v35 = v:getOpenCratePrompt();

                if v35 ~= nil then
                    v35:Destroy();
                end;
            end;
        end;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;