-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network");
local EntityDamageEventZap = v6.EntityDamageEventZap;
local EntityHealEventZap = v6.EntityHealEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "ScepterController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 46
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 50
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p9);
    p9.Name = "ScepterController";
    p9.maid = u3.new();
    p9.lowHealthTeammates = {};
    p9.isAngel = false;
    p9.sessionId = 0;
    p9.soundLock = false;
    p9.isPreloaded = false;
end;

function u7.KnitStart(u10) -- Line: 60
    -- upvalues: HandKnitController (copy), default (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy), ContextActionService (copy), ItemType (copy), ClientStore (copy)
    HandKnitController.KnitStart(u10);
    u10:runPreload();
    default.Client:Get("EntityDeathEvent"):Connect(function(p11) -- Line: 63
        -- upvalues: Players (ref), u10 (copy)
        local v12 = Players:GetPlayerFromCharacter(p11.entityInstance);

        if v12 then
            u10.lowHealthTeammates[v12] = nil;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p13) -- Line: 71
        -- upvalues: Players (ref), AbilityId (ref), ContextActionService (ref), u10 (copy), default (ref)
        if p13.userCharacter == Players.LocalPlayer.Character and p13.ability == AbilityId.PALADIN_ABILITY then
            ContextActionService:UnbindAction("Paladin Ability");
            local v14 = Players:GetPlayerFromCharacter(u10.target);
            default.Client:Get("PaladinAbilityRequest"):SendToServer({
                target = v14
            });
            u10:destroyAngel();
            u10:removeTarget();
            u10.maid:DoCleaning();
        end;
    end);
    ClientSyncEvents.ItemConsumed:connect(function(p15) -- Line: 83
        -- upvalues: Players (ref), ItemType (ref), ClientStore (ref), u10 (copy)
        local v16 = Players:GetPlayerFromCharacter(p15.entity:getInstance());

        if p15.itemType == ItemType.SCEPTER and v16 == Players.LocalPlayer then
            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = false
            });
            task.delay(0.8, function() -- Line: 90
                -- upvalues: u10 (ref)
                u10:useAbility();
            end);
        end;
    end);
    default.Client:Get("PaladinTeleport"):Connect(function(p17) -- Line: 95
        -- upvalues: u10 (copy)
        u10:teleportEffect(p17.player, p17.targetPosition, p17.character, p17.oldPosition, p17.ascend);
    end);
end;

function u7.runPreload(p18) -- Line: 99
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    if not p18.isPreloaded then
        KnitClient.Controllers.PreloadController:runPreload({
            animations = { AnimationType.PALADIN_JUMP, AnimationType.PALADIN_LAND, AnimationType.USE_CROSS },
            sounds = {
                GameSound.LANI_LANDING,
                GameSound.LANI_SUMMON,
                GameSound.LANI_ASCEND,
                GameSound.LANI_USE_STAFF,
                GameSound.LANI_DASH
            }
        });
        p18.isPreloaded = true;
    end;
end;

function u7.isRelevantItem(p19, p20) -- Line: 108
    -- upvalues: ItemType (copy)
    return p20.itemType == ItemType.SCEPTER;
end;

function u7.onEnable(u21, p22, p23) -- Line: 111
    -- upvalues: Players (copy), EntityDamageEventZap (copy), EntityHealEventZap (copy), ClientSyncEvents (copy), GameSound (copy), ItemType (copy), SoundManager (copy), KnitClient2 (copy), AnimationType (copy)
    local u24 = nil;
    u21:destroyAllHealthBar();
    local Team = Players.LocalPlayer.Team;

    if Team ~= nil then
        local function _(p25) -- Line: 117
            -- upvalues: Players (ref), u21 (copy)
            if p25 ~= Players.LocalPlayer then
                u21.lowHealthTeammates[p25] = true;
            end;
        end;

        for i, v in Team:GetPlayers() do
            local _ = i - 1;

            if v ~= Players.LocalPlayer then
                u21.lowHealthTeammates[v] = true;
            end;
        end;
    end;

    for i in u21.lowHealthTeammates do
        u21:createHealthBar(i);
    end;

    u21.cleanupDamageConnection = EntityDamageEventZap.On(function(p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39) -- Line: 131
        -- upvalues: Players (ref), u21 (copy)
        local v40 = Players:GetPlayerFromCharacter(p26);
        local v41 = not v40;

        if not v41 then
            v41 = not (u21.lowHealthTeammates[v40] ~= nil);
        end;

        if v41 then
            return nil;
        end;

        u21:updateHealthBar(v40);
    end);
    local u48 = EntityHealEventZap.On(function(p42, p43, p44, p45) -- Line: 145
        -- upvalues: Players (ref), u21 (copy)
        local v46 = Players:GetPlayerFromCharacter(p42);
        local v47 = not v46;

        if not v47 then
            v47 = not (u21.lowHealthTeammates[v46] ~= nil);
        end;

        if v47 then
            return nil;
        end;

        u21:updateHealthBar(v46);
    end);
    u21.maid:GiveTask(function() -- Line: 158
        -- upvalues: u48 (copy)
        u48();
    end);
    ClientSyncEvents.NewHandItem:connect(function(p49) -- Line: 161
        -- upvalues: Players (ref)
        local v50 = Players.LocalPlayer:GetAttribute("Untargetable");

        if v50 ~= 0 and (v50 == v50 and (v50 ~= "" and v50)) then
            p49:setCancelled(true);
        end;
    end);
    ClientSyncEvents.StartConsuming:connect(function(p51) -- Line: 167
        -- upvalues: u21 (copy), GameSound (ref), ItemType (ref), SoundManager (ref), u24 (ref), KnitClient2 (ref), AnimationType (ref)
        if p51:isCancelled() then
            return nil;
        end;

        local sound = u21.sound;

        if sound ~= nil then
            sound = sound.SoundId;
        end;

        if sound == GameSound.LANI_SUMMON then
            local sound2 = u21.sound;

            if sound2 ~= nil then
                sound2:Stop();
            end;
        end;

        if p51.itemType == ItemType.SCEPTER then
            u21.sound = SoundManager:playModifiableSound(GameSound.LANI_SUMMON, {
                volumeMultiplier = 0.4
            });
        end;

        u24 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SHIELD_USE);
    end);
    ClientSyncEvents.StopConsuming:connect(function(p52) -- Line: 188
        -- upvalues: u24 (ref), ItemType (ref), u21 (copy)
        local v53 = u24;

        if v53 ~= nil then
            v53:Stop();
        end;

        local v54 = u24;

        if v54 ~= nil then
            v54:Destroy();
        end;

        if p52.itemType ~= ItemType.SCEPTER or not p52.completed then
            if p52.itemType == ItemType.SCEPTER and not (p52.completed or u21.soundLock) then
                local sound = u21.sound;

                if sound ~= nil then
                    sound:Stop();
                end;
            end;

            return;
        end;

        u21.soundLock = true;
        task.delay(0.2, function() -- Line: 199
            -- upvalues: u21 (ref)
            u21.soundLock = false;
        end);
    end);
end;

function u7.onDisable(p55) -- Line: 210
    -- upvalues: GameSound (copy)
    p55:destroyAllHealthBar();
    local v56 = not p55.angel;

    if v56 then
        local sound = p55.sound;

        if sound ~= nil then
            sound = sound.SoundId;
        end;

        v56 = sound == GameSound.LANI_SUMMON;
    end;

    if v56 then
        local sound = p55.sound;

        if sound ~= nil then
            sound:Stop();
        end;
    end;

    local cleanupDamageConnection = p55.cleanupDamageConnection;

    if cleanupDamageConnection ~= nil then
        cleanupDamageConnection();
    end;

    local healConnection = p55.healConnection;

    if healConnection ~= nil then
        healConnection:Disconnect();
    end;
end;

function u7.useAbility(u57) -- Line: 235
    -- upvalues: Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy), MobileTouchType (copy), RunService (copy), Workspace (copy), EntityUtil (copy), u4 (copy)
    u57.sessionId = u57.sessionId + 1;
    local sessionId = u57.sessionId;
    u57.maid:DoCleaning();
    u57:summonAngel();
    local maid = u57.maid;
    local v58 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local PALADIN_ABILITY = AbilityId.PALADIN_ABILITY;
    local v59 = {};
    local v60 = {};
    local image = getItemMeta(ItemType.SCEPTER).image;
    v60.icon = image == nil and "" or image;
    v59.abilityButton = v60;
    v59.abilityType = "ItemPrimary";
    maid:GiveTask(v58:enableAbility(PALADIN_ABILITY, v59):expect());
    local v64 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Paladin Ability",

        boundFunction = function(p61, p62, p63) -- Line: 259, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.PALADIN_ABILITY);
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 264, Name: mobileBoundFunction
                -- upvalues: Flamework (ref), AbilityId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.PALADIN_ABILITY);
            end
        }
    });
    u57.maid:GiveTask(v64);
    u57.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 270
        -- upvalues: Workspace (ref), u57 (copy), EntityUtil (ref), u4 (ref)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u57:removeTarget();

            return nil;
        end;

        if not EntityUtil:getLocalPlayerEntity() then
            u57:removeTarget();

            return nil;
        end;

        local v65 = u57:getTargetTeammates(CurrentCamera * Vector3.new(0, 0, -600), 600);
        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        local v66 = (1 / 0);
        local v67 = nil;

        for _, v in v65 do
            local Position = v:getInstance():GetPrimaryPartCFrame().Position;
            local v68 = Unit:ClosestPoint(Position);
            local Magnitude = (Position - v68).Magnitude;

            if CurrentCamera.LookVector:Dot((Position - CurrentCamera.Position).Unit) >= 0.6 then
                local v69 = Magnitude + (Unit.Origin - v68).Magnitude / 6;

                if v69 < v66 then
                    v67 = v:getInstance();
                    v66 = v69;
                end;
            end;
        end;

        if u57.target ~= v67 then
            u57:removeTarget();

            if v67 then
                local v70 = Color3.fromRGB(255, 215, 0);
                u57.targetIcon = u4("BillboardGui", {
                    StudsOffset = Vector3.new(0, 7, 0),
                    AlwaysOnTop = true,
                    Parent = v67.PrimaryPart,
                    Size = UDim2.fromOffset(40, 40),
                    Children = { u4("ImageLabel", {
                            Image = "rbxassetid://9429977101",
                            BackgroundTransparency = 1,
                            ImageTransparency = 0,
                            Size = UDim2.fromScale(1, 1),
                            ScaleType = Enum.ScaleType.Fit,
                            ImageColor3 = v70
                        }) }
                });
            end;
        end;

        u57.target = v67;
    end));
    task.delay(5, function() -- Line: 334
        -- upvalues: sessionId (copy), u57 (copy)
        if sessionId == u57.sessionId and u57.isAngel then
            u57:cleanUp();
        end;
    end);
end;

function u7.removeTarget(p71) -- Line: 340
    p71.target = nil;
    local targetIcon = p71.targetIcon;

    if targetIcon ~= nil then
        targetIcon:Destroy();
    end;
end;

function u7.getTargetTeammates(p72, p73, p74) -- Line: 347
    -- upvalues: Players (copy), EntityUtil (copy)
    local v75 = {};

    for i in p72.lowHealthTeammates do
        local v76 = (i.Character:GetPivot().Position - p73).Magnitude < p74;

        if v76 then
            if i.Team == Players.LocalPlayer.Team then
                v76 = i ~= Players.LocalPlayer;
            else
                v76 = false;
            end;
        end;

        if v76 then
            local v77 = EntityUtil:getEntity(i);

            if v77 then
                table.insert(v75, v77);
            end;
        end;
    end;

    return v75;
end;

function u7.summonAngel(u78) -- Line: 367
    -- upvalues: EntityDamageEventZap (copy), Players (copy), EntityHealEventZap (copy)
    u78.isAngel = true;
    u78:destroyAllHealthBar();

    for i in u78.lowHealthTeammates do
        u78:createHealthBar(i);
    end;

    EntityDamageEventZap.On(function(p79, p80, p81, p82, p83, p84, p85, p86, p87, p88, p89, p90, p91, p92) -- Line: 373
        -- upvalues: Players (ref), u78 (copy)
        local v93 = Players:GetPlayerFromCharacter(p79);
        local v94 = not v93;

        if not v94 then
            v94 = not (u78.lowHealthTeammates[v93] ~= nil);
        end;

        if v94 then
            return nil;
        end;

        u78:updateHealthBar(v93);
    end);
    local u101 = EntityHealEventZap.On(function(p95, p96, p97, p98) -- Line: 386
        -- upvalues: Players (ref), u78 (copy)
        local v99 = Players:GetPlayerFromCharacter(p95);
        local v100 = not v99;

        if not v100 then
            v100 = not (u78.lowHealthTeammates[v99] ~= nil);
        end;

        if v100 then
            return nil;
        end;

        u78:updateHealthBar(v99);
    end);
    u78.maid:GiveTask(function() -- Line: 399
        -- upvalues: u101 (copy)
        u101();
    end);
end;

function u7.destroyAngel(p102) -- Line: 403
    -- upvalues: ClientStore (copy), InventoryUtil (copy), Players (copy), ItemType (copy), Workspace (copy)
    local angel = p102.angel;

    if angel ~= nil then
        angel:Destroy();
    end;

    p102.isAngel = false;
    ClientStore:dispatch({
        type = "UnequipItemInHand",
        equip = true
    });
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand ~= ItemType.SCEPTER then
        p102:destroyAllHealthBar();
    end;

    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    Workspace.CurrentCamera.CameraSubject = Character.Humanoid;
end;

function u7.cleanUp(p103) -- Line: 428
    -- upvalues: ContextActionService (copy), default (copy)
    p103:removeTarget();
    p103.maid:DoCleaning();
    ContextActionService:UnbindAction("Paladin Ability");

    if p103.isAngel then
        p103:destroyAngel();
        default.Client:Get("PaladinAbilityRequest"):SendToServer({
            target = nil
        });
    end;

    if not p103:isEnabled() then
        p103:destroyAllHealthBar();
        local cleanupDamageConnection = p103.cleanupDamageConnection;

        if cleanupDamageConnection ~= nil then
            cleanupDamageConnection();
        end;

        local healConnection = p103.healConnection;

        if healConnection ~= nil then
            healConnection:Disconnect();
        end;
    end;
end;

function u7.teleportEffect(u104, u105, u106, u107, p108, u109) -- Line: 450
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), WeldUtil (copy), GameQueryUtil (copy), Workspace (copy), TweenService (copy)
    u107.Archivable = true;

    if u109 then
        if u105 ~= Players.LocalPlayer then
            SoundManager:playSound(GameSound.LANI_ASCEND, {
                rollOffMaxDistance = 70,
                volumeMultiplier = 1,
                position = u106
            });
        end;

        ReplicatedStorage.Assets.Effects.PaladinWings:Clone().Parent = u107;
        WeldUtil:weldCharacterAccessories(u107);
    else
        SoundManager:playSound(GameSound.LANI_DASH, {
            rollOffMaxDistance = 70,
            volumeMultiplier = 1,
            position = u106
        });
    end;

    local u110 = u107:Clone();

    for _, descendant in u110:GetDescendants() do
        if descendant.Name == "cross" then
            descendant:Destroy();
        end;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    local Character = u105.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 1);
    end;

    u110:PivotTo(CFrame.new(p108));
    u110.Parent = Workspace;

    if u105 == Players.LocalPlayer then
        Workspace.CurrentCamera.CameraSubject = u110.Humanoid;
    end;

    local v111 = TweenInfo.new(0.4);
    local u112 = TweenService:Create(u110.PrimaryPart, v111, {
        CFrame = CFrame.new(u106)
    });

    if u109 then
        u104:playAscendEffect(u107, u110);
        task.delay(0.3, function() -- Line: 496
            -- upvalues: u112 (copy)
            u112:Play();
        end);
    else
        u104:playLandingEffect(u107, u110);
        u112:Play();
        task.delay(3, function() -- Line: 502
            -- upvalues: u107 (copy)
            local PaladinWings = u107:WaitForChild("PaladinWings", 3);

            if PaladinWings then
                PaladinWings:Destroy();
            end;
        end);
    end;

    u112.Completed:Connect(function() -- Line: 509
        -- upvalues: u110 (copy), u105 (copy), u109 (copy), u104 (copy), u106 (copy), SoundManager (ref), GameSound (ref), Players (ref), Workspace (ref)
        u110:Destroy();
        local Character2 = u105.Character;

        if Character2 ~= nil then
            Character2:SetAttribute("Transparency", 0);
        end;

        if not u109 then
            u104:createAura(u106);
            SoundManager:playSound(GameSound.LANI_LANDING, {
                rollOffMaxDistance = 45,
                volumeMultiplier = 0.5,
                position = u106
            });
        end;

        if u105 == Players.LocalPlayer then
            Workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character.Humanoid;
        end;
    end);
end;

function u7.createHealthBar(p113, p114) -- Line: 529
    -- upvalues: EntityUtil (copy), u4 (copy)
    local v115 = EntityUtil:getEntity(p114);

    if not v115 then
        return nil;
    end;

    local v116 = v115:getHealth() / v115:getMaxHealth();
    u4("BillboardGui", {
        Name = "Teammate HP bar",
        AlwaysOnTop = true,
        StudsOffset = Vector3.new(0, 3, 0),
        MaxDistance = 600,
        Parent = v115:getInstance().Head,
        Size = UDim2.new(8, 10, 1.5, 1),
        Adornee = v115:getInstance().Head,
        Children = { u4("Frame", {
                Name = "Main HP Bar",
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.75, 0),
                Size = UDim2.new(1, 0, 0.5, 0),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Children = { u4("Frame", {
                        Name = "Health",
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 0, 0.5, 0),
                        Size = UDim2.new(v116, 0, 1, 0),
                        BackgroundColor3 = Color3.fromRGB(3, 207, 3)
                    }) }
            }) }
    });
end;

function u7.updateHealthBar(p117, p118) -- Line: 563
    -- upvalues: EntityUtil (copy), TweenService (copy)
    local v119 = EntityUtil:getEntity(p118);

    if not v119 then
        return nil;
    end;

    local Character = p118.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("Head");

        if Character ~= nil then
            Character = Character:FindFirstChild("Teammate HP bar");

            if Character ~= nil then
                Character = Character:FindFirstChild("Main HP Bar");

                if Character ~= nil then
                    Character = Character:FindFirstChild("Health");
                end;
            end;
        end;
    end;

    if Character then
        local v120 = v119:getHealth() / v119:getMaxHealth();
        TweenService:Create(Character, TweenInfo.new(0.2), {
            Size = UDim2.new(v120, 0, 1, 0)
        }):Play();

        if v120 >= 0.6 then
            Character.BackgroundColor3 = Color3.fromRGB(3, 207, 3);

            return;
        end;

        if v120 >= 0.4 then
            Character.BackgroundColor3 = Color3.fromRGB(224, 235, 0);

            return;
        end;

        if v120 >= 0.2 then
            Character.BackgroundColor3 = Color3.fromRGB(242, 166, 0);

            return;
        end;

        if v120 >= 0 then
            Character.BackgroundColor3 = Color3.fromRGB(207, 3, 3);
        end;
    end;
end;

function u7.destroyAllHealthBar(p121) -- Line: 598
    if p121.isAngel then
        return nil;
    end;

    for i in p121.lowHealthTeammates do
        local Character = i.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Head");

            if Character ~= nil then
                Character = Character:FindFirstChild("Teammate HP bar");
            end;
        end;

        if Character then
            Character:Destroy();
        end;
    end;
end;

function u7.playAscendEffect(p122, p123, p124) -- Line: 616
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), Players (copy)
    local v125 = p124.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PALADIN_JUMP));
    v125:AdjustSpeed(3);
    local u126 = p123.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PALADIN_JUMP));
    u126:AdjustSpeed(3);
    v125:Play();
    u126:Play();
    u126:GetMarkerReachedSignal("end"):Connect(function() -- Line: 625
        -- upvalues: u126 (copy)
        local v127 = u126;

        if v127 ~= nil then
            v127:AdjustSpeed(0);
        end;
    end);
    local v128 = Players:GetPlayerFromCharacter(p123);

    if v128 then
        local u129 = nil;
        u129 = v128:GetAttributeChangedSignal("Untargetable"):Connect(function(p130) -- Line: 635
            -- upvalues: u126 (copy), u129 (ref)
            u126:Stop();
            u126:Destroy();
            u129:Disconnect();

            return nil;
        end);
    end;
end;

function u7.playLandingEffect(p131, p132, p133) -- Line: 643
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local v134 = p133.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PALADIN_LAND));
    v134:AdjustSpeed(3);
    local v135 = p132.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PALADIN_LAND));
    v135:AdjustSpeed(3);
    v134:Play();
    v135:Play();
end;

function u7.createAura(p136, p137) -- Line: 653
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local u138 = ReplicatedStorage.Assets.Effects.PaladinAura:Clone();
    u138.Position = p137 - Vector3.new(0, 2, 0);
    u138.Parent = Workspace;

    local function _(p139) -- Line: 660
        if p139:IsA("ParticleEmitter") then
            p139:Emit(30);
        end;
    end;

    for i, descendant in u138:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    task.delay(1, function() -- Line: 669
        -- upvalues: u138 (copy)
        u138:Destroy();
    end);
end;

KnitClient.CreateController(u7.new());

return nil;