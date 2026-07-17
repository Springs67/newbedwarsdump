-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "partcache", "out");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance");
local DefenderKitBalance = v5.DefenderKitBalance;
local DefenderScannerMode = v5.DefenderScannerMode;
local DefenderScannerUtil = v5.DefenderScannerUtil;
local DefenderSchematicColors = v5.DefenderSchematicColors;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u6 = {
    {
        name = "Top",
        textureIndex = 0,
        face = Enum.NormalId.Top
    },
    {
        name = "Bottom",
        textureIndex = 1,
        face = Enum.NormalId.Bottom
    },
    {
        name = "Left",
        textureIndex = 2,
        face = Enum.NormalId.Left
    },
    {
        name = "Front",
        textureIndex = 3,
        face = Enum.NormalId.Front
    },
    {
        name = "Right",
        textureIndex = 4,
        face = Enum.NormalId.Right
    },
    {
        name = "Back",
        textureIndex = 5,
        face = Enum.NormalId.Back
    }
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 65, Name: __tostring
        return "DefenderKitController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 71
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 75
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), default2 (copy), ExpireList (copy)
    BaseKitController.constructor(p9, BedwarsKit.DEFENDER, {
        sounds = {
            GameSound.DEFENDER_UPGRADE_DEFENSE_01,
            GameSound.DEFENDER_UPGRADE_DEFENSE_02,
            GameSound.DEFENDER_UPGRADE_DEFENSE_03,
            GameSound.DEFENDER_UPGRADE_DEFENSE_04
        }
    });
    p9.Name = "DefenderKitController";
    p9.requestPlaceDefenderBlockRemote = default2.Client:Get("DefenderRequestPlaceBlock");
    p9.defenderBlockPlaced = default2.Client:Get("DefenderBlockPlaced");
    p9.currentSchematic = {};
    p9.schematicBlockMap = {};
    p9.schematicBlockDisplayState = {};
    p9.schematicBlockNormalColor = {};
    p9.schematicBlocksQueryable = false;
    p9.schematicBlocksVisible = true;
    p9.refundProgress = {};
    p9.placementProgress = {};
    p9.blockCreationEffectCaches = {};
    p9.blockCreationEffectCacheFolder = nil;
    p9.localBlockCreationEffectPositions = ExpireList.new(3);
    p9.activeBlockCreationEffects = 0;
    p9.spamClickPosition = ExpireList.new(0.4);
end;

function u7.KnitStart(u10) -- Line: 96
    -- upvalues: BaseKitController (copy), default2 (copy)
    BaseKitController.KnitStart(u10);
    default2.Client:Get("UpdateDefenderSchematic"):Connect(function(p11) -- Line: 98
        -- upvalues: u10 (copy)
        u10:handleSchematicChange((u10:fixVectorMap(p11)));
        u10:applySchematicBlockDisplayStates();
    end);
end;

function u7.fixVectorMap(p12, p13) -- Line: 104
    local u14 = {};

    local function _(p15, p16) -- Line: 107
        -- upvalues: u14 (copy)
        u14[p15.ps] = p15.bl;
    end;

    for i, v in p13 do
        local _ = i - 1;
        u14[v.ps] = v.bl;
    end;

    return u14;
end;

function u7.canPlayerAffordBlockAtPosition(p17, p18) -- Line: 117
    -- upvalues: InventoryUtil (copy), Players (copy)
    local v19 = p17:getBlockCostFromPosition(p18);

    if v19 then
        return InventoryUtil.hasEnough(Players.LocalPlayer, v19.currency, v19.price);
    end;

    return false;
end;

function u7.getBlockCostFromPosition(p20, p21) -- Line: 127
    local v22 = p20:getBlockForSchematicPosition(p21);

    if v22 then
        return p20:getBlockCostFromBlock(v22);
    end;

    return nil;
end;

function u7.getBlockCostFromBlock(p23, p24) -- Line: 134
    -- upvalues: DefenderScannerUtil (copy), BedwarsShop (copy), Players (copy), ItemType (copy), DefenderKitBalance (copy)
    local v25 = DefenderScannerUtil.getShopBlockType(p24);
    local v26 = BedwarsShop.getShopItem(v25, Players.LocalPlayer);

    if not v26 then
        return nil;
    end;

    if v25 ~= ItemType.WOOL_WHITE then
        return {
            price = math.ceil(v26.price / v26.amount),
            currency = v26.currency
        };
    end;

    local v27 = DefenderScannerUtil.getScaledPlacementValue(v26.price, v26.amount, DefenderKitBalance.ScannerWoolPlaceResourceAmount);

    if v27 <= 0 then
        return nil;
    end;

    local v28 = {
        price = DefenderKitBalance.ScannerWoolPlaceResourceAmount,
        currency = v26.currency
    };
    local getPlacementBlockCount = DefenderScannerUtil.getPlacementBlockCount;
    local v29 = p23:getPlacementProgress(v25);
    v28.blockCount = math.max(1, getPlacementBlockCount(v29, v27));

    return v28;
end;

function u7.getBlockValueFromBlock(p30, p31) -- Line: 158
    -- upvalues: DefenderScannerUtil (copy), BedwarsShop (copy), Players (copy)
    local v32 = DefenderScannerUtil.getShopBlockType(p31);
    local v33 = BedwarsShop.getShopItem(v32, Players.LocalPlayer);

    return v33 and {
        price = v33.price / v33.amount,
        currency = v33.currency
    } or nil;
end;

function u7.getBlockRefundValueFromBlock(p34, p35) -- Line: 169
    -- upvalues: DefenderScannerUtil (copy), BedwarsShop (copy), Players (copy)
    local v36 = DefenderScannerUtil.getShopBlockType(p35);
    local v37 = BedwarsShop.getShopItem(v36, Players.LocalPlayer);

    if not v37 then
        return nil;
    end;

    local v38 = DefenderScannerUtil.getScaledRefundValue(v37.price, v37.amount);

    if v38 <= 0 then
        return nil;
    end;

    local v39 = p34:getRefundProgress(v36);
    local v40 = DefenderScannerUtil.getRefundProgress(v39, v38);
    local v41 = DefenderScannerUtil.getRefundAmount(v39, v38);

    return {
        price = math.max(1, v41),
        currency = DefenderScannerUtil.getRefundCurrency(p35, v37.currency),
        progress = v40.current / v40.required,
        blocksUntilNextRefund = v40.blocksUntilNextRefund
    };
end;

function u7.getBlockUpgradeCostFromBlock(p42, p43, p44) -- Line: 189
    -- upvalues: DefenderScannerUtil (copy)
    local v45 = DefenderScannerUtil.getNextUpgradeBlockType(p43);

    if not v45 then
        return nil;
    end;

    local v46 = p42:getBlockValueFromBlock(v45);

    if not v46 then
        return nil;
    end;

    local v47 = p42:getBlockValueFromBlock(p43);
    local price = v46.price;

    if v47 and (v47.currency == v46.currency and v46.price > v47.price) then
        price = v46.price - v47.price;
    end;

    return {
        targetBlock = v45,
        price = math.ceil(price * (p44 == nil and 1 or p44)),
        currency = v46.currency
    };
end;

function u7.handleSchematicChange(u48, u49) -- Line: 213
    local function _(p50, p51) -- Line: 216
        -- upvalues: u49 (copy), u48 (copy)
        if u49[p51] == nil then
            local v52 = u48.schematicBlockMap[p51];

            if v52 then
                u48.schematicBlockDisplayState[v52] = nil;
                u48.schematicBlockNormalColor[v52] = nil;
                v52:Destroy();
            end;

            u48.schematicBlockMap[p51] = nil;
        end;
    end;

    for i, _ in u48.currentSchematic do
        if u49[i] == nil then
            local v53 = u48.schematicBlockMap[i];

            if v53 then
                u48.schematicBlockDisplayState[v53] = nil;
                u48.schematicBlockNormalColor[v53] = nil;
                v53:Destroy();
            end;

            u48.schematicBlockMap[i] = nil;
        end;
    end;

    local function _(p54, p55) -- Line: 238
        -- upvalues: u48 (copy)
        if u48.currentSchematic[p55] == nil then
            u48:createSchematicBlockHighlight(p55, p54);
        end;
    end;

    for i, v in u49 do
        if u48.currentSchematic[i] == nil then
            u48:createSchematicBlockHighlight(i, v);
        end;
    end;

    u48.currentSchematic = u49;
end;

function u7.onKitReplicationActivated(u56, p57) -- Line: 250
    -- upvalues: Players (copy)
    p57:GiveTask(u56.defenderBlockPlaced:Connect(function(p58, p59, p60) -- Line: 251
        -- upvalues: Players (ref), u56 (copy)
        if p58 == Players.LocalPlayer and u56.localBlockCreationEffectPositions:has(p59) then
            return nil;
        end;

        u56:onDefenderBlockPlaced(p58, p60, p59, false);
    end));
end;

function u7.onKitLocalActivated(p61, p62) -- Line: 258
end;

function u7.onKitLocalDeactivated(p63) -- Line: 260
end;

function u7.onKitReplicationDeactivated(p64) -- Line: 262
end;

function u7.onInnateAbilityEnabled(p65, p66, p67) -- Line: 264
end;

function u7.onAbilityUsed(p68, p69, p70) -- Line: 266
end;

function u7.setSchematicBlocksQueryable(p71, p72) -- Line: 268
    p71.schematicBlocksQueryable = p72;
    p71:applySchematicBlockDisplayStates();
end;

function u7.setSchematicBlocksVisible(p73, p74) -- Line: 272
    p73.schematicBlocksVisible = p74;
    p73:applySchematicBlockDisplayStates();
end;

function u7.onDefenderBlockPlaced(p75, p76, p77, p78, p79, p80, p81) -- Line: 276
    -- upvalues: BlockEngine (copy)
    local v82 = p80 == nil and 0 or p80;
    local v83 = p81 == nil and 1 or p81;

    if p79 then
        if v83 > 1 then
            p79 = v82 > 0;
        else
            p79 = false;
        end;
    end;

    p75:createBlockCreationEffect(p76, p77, BlockEngine:getWorldPosition(p78), {
        playSound = not p79,
        playFloorEffect = not p79,
        segmentCount = p79 and 2 or nil
    });
end;

function u7.isValidSchematicPosition(p84, p85) -- Line: 290
    if p84.currentSchematic then
        return p84.currentSchematic[p85] ~= nil;
    end;

    return false;
end;

function u7.getBlockForSchematicPosition(p86, p87) -- Line: 299
    return p86.currentSchematic[p87];
end;

function u7.requestPlaceDefenderBlock(p88, p89) -- Line: 305
    -- upvalues: DefenderScannerMode (copy)
    return p88:requestScannerAction(p89, DefenderScannerMode.PLACE);
end;

function u7.requestScannerAction(p90, p91, p92, p93) -- Line: 308
    -- upvalues: Players (copy), DefenderScannerMode (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return false;
    end;

    if p92 == DefenderScannerMode.PLACE and not p90:isValidSchematicPosition(p91) then
        return false;
    end;

    if p90.spamClickPosition:has(p91) then
        return false;
    end;

    p90.spamClickPosition:add(p91);
    local v94 = p90.requestPlaceDefenderBlockRemote:CallServer({
        blockPos = p91,
        mode = p92,
        sourceBlockType = p93
    });
    local v95;

    if v94 == nil then
        v95 = v94;
    else
        v95 = v94.blockType;
    end;

    if v95 ~= nil and p92 ~= DefenderScannerMode.REFUND then
        local v96 = v94.blockPositions or { p91 };

        for i, v in ipairs(v96) do
            p90.localBlockCreationEffectPositions:add(v);
            p90:onDefenderBlockPlaced(Players.LocalPlayer, v94.blockType, v, true, i - 1, #v96);
        end;
    end;

    local v97;

    if v94 == nil then
        v97 = v94;
    else
        v97 = v94.blockType;
    end;

    if v97 ~= nil and v94.refund ~= nil then
        p90:setRefundProgress(v94.blockType, v94.refund.progress.current);
    end;

    local v98;

    if v94 == nil then
        v98 = v94;
    else
        v98 = v94.blockType;
    end;

    local v99 = v98 ~= nil;

    if v99 then
        local cost = v94.cost;

        if cost ~= nil then
            cost = cost.placementProgress;
        end;

        v99 = cost ~= nil;
    end;

    if v99 then
        p90:setPlacementProgress(v94.blockType, v94.cost.placementProgress);
    end;

    return v94 ~= nil;
end;

function u7.getRefundProgress(p100, p101) -- Line: 372
    return p100:getScannerProgress(p100.refundProgress, p101);
end;

function u7.setRefundProgress(p102, p103, p104) -- Line: 375
    p102:setScannerProgress(p102.refundProgress, p103, p104);
end;

function u7.getPlacementProgress(p105, p106) -- Line: 378
    return p105:getScannerProgress(p105.placementProgress, p106);
end;

function u7.setPlacementProgress(p107, p108, p109) -- Line: 381
    p107:setScannerProgress(p107.placementProgress, p108, p109);
end;

function u7.getScannerProgress(p110, p111, p112) -- Line: 384
    -- upvalues: DefenderScannerUtil (copy)
    local v113 = p111[DefenderScannerUtil.getShopBlockType(p112)];

    return v113 == nil and 0 or v113;
end;

function u7.setScannerProgress(p114, p115, p116, p117) -- Line: 393
    -- upvalues: DefenderScannerUtil (copy)
    p115[DefenderScannerUtil.getShopBlockType(p116)] = p117;
end;

function u7.createBlockCreationEffect(u118, p119, p120, u121, p122) -- Line: 399
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), ClientSyncEvents (copy), DefenderKitBalance (copy), RandomUtil (copy), GameSound (copy), SoundManager (copy), Workspace (copy), default (copy), OutExpo (copy)
    local u123 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p119);
    local v124;

    if u123 == nil then
        v124 = u123;
    else
        v124 = u123.marcel;

        if v124 ~= nil then
            v124 = v124.blockCreationEffect;
        end;
    end;

    if v124 == nil then
        v124 = ReplicatedStorage.Assets.Effects.BlockCreationEffect;
    end;

    local v125 = u118:getBlockCreationEffectCache(v124);
    local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(DefenderKitBalance.BlockCreationTime).cooldown;
    local v126 = u118.activeBlockCreationEffects >= 1;
    local v127;

    if p122 == nil then
        v127 = p122;
    else
        v127 = p122.segmentCount;
    end;

    local v128 = v127 == nil and (v126 and 2 or 4) or v127;
    local v129;

    if p122 == nil then
        v129 = p122;
    else
        v129 = p122.playSound;
    end;

    if v129 == nil then
        v129 = not v126;
    end;

    if p122 ~= nil then
        p122 = p122.playFloorEffect;
    end;

    if p122 == nil then
        p122 = not v126;
    end;

    u118.activeBlockCreationEffects = u118.activeBlockCreationEffects + 1;
    task.delay(2.8 + cooldown, function() -- Line: 444
        -- upvalues: u118 (copy)
        u118.activeBlockCreationEffects = math.max(0, u118.activeBlockCreationEffects - 1);
    end);

    if v129 then
        task.spawn(function() -- Line: 448
            -- upvalues: u123 (copy), RandomUtil (ref), GameSound (ref), SoundManager (ref), u121 (copy)
            local v130 = u123;

            if v130 ~= nil then
                v130 = v130.marcel;

                if v130 ~= nil then
                    v130 = v130.createBlockSound;
                end;
            end;

            local v131;

            if v130 then
                local v132 = u123;

                if v132 ~= nil then
                    v132 = v132.marcel;

                    if v132 ~= nil then
                        v132 = v132.createBlockSound;
                    end;
                end;

                v131 = RandomUtil.fromList(unpack(v132));
            else
                v131 = RandomUtil.fromList(GameSound.DEFENDER_UPGRADE_DEFENSE_01, GameSound.DEFENDER_UPGRADE_DEFENSE_02, GameSound.DEFENDER_UPGRADE_DEFENSE_03, GameSound.DEFENDER_UPGRADE_DEFENSE_04);
            end;

            SoundManager:playSound(v131, {
                playbackSpeedMultiplier = 0.8,
                position = u121
            });
        end);
    end;

    if v125 then
        u118:playCachedBlockCreationEffect(v125, p120, u121, cooldown, v128);
    end;

    if not p122 then
        return nil;
    end;

    if u123 ~= nil then
        u123 = u123.marcel;

        if u123 ~= nil then
            u123 = u123.blockCreationFloorEffect;
        end;
    end;

    if u123 == nil then
        u123 = ReplicatedStorage.Assets.Effects.BlockCreationFloorEffect;
    end;

    local u133 = u123:Clone();
    u133.Parent = Workspace;
    u133:PivotTo(CFrame.new(u121 - Vector3.new(0, 1.5, 0)));
    task.delay(cooldown, function() -- Line: 500
        -- upvalues: u133 (copy), default (ref), OutExpo (ref), cooldown (copy)
        local v134 = u133:GetDescendants();

        local function v137(u135) -- Line: 502
            -- upvalues: default (ref), OutExpo (ref)
            if u135:IsA("ParticleEmitter") then
                u135.Enabled = false;

                return;
            end;

            if u135:IsA("ImageLabel") then
                default(1, OutExpo, function(p136) -- Line: 506
                    -- upvalues: u135 (copy)
                    u135.ImageTransparency = p136;
                end, 0, 1):Play();
            end;
        end;

        for i, v in v134 do
            v137(v, i - 1, v134);
        end;

        task.wait(cooldown);
        u133:Destroy();
    end);
end;

function u7.getBlockCreationEffectCache(p138, p139) -- Line: 518
    -- upvalues: u2 (copy), GameQueryUtil (copy), u3 (copy)
    local v140 = p138.blockCreationEffectCaches[p139];

    if v140 then
        return v140;
    end;

    local v141 = p138:getBlockCreationEffectSegments(p139);
    local v142 = v141[1];

    if v142 ~= nil then
        v142 = v142.cubes[1];
    end;

    if not v142 then
        return nil;
    end;

    local v143 = u2("Part", {
        Name = "DefenderBlockCreationCube",
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Transparency = 1,
        Size = v142.size,
        Color = v142.color,
        Material = v142.material
    });
    p138:getBlockCreationTextureInstances(v143);
    GameQueryUtil:setQueryIgnored(v143, true);
    local v144 = u3.new(v143, 128);
    v144:SetCacheParent(p138:getBlockCreationEffectCacheFolder());
    local v145 = {
        partCache = v144,
        segments = v141
    };
    p138.blockCreationEffectCaches[p139] = v145;

    return v145;
end;

function u7.getBlockCreationEffectSegments(p146, p147) -- Line: 558
    local v148 = p147:GetPivot();
    local v149 = false;
    local v150 = 1;
    local v151 = (1 / 0);
    local v152 = (1 / 0);
    local v153 = (-1 / 0);
    local v154 = (-1 / 0);
    local v155 = (-1 / 0);
    local v156 = {};
    local v157 = (1 / 0);

    while true do
        if v149 then
            v150 = v150 + 1;
        else
            v149 = true;
        end;

        if v150 > 9 then
            break;
        end;

        local v158 = p147:FindFirstChild(v150);

        if v158 then
            local v159 = false;
            local v160 = 1;

            while true do
                if true then
                    if v159 then
                        v160 = v160 + 1;
                    else
                        v159 = true;
                    end;
                end;

                if v160 > 3 then
                    break;
                end;

                local v161 = v158:FindFirstChild(v160);

                if v161 then
                    local v162 = v148:ToObjectSpace(v161:GetPivot());
                    local Position = v162.Position;
                    v157 = math.min(v157, Position.X - v161.Size.X / 2);
                    v151 = math.min(v151, Position.Y - v161.Size.Y / 2);
                    v152 = math.min(v152, Position.Z - v161.Size.Z / 2);
                    v153 = math.max(v153, Position.X + v161.Size.X / 2);
                    v154 = math.max(v154, Position.Y + v161.Size.Y / 2);
                    v155 = math.max(v155, Position.Z + v161.Size.Z / 2);
                    table.insert(v156, {
                        relativeCFrame = v162,
                        size = v161.Size,
                        color = v161.Color,
                        material = v161.Material
                    });
                end;
            end;
        end;
    end;

    local v163 = v156[1];

    if not v163 then
        return {};
    end;

    local v164 = Vector3.new((v153 - v157) / 2, (v154 - v151) / 2, (v155 - v152) / 2);
    local v165 = false;
    local v166 = 0;
    local v167 = {};
    local v168;

    while true do
        if v165 then
            v166 = v166 + 1;
        else
            v165 = true;
        end;

        if v166 >= 2 then
            return v167;
        end;

        local v169 = false;
        v168 = 0;

        if true then
            if v169 then
                v168 = v168 + 1;
            else
                v169 = true;
            end;
        end;

        if v168 < 2 then
            break;
        end;
    end;

    local v170 = false;
    local v171 = 0;
    local v172 = {};

    while true do
        if true then
            if v170 then
                v171 = v171 + 1;
            else
                v170 = true;
            end;
        end;

        if v171 >= 2 then
            table.insert(v167, {
                cubes = v172
            });
        end;

        local v173 = {
            relativeCFrame = CFrame.new(v157 + v164.X * (v166 + 0.5), v151 + v164.Y * (v171 + 0.5), v152 + v164.Z * (v168 + 0.5)),
            size = v164,
            color = v163.color,
            material = v163.material
        };
        table.insert(v172, v173);
    end;
end;

function u7.getBlockCreationEffectCacheFolder(p174) -- Line: 680
    -- upvalues: u2 (copy), Workspace (copy)
    if p174.blockCreationEffectCacheFolder then
        return p174.blockCreationEffectCacheFolder;
    end;

    p174.blockCreationEffectCacheFolder = u2("Folder", {
        Name = "DefenderBlockCreationEffectCache",
        Parent = Workspace.Terrain
    });

    return p174.blockCreationEffectCacheFolder;
end;

function u7.playCachedBlockCreationEffect(u175, u176, u177, p178, u179, u180) -- Line: 690
    -- upvalues: RandomUtil (copy), default (copy), OutExpo (copy)
    local u181 = CFrame.new(p178 + Vector3.new(0, 3.1, 0));

    local function _(u182, u183) -- Line: 695
        -- upvalues: u180 (copy), u176 (copy), u175 (copy), u177 (copy), u181 (copy), default (ref), u179 (copy), OutExpo (ref)
        if u180 <= u183 then
            return nil;
        end;

        task.delay(u183 * 0.1, function() -- Line: 699
            -- upvalues: u182 (copy), u176 (ref), u175 (ref), u177 (ref), u183 (copy), u181 (ref), default (ref), u179 (ref), OutExpo (ref)
            local cubes = u182.cubes;

            local function v196(p184, p185) -- Line: 701
                -- upvalues: u176 (ref), u175 (ref), u177 (ref), u183 (ref), u181 (ref), u182 (ref), default (ref), u179 (ref), OutExpo (ref)
                local u186 = u176.partCache:GetPart();
                local u187 = u175:prepareCachedBlockCreationCube(u186, p184, u177, p185 + 1, u183 % 3, u181);
                task.delay((#u182.cubes - (p185 + 1)) * 0.4, function() -- Line: 704
                    -- upvalues: u186 (copy), default (ref), u179 (ref), OutExpo (ref), u187 (copy), u175 (ref), u176 (ref)
                    local u188 = u186:GetPivot();
                    local Size = u186.Size;
                    local u189 = u186:GetPivot() - Vector3.new(0, 3, 0);
                    task.spawn(function() -- Line: 710
                        -- upvalues: u186 (ref), u188 (copy), default (ref), u179 (ref), OutExpo (ref), u189 (copy), Size (copy)
                        u186:PivotTo(u188);
                        default(0.35 * u179, OutExpo, function(p190) -- Line: 712
                            -- upvalues: u186 (ref), u188 (ref), u189 (ref), Size (ref)
                            u186:PivotTo(u188:Lerp(u189, p190));
                            u186.Size = (Size * 0.85):Lerp(Size, p190);
                        end, 0, 1):Play();
                    end);
                    task.spawn(function() -- Line: 717
                        -- upvalues: u186 (ref), default (ref), u179 (ref), OutExpo (ref)
                        u186.Transparency = 1;
                        default(0.15 * u179, OutExpo, function(p191) -- Line: 719
                            -- upvalues: u186 (ref)
                            u186.Transparency = p191;
                        end, 1, 0):Play();
                    end);
                    task.delay(0.75, function() -- Line: 723
                        -- upvalues: default (ref), u179 (ref), OutExpo (ref), u187 (ref)
                        default(0.25 * u179, OutExpo, function(u192) -- Line: 724
                            -- upvalues: u187 (ref)
                            local function _(p193) -- Line: 725
                                -- upvalues: u192 (copy)
                                p193.Transparency = u192;

                                return p193.Transparency;
                            end;

                            for i, v in u187 do
                                local _ = i - 1;
                                v.Transparency = u192;
                                local _ = v.Transparency;
                            end;
                        end, 1, 0):Play();
                    end);
                    task.delay(2, function() -- Line: 734
                        -- upvalues: default (ref), u179 (ref), OutExpo (ref), u186 (ref), u187 (ref)
                        default(0.5 * u179, OutExpo, function(u194) -- Line: 735
                            -- upvalues: u186 (ref), u187 (ref)
                            u186.Transparency = u194;

                            local function _(p195) -- Line: 737
                                -- upvalues: u194 (copy)
                                p195.Transparency = u194;

                                return p195.Transparency;
                            end;

                            for i, v in u187 do
                                local _ = i - 1;
                                v.Transparency = u194;
                                local _ = v.Transparency;
                            end;
                        end, 0, 1):Play();
                    end);
                    task.delay(2 + 0.5 * u179, function() -- Line: 746
                        -- upvalues: u175 (ref), u176 (ref), u186 (ref), u187 (ref)
                        u175:returnCachedBlockCreationCube(u176, u186, u187);
                    end);
                end);
            end;

            for i, v in cubes do
                v196(v, i - 1, cubes);
            end;
        end);
    end;

    for i, v in RandomUtil.shuffleArray(u176.segments) do
        local u197 = i - 1;

        if u180 > u197 then
            task.delay(u197 * 0.1, function() -- Line: 699
                -- upvalues: v (copy), u176 (copy), u175 (copy), u177 (copy), u197 (copy), u181 (copy), default (ref), u179 (copy), OutExpo (ref)
                local cubes = v.cubes;

                local function v210(p198, p199) -- Line: 701
                    -- upvalues: u176 (ref), u175 (ref), u177 (ref), u197 (ref), u181 (ref), v (ref), default (ref), u179 (ref), OutExpo (ref)
                    local u200 = u176.partCache:GetPart();
                    local u201 = u175:prepareCachedBlockCreationCube(u200, p198, u177, p199 + 1, u197 % 3, u181);
                    task.delay((#v.cubes - (p199 + 1)) * 0.4, function() -- Line: 704
                        -- upvalues: u200 (copy), default (ref), u179 (ref), OutExpo (ref), u201 (copy), u175 (ref), u176 (ref)
                        local u202 = u200:GetPivot();
                        local Size = u200.Size;
                        local u203 = u200:GetPivot() - Vector3.new(0, 3, 0);
                        task.spawn(function() -- Line: 710
                            -- upvalues: u200 (ref), u202 (copy), default (ref), u179 (ref), OutExpo (ref), u203 (copy), Size (copy)
                            u200:PivotTo(u202);
                            default(0.35 * u179, OutExpo, function(p204) -- Line: 712
                                -- upvalues: u200 (ref), u202 (ref), u203 (ref), Size (ref)
                                u200:PivotTo(u202:Lerp(u203, p204));
                                u200.Size = (Size * 0.85):Lerp(Size, p204);
                            end, 0, 1):Play();
                        end);
                        task.spawn(function() -- Line: 717
                            -- upvalues: u200 (ref), default (ref), u179 (ref), OutExpo (ref)
                            u200.Transparency = 1;
                            default(0.15 * u179, OutExpo, function(p205) -- Line: 719
                                -- upvalues: u200 (ref)
                                u200.Transparency = p205;
                            end, 1, 0):Play();
                        end);
                        task.delay(0.75, function() -- Line: 723
                            -- upvalues: default (ref), u179 (ref), OutExpo (ref), u201 (ref)
                            default(0.25 * u179, OutExpo, function(u206) -- Line: 724
                                -- upvalues: u201 (ref)
                                local function _(p207) -- Line: 725
                                    -- upvalues: u206 (copy)
                                    p207.Transparency = u206;

                                    return p207.Transparency;
                                end;

                                for i2, v2 in u201 do
                                    local _ = i2 - 1;
                                    v2.Transparency = u206;
                                    local _ = v2.Transparency;
                                end;
                            end, 1, 0):Play();
                        end);
                        task.delay(2, function() -- Line: 734
                            -- upvalues: default (ref), u179 (ref), OutExpo (ref), u200 (ref), u201 (ref)
                            default(0.5 * u179, OutExpo, function(u208) -- Line: 735
                                -- upvalues: u200 (ref), u201 (ref)
                                u200.Transparency = u208;

                                local function _(p209) -- Line: 737
                                    -- upvalues: u208 (copy)
                                    p209.Transparency = u208;

                                    return p209.Transparency;
                                end;

                                for i2, v2 in u201 do
                                    local _ = i2 - 1;
                                    v2.Transparency = u208;
                                    local _ = v2.Transparency;
                                end;
                            end, 0, 1):Play();
                        end);
                        task.delay(2 + 0.5 * u179, function() -- Line: 746
                            -- upvalues: u175 (ref), u176 (ref), u200 (ref), u201 (ref)
                            u175:returnCachedBlockCreationCube(u176, u200, u201);
                        end);
                    end);
                end;

                for i2, v2 in cubes do
                    v210(v2, i2 - 1, cubes);
                end;
            end);
        end;
    end;
end;

function u7.prepareCachedBlockCreationCube(p211, p212, p213, p214, p215, p216, p217) -- Line: 760
    -- upvalues: GameQueryUtil (copy)
    p212.Anchored = true;
    p212.CanCollide = false;
    p212.CanQuery = false;
    p212.CanTouch = false;
    p212.Size = p213.size;
    p212.Color = p213.color;
    p212.Material = p213.material;
    p212.Transparency = 1;
    p212:PivotTo(p217:ToWorldSpace(p213.relativeCFrame));
    GameQueryUtil:setQueryIgnored(p212, true);

    return p211:applyBlockTexturesToPart(p212, p214, p215, p216);
end;

function u7.returnCachedBlockCreationCube(p218, p219, p220, p221) -- Line: 773
    p220.Transparency = 1;

    local function _(p222) -- Line: 776
        p222.Transparency = 1;

        return p222.Transparency;
    end;

    for i, v in p221 do
        local _ = i - 1;
        v.Transparency = 1;
        local _ = v.Transparency;
    end;

    p219.partCache:ReturnPart(p220);
end;

function u7.getBlockCreationTextureInstances(p223, u224) -- Line: 785
    -- upvalues: u2 (copy), u6 (copy)
    local function _(p225) -- Line: 786
        -- upvalues: u224 (copy), u2 (ref)
        return u224:FindFirstChild(p225.name) or u2("Texture", {
            Name = p225.name,
            Face = p225.face,
            Parent = u224
        });
    end;

    local v226 = table.create(#u6);

    for i, v in u6 do
        local _ = i - 1;
        v226[i] = u224:FindFirstChild(v.name) or u2("Texture", {
            Name = v.name,
            Face = v.face,
            Parent = u224
        });
    end;

    return v226;
end;

function u7.applyBlockTexturesToPart(p227, p228, p229, u230, u231) -- Line: 805
    -- upvalues: getItemMeta (copy)
    local block = getItemMeta(p229).block;

    if block ~= nil then
        block = block.greedyMesh;

        if block ~= nil then
            block = block.textures;
        end;
    end;

    local v232 = p227:getBlockCreationTextureInstances(p228);

    local function _(p233, p234) -- Line: 815
        -- upvalues: block (copy), u231 (copy), u230 (copy)
        local v235;

        if block then
            if #block == 1 then
                v235 = block[1];
            else
                v235 = block[p234 + 1];

                if v235 == nil then
                    v235 = block[1];
                end;
            end;
        else
            v235 = "";
        end;

        p233.Texture = v235;
        p233.StudsPerTileU = 3;
        p233.StudsPerTileV = 3;
        p233.OffsetStudsV = u231;
        p233.OffsetStudsU = u230;
        p233.Transparency = 1;
    end;

    for i, v in v232 do
        local v236 = i - 1;
        local v237;

        if block then
            if #block == 1 then
                v237 = block[1];
            else
                v237 = block[v236 + 1];

                if v237 == nil then
                    v237 = block[1];
                end;
            end;
        else
            v237 = "";
        end;

        v.Texture = v237;
        v.StudsPerTileU = 3;
        v.StudsPerTileV = 3;
        v.OffsetStudsV = u231;
        v.OffsetStudsU = u230;
        v.Transparency = 1;
    end;

    return v232;
end;

function u7.changeSchematicBlockColor(u238, p239, p240) -- Line: 845
    -- upvalues: DefenderSchematicColors (copy)
    local u241 = u238.schematicBlockMap[p239];

    if not u241 then
        return nil;
    end;

    local u242 = u238:getSchematicBlockColorPart(u241);

    if not u242 then
        return nil;
    end;

    u242.Color = p240;
    task.delay(1, function() -- Line: 857
        -- upvalues: u242 (copy), u238 (copy), u241 (copy), DefenderSchematicColors (ref)
        if not u242.Parent then
            return nil;
        end;

        u242.Color = u238.schematicBlockNormalColor[u241] or DefenderSchematicColors.normal;
    end);
end;

function u7.createSchematicBlockHighlight(p243, p244, p245) -- Line: 864
    -- upvalues: KnitClient (copy), Players (copy), ReplicatedStorage (copy), Workspace (copy), BlockEngine (copy), getItemMeta (copy)
    local v246 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(Players.LocalPlayer);
    local v247 = p243.schematicBlockMap[p244];

    if v247 then
        p243.schematicBlockDisplayState[v247] = nil;
        p243.schematicBlockNormalColor[v247] = nil;
        v247:Destroy();
    end;

    if v246 ~= nil then
        v246 = v246.marcel;

        if v246 ~= nil then
            v246 = v246.defenderSchematicBlock;
        end;
    end;

    if v246 == nil then
        v246 = ReplicatedStorage.Assets.Effects.DefenderSchematicBlock;
    end;

    local v248 = v246:Clone();
    v248.Parent = Workspace;
    local v249 = p243:getSchematicBlockColorPart(v248);

    if v249 then
        p243.schematicBlockNormalColor[v248] = v249.Color;
    end;

    local v250 = BlockEngine:getWorldPosition(p244);
    v248:PivotTo(CFrame.new(v250));
    local image = getItemMeta(p245).image;
    v248.Billboard.BlockIcon.Image = image == nil and "" or image;
    v248:SetAttribute("Block", true);
    local u251 = {};
    local u252 = {};
    u251[v248] = v248.Transparency;

    local function _(p253) -- Line: 908
        -- upvalues: u251 (copy), u252 (copy)
        if p253:IsA("BasePart") then
            u251[p253] = p253.Transparency;

            return;
        end;

        if p253:IsA("BillboardGui") then
            u252[p253] = p253.Enabled;
        end;
    end;

    for i, descendant in v248:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            u251[descendant] = descendant.Transparency;
        elseif descendant:IsA("BillboardGui") then
            u252[descendant] = descendant.Enabled;
        end;
    end;

    p243.schematicBlockDisplayState[v248] = {
        partTransparency = u251,
        billboardEnabled = u252
    };
    p243.schematicBlockMap[p244] = v248;
    p243:applySchematicBlockDisplayState(v248);
end;

function u7.getSchematicBlockColorPart(p254, p255) -- Line: 933
    local Grid = p255:FindFirstChild("Grid");
    local v256;

    if Grid == nil then
        v256 = Grid;
    else
        v256 = Grid:IsA("BasePart");
    end;

    if v256 then
        return Grid;
    end;

    return p255;
end;

function u7.applySchematicBlockDisplayStates(u257) -- Line: 944
    local function _(p258) -- Line: 946
        -- upvalues: u257 (copy)
        u257:applySchematicBlockDisplayState(p258);
    end;

    for _, v in u257.schematicBlockMap do
        u257:applySchematicBlockDisplayState(v);
    end;
end;

function u7.applySchematicBlockDisplayState(u259, p260) -- Line: 953
    -- upvalues: GameQueryUtil (copy)
    local u261 = u259.schematicBlocksVisible and u259.schematicBlocksQueryable;
    local v262 = u259.schematicBlockDisplayState[p260];

    if not v262 then
        p260.CanQuery = u261;
        GameQueryUtil:setQueryIgnored(p260, not u261);

        return nil;
    end;

    local function _(p263, p264) -- Line: 964
        -- upvalues: u261 (copy), u259 (copy), GameQueryUtil (ref)
        p264.CanQuery = u261;
        p264.Transparency = not u259.schematicBlocksVisible and 1 or p263;
        GameQueryUtil:setQueryIgnored(p264, not u261);
    end;

    for i, v in v262.partTransparency do
        i.CanQuery = u261;
        i.Transparency = not u259.schematicBlocksVisible and 1 or v;
        GameQueryUtil:setQueryIgnored(i, not u261);
    end;

    local function _(p265, p266) -- Line: 973
        -- upvalues: u259 (copy)
        if not u259.schematicBlocksVisible then
            p265 = false;
        end;

        p266.Enabled = p265;
    end;

    for i, v in v262.billboardEnabled do
        if not u259.schematicBlocksVisible then
            local v = false;
        end;

        i.Enabled = v;
    end;
end;

function u7.createHighlight(p267, p268, p269) -- Line: 980
    -- upvalues: u2 (copy)
    local v270 = {};
    local v271;

    if p269 == nil then
        v271 = p269;
    else
        v271 = p269.name;
    end;

    v270.Name = v271 == nil and "Highlight" or v271;
    v270.Parent = p268;

    if p269 ~= nil then
        p269 = p269.color;
    end;

    if p269 == nil then
        p269 = Color3.fromRGB(10, 179, 217);
    end;

    v270.OutlineColor = p269;
    v270.FillTransparency = 1;
    v270.OutlineTransparency = 0;
    v270.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;

    return u2("Highlight", v270);
end;

KnitClient.CreateController(u7.new());

return nil;