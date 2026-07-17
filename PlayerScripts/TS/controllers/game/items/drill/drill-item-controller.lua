-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v6.InteractionCategory;
local InteractionPriority = v6.InteractionPriority;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent, "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local DrillBillboard = RuntimeLib.import(script, script.Parent, "ui", "drill-billboard").DrillBillboard;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "DrillItemController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 41
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 45
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p9);
    p9.Name = "DrillItemController";
    p9.genPrompts = {};
    p9.drillAnimationMap = {};
end;

function u7.isRelevantItem(p10, p11) -- Line: 51
    -- upvalues: ItemType (copy)
    return p11.itemType == ItemType.DRILL;
end;

function u7.onEnable(p12, p13, p14) -- Line: 54
    p12:enableAllPrompts();
end;

function u7.onDisable(p15) -- Line: 57
    p15:disableAllPrompts();
end;

function u7.KnitStart(u16) -- Line: 60
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), default (copy), KnitClient2 (copy), SoundManager (copy), u3 (copy), Players (copy), Theme (copy), CollectionService (copy), Flamework (copy), AnimationUtil (copy), GameAnimationUtil (copy), TweenService (copy)
    HandKnitController.KnitStart(u16);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.DRILL, {
        animations = { AnimationType.SAW_ATTACK },
        sounds = { GameSound.DRILL_ATTACK_1, GameSound.DRILL_DEPLOY, GameSound.DRILL_LOOP }
    });
    default.Client:Get("SpawnDrillPrompt"):Connect(function(p17) -- Line: 66
        -- upvalues: u16 (copy)
        for _, v in p17.positions do
            local v18 = u16:createInvisiblePart(v);
            u16.genPrompts[v] = v18;
        end;

        u16:initPrompt();
    end);
    default.Client:Get("DrillPlaced"):Connect(function(p19) -- Line: 73
        -- upvalues: u16 (copy), KnitClient2 (ref), SoundManager (ref), GameSound (ref), u3 (ref), Players (ref), Theme (ref)
        local v20 = u16.genPrompts[p19.position];

        if v20 then
            KnitClient2.Controllers.InteractionRegistryController:removePrompt(v20, "Drill_Prompt");
            v20:SetAttribute("Occupied", true);
            SoundManager:playSound(GameSound.DRILL_DEPLOY, {
                rollOffMaxDistance = 220,
                position = p19.position
            });
            local u21 = u3("Sound", {
                RollOffMinDistance = 20,
                RollOffMaxDistance = 40,
                Volume = 0.15,
                Playing = false,
                Looped = true,
                SoundId = GameSound.DRILL_LOOP,
                Parent = p19.drill.PrimaryPart
            });
            task.delay(2.5, function() -- Line: 93
                -- upvalues: u21 (copy)
                u21:Play();
            end);
        end;

        local v22 = p19.drill:GetAttribute("PlacedByUserId");

        if v22 == 0 or (v22 ~= v22 or not v22) then
            return nil;
        end;

        local v23 = Players:GetPlayerByUserId(v22);

        if not v23 then
            return nil;
        end;

        local mcGreen = Theme.mcGreen;

        if Players.LocalPlayer.Team ~= v23.Team then
            mcGreen = Theme.mcRed;
        end;

        u16:createEntityHealthbar(p19.drill, mcGreen);
    end);
    default.Client:Get("DrillDestroyed"):Connect(function(p24) -- Line: 111
        -- upvalues: u16 (copy), CollectionService (ref), Flamework (ref)
        local v25 = u16.genPrompts[p24.position];

        if v25 then
            if u16:isEnabled() then
                CollectionService:AddTag(v25, "Drill_Prompt");
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(p24.position));
            end;

            v25:SetAttribute("Occupied", false);
        end;
    end);
    default.Client:Get("DrillSpin"):Connect(function(p26) -- Line: 123
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u16 (copy)
        if p26.active then
            local v27 = AnimationUtil:playAnimation(p26.drill, GameAnimationUtil:getAssetId(AnimationType.DRILL_SPIN_LOOP), {
                looped = true
            });

            if not v27 then
                return nil;
            end;

            u16.drillAnimationMap[p26.drill] = v27;

            return;
        end;

        local v28 = u16.drillAnimationMap[p26.drill];

        if v28 ~= nil then
            v28:Stop();
        end;

        if v28 ~= nil then
            v28:Destroy();
        end;
    end);
    default.Client:Get("DrillAttackAnimation"):Connect(function(p29) -- Line: 148
        -- upvalues: TweenService (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v30 = TweenInfo.new(0.5);
        TweenService:Create(p29.drill.PrimaryPart, v30, {
            CFrame = p29.cFrame
        }):Play();
        SoundManager:playSound(GameSound.DRILL_ATTACK_1, {
            rollOffMaxDistance = 220,
            position = p29.cFrame.Position
        });
        SoundManager:playSound(GameSound.JUGGERNAUT_ATTACK_IMPACT_1, {
            rollOffMaxDistance = 220,
            position = p29.cFrame.Position
        });
        local Humanoid = p29.drill:WaitForChild("Humanoid", 3);

        if Humanoid ~= nil then
            Humanoid = Humanoid:WaitForChild("Animator", 3);
        end;

        GameAnimationUtil:playAnimation(Humanoid, AnimationType.SAW_ATTACK);
    end);
end;

function u7.initPrompt(p31) -- Line: 170
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), default (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Deploy",
        interactionObjectText = "Extract ore",
        interactionTag = "Drill_Prompt",
        instantActivation = true,
        maxActivationDistance = 20,
        removePromptOnInteract = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,
        KeyCode = Enum.KeyCode.R,

        onInteracted = function(p32, p33, p34) -- Line: 182, Name: onInteracted
            -- upvalues: default (ref)
            default.Client:Get("PlaceDrill"):SendToServer({
                position = p33.Position
            });
        end
    });
end;

function u7.enableAllPrompts(p35) -- Line: 190
    -- upvalues: CollectionService (copy)
    for i, v in p35.genPrompts do
        local v36 = { i, v };
        local v37 = v36[2]:GetAttribute("Occupied");

        if v37 == 0 or (v37 ~= v37 or (v37 == "" or not v37)) then
            CollectionService:AddTag(v36[2], "Drill_Prompt");
        end;
    end;
end;

function u7.disableAllPrompts(p38) -- Line: 201
    -- upvalues: KnitClient2 (copy)
    for i, v in p38.genPrompts do
        KnitClient2.Controllers.InteractionRegistryController:removePrompt(({ i, v })[2], "Drill_Prompt");
    end;
end;

function u7.createInvisiblePart(p39, p40) -- Line: 207
    -- upvalues: u3 (copy), Workspace (copy)
    return u3("Part", {
        Name = "DrillPromptPart",
        Size = Vector3.new(1, 1, 1),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CFrame = CFrame.new(p40),
        Parent = Workspace
    });
end;

function u7.createEntityHealthbar(p41, p42, p43) -- Line: 219
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy), u4 (copy), DrillBillboard (copy)
    local v44 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local v45 = {
        app = StatefulEntityHpBarBillboard
    };
    local Position = p42:GetPivot().Position;
    v45.appId = "StatefulEntityHpBarBillboard_" .. tostring(Position);
    v44:openApp(v45, {
        hpBarOffset = Vector3.new(0, 3.5, 0),
        gameEntity = p42,
        serverInstance = p42,
        barColor = p43
    }, nil, p42);
    local v46 = p42:GetAttribute("ItemType");

    if not v46 then
        return nil;
    end;

    u4.mount(u4.createElement(DrillBillboard, {
        drill = p42,
        itemtype = v46
    }), p42);
end;

KnitClient.CreateController(u7.new());

return nil;