-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConfettiGroup = v1.ConfettiGroup;
local ConstraintType = v1.ConstraintType;
local IndicatorUIType = v1.IndicatorUIType;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local TutorialType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorial-type").TutorialType;
local BaseTutorialController = RuntimeLib.import(script, script.Parent, "base-tutorial-controller").BaseTutorialController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "BeginnerTutorialController";
    end,

    __index = BaseTutorialController
});
u7.__index = u7;

function u7.new(...) -- Line: 42
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 46
    -- upvalues: BaseTutorialController (copy), TutorialType (copy)
    BaseTutorialController.constructor(p9, TutorialType.BEGINNER);
    p9.Name = "BeginnerTutorialController";
end;

function u7.KnitStart(p10) -- Line: 50
    -- upvalues: BaseTutorialController (copy)
    BaseTutorialController.KnitStart(p10);
end;

function u7.assignSectionGuides(u11, p12) -- Line: 53
    -- upvalues: u3 (copy), GamePlayerUtil (copy), Players (copy), CollectionService (copy), u4 (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), ClientStore (copy), AbilityId (copy)
    local u13 = u3.new();
    local u14 = GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();

    if u14 == "" or not u14 then
        warn("Player has no team, cannot start tutorial.");

        return u13;
    end;

    if p12 == "generator" then
        local v15 = CollectionService:GetTagged(u14 .. "_TeamOreGenerator");

        local function v18(p16) -- Line: 64
            -- upvalues: u4 (ref), u11 (copy), u13 (copy)
            local PrimaryPart = p16.PrimaryPart;

            if not PrimaryPart then
                warn("TeamOreGenerator model has no primary part");

                return nil;
            end;

            local u17 = u11:setupArrowBeam((u4("Attachment", {
                Position = Vector3.new(0, -6, 0),
                Parent = PrimaryPart
            })));
            u13:GiveTask(function() -- Line: 76
                -- upvalues: u17 (copy)
                u17:DoCleaning();
            end);
        end;

        for i, v in v15 do
            v18(v, i - 1, v15);
        end;

        local function _(p19) -- Line: 84
            -- upvalues: u13 (copy), u11 (copy)
            u13:GiveTask(u11:createHighlight(p19, {
                name = "ItemDropHighlight"
            }));
        end;

        for i, v in CollectionService:GetTagged("team-ore-gen-drop:" .. u14) do
            local _ = i - 1;
            u13:GiveTask(u11:createHighlight(v, {
                name = "ItemDropHighlight"
            }));
        end;

        return u13;
    end;

    if p12 == "shop" then
        local v20 = KnitClient.Controllers.ShopkeeperController:getShopkeeperModel("item_shop", u14);

        if v20 then
            local u21 = u11:createHighlight(v20, {
                name = "ItemShopkeeperHighlight"
            });
            local u22 = u11:setupArrowBeam((u4("Attachment", {
                Parent = v20.PrimaryPart
            })));
            u13:GiveTask(function() -- Line: 105
                -- upvalues: u22 (copy)
                u22:DoCleaning();
            end);
            u13:GiveTask(function() -- Line: 108
                -- upvalues: u21 (copy)
                u21:Destroy();
            end);
        end;

        u13:GiveTask(function() -- Line: 112
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.BEDWARS_ITEM_SHOP);
        end);

        return u13;
    end;

    if p12 == "block" then
        u11:highlightWoolHotbarSlot();
        local u25 = ClientStore.changed:connect(function(p23, p24) -- Line: 119
            -- upvalues: u11 (copy)
            if p23.Inventory.observedInventory.hotbar ~= p24.Inventory.observedInventory.hotbar then
                u11:highlightWoolHotbarSlot();
            end;
        end);
        u13:GiveTask(function() -- Line: 124
            -- upvalues: u25 (copy), Players (ref)
            u25:disconnect();
            Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil);
        end);

        return u13;
    end;

    if p12 ~= "bed" then
        if p12 == "team_upgrades" then
            local v26 = KnitClient.Controllers.ShopkeeperController:getShopkeeperModel("upgrade_shop", u14);

            if v26 then
                local u27 = u11:setupArrowBeam((u4("Attachment", {
                    Parent = v26.PrimaryPart
                })));
                u13:GiveTask(function() -- Line: 170
                    -- upvalues: u27 (copy)
                    u27:DoCleaning();
                end);
                local u28 = u11:createHighlight(v26, {
                    name = "UpgradeShopkeeperHighlight"
                });
                u13:GiveTask(function() -- Line: 176
                    -- upvalues: u28 (copy)
                    u28:Destroy();
                end);

                return u13;
            end;
        else
            if p12 == "purchase_upgrade" then
                u13:GiveTask(function() -- Line: 183
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.TEAM_UPGRADE);
                end);

                return u13;
            end;

            if p12 == "recall" then
                Players.LocalPlayer:SetAttribute("TutorialHighlightedAbility", AbilityId.RECALL);
                u13:GiveTask(function() -- Line: 190
                    -- upvalues: Players (ref)
                    Players.LocalPlayer:SetAttribute("TutorialHighlightedAbility", nil);
                end);

                return u13;
            end;

            if p12 == "sprint" then
                Players.LocalPlayer:SetAttribute("SprintHighlighted", true);
                u13:GiveTask(function() -- Line: 197
                    -- upvalues: Players (ref)
                    Players.LocalPlayer:SetAttribute("SprintHighlighted", nil);
                end);
            end;
        end;

        return u13;
    end;

    local v29 = CollectionService:GetTagged("bed:" .. u14);

    local function v34(p30) -- Line: 132
        -- upvalues: u4 (ref), u11 (copy), u13 (copy), u14 (copy)
        local u31 = u11:setupArrowBeam((u4("Attachment", {
            Position = Vector3.new(0, 3, 0),
            Parent = p30
        })));
        u13:GiveTask(function() -- Line: 139
            -- upvalues: u31 (copy)
            u31:DoCleaning();
        end);
        local v32 = u11:requestBedLayerPositions(u14);

        if not v32 then
            warn("No positions found for bed");

            return u13;
        end;

        for _, v in v32 do
            local u33 = u11:highlightBlockPosition(v);

            if not u33 then
                return u13;
            end;

            u13:GiveTask(function() -- Line: 153
                -- upvalues: u33 (copy)
                u33:DoCleaning();
            end);
        end;
    end;

    for i, v in v29 do
        v34(v, i - 1, v29);
    end;

    return u13;
end;

function u7.assignTaskGuides(u35, p36) -- Line: 204
    -- upvalues: u3 (copy), WatchCollectionTag (copy), MonsterType (copy), u4 (copy), KnitClient2 (copy), ItemType (copy), ClientStore (copy), Players (copy), Flamework (copy), IndicatorUIType (copy), getItemMeta (copy), TweenService (copy), ConstraintType (copy), CollectionService (copy), Workspace (copy), default (copy)
    local u37 = u3.new();

    if p36 == "place_block" then
        local v38 = u35:getTutorialBlockPosition();

        if not v38 then
            return u37;
        end;

        local u39 = u35:highlightBlockPosition(v38, true);
        u37:GiveTask(function() -- Line: 214
            -- upvalues: u39 (copy)
            local v40 = u39;

            if v40 ~= nil then
                v40:DoCleaning();
            end;
        end);

        return u37;
    end;

    if p36 ~= "break_block" then
        if p36 == "kill_enemy" then
            u37:GiveTask((WatchCollectionTag("Monster", function(p41) -- Line: 237
                -- upvalues: MonsterType (ref), u4 (ref), u37 (copy), u35 (copy)
                if p41:GetAttribute("MonsterType") ~= MonsterType.PLAYER_DUMMY then
                    return nil;
                end;

                u37:GiveTask((u4("Highlight", {
                    FillTransparency = 1,
                    OutlineTransparency = 0,
                    Parent = p41,
                    OutlineColor = Color3.fromRGB(255, 69, 105),
                    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                })));
                local u42 = u35:setupArrowBeam(p41.UpperTorso.BodyFrontAttachment);
                u37:GiveTask(function() -- Line: 250
                    -- upvalues: u42 (copy)
                    u42:DoCleaning();
                end);
            end)));

            return u37;
        end;

        if p36 == "final_kill" then
            u37:GiveTask((WatchCollectionTag("Monster", function(p43) -- Line: 258
                -- upvalues: MonsterType (ref), u4 (ref), u37 (copy), u35 (copy)
                if p43:GetAttribute("MonsterType") ~= MonsterType.PLAYER_DUMMY then
                    return nil;
                end;

                u37:GiveTask((u4("Highlight", {
                    FillTransparency = 1,
                    OutlineTransparency = 0,
                    Parent = p43,
                    OutlineColor = Color3.fromRGB(255, 69, 105),
                    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                })));
                local u44 = u35:setupArrowBeam(p43.UpperTorso.BodyFrontAttachment);
                u37:GiveTask(function() -- Line: 271
                    -- upvalues: u44 (copy)
                    u44:DoCleaning();
                end);
            end)));

            return u37;
        end;

        if p36 == "path_to_enemy_bed" then
            u35:highlightMobileAutoBridgeButton(u37);
            local v45 = KnitClient2.Controllers.BedwarsController:getTeamBed("2");

            if v45 then
                local u46 = u35:setupArrowBeam((u4("Attachment", {
                    Position = Vector3.new(0, 1, 0),
                    Parent = v45
                })));
                u37:GiveTask(function() -- Line: 287
                    -- upvalues: u46 (copy)
                    u46:DoCleaning();
                end);

                return u37;
            end;
        else
            if p36 == "equip_axe" then
                u35:highlightSlotWithItem(ItemType.WOOD_AXE);
                local u49 = ClientStore.changed:connect(function(p47, p48) -- Line: 295
                    -- upvalues: u35 (copy), ItemType (ref)
                    if p47.Inventory.observedInventory.hotbar ~= p48.Inventory.observedInventory.hotbar then
                        u35:highlightSlotWithItem(ItemType.WOOD_AXE);
                    end;
                end);
                u37:GiveTask(function() -- Line: 300
                    -- upvalues: u49 (copy), Players (ref)
                    u49:disconnect();
                    Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil);
                end);

                return u37;
            end;

            if p36 == "equip_pickaxe" then
                u35:highlightSlotWithItem(ItemType.WOOD_PICKAXE);
                local u52 = ClientStore.changed:connect(function(p50, p51) -- Line: 308
                    -- upvalues: u35 (copy), ItemType (ref)
                    if p50.Inventory.observedInventory.hotbar ~= p51.Inventory.observedInventory.hotbar then
                        u35:highlightSlotWithItem(ItemType.WOOD_PICKAXE);
                    end;
                end);
                u37:GiveTask(function() -- Line: 313
                    -- upvalues: u52 (copy), Players (ref)
                    u52:disconnect();
                    Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil);
                end);

                return u37;
            end;

            if p36 == "equip_sword" then
                u35:highlightSlotWithItem(ItemType.STONE_SWORD);
                local u55 = ClientStore.changed:connect(function(p53, p54) -- Line: 321
                    -- upvalues: u35 (copy), ItemType (ref)
                    if p53.Inventory.observedInventory.hotbar ~= p54.Inventory.observedInventory.hotbar then
                        u35:highlightSlotWithItem(ItemType.STONE_SWORD);
                    end;
                end);
                u37:GiveTask(function() -- Line: 326
                    -- upvalues: u55 (copy), Players (ref)
                    u55:disconnect();
                    Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil);
                end);

                return u37;
            end;

            if p36 == "break_bed" then
                local v56 = KnitClient2.Controllers.BedwarsController:getTeamBed("2");
                local v57;

                if v56 == nil then
                    v57 = v56;
                else
                    v57 = v56:WaitForChild("Covers", 3);
                end;

                if v57 then
                    u37:GiveTask((u4("Highlight", {
                        FillTransparency = 1,
                        OutlineTransparency = 0,
                        Parent = v57,
                        OutlineColor = Color3.fromRGB(255, 69, 105),
                        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    })));
                end;

                if v56 then
                    local Position = v56:GetPivot().Position;
                    local u63 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController"):addIndicator({
                        uiType = IndicatorUIType.Custom,
                        uiConfig = {
                            distanceRelativeToPlayer = true,
                            scaleWithAlpha = true,
                            scaleOnFade = false,
                            easeOutOnAppoach = false,
                            color3 = Color3.new(255, 255, 255),
                            template = u4("Frame", {
                                Name = "Container",
                                BackgroundTransparency = 1,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Size = UDim2.fromScale(1, 1),
                                Children = { u4("ImageLabel", {
                                        Name = "BedIcon",
                                        BackgroundTransparency = 1,
                                        AnchorPoint = Vector2.new(0.5, 1),
                                        Position = UDim2.fromScale(0.5, 0.85),
                                        Size = UDim2.fromScale(0.7, 0.7),
                                        Image = getItemMeta(ItemType.WOOD_AXE).image
                                    }) }
                            }),

                            transparency = function(p58, p59, p60) -- Line: 373, Name: transparency
                                return 0;
                            end,

                            onEnterAnimation = function(p61) -- Line: 380, Name: onEnterAnimation
                                -- upvalues: TweenService (ref)
                                local PingIcon = p61:FindFirstChild("PingIcon");

                                if PingIcon ~= nil then
                                    PingIcon = PingIcon:Clone();
                                end;

                                if not PingIcon then
                                    return nil;
                                end;

                                PingIcon.Parent = p61;
                                local u62 = TweenService:Create(PingIcon, TweenInfo.new(0.15), {
                                    ImageTransparency = 1,
                                    Size = UDim2.fromScale(1.5, 1.5)
                                });
                                u62:Play();
                                u62.Completed:Connect(function() -- Line: 395
                                    -- upvalues: u62 (copy), PingIcon (copy)
                                    u62:Destroy();
                                    PingIcon:Destroy();
                                end);
                            end
                        },
                        creator = Players.LocalPlayer,
                        attachTo = Position,
                        constraintType = ConstraintType.Constrained
                    });
                    u37:GiveTask(function() -- Line: 405
                        -- upvalues: u63 (copy)
                        u63:destroy();
                    end);

                    return u37;
                end;
            else
                if p36 == "collect_diamonds" then
                    local v64 = CollectionService:GetTagged(ItemType.DIAMOND .. "_OreGenerator");

                    local function v67(p65) -- Line: 413
                        -- upvalues: u4 (ref), u35 (copy), u37 (copy)
                        local PrimaryPart = p65.PrimaryPart;

                        if not PrimaryPart then
                            warn("OreGenerator model has no primary part");

                            return nil;
                        end;

                        local u66 = u35:setupArrowBeam((u4("Attachment", {
                            Position = Vector3.new(0, -6, 0),
                            Parent = PrimaryPart
                        })));
                        u37:GiveTask(function() -- Line: 425
                            -- upvalues: u66 (copy)
                            u66:DoCleaning();
                        end);
                    end;

                    for i, v in v64 do
                        v67(v, i - 1, v64);
                    end;

                    return u37;
                end;

                if p36 == "collect_emeralds" then
                    local v68 = CollectionService:GetTagged(ItemType.EMERALD .. "_OreGenerator");

                    local function v71(p69) -- Line: 436
                        -- upvalues: u4 (ref), u35 (copy), u37 (copy)
                        local PrimaryPart = p69.PrimaryPart;

                        if not PrimaryPart then
                            warn("OreGenerator model has no primary part");

                            return nil;
                        end;

                        local u70 = u35:setupArrowBeam((u4("Attachment", {
                            Position = Vector3.new(0, -6, 0),
                            Parent = PrimaryPart
                        })));
                        u37:GiveTask(function() -- Line: 448
                            -- upvalues: u70 (copy)
                            u70:DoCleaning();
                        end);
                    end;

                    for i, v in v68 do
                        v71(v, i - 1, v68);
                    end;

                    return u37;
                end;

                if p36 == "path_to_diamond_emerald_gen" then
                    u35:highlightMobileAutoBridgeButton(u37);
                    local v72 = u35:getGlobalOreGeneratorMidpoint();
                    local v73 = u4("Part", {
                        Name = "DiamondEmeraldGenMidpoint",
                        Size = Vector3.new(1, 1, 1),
                        Anchored = true,
                        CanCollide = false,
                        Transparency = 1,
                        CFrame = CFrame.new(v72),
                        Parent = Workspace
                    });
                    local u74 = u35:setupArrowBeam((u4("Attachment", {
                        Position = Vector3.new(0, 1, 0),
                        Parent = v73
                    })));
                    u37:GiveTask(function() -- Line: 474
                        -- upvalues: u74 (copy)
                        u74:DoCleaning();
                    end);
                    local u75 = u35:highlightBridgePath(v72);
                    u37:GiveTask(function() -- Line: 478
                        -- upvalues: u75 (copy)
                        u75:DoCleaning();
                    end);
                    u37:GiveTask(v73);

                    return u37;
                end;

                if p36 == "purchase_upgrade" then
                    local u76 = u35:highlightTeamUpgradeButton();
                    u37:GiveTask(function() -- Line: 486
                        -- upvalues: u76 (copy)
                        local v77 = u76;

                        if v77 ~= nil then
                            v77:DoCleaning();
                        end;
                    end);

                    return u37;
                end;

                if p36 == "sprint" then
                    local function _(p78) -- Line: 495
                        -- upvalues: default (ref)
                        if p78 then
                            default.Client:Get("SprintStart"):SendToServer();

                            return;
                        end;

                        default.Client:Get("SprintStop"):SendToServer();
                    end;

                    if Players.LocalPlayer:GetAttribute("Sprinting") then
                        default.Client:Get("SprintStart"):SendToServer();
                    else
                        default.Client:Get("SprintStop"):SendToServer();
                    end;

                    u37:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("Sprinting"):Connect(function() -- Line: 503
                        -- upvalues: Players (ref), default (ref)
                        if Players.LocalPlayer:GetAttribute("Sprinting") then
                            default.Client:Get("SprintStart"):SendToServer();

                            return;
                        end;

                        default.Client:Get("SprintStop"):SendToServer();
                    end));
                end;
            end;
        end;

        return u37;
    end;

    local v79 = u35:getTutorialBlockPosition();

    if not v79 then
        return u37;
    end;

    local u80 = u35:highlightBlockPosition(v79, true);
    u37:GiveTask(function() -- Line: 228
        -- upvalues: u80 (copy)
        local v81 = u80;

        if v81 ~= nil then
            v81:DoCleaning();
        end;
    end);

    return u37;
end;

function u7.onTaskStart(p82, p83) -- Line: 510
end;

function u7.onTaskEnd(p84, p85) -- Line: 512
end;

function u7.onSectionStart(p86, p87) -- Line: 514
    -- upvalues: KnitClient (copy)
    if p87 ~= "sprint" then
        return;
    end;

    KnitClient.Controllers.SprintController:stopSprinting(true, false);
end;

function u7.onSectionEnd(p88, p89) -- Line: 522
end;

function u7.onTutorialStart(p90) -- Line: 524
    -- upvalues: ClientSyncEvents (copy), default (copy)
    ClientSyncEvents.TeamUpgradeOpened:connect(function(p91) -- Line: 525
        -- upvalues: default (ref)
        default.Client:Get("TutorialTeamUpgradeOpened"):SendToServer({});
    end);
end;

function u7.onTutorialEnd(p92) -- Line: 529
    -- upvalues: u5 (copy), ConfettiGroup (copy), KnitClient (copy)
    u5.mount(u5.createElement(ConfettiGroup, {
        Lifetime = 20
    }));
    KnitClient.Controllers.SpectateUIController:setLobbyButtonsVisiblity(false);
end;

function u7.highlightWoolHotbarSlot(p93) -- Line: 535
    -- upvalues: ClientStore (copy), getItemMeta (copy), Players (copy)
    local hotbar = ClientStore:getState().Inventory.observedInventory.hotbar;

    local function _(p94) -- Line: 538
        -- upvalues: getItemMeta (ref)
        local item = p94.item;

        if item then
            return getItemMeta(item.itemType).block ~= nil;
        end;

        return nil;
    end;

    local v95 = nil;

    for i, v in hotbar do
        local _ = i - 1;
        local item = v.item;
        local v96;

        if item then
            v96 = getItemMeta(item.itemType).block ~= nil;
        else
            v96 = nil;
        end;

        if v96 == true then
            v95 = v;
            break;
        end;
    end;

    if not v95 then
        warn("No wool slot found");

        return nil;
    end;

    local v97 = (table.find(hotbar, v95) or 0) - 1;
    Players.LocalPlayer:SetAttribute("TutorialHighlightedSlot", v97);
end;

function u7.requestBedLayerPositions(p98, p99) -- Line: 563
    -- upvalues: default (copy)
    return default.Client:Get("RequestBedLayerPositions"):CallServer(p99);
end;

function u7.getGlobalOreGeneratorMidpoint(p100) -- Line: 566
    -- upvalues: CollectionService (copy), ItemType (copy)
    local u101 = Vector3.new(0, 0, 0);

    local function _(p102) -- Line: 570
        -- upvalues: u101 (ref)
        local PrimaryPart = p102.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        u101 = PrimaryPart.Position;
    end;

    local u103 = Vector3.new(0, 0, 0);

    for i, v in CollectionService:GetTagged(ItemType.EMERALD .. "_OreGenerator") do
        local _ = i - 1;
        local PrimaryPart = v.PrimaryPart;

        if PrimaryPart then
            u101 = PrimaryPart.Position;
        end;
    end;

    local function _(p104) -- Line: 582
        -- upvalues: u103 (ref)
        local PrimaryPart = p104.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        u103 = PrimaryPart.Position;
    end;

    for i, v in CollectionService:GetTagged(ItemType.DIAMOND .. "_OreGenerator") do
        local _ = i - 1;
        local PrimaryPart = v.PrimaryPart;

        if PrimaryPart then
            u103 = PrimaryPart.Position;
        end;
    end;

    return (u101 + u103) / 2 - Vector3.new(0, 9, 0);
end;

function u7.getTutorialBlockPosition(p105) -- Line: 598
    -- upvalues: KnitClient2 (copy), BlockEngine (copy)
    local v106 = KnitClient2.Controllers.BedwarsController:getTeamBed("1");

    if v106 then
        return BlockEngine:getBlockPosition(v106.Position) - Vector3.new(0, 0, 2);
    end;

    return nil;
end;

function u7.highlightBridgePath(p107, p108) -- Line: 607
    -- upvalues: u3 (copy), KnitClient2 (copy), BlockEngine (copy)
    local v109 = u3.new();
    local v110 = KnitClient2.Controllers.BedwarsController:getTeamBed("1");

    if not v110 then
        return v109;
    end;

    local v111 = BlockEngine:getBlockPosition(v110.Position);
    local v112 = BlockEngine:getBlockPosition(p108);
    local v113 = v112.X - v111.X;
    local v114 = v112.Z - v111.Z;
    local v115 = math.abs(v113);
    local v116 = math.abs(v114);
    local v117 = math.max(v115, v116);

    if v117 < 1 then
        return v109;
    end;

    local v118 = false;
    local v119 = 0;
    local v120 = {};
    local v121 = nil;
    local v122 = {};
    local v123 = nil;

    while true do
        if v118 then
            v119 = v119 + 1;
        else
            v118 = true;
        end;

        if v119 > v117 then
            break;
        end;

        local v124 = v119 / v117;
        local v125 = math.round(v111.X + v113 * v124);
        local v126 = math.round(v111.Z + v114 * v124);
        local v127 = tostring(v125) .. ":" .. tostring(v126);

        if v122[v127] == nil then
            v122[v127] = true;
            local v128 = p107:getTopBlockY(v125, v126, v111.Y);

            if v123 == nil then
                if v128 == nil then
                    if v121 ~= nil then
                        local v129 = Vector3.new(v125, v121, v126);
                        table.insert(v120, v129);
                        v123 = v121;
                    end;
                else
                    v121 = v128;
                end;
            else
                if v128 ~= nil then
                    break;
                end;

                local v130 = Vector3.new(v125, v123, v126);
                table.insert(v120, v130);
            end;
        end;
    end;

    for _, v in v120 do
        local u131 = p107:highlightBlockPosition(v);

        if u131 then
            v109:GiveTask(function() -- Line: 667
                -- upvalues: u131 (copy)
                u131:DoCleaning();
            end);
        end;
    end;

    return v109;
end;

function u7.getTopBlockY(p132, p133, p134, p135) -- Line: 673
    -- upvalues: BlockEngine (copy)
    local v136 = math.floor(p135) + 2;
    local v137 = false;

    while true do
        if v137 then
            v136 = v136 - 1;
        else
            v137 = true;
        end;

        if math.floor(p135) - 12 > v136 then
            return;
        end;

        if BlockEngine:getStore():getBlockAt((Vector3.new(p133, v136, p134))) then
            return v136;
        end;
    end;
end;

function u7.highlightMobileAutoBridgeButton(p138, p139) -- Line: 692
    -- upvalues: Players (copy)
    Players.LocalPlayer:SetAttribute("TutorialHighlightedAutoBridge", true);
    p139:GiveTask(function() -- Line: 694
        -- upvalues: Players (ref)
        Players.LocalPlayer:SetAttribute("TutorialHighlightedAutoBridge", nil);
    end);
end;

KnitClient.CreateController(u7.new());

return nil;