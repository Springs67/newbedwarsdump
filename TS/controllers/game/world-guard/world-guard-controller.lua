-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Signal = v2.Signal;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v7.ContextActionService;
local Players = v7.Players;
local Workspace = v7.Workspace;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local RegionHighlight = RuntimeLib.import(script, script.Parent.Parent, "worldedit", "region-highlight").RegionHighlight;
local WorldToolPositionHUD = RuntimeLib.import(script, script.Parent.Parent, "worldedit", "worldedit-position-hud").WorldToolPositionHUD;
local WorldGuardRegionNametag = RuntimeLib.import(script, script.Parent, "world-guard-region-billboard").WorldGuardRegionNametag;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "WorldGuardController";
    end,

    __index = HandKnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 46
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 50
    -- upvalues: HandKnitController (copy), default (copy), u4 (copy), Signal (copy)
    HandKnitController.constructor(p10);
    p10.Name = "WorldGuardController";
    p10.worldGuardRemotes = default.Client:GetNamespace("WorldGuard");
    p10.contextActionMaid = u4.new();
    p10.positionHudMaid = u4.new();
    p10.positionHUDTree = nil;
    p10.regionUpdateSignal = Signal.new();
    p10.modifyingPos1 = false;
    p10.modifyingPos2 = false;
    p10.modifyingRegionId = nil;
    p10.pos1 = nil;
    p10.temporaryPos1Highlight = nil;
    p10.regionBlockCoordMap = {};
    p10.regionAllowListMap = {};
    p10.allRegionHighlightMap = {};
    p10.regionPartMap = {};
    p10.regionPromptMap = {};
    p10.regionNametagVisibilityMap = {};
end;

function u8.KnitStart(u11) -- Line: 70
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(u11);
    u11.worldGuardRemotes:Get("RegionUpdate"):Connect(function(p12) -- Line: 74
        -- upvalues: u11 (copy)
        if not u11.regionAllowListMap[p12.regionId] then
            u11.regionAllowListMap[p12.regionId] = {};
        end;

        local v13 = {
            blockPos1 = p12.blockPos1,
            blockPos2 = p12.blockPos2
        };
        u11.regionBlockCoordMap[p12.regionId] = v13;
        u11.regionUpdateSignal:Fire(p12.regionId, v13);
    end);
    u11.regionUpdateSignal:Connect(function(p14, p15) -- Line: 91
        -- upvalues: u11 (copy)
        u11:updateRegionHighlights(p14, p15);
        u11:updatePromptAndNametag(p14, p15);

        if u11:isEnabled() then
            u11:displayPositionHUD(p14, p15);
        end;
    end);
    u11.worldGuardRemotes:Get("BulkUpdateRegions"):Connect(function(p16) -- Line: 102
        -- upvalues: u11 (copy)
        local function v20(p17) -- Line: 104
            -- upvalues: u11 (ref)
            local v18 = {
                blockPos1 = Vector3.new(p17.blockPos1.x, p17.blockPos1.y, p17.blockPos1.z),
                blockPos2 = Vector3.new(p17.blockPos2.x, p17.blockPos2.y, p17.blockPos2.z)
            };
            u11.regionBlockCoordMap[p17.regionId] = v18;
            local regionAllowListMap = u11.regionAllowListMap;
            local regionId = p17.regionId;
            local v19 = {};

            for _, v in p17.addedPlayers do
                v19[v] = true;
            end;

            regionAllowListMap[regionId] = v19;
            u11:updateRegionHighlights(p17.regionId, v18);
            u11:updatePromptAndNametag(p17.regionId, v18);
        end;

        for i, v in p16 do
            v20(v, i - 1, p16);
        end;
    end);
    u11.worldGuardRemotes:Get("RegionDeleted"):Connect(function(p21) -- Line: 129
        -- upvalues: u11 (copy)
        u11:deleteRegion(p21.regionId);
    end);
    u11.worldGuardRemotes:Get("PlayerAdded"):Connect(function(p22) -- Line: 134
        -- upvalues: u11 (copy)
        local regionId = p22.regionId;
        local v23 = u11.regionAllowListMap[regionId] or {};
        v23[p22.userId] = true;
        u11.regionAllowListMap[regionId] = v23;
    end);
    u11.worldGuardRemotes:Get("PlayerRemoved"):Connect(function(p24) -- Line: 141
        -- upvalues: u11 (copy)
        local userId = p24.userId;
        local v25 = u11.regionAllowListMap[p24.regionId];

        if v25 ~= nil then
            v25[userId] = nil;
        end;
    end);
end;

function u8.isRelevantItem(p26, p27) -- Line: 150
    -- upvalues: ItemType (copy)
    return p27.itemType == ItemType.WORLD_GUARD_WAND;
end;

function u8.onEnable(u28, p29) -- Line: 153
    -- upvalues: KnitClient2 (copy), ContextActionService (copy), ClientBlockEngine (copy), BlockSelectorMode (copy), BlockEngine (copy), Flamework (copy), RegionHighlight (copy), BLOCK_SIZE (copy)
    if not KnitClient2.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
        return nil;
    end;

    local function _(p30) -- Line: 158
        p30.pos1:enable();
        p30.pos2:enable();
        p30.overall:enable();
    end;

    for _, v in u28.allRegionHighlightMap do
        v.pos1:enable();
        v.pos2:enable();
        v.overall:enable();
    end;

    local function _(p31) -- Line: 167
        p31.Enabled = true;

        return p31.Enabled;
    end;

    for _, v in u28.regionPromptMap do
        v.Enabled = true;
        local _ = v.Enabled;
    end;

    local function _(p32) -- Line: 175
        return p32(true);
    end;

    for _, v in u28.regionNametagVisibilityMap do
        v(true);
    end;

    ContextActionService:BindActionAtPriority("world-guard-wand-left-click", function(p33, p34, p35) -- Line: 181
        -- upvalues: ClientBlockEngine (ref), BlockSelectorMode (ref), BlockEngine (ref), u28 (copy), Flamework (ref), RegionHighlight (ref), BLOCK_SIZE (ref)
        if p34 == Enum.UserInputState.Begin then
            local v36 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);
            local v37;

            if v36 == nil then
                v37 = v36;
            else
                v37 = v36.target;
            end;

            if v37 then
                local target = v36.target;

                if not BlockEngine:getStore():getBlockAt(target.blockRef.blockPosition) then
                    return nil;
                end;

                local blockPosition = target.blockRef.blockPosition;
                local v38, v39;

                if u28:isInAnyRegion(blockPosition) then
                    v38 = u28:isPos1CornerOfExistingRegion(blockPosition);
                    v39 = u28:isPos2CornerOfExistingRegion(blockPosition);
                else
                    v38 = nil;
                    v39 = nil;
                end;

                local v40 = u28.modifyingPos1 and u28.modifyingRegionId;

                if v40 ~= "" and v40 then
                    u28.worldGuardRemotes:Get("SetPosition1"):CallServer(u28.modifyingRegionId, blockPosition);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "[WG]: POS1 of region " .. u28.modifyingRegionId .. " moved to " .. tostring(blockPosition)
                    });
                    u28.modifyingPos1 = false;
                    u28.modifyingRegionId = nil;

                    return nil;
                end;

                local v41 = u28.modifyingPos2 and u28.modifyingRegionId;

                if v41 ~= "" and v41 then
                    u28.worldGuardRemotes:Get("SetPosition2"):CallServer(u28.modifyingRegionId, blockPosition);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "[WG]: POS2 of region " .. u28.modifyingRegionId .. " moved to " .. tostring(blockPosition)
                    });
                    u28.modifyingPos2 = false;
                    u28.modifyingRegionId = nil;

                    return nil;
                end;

                if v38 ~= "" and v38 then
                    u28.modifyingPos1 = true;
                    u28.modifyingRegionId = v38;
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "[WG]: Moving POS1 of region " .. u28.modifyingRegionId
                    });

                    return nil;
                end;

                if v39 ~= "" and v39 then
                    u28.modifyingPos2 = true;
                    u28.modifyingRegionId = v39;
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "[WG]: Moving POS2 of region " .. u28.modifyingRegionId
                    });

                    return nil;
                end;

                if not u28.pos1 then
                    u28.pos1 = blockPosition;
                    u28.temporaryPos1Highlight = RegionHighlight.new(BlockEngine:getWorldPosition(blockPosition), BlockEngine:getWorldPosition(blockPosition), {
                        name = "TempHighlightPos1",
                        selectionBox = {
                            Transparency = 0,
                            LineThickness = 0.06,
                            Color3 = Color3.fromRGB(255, 227, 77),
                            SurfaceColor3 = Color3.fromRGB(209, 186, 59)
                        },
                        extraSizeIncrement = BLOCK_SIZE + 0.01
                    });

                    return nil;
                end;

                u28.worldGuardRemotes:Get("CreateRegion"):CallServer(u28.pos1, blockPosition);
                u28.pos1 = nil;
                local temporaryPos1Highlight = u28.temporaryPos1Highlight;

                if temporaryPos1Highlight ~= nil then
                    temporaryPos1Highlight:destroy();
                end;

                u28.temporaryPos1Highlight = nil;

                return nil;
            end;
        end;

        return Enum.ContextActionResult.Pass;
    end, false, 5000, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, Enum.UserInputType.Touch);
    u28.contextActionMaid:GiveTask(function() -- Line: 280
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("world-guard-wand-left-click");
    end);
end;

function u8.onDisable(p42) -- Line: 284
    p42.contextActionMaid:DoCleaning();
    p42.modifyingPos1 = false;
    p42.modifyingPos2 = false;
    p42.modifyingRegionId = nil;
    p42.pos1 = nil;
    local temporaryPos1Highlight = p42.temporaryPos1Highlight;

    if temporaryPos1Highlight ~= nil then
        temporaryPos1Highlight:destroy();
    end;

    p42.temporaryPos1Highlight = nil;
    p42.positionHudMaid:DoCleaning();

    local function _(p43) -- Line: 301
        p43.pos1:disable();
        p43.pos2:disable();
        p43.overall:disable();
    end;

    for _, v in p42.allRegionHighlightMap do
        v.pos1:disable();
        v.pos2:disable();
        v.overall:disable();
    end;

    local function _(p44) -- Line: 310
        p44.Enabled = false;

        return p44.Enabled;
    end;

    for _, v in p42.regionPromptMap do
        v.Enabled = false;
        local _ = v.Enabled;
    end;

    local function _(p45) -- Line: 318
        return p45(false);
    end;

    for _, v in p42.regionNametagVisibilityMap do
        v(false);
    end;
end;

function u8.requestRenameRegion(p46, p47, p48) -- Line: 325
    return p46.worldGuardRemotes:Get("RequestRenameRegion"):CallServer(p47, p48);
end;

function u8.requestAddPlayer(p49, p50, p51) -- Line: 329
    return p49.worldGuardRemotes:Get("RequestAddPlayer"):CallServer(p50, p51);
end;

function u8.requestRemovePlayer(p52, p53, p54) -- Line: 333
    return p52.worldGuardRemotes:Get("RequestRemovePlayer"):CallServer(p53, p54);
end;

function u8.requestRegionDeletion(p55, p56) -- Line: 337
    return p55.worldGuardRemotes:Get("RequestDeleteRegion"):CallServer(p56);
end;

function u8.openRegionMenu(p57, u58) -- Line: 341
    -- upvalues: u3 (copy), OfflinePlayerUtil (copy), Flamework (copy), BedwarsAppIds (copy)
    local v59 = p57.regionAllowListMap[u58];
    local v60 = u3.keys(v59 == nil and {} or v59);

    if #v60 > 0 then
        OfflinePlayerUtil.getOfflinePlayersByUserIds(v60):andThen(function(p61) -- Line: 352
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u58 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.WORLD_GUARD_MENU, {
                RegionId = u58,
                AddedOfflinePlayers = p61
            });
        end);

        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.WORLD_GUARD_MENU, {
        RegionId = u58,
        AddedOfflinePlayers = {}
    });
end;

function u8.isInAnyRegion(u62, u63) -- Line: 366
    -- upvalues: u3 (copy)
    local function _(p64) -- Line: 368
        -- upvalues: u62 (copy), u63 (copy)
        return u62:isInRegion(p64[1], u63);
    end;

    local v65 = nil;

    for i, v in u3.entries(u62.regionBlockCoordMap) do
        local _ = i - 1;

        if u62:isInRegion(v[1], u63) == true then
            v65 = v;
            break;
        end;
    end;

    return v65 ~= nil;
end;

function u8.isInRegion(p66, p67, p68) -- Line: 383
    local v69 = p66.regionBlockCoordMap[p67];

    if not v69 then
        return false;
    end;

    local blockPos1 = v69.blockPos1;
    local blockPos2 = v69.blockPos2;
    local v70 = math.min(blockPos1.X, blockPos2.X);
    local v71 = math.max(blockPos1.X, blockPos2.X);
    local v72 = math.min(blockPos1.Y, blockPos2.Y);
    local v73 = math.max(blockPos1.Y, blockPos2.Y);
    local v74 = math.min(blockPos1.Z, blockPos2.Z);
    local v75 = math.max(blockPos1.Z, blockPos2.Z);
    local v76 = v70 <= p68.X;
    local v77 = p68.X <= v71;
    local v78 = v72 <= p68.Y;
    local v79 = p68.Y <= v73;
    local v80 = v74 <= p68.Z;
    local v81 = p68.Z <= v75;

    if v76 then
        if v77 then
            if v78 then
                if v79 then
                    v79 = v80 and v81;
                end;
            else
                v79 = v78;
            end;
        else
            v79 = v77;
        end;
    else
        v79 = v76;
    end;

    return v79;
end;

function u8.isPos1CornerOfExistingRegion(p82, u83) -- Line: 407
    -- upvalues: u3 (copy)
    local function _(p84, p85) -- Line: 409
        -- upvalues: u83 (copy)
        local _ = p84[1];

        return p84[2].blockPos1 == u83;
    end;

    local v86 = nil;

    for i, v in u3.entries(p82.regionBlockCoordMap) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].blockPos1 == u83 == true then
            v86 = v;
            break;
        end;
    end;

    if v86 ~= nil then
        v86 = v86[1];
    end;

    return v86;
end;

function u8.isPos2CornerOfExistingRegion(p87, u88) -- Line: 429
    -- upvalues: u3 (copy)
    local function _(p89, p90) -- Line: 431
        -- upvalues: u88 (copy)
        local _ = p89[1];

        return p89[2].blockPos2 == u88;
    end;

    local v91 = nil;

    for i, v in u3.entries(p87.regionBlockCoordMap) do
        local _ = i - 1;
        local _ = v[1];

        if v[2].blockPos2 == u88 == true then
            v91 = v;
            break;
        end;
    end;

    if v91 ~= nil then
        v91 = v91[1];
    end;

    return v91;
end;

function u8.getCenterPositionOfRegion(p92, p93, p94) -- Line: 451
    return Vector3.new((p93.X + p94.X) / 2, (p93.Y + p94.Y) / 2, (p93.Z + p94.Z) / 2);
end;

function u8.deleteRegion(p95, p96) -- Line: 454
    p95.regionBlockCoordMap[p96] = nil;
    local v97 = p95.allRegionHighlightMap[p96];

    if v97 then
        v97.pos1:destroy();
        v97.pos2:destroy();
        v97.overall:destroy();
        p95.allRegionHighlightMap[p96] = nil;
    end;

    local v98 = p95.regionPartMap[p96];

    if v98 ~= nil then
        v98:Destroy();
    end;

    p95.regionPartMap[p96] = nil;
    p95.regionPromptMap[p96] = nil;
    p95.regionNametagVisibilityMap[p96] = nil;
    p95.positionHudMaid:DoCleaning();
    p95.regionAllowListMap[p96] = nil;
end;

function u8.displayPositionHUD(u99, p100, p101) -- Line: 489
    -- upvalues: u6 (copy), WorldToolPositionHUD (copy), Players (copy)
    local blockPos1 = p101.blockPos1;
    local blockPos2 = p101.blockPos2;
    local v102 = math.abs(blockPos1.X - blockPos2.X);
    local v103 = math.abs(blockPos1.Y - blockPos2.Y);
    local v104 = math.abs(blockPos1.Z - blockPos2.Z);
    local v105 = Vector3.new(v102, v103, v104);

    if u99.positionHUDTree then
        u6.update(u99.positionHUDTree, u6.createElement(WorldToolPositionHUD, {
            Label = "[World Guard] Region " .. p100,
            Pos1Color = Color3.fromRGB(255, 227, 77),
            Pos2Color = Color3.fromRGB(66, 201, 219),
            SizeColor = Color3.fromRGB(255, 115, 176),
            Pos1 = blockPos1,
            Pos2 = blockPos2,
            Size = v105
        }));

        return;
    end;

    u99.positionHUDTree = u6.mount(u6.createElement(WorldToolPositionHUD, {
        Label = "[World Guard] Region " .. p100,
        Pos1Color = Color3.fromRGB(255, 227, 77),
        Pos2Color = Color3.fromRGB(66, 201, 219),
        SizeColor = Color3.fromRGB(255, 115, 176),
        Pos1 = blockPos1,
        Pos2 = blockPos2,
        Size = v105
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u99.positionHudMaid:GiveTask(function() -- Line: 514
        -- upvalues: u99 (copy), u6 (ref)
        if u99.positionHUDTree then
            u6.unmount(u99.positionHUDTree);
            u99.positionHUDTree = nil;
        end;
    end);
end;

function u8.updateRegionHighlights(p106, p107, p108) -- Line: 522
    -- upvalues: BlockEngine (copy), RegionHighlight (copy), BLOCK_SIZE (copy)
    local v109 = BlockEngine:getWorldPosition(p108.blockPos1);
    local v110 = BlockEngine:getWorldPosition(p108.blockPos2);
    local v111 = p106.allRegionHighlightMap[p107];

    if v111 then
        v111.pos1:updateRegion(v109, v109);
        v111.pos2:updateRegion(v110, v110);
        v111.overall:updateRegion(v109, v110);

        return;
    end;

    local v112 = RegionHighlight.new(v109, v109, {
        decalTexture = "rbxassetid://15949352446",
        selectionBox = {
            Transparency = 0,
            LineThickness = 0.06,
            Color3 = Color3.fromRGB(255, 227, 77),
            SurfaceColor3 = Color3.fromRGB(209, 186, 59)
        },
        extraSizeIncrement = BLOCK_SIZE + 0.01,
        name = "WorldGuardHighlightPos1_" .. p107
    });
    local v113 = RegionHighlight.new(v110, v110, {
        decalTexture = "rbxassetid://15949352446",
        selectionBox = {
            Transparency = 0,
            LineThickness = 0.06,
            Color3 = Color3.fromRGB(66, 201, 219),
            SurfaceColor3 = Color3.fromRGB(48, 150, 163)
        },
        extraSizeIncrement = BLOCK_SIZE + 0.01,
        name = "WorldGuardHighlightPos2_" .. p107
    });
    local v114 = RegionHighlight.new(v109, v110, {
        selectionBox = {
            Transparency = 0,
            LineThickness = 0.06,
            Color3 = Color3.fromRGB(255, 115, 176),
            SurfaceColor3 = Color3.fromRGB(189, 74, 122)
        },
        extraSizeIncrement = BLOCK_SIZE,
        name = "WorldGuardHighlightRegion_" .. p107
    });

    if p106:isEnabled() then
        v112:enable();
        v113:enable();
        v114:enable();
    else
        v112:disable();
        v113:disable();
        v114:disable();
    end;

    p106.allRegionHighlightMap[p107] = {
        pos1 = v112,
        pos2 = v113,
        overall = v114
    };
end;

function u8.updatePromptAndNametag(u115, u116, p117) -- Line: 585
    -- upvalues: BlockEngine (copy), u5 (copy), Workspace (copy), KnitClient2 (copy), DeviceUtil (copy), Players (copy), u6 (copy), WorldGuardRegionNametag (copy)
    local v118 = u115:getCenterPositionOfRegion(BlockEngine:getWorldPosition(p117.blockPos1), (BlockEngine:getWorldPosition(p117.blockPos2)));
    local v119 = u115.regionPartMap[u116];

    if v119 then
        v119:PivotTo(CFrame.new(v118));

        return;
    end;

    local v120 = u5("Part", {
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Transparency = 1,
        Name = "WorldGuardRegion_" .. u116,
        Color = Color3.fromRGB(255, 115, 176),
        CFrame = CFrame.new(v118),
        Parent = Workspace
    });
    u115.regionPartMap[u116] = v120;
    local v121 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ActionText = "Configure Region",
        HoldDuration = 0,
        RequiresLineOfSight = false,
        MaxActivationDistance = 14,
        ObjectText = "ID: " .. u116,
        Parent = v120,
        ClickablePrompt = DeviceUtil.isMobileControls()
    });
    v121.Triggered:Connect(function(p122) -- Line: 619
        -- upvalues: Players (ref), u115 (copy), u116 (copy)
        if p122 ~= Players.LocalPlayer then
            return nil;
        end;

        u115:openRegionMenu(u116);
    end);
    v121.Enabled = u115:isEnabled();
    u115.regionPromptMap[u116] = v121;
    local v123, u124 = u6.createBinding(u115:isEnabled());
    u6.mount(u6.createElement(WorldGuardRegionNametag, {
        regionId = u116,
        adornee = v120,
        visible = v123
    }), v120);
    u115.regionNametagVisibilityMap[u116] = u124;
    v121.PromptHidden:Connect(function() -- Line: 640
        -- upvalues: u124 (copy), u115 (copy)
        u124(u115:isEnabled());
    end);
    v121.PromptShown:Connect(function() -- Line: 644
        -- upvalues: u124 (copy)
        u124(false);
    end);
end;

KnitClient.CreateController(u8.new());

return nil;