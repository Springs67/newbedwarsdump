-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Signal = v2.Signal;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v6.ContextActionService;
local Players = v6.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local RegionHighlight = RuntimeLib.import(script, script.Parent, "region-highlight").RegionHighlight;
local WorldToolPositionHUD = RuntimeLib.import(script, script.Parent, "worldedit-position-hud").WorldToolPositionHUD;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "WorldeditController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 42
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 46
    -- upvalues: HandKnitController (copy), u4 (copy), default (copy), Signal (copy)
    HandKnitController.constructor(p9);
    p9.Name = "WorldeditController";
    p9.maid = u4.new();
    p9.gamemodeRemotes = default.Client:GetNamespace("Gamemode");
    p9.regionHighlight = nil;
    p9.pos1Highlight = nil;
    p9.pos2Highlight = nil;
    p9.region = {
        pos1 = nil,
        pos2 = nil
    };
    p9.regionChangeSignal = Signal.new();
    p9.positionTree = nil;
    p9.mobilePositionSelection = 1;
end;

function u7.KnitStart(u10) -- Line: 62
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(u10);
    u10.regionChangeSignal:Connect(function(p11) -- Line: 64
        -- upvalues: u10 (copy)
        u10:onRegionChange(p11);
    end);
    u10.gamemodeRemotes:Get("RegionUpdate"):Connect(function(p12) -- Line: 68
        -- upvalues: u10 (copy)
        local region = p12.region;
        u10.region = {
            pos1 = region.pos1,
            pos2 = region.pos2
        };
        u10.regionChangeSignal:Fire({
            pos1 = region.pos1,
            pos2 = region.pos2
        });
    end);
end;

function u7.isRelevantItem(p13, p14) -- Line: 80
    -- upvalues: ItemType (copy)
    return p14.itemType == ItemType.WORLD_EDIT_WAND;
end;

function u7.onEnable(u15, p16) -- Line: 83
    -- upvalues: KnitClient2 (copy), DeviceUtil (copy), ContextActionService (copy), ClientBlockEngine (copy), BlockSelectorMode (copy), BlockEngine (copy), Flamework (copy), AbilityId (copy), ClientSyncEvents (copy), Players (copy), u5 (copy), BedwarsImageId (copy), u3 (copy), ItemType (copy), getItemMeta (copy), Theme (copy), Empty (copy), ColorUtil (copy), KnitClient (copy)
    if not KnitClient2.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
        return nil;
    end;

    local regionHighlight = u15.regionHighlight;

    if regionHighlight ~= nil then
        regionHighlight:enable();
    end;

    local pos1Highlight = u15.pos1Highlight;

    if pos1Highlight ~= nil then
        pos1Highlight:enable();
    end;

    local pos2Highlight = u15.pos2Highlight;

    if pos2Highlight ~= nil then
        pos2Highlight:enable();
    end;

    u15:displaySetPositions(u15.region.pos1, u15.region.pos2);

    if DeviceUtil.isMobileControls() or DeviceUtil.isGamepadControls() then
        ContextActionService:BindAction("worldedit-wand-mobile-select", function(p17, p18, p19) -- Line: 102
            -- upvalues: ClientBlockEngine (ref), BlockSelectorMode (ref), BlockEngine (ref), u15 (copy)
            if p18 == Enum.UserInputState.Begin then
                local v20 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);
                local v21;

                if v20 == nil then
                    v21 = v20;
                else
                    v21 = v20.target;
                end;

                if v21 then
                    local target = v20.target;

                    if not BlockEngine:getStore():getBlockAt(target.blockRef.blockPosition) then
                        return nil;
                    end;

                    if u15.mobilePositionSelection == 1 then
                        u15.gamemodeRemotes:Get("SetPosition1"):CallServer(target.blockRef.blockPosition);
                        u15.mobilePositionSelection = 2;
                    elseif u15.mobilePositionSelection == 2 then
                        u15.gamemodeRemotes:Get("SetPosition2"):CallServer(target.blockRef.blockPosition);
                        u15.mobilePositionSelection = 1;
                    end;

                    u15.region.pos1 = BlockEngine:getWorldPosition(target.blockRef.blockPosition);
                    u15.regionChangeSignal:Fire(u15.region);
                end;
            end;

            return Enum.ContextActionResult.Pass;
        end, false, Enum.UserInputType.Touch);
        u15.maid:GiveTask(function() -- Line: 128
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("worldedit-wand-mobile-select");
        end);
    else
        ContextActionService:BindAction("worldedit-wand-left-click", function(p22, p23, p24) -- Line: 133
            -- upvalues: ClientBlockEngine (ref), BlockSelectorMode (ref), BlockEngine (ref), u15 (copy)
            if p23 == Enum.UserInputState.Begin then
                local v25 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);
                local v26;

                if v25 == nil then
                    v26 = v25;
                else
                    v26 = v25.target;
                end;

                if v26 then
                    local target = v25.target;

                    if not BlockEngine:getStore():getBlockAt(target.blockRef.blockPosition) then
                        return nil;
                    end;

                    u15.gamemodeRemotes:Get("SetPosition1"):CallServer(target.blockRef.blockPosition);
                    u15.region.pos1 = BlockEngine:getWorldPosition(target.blockRef.blockPosition);
                    u15.regionChangeSignal:Fire(u15.region);
                end;
            end;

            return Enum.ContextActionResult.Pass;
        end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
        ContextActionService:BindAction("worldedit-wand-right-click", function(p27, p28, p29) -- Line: 154
            -- upvalues: ClientBlockEngine (ref), BlockSelectorMode (ref), BlockEngine (ref), u15 (copy)
            if p28 == Enum.UserInputState.Begin then
                local v30 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);
                local v31;

                if v30 == nil then
                    v31 = v30;
                else
                    v31 = v30.target;
                end;

                if v31 then
                    local target = v30.target;

                    if not BlockEngine:getStore():getBlockAt(target.blockRef.blockPosition) then
                        return nil;
                    end;

                    u15.gamemodeRemotes:Get("SetPosition2"):CallServer(target.blockRef.blockPosition);
                    u15.region.pos2 = BlockEngine:getWorldPosition(target.blockRef.blockPosition);
                    u15.regionChangeSignal:Fire(u15.region);
                end;
            end;

            return Enum.ContextActionResult.Pass;
        end, false, Enum.UserInputType.MouseButton2);
        u15.maid:GiveTask(function() -- Line: 174
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("worldedit-wand-right-click");
            ContextActionService:UnbindAction("worldedit-wand-left-click");
        end);
    end;

    u15:setupYield(function() -- Line: 179
        -- upvalues: Flamework (ref), AbilityId (ref)
        local u32 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.WORLD_EDIT_RADIAL_WHEEL, {
            abilityType = "ItemSecondary",
            abilityButton = {
                icon = "rbxassetid://12518331579"
            }
        }):expect();

        return function() -- Line: 186
            -- upvalues: u32 (copy)
            u32.Destroy();
        end;
    end);
    u15.maid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p33) -- Line: 190
        -- upvalues: AbilityId (ref), Players (ref), u5 (ref), BedwarsImageId (ref), u3 (ref), ItemType (ref), getItemMeta (ref), KnitClient2 (ref), u15 (copy), Theme (ref), Empty (ref), ColorUtil (ref), DeviceUtil (ref), KnitClient (ref)
        if p33.ability ~= AbilityId.WORLD_EDIT_RADIAL_WHEEL then
            return nil;
        end;

        if p33:isCancelled() then
            return nil;
        end;

        if p33.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local v34 = {};
        local v41 = {
            title = "Set",
            description = "Sets region to a selected block.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_SET,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 209, Name: onSelect
                -- upvalues: u3 (ref), ItemType (ref), getItemMeta (ref), KnitClient2 (ref), u15 (ref)
                local function _(p35) -- Line: 211
                    -- upvalues: getItemMeta (ref)
                    return getItemMeta(p35).block ~= nil;
                end;

                local v36 = 0;
                local v37 = {};

                for i, v in u3.values(ItemType) do
                    local _ = i - 1;

                    if getItemMeta(v).block ~= nil == true then
                        v36 = v36 + 1;
                        v37[v36] = v;
                    end;
                end;

                KnitClient2.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(v37, function(p38) -- Line: 225
                    -- upvalues: getItemMeta (ref)
                    local v39 = getItemMeta(p38);

                    return {
                        actionDescription = "select",
                        displayName = v39.displayName,
                        aliases = { v39.displayName },
                        image = v39.image
                    };
                end, function(p40) -- Line: 233
                    -- upvalues: u15 (ref)
                    if p40 == "" or not p40 then
                        return nil;
                    end;

                    u15.gamemodeRemotes:Get("SetOperation"):SendToServer(p40);
                end);
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v53 = {
            title = "Replace",
            description = "Replaces selected blocks in a region with a different block.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_REPLACE,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 250, Name: onSelect
                -- upvalues: u3 (ref), ItemType (ref), getItemMeta (ref), KnitClient2 (ref), u15 (ref), u5 (ref), Theme (ref), Empty (ref), ColorUtil (ref)
                local function _(p42) -- Line: 252
                    -- upvalues: getItemMeta (ref)
                    return getItemMeta(p42).block ~= nil;
                end;

                local v43 = 0;
                local u44 = {};

                for i, v in u3.values(ItemType) do
                    local _ = i - 1;

                    if getItemMeta(v).block ~= nil == true then
                        v43 = v43 + 1;
                        u44[v43] = v;
                    end;
                end;

                local u45 = nil;
                local u46 = nil;
                KnitClient2.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(u44, function(p47) -- Line: 268
                    -- upvalues: getItemMeta (ref)
                    local v48 = getItemMeta(p47);

                    return {
                        actionDescription = "select",
                        displayName = v48.displayName,
                        aliases = { v48.displayName },
                        image = v48.image
                    };
                end, function(p49) -- Line: 276
                    -- upvalues: u45 (ref), KnitClient2 (ref), u44 (copy), getItemMeta (ref), u46 (ref), u15 (ref), u5 (ref), Theme (ref), Empty (ref), ColorUtil (ref)
                    u45 = p49;

                    if not u45 then
                        return nil;
                    end;

                    KnitClient2.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(u44, function(p50) -- Line: 282
                        -- upvalues: getItemMeta (ref)
                        local v51 = getItemMeta(p50);

                        return {
                            actionDescription = "select",
                            displayName = v51.displayName,
                            aliases = { v51.displayName },
                            image = v51.image
                        };
                    end, function(p52) -- Line: 290
                        -- upvalues: u46 (ref), u15 (ref), u45 (ref)
                        u46 = p52;

                        if not u46 then
                            return nil;
                        end;

                        u15.gamemodeRemotes:Get("ReplaceOperation"):SendToServer(u45, u46);
                    end, u5.createFragment({
                        ReplaceHUD = u5.createElement("Frame", {
                            BackgroundTransparency = 0.5,
                            BorderSizePixel = 0,
                            Size = UDim2.new(0.3363119415109667, 0, 0, 20),
                            Position = UDim2.new(0.5, 0, 0.25, -20),
                            AnchorPoint = Vector2.new(0.5, 0),
                            BackgroundColor3 = Theme.backgroundPrimary
                        }, { u5.createElement(Empty, {
                                Size = UDim2.fromScale(1, 1)
                            }, { u5.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    VerticalAlignment = Enum.VerticalAlignment.Center,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                                }), u5.createElement("TextLabel", {
                                    Text = " Replacing",
                                    TextScaled = true,
                                    BackgroundTransparency = 1,
                                    TextColor3 = ColorUtil.WHITE,
                                    Font = Enum.Font.Roboto,
                                    Size = UDim2.new(0, 80, 1, 0),
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    TextYAlignment = Enum.TextYAlignment.Bottom
                                }), u5.createElement("ImageLabel", {
                                    BackgroundTransparency = 1,
                                    Image = getItemMeta(u45).image,
                                    Size = UDim2.fromScale(0.74, 1)
                                }, { u5.createElement("UIAspectRatioConstraint", {
                                        AspectRatio = 1
                                    }) }) }) })
                    }));
                end);
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v54 = {
            title = "Copy",
            description = "Copies the selected region.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_COPY,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 347, Name: onSelect
                -- upvalues: u15 (ref), KnitClient2 (ref)
                u15.gamemodeRemotes:Get("CopyOperation"):SendToServer();
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v55 = {
            title = "Paste",
            description = "Pastes the selected region.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_PASTE,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 360, Name: onSelect
                -- upvalues: u15 (ref), KnitClient2 (ref)
                u15.gamemodeRemotes:Get("PasteOperation"):SendToServer();
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v56 = {
            title = "Rotate",
            description = "Rotates the selected region.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_ROTATE,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 373, Name: onSelect
                -- upvalues: u15 (ref), KnitClient2 (ref)
                u15.gamemodeRemotes:Get("RotateOperation"):SendToServer(0, nil, nil);
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v57 = {
            title = "Undo",
            description = "Reverts the last action.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_UNDO,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 390, Name: onSelect
                -- upvalues: u15 (ref), KnitClient2 (ref)
                u15.gamemodeRemotes:Get("UndoOperation"):SendToServer();
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v58 = {
            title = "Redo",
            description = "Restores the last reverted action.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_REDO,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 403, Name: onSelect
                -- upvalues: u15 (ref), KnitClient2 (ref)
                u15.gamemodeRemotes:Get("RedoOperation"):SendToServer();
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        local v59 = {
            title = "Delete",
            description = "Deletes all blocks in the selected region.",
            element = u5.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = BedwarsImageId.WORLD_EDIT_DELETE,
                Size = UDim2.fromScale(1, 1)
            }),

            onSelect = function() -- Line: 416, Name: onSelect
                -- upvalues: u15 (ref), KnitClient2 (ref)
                u15.gamemodeRemotes:Get("DeleteOperation"):SendToServer();
                KnitClient2.Controllers.RadialWheelController:closeRadialWheel();
            end
        };
        table.insert(v34, v53);
        table.insert(v34, v57);
        table.insert(v34, v58);
        table.insert(v34, v59);
        table.insert(v34, v56);
        table.insert(v34, v55);
        table.insert(v34, v54);
        table.insert(v34, v41);
        local inputObject = p33.inputObject;
        local v60 = DeviceUtil.isMobileControls() or DeviceUtil.isGamepadControls();

        if not v60 then
            local v61;

            if inputObject == nil then
                v61 = inputObject;
            else
                v61 = inputObject.UserInputType;
            end;

            v60 = v61 == Enum.UserInputType.MouseButton1;
        end;

        local v62;

        if v60 then
            v62 = nil;
        else
            v62 = inputObject;
        end;

        local v63;

        if inputObject == nil then
            v63 = inputObject;
        else
            v63 = inputObject.UserInputType;
        end;

        local _ = v63 == Enum.UserInputType.MouseButton1;
        local RadialWheelController = KnitClient.Controllers.RadialWheelController;
        local v64;

        if v62 then
            local v65;

            if inputObject == nil then
                v65 = inputObject;
            else
                v65 = inputObject.Position.X;
            end;

            if inputObject ~= nil then
                inputObject = inputObject.Position.Y;
            end;

            v64 = UDim2.fromOffset(v65, inputObject);
        else
            v64 = UDim2.fromScale(0.5, 0.5);
        end;

        local v66;

        if v62 then
            v66 = nil;
        else
            v66 = UDim2.fromScale(0.6, 0.6);
        end;

        RadialWheelController:openRadialWheel(v34, 8, v62, true, v64, v66);
    end));
    u15.maid:GiveTask(function() -- Line: 465
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("worldedit-wand-left-click");
        ContextActionService:UnbindAction("worldedit-wand-right-click");
    end);
end;

function u7.onDisable(p67) -- Line: 470
    p67.maid:DoCleaning();
    local regionHighlight = p67.regionHighlight;

    if regionHighlight ~= nil then
        regionHighlight:disable();
    end;

    local pos1Highlight = p67.pos1Highlight;

    if pos1Highlight ~= nil then
        pos1Highlight:disable();
    end;

    local pos2Highlight = p67.pos2Highlight;

    if pos2Highlight ~= nil then
        pos2Highlight:disable();
    end;
end;

function u7.displaySetPositions(u68, p69, p70) -- Line: 485
    -- upvalues: u5 (copy), WorldToolPositionHUD (copy), Players (copy)
    local v71;

    if p69 and p70 then
        local v72 = math.abs(p69.X - p70.X);
        local v73 = math.abs(p69.Y - p70.Y);
        local v74 = math.abs(p69.Z - p70.Z);
        v71 = Vector3.new(v72, v73, v74);
    else
        v71 = nil;
    end;

    if u68.positionTree then
        u5.update(u68.positionTree, u5.createElement(WorldToolPositionHUD, {
            Label = "World Edit Positions",
            Pos1Color = Color3.fromRGB(254, 185, 76),
            Pos2Color = Color3.fromRGB(72, 219, 66),
            SizeColor = Color3.fromRGB(255, 46, 242),
            Pos1 = p69,
            Pos2 = p70,
            Size = v71
        }));

        return;
    end;

    u68.positionTree = u5.mount(u5.createElement(WorldToolPositionHUD, {
        Label = "World Edit Positions",
        Pos1Color = Color3.fromRGB(254, 185, 76),
        Pos2Color = Color3.fromRGB(72, 219, 66),
        SizeColor = Color3.fromRGB(255, 46, 242),
        Pos1 = p69,
        Pos2 = p70,
        Size = v71
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u68.maid:GiveTask(function() -- Line: 510
        -- upvalues: u68 (copy), u5 (ref)
        if u68.positionTree then
            u5.unmount(u68.positionTree);
            u68.positionTree = nil;
        end;
    end);
end;

function u7.onRegionChange(p75, p76) -- Line: 518
    -- upvalues: RegionHighlight (copy), BLOCK_SIZE (copy)
    local pos1 = p76.pos1;
    local pos2 = p76.pos2;
    p75:displaySetPositions(pos1, pos2);

    if pos1 then
        if p75.pos1Highlight then
            p75.pos1Highlight:updateRegion(pos1, pos1);
        else
            p75.pos1Highlight = RegionHighlight.new(pos1, pos1, {
                selectionBox = {
                    Transparency = 0,
                    LineThickness = 0.06,
                    Color3 = Color3.fromRGB(255, 204, 89),
                    SurfaceColor3 = Color3.fromRGB(196, 143, 59)
                },
                extraSizeIncrement = BLOCK_SIZE + 0.01
            });
        end;
    end;

    if pos2 then
        if p75.pos2Highlight then
            p75.pos2Highlight:updateRegion(pos2, pos2);
        else
            p75.pos2Highlight = RegionHighlight.new(pos2, pos2, {
                selectionBox = {
                    Transparency = 0,
                    LineThickness = 0.06,
                    Color3 = Color3.fromRGB(115, 255, 115),
                    SurfaceColor3 = Color3.fromRGB(64, 196, 59)
                },
                extraSizeIncrement = BLOCK_SIZE + 0.01
            });
        end;
    end;

    if pos1 and pos2 then
        if p75.regionHighlight then
            p75.regionHighlight:updateRegion(pos1, pos2);

            return;
        end;

        p75.regionHighlight = RegionHighlight.new(pos1, pos2, {
            extraSizeIncrement = BLOCK_SIZE
        });
    end;
end;

KnitClient.CreateController(u7.new());

return nil;