-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local RunService = v5.RunService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local VulcanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "vulcan", "vulcan-util").VulcanUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local EngineerCameraViewWrapper = RuntimeLib.import(script, script.Parent, "ui", "engineer-camera-view").EngineerCameraViewWrapper;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "EngineerTabletController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 45
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 49
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "EngineerTabletController";
    p8.nextAllowActivation = -1;
    p8.maid = u2.new();
    p8.isTabletSessionActive = false;
    p8.areTabletAbilitiesEnabled = false;
end;

function u6.KnitStart(p9) -- Line: 57
    -- upvalues: HandKnitController (copy), ClientStore (copy), ItemType (copy)
    HandKnitController.KnitStart(p9);
    ClientStore.changed:connect(function(p10, p11) -- Line: 59
        -- upvalues: ItemType (ref), ClientStore (ref)
        local selectedTurret = p10.Game.selectedTurret;

        if selectedTurret == nil and selectedTurret ~= p11.Game.selectedTurret then
            local hand = p10.Inventory.observedInventory.inventory.hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            if hand == ItemType.TABLET then
                return nil;
            end;

            ClientStore:dispatch({
                type = "InventorySelectHotbarSlot",
                slot = 0
            });
        end;
    end);
end;

function u6.closeTurretCameraView(p12) -- Line: 78
    p12.maid:DoCleaning();
end;

function u6.getOwnedVulcanTurretCount(p13) -- Line: 81
    -- upvalues: CollectionService (copy), TurretId (copy), Players (copy)
    local function _(p14) -- Line: 83
        -- upvalues: Players (ref)
        return p14:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
    end;

    local v15 = 0;
    local v16 = {};

    for i, v in CollectionService:GetTagged(TurretId.VULCAN_TURRET) do
        local _ = i - 1;

        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId == true then
            v15 = v15 + 1;
            v16[v15] = v;
        end;
    end;

    return #v16;
end;

function u6.attemptToActivate(u17) -- Line: 99
    -- upvalues: EntityUtil (copy), Flamework (copy), KnitClient2 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), KnitClient (copy), CreateRoduxApp (copy), EngineerCameraViewWrapper (copy), u4 (copy), EntityDamageEventZap (copy)
    if time() < u17.nextAllowActivation then
        return false;
    end;

    u17.nextAllowActivation = time() + 1;

    if EntityUtil:getLocalPlayerEntity() == nil then
        warn("Could not find entity for localplayer");

        return false;
    end;

    if u17:getOwnedVulcanTurretCount() == 0 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You do not have any turrets placed yet."
        });

        return false;
    end;

    local u18 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        moveSpeedMultiplier = 0
    });
    u17:setTabletAbilitiesEnabled(false);
    u17.maid:GiveTask(function() -- Line: 121
        -- upvalues: u17 (copy), u18 (copy)
        if u17.isTabletSessionActive then
            u17:setTabletAbilitiesEnabled(true);
        end;

        u18.Destroy();
    end);
    local u19 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.USE_TABLET, {
        looped = true
    });
    u17.maid:GiveTask(function() -- Line: 130
        -- upvalues: u19 (copy)
        local v20 = u19;

        if v20 ~= nil then
            v20:Stop();
        end;
    end);
    local u21 = KnitClient.Controllers.ViewmodelController:addDisabler();
    u17.maid:GiveTask(function() -- Line: 137
        -- upvalues: KnitClient (ref), u21 (copy)
        KnitClient.Controllers.ViewmodelController:removeDisabler(u21);
    end);
    local u22 = CreateRoduxApp("EngineerCameraView", EngineerCameraViewWrapper);
    u17.maid:GiveTask(function() -- Line: 141
        -- upvalues: u4 (ref), u22 (copy)
        u4.unmount(u22);
    end);
    local u37 = EntityDamageEventZap.On(function(p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36) -- Line: 144
        -- upvalues: Players (ref), u17 (copy)
        if Players.LocalPlayer.Character and p23 == Players.LocalPlayer.Character then
            u17.maid:DoCleaning();
        end;
    end);
    u17.maid:GiveTask(function() -- Line: 149
        -- upvalues: u37 (copy)
        return u37();
    end);

    return true;
end;

function u6.onEnable(u38, p39, u40) -- Line: 154
    -- upvalues: u2 (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), getItemMeta (copy), ItemType (copy), ClientSyncEvents (copy), KnitClient (copy), Players (copy), BedwarsKit (copy), default (copy), RunService (copy), Workspace (copy), EntityUtil (copy), GameWorldUtil (copy), VulcanUtil (copy), u3 (copy)
    u38:setupYield(function() -- Line: 155
        -- upvalues: u2 (ref), u38 (copy), Flamework (ref), AbilityId (ref), BedwarsImageId (ref), getItemMeta (ref), ItemType (ref), ClientSyncEvents (ref), KnitClient (ref), Players (ref), BedwarsKit (ref), default (ref), RunService (ref), u40 (copy), Workspace (ref), EntityUtil (ref), GameWorldUtil (ref), VulcanUtil (ref), u3 (ref)
        local u41 = u2.new();
        u38.isTabletSessionActive = true;
        u41:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VULCAN_ARTILLERY_MARK, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = BedwarsImageId.TURRET_CROSSHAIR
            }
        }):expect());
        u38.areTabletAbilitiesEnabled = true;
        local v42 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local VULCAN_TABLET_TURRET_CONTROL = AbilityId.VULCAN_TABLET_TURRET_CONTROL;
        local v43 = {};
        local v44 = {};
        local image = getItemMeta(ItemType.TABLET).image;
        v44.icon = image == nil and "" or image;
        v43.abilityButton = v44;
        v43.abilityType = "KitSecondary";
        u41:GiveTask(v42:enableAbility(VULCAN_TABLET_TURRET_CONTROL, v43):expect());
        u41:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p45) -- Line: 180
            -- upvalues: AbilityId (ref), KnitClient (ref), Players (ref), BedwarsKit (ref), u38 (ref)
            if p45.ability ~= AbilityId.VULCAN_ARTILLERY_MARK and p45.ability ~= AbilityId.VULCAN_TABLET_TURRET_CONTROL then
                return nil;
            end;

            if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.VULCAN) then
                return nil;
            end;

            if p45.ability == AbilityId.VULCAN_ARTILLERY_MARK then
                if not u38.target then
                    p45:setCancelled(true);
                end;
            elseif u38:getOwnedVulcanTurretCount() == 0 then
                p45:setCancelled(true);
            end;
        end));
        u41:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p46) -- Line: 195
            -- upvalues: Players (ref), KnitClient (ref), BedwarsKit (ref), AbilityId (ref), u38 (ref), default (ref)
            if p46.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.VULCAN) then
                return nil;
            end;

            if p46.ability ~= AbilityId.VULCAN_ARTILLERY_MARK then
                if p46.ability == AbilityId.VULCAN_TABLET_TURRET_CONTROL then
                    u38:attemptToActivate();
                end;

                return;
            end;

            if not u38.target then
                return nil;
            end;

            local v47 = Players:GetPlayerFromCharacter(u38.target);

            if not v47 then
                return nil;
            end;

            default.Client:Get("VulcanArtilleryMark"):CallServer(v47);
        end));
        u41:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 215
            -- upvalues: u40 (ref), Workspace (ref), u38 (ref), EntityUtil (ref), GameWorldUtil (ref), VulcanUtil (ref), u3 (ref)
            if not u40() then
                return nil;
            end;

            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera ~= nil then
                CurrentCamera = CurrentCamera.CFrame;
            end;

            if not CurrentCamera then
                u38:removeTarget();

                return nil;
            end;

            local v48 = EntityUtil:getLocalPlayerEntity();

            if not v48 then
                u38:removeTarget();

                return nil;
            end;

            local v49 = GameWorldUtil.getEntitiesWithinRadius(CurrentCamera * Vector3.new(0, 0, -20), 20);
            local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
            local v50 = (1 / 0);
            local v51 = nil;

            for _, v in v49 do
                if v48:canAttack(v) then
                    local Position = v:getInstance():GetPrimaryPartCFrame().Position;
                    local v52 = Unit:ClosestPoint(Position);
                    local Magnitude = (Position - v52).Magnitude;

                    if Magnitude <= 6 then
                        local v53 = Magnitude + (Unit.Origin - v52).Magnitude / 3;

                        if v53 < v50 then
                            v51 = v:getInstance();
                            v50 = v53;
                        end;
                    end;
                end;
            end;

            local PrimaryPart = v48:getInstance().PrimaryPart;
            local v54;

            if v51 == nil then
                v54 = v51;
            else
                v54 = v51.PrimaryPart;
            end;

            local v55;

            if v51 then
                v55 = not (PrimaryPart and v54) or (PrimaryPart.Position - v54.Position).Magnitude > VulcanUtil.NEARBY_TURRET_RANGE + 6;
            else
                v55 = v51;
            end;

            if v55 then
                v51 = nil;
            end;

            if u38.target ~= v51 then
                u38:removeTarget();

                if v51 then
                    u38.targetIcon = u3("BillboardGui", {
                        AlwaysOnTop = true,
                        Parent = v51.PrimaryPart,
                        Size = UDim2.new(0.8, 10, 0.8, 10),
                        Children = { u3("ImageLabel", {
                                Image = "rbxassetid://9429977101",
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(1, 1),
                                ScaleType = Enum.ScaleType.Fit,
                                ImageColor3 = Color3.fromRGB(255, 37, 222)
                            }) }
                    });
                end;
            end;

            u38.target = v51;
        end));

        return function() -- Line: 294
            -- upvalues: u38 (ref), u41 (copy)
            u38.isTabletSessionActive = false;
            u38.areTabletAbilitiesEnabled = false;
            u41:DoCleaning();
            u38:removeTarget();
        end;
    end);
end;

function u6.isRelevantItem(p56, p57) -- Line: 302
    -- upvalues: ItemType (copy)
    return p57.itemType == ItemType.TABLET;
end;

function u6.onDisable(p58) -- Line: 305
    -- upvalues: UserInputService (copy)
    p58.isTabletSessionActive = false;
    p58.areTabletAbilitiesEnabled = false;
    p58:removeTarget();
    p58.maid:DoCleaning();
    task.defer(function() -- Line: 310
        -- upvalues: UserInputService (ref)
        UserInputService.MouseIconEnabled = true;
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
    end);
end;

function u6.removeTarget(p59) -- Line: 315
    p59.target = nil;
    local targetIcon = p59.targetIcon;

    if targetIcon ~= nil then
        targetIcon:Destroy();
    end;

    p59.targetIcon = nil;
end;

function u6.setTabletAbilitiesEnabled(p60, p61) -- Line: 323
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy), getItemMeta (copy), ItemType (copy)
    if p60.areTabletAbilitiesEnabled == p61 then
        return nil;
    end;

    p60.areTabletAbilitiesEnabled = p61;

    if p61 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VULCAN_ARTILLERY_MARK, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = BedwarsImageId.TURRET_CROSSHAIR
            }
        }):expect();
        local v62 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local VULCAN_TABLET_TURRET_CONTROL = AbilityId.VULCAN_TABLET_TURRET_CONTROL;
        local v63 = {};
        local v64 = {};
        local image = getItemMeta(ItemType.TABLET).image;
        v64.icon = image == nil and "" or image;
        v63.abilityButton = v64;
        v63.abilityType = "KitSecondary";
        v62:enableAbility(VULCAN_TABLET_TURRET_CONTROL, v63):expect();

        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.VULCAN_ARTILLERY_MARK);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.VULCAN_TABLET_TURRET_CONTROL);
end;

return {
    EngineerTabletController = KnitClient.CreateController(u6.new())
};