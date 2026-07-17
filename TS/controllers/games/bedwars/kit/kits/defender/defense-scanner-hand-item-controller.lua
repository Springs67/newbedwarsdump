-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getNearbyBlockPositions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").getNearbyBlockPositions;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance");
local DefenderKitBalance = v5.DefenderKitBalance;
local DefenderScannerMode = v5.DefenderScannerMode;
local DefenderScannerUtil = v5.DefenderScannerUtil;
local DefenderSchematicColors = v5.DefenderSchematicColors;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local CpsConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").CpsConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local DefenderScannerModeBarBase = RuntimeLib.import(script, script.Parent, "ui", "defender-scanner-mode-bar-base").DefenderScannerModeBarBase;
local u6 = 1 / CpsConstants.BLOCK_PLACE_CPS;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "DefenseScannerHandItemController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 50
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 54
    -- upvalues: HandKnitController (copy), u2 (copy), DefenderScannerMode (copy)
    HandKnitController.constructor(p9);
    p9.Name = "DefenseScannerHandItemController";
    p9.maid = u2.new();
    p9.currentHighlightedPosition = Vector3.new();
    p9.currentHighlightedBlockType = nil;
    p9.customBlockHighlights = {};
    p9.currentMode = DefenderScannerMode.PLACE;
    p9.heldUpgradeSourceBlockType = nil;
    p9.isHoldingActionInput = false;
    p9.holdActionLoopId = 0;
end;

function u7.KnitStart(u10) -- Line: 66
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy), BlockEngineClientEvents (copy), EntityUtil (copy)
    HandKnitController.KnitStart(u10);
    ClientSyncEvents.PlaceBlock:connect(function(p11) -- Line: 69
        -- upvalues: ItemType (ref), u10 (copy)
        if p11:isCancelled() then
            return nil;
        end;

        if p11.blockType ~= ItemType.DEFENSE_SCANNER_BLOCK_SNAPPING then
            return nil;
        end;

        u10:startHeldActionLoop();
        task.spawn(function() -- Line: 77
            -- upvalues: u10 (ref)
            u10:tryPerformScannerAction();
        end);
        p11:setCancelled(true);
    end);
    BlockEngineClientEvents.BeforeHighlightBlock:connect(function(p12) -- Line: 82
        -- upvalues: EntityUtil (ref), ItemType (ref), u10 (copy)
        local v13 = EntityUtil:getLocalPlayerEntity();

        if not v13 then
            return nil;
        end;

        if v13 ~= nil then
            v13 = v13:getHandItemInstanceFromCharacter();
        end;

        if not v13 then
            return nil;
        end;

        if v13.Name ~= ItemType.DEFENSE_SCANNER then
            u10:hideCustomVisuals();

            return nil;
        end;

        u10:updateCustomVisualsFromMouseInfo(p12.mouseInfo);
    end);
end;

function u7.refreshCurrentTarget(p14) -- Line: 102
    -- upvalues: DefenderScannerMode (copy), BlockSelectorMode (copy), ClientBlockEngine (copy)
    local v15;

    if p14.currentMode == DefenderScannerMode.PLACE then
        v15 = BlockSelectorMode.PLACE;
    else
        v15 = BlockSelectorMode.SELECT;
    end;

    local v16 = ClientBlockEngine:getBlockSelector():getMouseInfo(v15);

    if v16 then
        return p14:updateCustomVisualsFromMouseInfo(v16);
    end;

    p14:hideCustomVisuals();

    return false;
end;

function u7.updateCustomVisualsFromMouseInfo(p17, p18) -- Line: 111
    -- upvalues: BlockEngine (copy), DefenderScannerMode (copy), KnitClient2 (copy), InventoryUtil (copy), Players (copy)
    if not p18.target then
        p17:hideCustomVisuals();

        return false;
    end;

    local v19 = BlockEngine:snapPosition(BlockEngine:getBlockPosition(p18.target.blockInstance.Position));
    local v20 = BlockEngine:getWorldPosition(v19);

    if p17.currentMode == DefenderScannerMode.REFUND then
        if not p17:isLocalTeamScannerBlock(p18.target.blockInstance) then
            p17:hideCustomVisuals();

            return false;
        end;

        local Name = p18.target.blockInstance.Name;
        local v21 = KnitClient2.Controllers.DefenderKitController:getBlockRefundValueFromBlock(Name);

        if v21 then
            p17:updateCustomVisuals(Name, v20, {
                pricePrefix = "+",
                canAfford = true,
                price = v21.price,
                currency = v21.currency,
                backgroundColor3 = Color3.fromRGB(48, 150, 83),
                refundProgress = {
                    progress = v21.progress,
                    blocksUntilNextRefund = v21.blocksUntilNextRefund
                }
            });

            return true;
        end;

        p17:hideCustomVisuals();

        return false;
    end;

    if p17.currentMode ~= DefenderScannerMode.UPGRADE then
        if not KnitClient2.Controllers.DefenderKitController:isValidSchematicPosition(v19) then
            p17:hideCustomVisuals();

            return false;
        end;

        local v22 = KnitClient2.Controllers.DefenderKitController:getBlockForSchematicPosition(v19);

        if not v22 then
            p17:hideCustomVisuals();

            return false;
        end;

        local v23 = KnitClient2.Controllers.DefenderKitController:getBlockCostFromBlock(v22);

        if not v23 then
            p17:hideCustomVisuals();

            return false;
        end;

        local blockCount = v23.blockCount;
        local v24 = p17:getPlacePreviewPositions(v19, v22, blockCount == nil and 1 or blockCount);

        if #v24 == 0 then
            p17:hideCustomVisuals();

            return false;
        end;

        local v25 = {
            price = v23.price,
            currency = v23.currency,
            canAfford = InventoryUtil.hasEnough(Players.LocalPlayer, v23.currency, v23.price),
            blockCount = #v24
        };

        local function _(p26) -- Line: 215
            -- upvalues: BlockEngine (ref)
            return BlockEngine:getWorldPosition(p26);
        end;

        local v27 = table.create(#v24);

        for i, v in v24 do
            local _ = i - 1;
            v27[i] = BlockEngine:getWorldPosition(v);
        end;

        p17:updateCustomVisuals(v22, v20, v25, nil, v27);

        return true;
    end;

    if not p17:isLocalTeamScannerBlock(p18.target.blockInstance) then
        p17:hideCustomVisuals();

        return false;
    end;

    local v28 = p17.heldUpgradeSourceBlockType or p18.target.blockInstance.Name;
    local v29 = KnitClient2.Controllers.DefenderKitController:getBlockUpgradeCostFromBlock(v28);

    if not v29 then
        p17:hideCustomVisuals();

        return false;
    end;

    local v30 = p17:getUpgradePreviewPositions(v19, v28, v29.targetBlock);

    if #v30 == 0 then
        p17:hideCustomVisuals();

        return false;
    end;

    local v31 = KnitClient2.Controllers.DefenderKitController:getBlockUpgradeCostFromBlock(v28, #v30);

    if not v31 then
        p17:hideCustomVisuals();

        return false;
    end;

    local targetBlock = v31.targetBlock;
    local v32 = {
        price = v31.price,
        currency = v31.currency,
        canAfford = InventoryUtil.hasEnough(Players.LocalPlayer, v31.currency, v31.price),
        blockCount = #v30
    };

    local function _(p33) -- Line: 172
        -- upvalues: BlockEngine (ref)
        return BlockEngine:getWorldPosition(p33);
    end;

    local v34 = table.create(#v30);

    for i, v in v30 do
        local _ = i - 1;
        v34[i] = BlockEngine:getWorldPosition(v);
    end;

    p17:updateCustomVisuals(targetBlock, v20, v32, v28, v34);

    return true;
end;

function u7.getPlacePreviewPositions(p35, p36, p37, p38) -- Line: 227
    -- upvalues: DefenderScannerUtil (copy), getNearbyBlockPositions (copy), DefenderKitBalance (copy), BlockEngine (copy), KnitClient2 (copy)
    local v39 = DefenderScannerUtil.getShopBlockType(p37);
    local v40 = {};

    for _, v in p38 <= 1 and { p36 } or getNearbyBlockPositions(p36, DefenderKitBalance.ScannerNearbyUpgradeRadius) do
        if p38 <= #v40 then
            break;
        end;

        if not BlockEngine:getStore():getBlockAt(v) then
            local v41 = KnitClient2.Controllers.DefenderKitController:getBlockForSchematicPosition(v);

            if v41 ~= nil and DefenderScannerUtil.getShopBlockType(v41) == v39 then
                table.insert(v40, v);
            end;
        end;
    end;

    return v40;
end;

function u7.getUpgradePreviewPositions(p42, p43, p44, p45) -- Line: 249
    -- upvalues: DefenderScannerUtil (copy), getNearbyBlockPositions (copy), DefenderKitBalance (copy), BlockEngine (copy)
    local v46 = DefenderScannerUtil.getShopBlockType(p44);
    local v47 = {};

    for _, v in getNearbyBlockPositions(p43, DefenderKitBalance.ScannerNearbyUpgradeRadius) do
        if #v47 >= DefenderKitBalance.ScannerUpgradeBlockCount then
            break;
        end;

        local v48 = BlockEngine:getStore():getBlockAt(v);

        if v48 and p42:canPreviewUpgradeBlock(v48, p45, v46) then
            table.insert(v47, v);
        end;
    end;

    return v47;
end;

function u7.canPreviewUpgradeBlock(p49, p50, p51, p52) -- Line: 267
    -- upvalues: DefenderScannerUtil (copy)
    if not p49:isLocalTeamScannerBlock(p50) then
        return false;
    end;

    if DefenderScannerUtil.getShopBlockType(p50.Name) == p52 then
        return DefenderScannerUtil.getNextUpgradeBlockType(p50.Name) == p51;
    end;

    return false;
end;

function u7.isLocalTeamScannerBlock(p53, p54) -- Line: 276
    -- upvalues: ClientStore (copy)
    local v55 = p54:GetAttribute("PlacedByUserId");

    if v55 == nil or v55 == 0 then
        return false;
    end;

    local myTeam = ClientStore:getState().Game.myTeam;

    if myTeam then
        return myTeam.members[v55] ~= nil or myTeam.members[tostring(v55)] ~= nil;
    end;

    return false;
end;

function u7.tryPerformScannerAction(p56) -- Line: 293
    -- upvalues: KnitClient2 (copy), DefenderSchematicColors (copy), DefenderScannerMode (copy)
    if p56.currentHighlightedBlockType == nil then
        return false;
    end;

    local v57 = p56:canPerformCurrentAction();
    local v58;

    if v57 then
        v58 = DefenderSchematicColors.click;
    else
        v58 = DefenderSchematicColors.error;
    end;

    KnitClient2.Controllers.DefenderKitController:changeSchematicBlockColor(p56.currentHighlightedPosition, v58);
    local currentMode = p56.currentMode;

    if currentMode == DefenderScannerMode.UPGRADE and p56.heldUpgradeSourceBlockType == nil then
        p56.heldUpgradeSourceBlockType = p56.currentHighlightedBlockType;
    end;

    local v59;

    if currentMode == DefenderScannerMode.UPGRADE then
        v59 = p56.heldUpgradeSourceBlockType;
    else
        v59 = nil;
    end;

    local v60 = KnitClient2.Controllers.DefenderKitController:requestScannerAction(p56.currentHighlightedPosition, currentMode, v59);

    if v60 then
        p56:playScannerActionSound(currentMode);
        p56:hideCustomVisuals();
    end;

    return v60;
end;

function u7.playScannerActionSound(p61, p62) -- Line: 310
    -- upvalues: DefenderScannerMode (copy), SoundManager (copy), GameSound (copy)
    if p62 == DefenderScannerMode.REFUND then
        SoundManager:playSound(GameSound.PICKUP_ITEM_DROP);

        return;
    end;

    if p62 == DefenderScannerMode.UPGRADE then
        SoundManager:playSound(GameSound.GENERIC_BLOCK_PLACE);
    end;
end;

function u7.canPerformCurrentAction(p63) -- Line: 317
    -- upvalues: DefenderScannerMode (copy), KnitClient2 (copy), InventoryUtil (copy), Players (copy)
    if p63.currentHighlightedBlockType == nil then
        return false;
    end;

    if p63.currentMode == DefenderScannerMode.PLACE then
        return KnitClient2.Controllers.DefenderKitController:canPlayerAffordBlockAtPosition(p63.currentHighlightedPosition);
    end;

    if p63.currentMode == DefenderScannerMode.UPGRADE and p63.currentHighlightedBlockType ~= nil then
        if p63.currentActionCost then
            return InventoryUtil.hasEnough(Players.LocalPlayer, p63.currentActionCost.currency, p63.currentActionCost.price);
        end;

        return false;
    end;

    local v64;

    if p63.currentMode == DefenderScannerMode.REFUND then
        v64 = p63.currentHighlightedBlockType ~= nil;
    else
        v64 = false;
    end;

    return v64;
end;

function u7.createTestPart(p65, p66, p67) -- Line: 332
    -- upvalues: u3 (copy), Workspace (copy)
    local u68 = u3("Part", {
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Parent = Workspace,
        Color = p67,
        Material = Enum.Material.Neon,
        Position = p66
    });
    task.delay(2, function() -- Line: 344
        -- upvalues: u68 (copy)
        u68:Destroy();
    end);
end;

function u7.updateCustomVisuals(p69, p70, p71, p72, p73, p74) -- Line: 348
    -- upvalues: KnitClient2 (copy), BlockEngine (copy)
    p69:updateCustomBlockHighlights(p70, p74 or { p71 });
    KnitClient2.Controllers.DefenderPopupController:updatePopup(p70, p71, p72);
    p69.currentHighlightedPosition = BlockEngine:getBlockPosition(p71);
    p69.currentHighlightedBlockType = p73 or p70;
    local v75;

    if p72 == nil then
        v75 = p72;
    else
        v75 = p72.price;
    end;

    p69.currentActionCost = v75 ~= nil and p72.currency ~= nil and {
        price = p72.price,
        currency = p72.currency
    } or nil;
end;

function u7.hideCustomVisuals(p76) -- Line: 366
    -- upvalues: KnitClient2 (copy)
    p76:hideCustomBlockHighlight();
    KnitClient2.Controllers.DefenderPopupController:hidePopup();
    p76.currentHighlightedPosition = Vector3.new();
    p76.currentHighlightedBlockType = nil;
    p76.currentActionCost = nil;
end;

function u7.onEnable(u77, p78, p79) -- Line: 373
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), KnitClient (copy), DefenderScannerMode (copy), Flamework (copy), KnitClient2 (copy)
    local u80 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.PAINT_SHOTGUN_IDLE, {
        looped = true
    });
    u77.maid:GiveTask(function() -- Line: 377
        -- upvalues: u80 (copy)
        local v81 = u80;

        if v81 ~= nil then
            v81:Stop();
        end;
    end);
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HOLD, {
        looped = true,
        keepEnabledOnUnequipItem = false
    });
    u77:setMode(DefenderScannerMode.PLACE);
    u77:mountModeBar();
    u77:bindModeSwapAction();
    u77:updateSchematicModeView();
    u77:bindHeldActionLoop();
    u77.maid:GiveTask(function() -- Line: 393
        -- upvalues: u77 (copy), Flamework (ref), KnitClient2 (ref)
        u77:stopHeldActionLoop();
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("DefenderScannerModeBar");
        KnitClient2.Controllers.DefenderKitController:setSchematicBlocksQueryable(false);
        KnitClient2.Controllers.DefenderKitController:setSchematicBlocksVisible(true);
    end);
end;

function u7.onDisable(p82) -- Line: 400
    p82:hideCustomVisuals();
    p82.maid:DoCleaning();
end;

function u7.isRelevantItem(p83, p84) -- Line: 404
    -- upvalues: ItemType (copy)
    return p84.itemType == ItemType.DEFENSE_SCANNER;
end;

function u7.mountModeBar(u85) -- Line: 407
    -- upvalues: Flamework (copy), DefenderScannerModeBarBase (copy), DefenderScannerUtil (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "DefenderScannerModeBar",
        app = DefenderScannerModeBarBase
    }, {
        ChangeMode = function(p86) -- Line: 412, Name: ChangeMode
            -- upvalues: u85 (copy)
            return u85:changeMode(p86);
        end,

        ChangeNextMode = function() -- Line: 415, Name: ChangeNextMode
            -- upvalues: u85 (copy)
            return u85:changeNextMode();
        end,

        Modes = DefenderScannerUtil.ScannerModes
    });
end;

function u7.bindModeSwapAction(u87) -- Line: 421
    -- upvalues: Flamework (copy)
    u87.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "ItemPrimary",
        actionId = "change-defender-scanner-mode",

        boundFunction = function(p88, p89) -- Line: 425, Name: boundFunction
            -- upvalues: u87 (copy)
            if p89 == Enum.UserInputState.Begin then
                u87:changeNextMode();
            end;
        end
    }));
end;

function u7.changeMode(p90, p91) -- Line: 432
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    if p91 == p90.currentMode then
        return nil;
    end;

    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WIZARD_ABILITY_SWITCH);
    p90:setMode(p91);
end;

function u7.changeNextMode(p92) -- Line: 439
    -- upvalues: DefenderScannerUtil (copy)
    p92:changeMode(DefenderScannerUtil.getNextMode(p92.currentMode));
end;

function u7.setMode(u93, p94) -- Line: 442
    -- upvalues: ClientStore (copy)
    u93.currentMode = p94;
    u93.heldUpgradeSourceBlockType = nil;
    u93:hideCustomVisuals();
    u93:updateSchematicModeView();
    ClientStore:dispatch({
        type = "KitDefenderScannerSetMode",
        mode = p94
    });
    task.defer(function() -- Line: 451
        -- upvalues: u93 (copy)
        if u93:isEnabled() then
            u93:refreshCurrentTarget();
        end;
    end);
end;

function u7.bindHeldActionLoop(u95) -- Line: 457
    -- upvalues: UserInputService (copy)
    u95.maid:GiveTask(UserInputService.InputBegan:Connect(function(p96) -- Line: 458
        -- upvalues: u95 (copy)
        if not u95:isInputAttackEquivalent(p96) then
            return nil;
        end;

        u95:startHeldActionLoop();
    end));
    u95.maid:GiveTask(UserInputService.InputEnded:Connect(function(p97) -- Line: 464
        -- upvalues: u95 (copy)
        if not u95:isInputAttackEquivalent(p97) then
            return nil;
        end;

        u95:stopHeldActionLoop();
    end));
end;

function u7.startHeldActionLoop(u98) -- Line: 471
    -- upvalues: u6 (copy)
    if u98.isHoldingActionInput then
        return nil;
    end;

    u98.isHoldingActionInput = true;
    u98.holdActionLoopId = u98.holdActionLoopId + 1;
    local holdActionLoopId = u98.holdActionLoopId;
    task.spawn(function() -- Line: 478
        -- upvalues: u98 (copy), holdActionLoopId (copy), u6 (ref)
        task.wait(0.5);

        while u98.isHoldingActionInput and (u98.holdActionLoopId == holdActionLoopId and u98:isEnabled()) do
            if u98:refreshCurrentTarget() then
                u98:tryPerformScannerAction();
            end;

            task.wait(u6);
        end;
    end);
end;

function u7.stopHeldActionLoop(p99) -- Line: 488
    p99.isHoldingActionInput = false;
    p99.holdActionLoopId = p99.holdActionLoopId + 1;
    p99.heldUpgradeSourceBlockType = nil;
end;

function u7.updateSchematicModeView(p100) -- Line: 493
    -- upvalues: DefenderScannerMode (copy), KnitClient2 (copy)
    local v101 = p100.currentMode == DefenderScannerMode.PLACE;
    KnitClient2.Controllers.DefenderKitController:setSchematicBlocksVisible(v101);
    KnitClient2.Controllers.DefenderKitController:setSchematicBlocksQueryable(v101);
end;

function u7.updateCustomBlockHighlights(p102, p103, p104) -- Line: 498
    -- upvalues: ItemType (copy), KnitClient2 (copy), Players (copy), BedwarsShop (copy), getItemMeta (copy), Workspace (copy)
    if p103 == ItemType.WOOL_WHITE then
        local v105 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v105 then
            p103 = BedwarsShop.getTeamWoolById(v105.id) or ItemType.WOOL_WHITE;
        end;
    end;

    local block = getItemMeta(p103).block;

    if block ~= nil then
        block = block.greedyMesh;

        if block ~= nil then
            block = block.textures;
        end;
    end;

    if not block then
        p102:hideCustomBlockHighlight();

        return nil;
    end;

    local v106 = false;
    local v107 = 0;

    while true do
        if v106 then
            v107 = v107 + 1;
        else
            v106 = true;
        end;

        if v107 >= #p104 then
            break;
        end;

        local v108 = p102:getCustomBlockHighlight(v107);
        p102:applyCustomBlockHighlightTextures(v108, block);
        v108:PivotTo(CFrame.new(p104[v107 + 1]));
    end;

    local v109 = #p104;
    local v110 = false;

    while true do
        if v110 then
            v109 = v109 + 1;
        else
            v110 = true;
        end;

        if v109 >= #p102.customBlockHighlights then
            return;
        end;

        p102.customBlockHighlights[v109 + 1]:PivotTo(Workspace:GetPivot());
    end;
end;

function u7.getCustomBlockHighlight(p111, p112) -- Line: 550
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    while #p111.customBlockHighlights <= p112 do
        local v113 = ReplicatedStorage.Assets.Misc.DefenderCustomBlockHighlight:Clone();
        v113.Parent = Workspace;
        table.insert(p111.customBlockHighlights, v113);
    end;

    return p111.customBlockHighlights[p112 + 1];
end;

function u7.applyCustomBlockHighlightTextures(p114, p115, p116) -- Line: 558
    if #p116 == 1 then
        p115.Top.Texture = p116[1];
        p115.Bottom.Texture = p116[1];
        p115.Left.Texture = p116[1];
        p115.Front.Texture = p116[1];
        p115.Right.Texture = p116[1];
        p115.Back.Texture = p116[1];

        return;
    end;

    p115.Top.Texture = p116[1];
    p115.Bottom.Texture = p116[2];
    p115.Left.Texture = p116[3];
    p115.Front.Texture = p116[4];
    p115.Right.Texture = p116[5];
    p115.Back.Texture = p116[6];
end;

function u7.hideCustomBlockHighlight(p117) -- Line: 575
    -- upvalues: Workspace (copy)
    local function _(p118) -- Line: 577
        -- upvalues: Workspace (ref)
        p118:PivotTo(Workspace:GetPivot());
    end;

    for i, v in p117.customBlockHighlights do
        local _ = i - 1;
        v:PivotTo(Workspace:GetPivot());
    end;
end;

KnitClient.CreateController(u7.new());

return nil;