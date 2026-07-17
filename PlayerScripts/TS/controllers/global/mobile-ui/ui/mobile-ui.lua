-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local MobileButton = v1.MobileButton;
local getLegacyMobileLayoutDimensions = v1.getLegacyMobileLayoutDimensions;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BaseWeaponBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type");
local PING_SLOTS = v7.PING_SLOTS;
local PingType = v7.PingType;
local Pings = v7.Pings;
local getPingFromSlot = v7.getPingFromSlot;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local SprintUI = RuntimeLib.import(script, script.Parent.Parent.Parent, "sprint", "ui", "sprint-ui").SprintUI;
local MoveMountMobileUI = RuntimeLib.import(script, script.Parent, "move-mount-mobile-ui").MoveMountMobileUI;

return {
    MobileUI = v5.new(u4)(function(u8, p9) -- Line: 34
        -- upvalues: PingType (copy), u3 (copy), DeviceUtil (copy), getLegacyMobileLayoutDimensions (copy), Flamework (copy), Players (copy), KnitClient (copy), GameCoreClientSyncEvents (copy), Setting (copy), ClientSyncEvents (copy), u4 (copy), PlaceUtil (copy), MobileButton (copy), Pings (copy), PING_SLOTS (copy), getPingFromSlot (copy), u2 (copy), BedwarsImageId (copy), ClientStore (copy), EntityUtil (copy), getItemMeta (copy), BaseWeaponBalance (copy), RunService (copy), SprintUI (copy), Workspace (copy), MoveMountMobileUI (copy)
        local useState = p9.useState;
        local useEffect = p9.useEffect;
        local useValue = p9.useValue;
        local v10, u11 = useState(PingType.GENERIC);
        local u12, u13 = useState(true);
        local u14 = useValue(u3.new());
        local v15;

        if DeviceUtil.isHoarceKat() then
            v15 = getLegacyMobileLayoutDimensions().Ping;
        else
            v15 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("Ping");
        end;

        local v16, u17 = useState(v15);
        local v18;

        if DeviceUtil.isHoarceKat() then
            v18 = getLegacyMobileLayoutDimensions().SwordSwing;
        else
            v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("SwordSwing");
        end;

        local v19, u20 = useState(v18);
        local v21;

        if DeviceUtil.isHoarceKat() then
            v21 = getLegacyMobileLayoutDimensions().Interact;
        else
            v21 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("Interact");
        end;

        local v22, u23 = useState(v21);
        local v24;

        if DeviceUtil.isHoarceKat() then
            v24 = getLegacyMobileLayoutDimensions().AutoBridge;
        else
            v24 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("AutoBridge");
        end;

        local v25, u26 = useState(v24);
        local v27, u28 = useState(false);
        local v29, u30 = useState(false);
        local u31 = false;
        local u32 = nil;
        local u33 = 0;
        useEffect(function() -- Line: 50
            -- upvalues: DeviceUtil (ref), u3 (ref), Flamework (ref), u28 (copy), Players (ref), KnitClient (ref), u17 (copy), u20 (copy), u23 (copy), u26 (copy), GameCoreClientSyncEvents (ref), u8 (copy), u30 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u34 = u3.new();
            local u35 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController");
            u28(Players.LocalPlayer:GetAttribute("TutorialHighlightedAutoBridge") == true);
            local u36 = KnitClient.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():andThen(function() -- Line: 57
                -- upvalues: u17 (ref), u35 (copy), u20 (ref), u23 (ref), u26 (ref)
                u17(u35:getLayoutDimensions("Ping"));
                u20(u35:getLayoutDimensions("SwordSwing"));
                u23(u35:getLayoutDimensions("Interact"));
                u26(u35:getLayoutDimensions("AutoBridge"));
            end);
            u34:GiveTask(function() -- Line: 63
                -- upvalues: u36 (copy)
                return u36:cancel();
            end);
            u34:GiveTask(GameCoreClientSyncEvents.MobileLayoutRegistered:connect(function() -- Line: 66
                -- upvalues: u17 (ref), u35 (copy), u20 (ref), u23 (ref), u26 (ref)
                u17(u35:getLayoutDimensions("Ping"));
                u20(u35:getLayoutDimensions("SwordSwing"));
                u23(u35:getLayoutDimensions("Interact"));
                u26(u35:getLayoutDimensions("AutoBridge"));
            end));
            u34:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("TutorialHighlightedAutoBridge"):Connect(function() -- Line: 72
                -- upvalues: u28 (ref), Players (ref)
                u28(Players.LocalPlayer:GetAttribute("TutorialHighlightedAutoBridge") == true);
            end));
            u34:GiveTask(u8.isMoveMountEnabledSignal:Connect(function(p37) -- Line: 75
                -- upvalues: u30 (ref)
                u30(p37);
            end));

            return function() -- Line: 78
                -- upvalues: u34 (copy)
                return u34:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 82
            -- upvalues: KnitClient (ref), u13 (copy), Setting (ref), ClientSyncEvents (ref)
            KnitClient.Controllers.SettingsController:waitForSettingsAsync():andThen(function(p38) -- Line: 84
                -- upvalues: u13 (ref), Setting (ref)
                u13(p38[Setting.MOBILE_SWORD_HOLD]);
            end);
            ClientSyncEvents.SettingChanged:connect(function(p39) -- Line: 89
                -- upvalues: Setting (ref), u13 (ref)
                if p39.setting == Setting.MOBILE_SWORD_HOLD then
                    u13(p39.value);
                end;
            end);
        end, {});
        local v40 = {
            ResetOnSpawn = false
        };
        local v41 = {};
        local v42 = #v41;
        local v43 = u8[u4.Children];

        if v43 then
            for i, v in v43 do
                if type(i) == "number" then
                    v41[v42 + i] = v;
                else
                    v41[i] = v;
                end;
            end;
        end;

        local v44 = #v41;
        local v50 = PlaceUtil.isGameServer() and not DeviceUtil.isHoarceKat() and u4.createElement(MobileButton, {
            GenerateCircleBackground = true,
            Image = Pings[v10].image,
            ImageColor3 = Pings[v10].color,
            Size = v16.size,
            Position = v16.position or UDim2.fromOffset(0, 0),

            OnPressDown = function() -- Line: 117, Name: OnPressDown
                -- upvalues: u31 (ref), u33 (ref), u32 (ref), Flamework (ref), u11 (copy), PingType (ref), PING_SLOTS (ref), getPingFromSlot (ref), u4 (ref), KnitClient (ref), u2 (ref)
                u31 = false;
                u33 = os.time();

                if u32 then
                    task.cancel(u32);
                end;

                u32 = task.delay(0.5, function() -- Line: 123
                    -- upvalues: u31 (ref), Flamework (ref), u11 (ref), PingType (ref), PING_SLOTS (ref), getPingFromSlot (ref), u4 (ref), KnitClient (ref), u2 (ref)
                    if not u31 then
                        local u45 = Flamework.resolveDependency("client/controllers/game/ping/ping-controller@PingController");
                        u45:setSelectedSlot(nil);
                        u11(PingType.GENERIC);
                        local u46 = 1;
                        local v47 = false;
                        local v48 = {};

                        while true do
                            if true then
                                if v47 then
                                    u46 = u46 + 1;
                                else
                                    v47 = true;
                                end;
                            end;

                            if u46 > PING_SLOTS then
                                break;
                            end;

                            local u49 = getPingFromSlot(u46);
                            v48[u46] = {
                                element = u4.createElement("ImageLabel", {
                                    BackgroundTransparency = 1,
                                    Image = u49.data.image,
                                    ImageColor3 = u49.data.color,
                                    Size = UDim2.fromScale(0.9, 0.9)
                                }),
                                title = u49.data.title,

                                onSelect = function() -- Line: 152, Name: onSelect
                                    -- upvalues: u45 (copy), u46 (ref), u11 (ref), u49 (copy), KnitClient (ref)
                                    u45:setSelectedSlot(u46);
                                    u11(u49.pingType);
                                    KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                                end
                            };
                            u46 = u46;
                        end;

                        KnitClient.Controllers.RadialWheelController:openRadialWheel(u2.values(v48), PING_SLOTS, nil, true, UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.6, 0.6), function() -- Line: 162
                            -- upvalues: Flamework (ref)
                            Flamework.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):enableTouchPing();
                        end);
                    end;
                end);
            end,

            OnPressUp = function() -- Line: 168, Name: OnPressUp
                -- upvalues: u31 (ref), u33 (ref), Flamework (ref)
                u31 = true;

                if os.time() - u33 <= 0.5 then
                    Flamework.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):enableTouchPing();
                end;
            end
        });

        if v50 then
            v41[v44 + 1] = v50;
        end;

        local v51 = #v41;
        v41[v51 + 1] = u4.createElement(MobileButton, {
            Image = BedwarsImageId.ATTACK_MOBILE,
            Position = v19.position or UDim2.fromOffset(0, 0),
            Size = v19.size,

            OnPressDown = function(p52) -- Line: 183, Name: OnPressDown
                -- upvalues: Players (ref), ClientStore (ref), KnitClient (ref), EntityUtil (ref), getItemMeta (ref), ClientSyncEvents (ref), u12 (copy), BaseWeaponBalance (ref), u14 (copy), RunService (ref)
                local v53 = Players.LocalPlayer:GetAttribute("IsCasting");

                if v53 ~= 0 and (v53 == v53 and (v53 ~= "" and v53)) then
                    return nil;
                end;

                local function _() -- Line: 189
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.SwordController:bufferMobileAttack();
                    KnitClient.Controllers.HotbarController:selectHotbarItemGroup("sword");
                end;

                if ClientStore:getState().Inventory.observedPlayer == Players.LocalPlayer then
                    local v54 = EntityUtil:getLocalPlayerEntity();

                    if not v54 then
                        return nil;
                    end;

                    local v55 = v54:getItemInHandClient();

                    if v55 == nil then
                        KnitClient.Controllers.SwordController:bufferMobileAttack();
                        KnitClient.Controllers.HotbarController:selectHotbarItemGroup("sword");

                        return nil;
                    end;

                    if not getItemMeta(v55.Name).sword then
                        KnitClient.Controllers.SwordController:bufferMobileAttack();
                        KnitClient.Controllers.HotbarController:selectHotbarItemGroup("sword");

                        return nil;
                    end;
                end;

                if not ClientSyncEvents.MobileSwordButtonPressed:fire("down", p52):isCancelled() then
                    local SwordController = KnitClient.Controllers.SwordController;
                    SwordController:mobileSwingPressed();

                    if u12 then
                        local v56 = EntityUtil:getLocalPlayerEntity();
                        local v57 = v56 and v56:getItemInHandClient();

                        if v57 then
                            SwordController.activeSwordActionId = SwordController.swordActionIdHandler:getNextId();
                            local sword = getItemMeta(v57.Name).sword;

                            if sword ~= nil then
                                sword = sword.attackSpeed;
                            end;

                            if sword == nil then
                                sword = BaseWeaponBalance.SWORD_SWING_COOLDOWN;
                            end;

                            local u58 = sword * 0.5;
                            task.delay(u58, function() -- Line: 230
                                -- upvalues: SwordController (copy), u14 (ref), RunService (ref), u58 (copy), KnitClient (ref)
                                if SwordController.activeSwordActionId ~= SwordController.swordActionIdHandler:getCurrId() then
                                    return nil;
                                end;

                                u14.value:DoCleaning();
                                local u59 = 0;
                                SwordController:mobileSwingPressed();
                                u14.value:GiveTask(RunService.Heartbeat:Connect(function(p60) -- Line: 238
                                    -- upvalues: u59 (ref), u58 (ref), KnitClient (ref), u14 (ref), SwordController (ref)
                                    if u58 >= u59 then
                                        u59 = u59 + p60;

                                        return;
                                    end;

                                    if KnitClient.Controllers.SwordController:isHoldAutoSwingDisabled() then
                                        u14.value:DoCleaning();

                                        return nil;
                                    end;

                                    SwordController:mobileSwingPressed();
                                    u59 = 0;
                                end));
                            end);
                        end;
                    end;
                end;
            end,

            OnPressUp = function(p61) -- Line: 256, Name: OnPressUp
                -- upvalues: ClientSyncEvents (ref), KnitClient (ref), u14 (copy)
                ClientSyncEvents.MobileSwordButtonPressed:fire("up", p61);
                ClientSyncEvents.SwordSwingUp:fire();
                KnitClient.Controllers.SwordController.activeSwordActionId = -1;
                u14.value:DoCleaning();
            end
        });
        local v62 = v22.position and u4.createElement(MobileButton, {
            Image = BedwarsImageId.INTERACT_MOBILE,
            Position = v22.position,
            Size = v22.size,

            OnPressDown = function() -- Line: 267, Name: OnPressDown
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.MobileInteractController:abilityInteract();
            end,

            OnPressUp = function() -- Line: 270, Name: OnPressUp
            end
        });

        if v62 then
            v41[v51 + 2] = v62;
        end;

        local v63 = #v41;
        v41[v63 + 1] = u4.createElement(SprintUI, {
            OnClick = function() -- Line: 277, Name: OnClick
                -- upvalues: KnitClient (ref)
                if KnitClient.Controllers.SprintController:isSprinting() then
                    KnitClient.Controllers.SprintController:stopSprinting(true);

                    return;
                end;

                KnitClient.Controllers.SprintController:startSprinting();
            end
        });
        local position = v25.position;

        if position then
            local v66 = {
                Image = BedwarsImageId.BUILD_MOBILE,
                Position = v25.position,
                Size = v25.size,

                OnPressDown = function() -- Line: 291, Name: OnPressDown
                    -- upvalues: KnitClient (ref), Workspace (ref)
                    KnitClient.Controllers.HotbarController:selectHotbarItemGroup("block");
                    local v64 = Workspace:GetServerTimeNow() - KnitClient.Controllers.KnockbackController:getLastKnockbackTime() >= 0.2;
                    local v65 = KnitClient.Controllers.BlockPlacementController:getBlockPlacer();

                    if v65 ~= nil then
                        v65:autoBridge(v64);
                    end;
                end,

                OnPressUp = function() -- Line: 303, Name: OnPressUp
                end
            };
            local v67 = {};
            local v68 = #v67;
            local v69;

            if v27 then
                v69 = u4.createFragment({
                    TutorialAutoBridgeArrow = u4.createElement("ImageLabel", {
                        Image = "rbxassetid://16809397532",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 20,
                        Size = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, -0.35),
                        SizeConstraint = Enum.SizeConstraint.RelativeXX,
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    })
                });
            else
                v69 = v27;
            end;

            if v69 then
                v67[v68 + 1] = v69;
            end;

            local v70 = #v67;

            if v27 then
                v27 = u4.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255)
                });
            end;

            if v27 then
                v67[v70 + 1] = v27;
            end;

            position = u4.createElement(MobileButton, v66, v67);
        end;

        if position then
            v41[v63 + 2] = position;
        end;

        local v71 = #v41;

        if v29 then
            v29 = u4.createElement(MoveMountMobileUI);
        end;

        if v29 then
            v41[v71 + 1] = v29;
        end;

        return u4.createFragment({
            MobileUI = u4.createElement("ScreenGui", v40, v41)
        });
    end)
};