-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GamepadAbilityUIContainer = v1.GamepadAbilityUIContainer;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local UserInputService = v7.UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local KeybindDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local HotbarCustomMatchSection = RuntimeLib.import(script, script.Parent.Parent.Parent, "creative", "custom-match", "hotbar-custom-match-section").HotbarCustomMatchSection;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local HotbarHealthbar = RuntimeLib.import(script, script.Parent, "healthbar", "hotbar-healthbar").HotbarHealthbar;
local HotbarItemNameDisplay = RuntimeLib.import(script, script.Parent, "hotbar-item-name-display").HotbarItemNameDisplay;
local HotbarOpenInventory = RuntimeLib.import(script, script.Parent, "hotbar-open-inventory").HotbarOpenInventory;
local HotbarResourceDisplay = RuntimeLib.import(script, script.Parent, "hotbar-resource-display").HotbarResourceDisplay;
local HotbarTeamEventCollectableDisplay = RuntimeLib.import(script, script.Parent, "hotbar-team-event-collectable-display").HotbarTeamEventCollectableDisplay;
local HotbarTile = RuntimeLib.import(script, script.Parent, "hotbar-tile").HotbarTile;
local HotbarPregame = RuntimeLib.import(script, script.Parent, "pregame", "hotbar-pregame").HotbarPregame;
local HotbarSpectatorSection = RuntimeLib.import(script, script.Parent, "spectate", "hotbar-spectator-section").HotbarSpectatorSection;
local u8 = {
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine,
    Enum.KeyCode.Zero
};
local v9 = {};
local u10 = setmetatable({}, {
    __index = v9
});
u10.PARTY = 0;
v9[0] = "PARTY";
u10.SPECTATOR = 1;
v9[1] = "SPECTATOR";
u10.HEALTHBAR = 2;
v9[2] = "HEALTHBAR";
u10.CUSTOM_MATCH_PREGAME = 3;
v9[3] = "CUSTOM_MATCH_PREGAME";
u10.POST_GAME = 4;
v9[4] = "POST_GAME";
u10.PRE_GAME = 5;
v9[5] = "PRE_GAME";

local function v81(u11, p12) -- Line: 61
    -- upvalues: ClientStore (copy), Setting (copy), u3 (copy), DeviceUtil (copy), Players (copy), QueueMeta (copy), u10 (ref), MatchState (copy), PlaceUtil (copy), KnitClient (copy), KeybindDefaults (copy), EventUtil (copy), u4 (copy), HotbarSpectatorSection (copy), HotbarHealthbar (copy), HotbarCustomMatchSection (copy), HotbarPregame (copy), u2 (copy), ArmorSlot (copy), ItemViewport (copy), Empty (copy), u8 (copy), HotbarTile (copy), Flamework (copy), BedwarsAppIds (copy), default (copy), getItemMeta (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), HotbarOpenInventory (copy), HotbarItemNameDisplay (copy), HotbarResourceDisplay (copy), HotbarTeamEventCollectableDisplay (copy), UserInputService (copy), GamepadAbilityUIContainer (copy)
    local useState = p12.useState;
    local useEffect = p12.useEffect;
    local v13, u14 = useState(ClientStore:getState().Settings[Setting.SHOW_RESOURCES_IN_HUD]);
    local u15, u16 = useState(nil);
    useEffect(function() -- Line: 66
        -- upvalues: u3 (ref), DeviceUtil (ref), Players (ref), u16 (copy), ClientStore (ref), Setting (ref), u14 (copy)
        local u17 = u3.new();

        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        u16((Players.LocalPlayer:GetAttribute("TutorialHighlightedSlot")));
        u17:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("TutorialHighlightedSlot"):Connect(function() -- Line: 73
            -- upvalues: Players (ref), u16 (ref)
            local v18 = Players.LocalPlayer:GetAttribute("TutorialHighlightedSlot");
            u16(v18 == nil and -1 or v18);
        end));
        local u21 = ClientStore.changed:connect(function(p19, p20) -- Line: 81
            -- upvalues: Setting (ref), u14 (ref)
            if p19.Settings[Setting.SHOW_RESOURCES_IN_HUD] ~= p20.Settings[Setting.SHOW_RESOURCES_IN_HUD] then
                u14(p19.Settings[Setting.SHOW_RESOURCES_IN_HUD]);
            end;
        end);
        u17:GiveTask(function() -- Line: 86
            -- upvalues: u21 (copy)
            return u21:disconnect();
        end);

        return function() -- Line: 89
            -- upvalues: u17 (copy)
            u17:DoCleaning();
        end;
    end, { u15 });
    local v22;

    if u11.QueueType then
        v22 = QueueMeta[u11.QueueType];
    else
        v22 = nil;
    end;

    local HEALTHBAR = u10.HEALTHBAR;

    if u11.store.App.showHotbarPartyControls then
        HEALTHBAR = u10.PARTY;
    elseif u11.store.Game.customMatch and (u11.store.Game.matchState == MatchState.PRE and not u11.store.Game.pregameVotingEnabled) then
        HEALTHBAR = u10.CUSTOM_MATCH_PREGAME;
    elseif u11.store.Game.spectating then
        HEALTHBAR = u10.SPECTATOR;
    elseif u11.store.Game.matchState == MatchState.PRE and (PlaceUtil.isGameServer() and (v22 and not v22.noKits)) then
        HEALTHBAR = u10.PRE_GAME;
    end;

    if u11.store.Game.matchState == MatchState.POST then
        HEALTHBAR = u10.POST_GAME;
    end;

    local armor = u11.store.Inventory.observedInventory.inventory.armor;
    local u23;

    if DeviceUtil.isHoarceKat() then
        u23 = nil;
    else
        u23 = KnitClient.Controllers.InventoryController:getEquippedArmor(armor);
    end;

    local v24;

    if DeviceUtil.isHoarceKat() then
        v24 = nil;
    else
        v24 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
    end;

    local v25;

    if v24 == nil then
        v25 = v24;
    else
        v25 = v24.keyboard;

        if v25 ~= nil then
            v25 = v25.controlActions.HotbarSlot1;
        end;
    end;

    if v25 == nil then
        v25 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v26;

    if v24 == nil then
        v26 = v24;
    else
        v26 = v24.keyboard;

        if v26 ~= nil then
            v26 = v26.controlActions.HotbarSlot2;
        end;
    end;

    if v26 == nil then
        v26 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v27;

    if v24 == nil then
        v27 = v24;
    else
        v27 = v24.keyboard;

        if v27 ~= nil then
            v27 = v27.controlActions.HotbarSlot3;
        end;
    end;

    if v27 == nil then
        v27 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v28;

    if v24 == nil then
        v28 = v24;
    else
        v28 = v24.keyboard;

        if v28 ~= nil then
            v28 = v28.controlActions.HotbarSlot4;
        end;
    end;

    if v28 == nil then
        v28 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v29;

    if v24 == nil then
        v29 = v24;
    else
        v29 = v24.keyboard;

        if v29 ~= nil then
            v29 = v29.controlActions.HotbarSlot5;
        end;
    end;

    if v29 == nil then
        v29 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v30;

    if v24 == nil then
        v30 = v24;
    else
        v30 = v24.keyboard;

        if v30 ~= nil then
            v30 = v30.controlActions.HotbarSlot6;
        end;
    end;

    if v30 == nil then
        v30 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v31;

    if v24 == nil then
        v31 = v24;
    else
        v31 = v24.keyboard;

        if v31 ~= nil then
            v31 = v31.controlActions.HotbarSlot7;
        end;
    end;

    if v31 == nil then
        v31 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local v32;

    if v24 == nil then
        v32 = v24;
    else
        v32 = v24.keyboard;

        if v32 ~= nil then
            v32 = v32.controlActions.HotbarSlot8;
        end;
    end;

    if v32 == nil then
        v32 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    if v24 ~= nil then
        v24 = v24.keyboard;

        if v24 ~= nil then
            v24 = v24.controlActions.HotbarSlot9;
        end;
    end;

    if v24 == nil then
        v24 = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1;
    end;

    local u33 = {
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        v31,
        v32,
        v24
    };
    local v34;

    if #EventUtil.getActiveTeamEvents() > 0 then
        v34 = not u11.store.Game.customMatch and PlaceUtil.isGameServer() and EventUtil.isEventRunning(EventUtil.getActiveTeamEvents()[1]);
    else
        v34 = false;
    end;

    local v35 = {
        DisplayOrder = 10
    };
    local v36 = {};
    local v37 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.6, DeviceUtil.isSmallScreen() and 0.13 or 0.08),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.95 or 0.99)
    };
    local v38 = { u4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 9
        }) };
    local v39 = #v38;
    local v40;

    if HEALTHBAR == u10.SPECTATOR then
        v40 = u4.createElement(HotbarSpectatorSection);
    else
        v40 = false;
    end;

    if v40 then
        v38[v39 + 1] = v40;
    end;

    local v41 = #v38;
    local v42;

    if HEALTHBAR == u10.HEALTHBAR then
        v42 = u4.createElement(HotbarHealthbar);
    else
        v42 = false;
    end;

    if v42 then
        v38[v41 + 1] = v42;
    end;

    local v43 = #v38;
    local v44;

    if HEALTHBAR == u10.CUSTOM_MATCH_PREGAME then
        v44 = u4.createElement(HotbarCustomMatchSection, {
            AppId = "HotbarCustomMatchSection"
        });
    else
        v44 = false;
    end;

    if v44 then
        v38[v43 + 1] = v44;
    end;

    local v45 = #v38;
    local v46;

    if HEALTHBAR == u10.POST_GAME then
        v46 = u4.createElement(HotbarSpectatorSection, {
            HideSpectating = true
        });
    else
        v46 = false;
    end;

    if v46 then
        v38[v45 + 1] = v46;
    end;

    local v47 = #v38;
    local v48;

    if HEALTHBAR == u10.PRE_GAME then
        v48 = u4.createElement(HotbarPregame);
    else
        v48 = false;
    end;

    if v48 then
        v38[v47 + 1] = v48;
    end;

    local v49 = #v38;

    if u23 then
        local v50 = u2.entries(ArmorSlot);

        local function v54(p51) -- Line: 264
            -- upvalues: u23 (copy), u4 (ref), ItemViewport (ref), u2 (ref), ArmorSlot (ref), Empty (ref)
            local _ = p51[1];
            local v52 = p51[2];
            local v53 = u23[v52];

            if v53 then
                return u4.createElement(ItemViewport, {
                    SizeConstraint = "RelativeXY",
                    ItemType = v53,
                    Size = UDim2.fromScale(1, 1 / #u2.keys(ArmorSlot)),
                    LayoutOrder = v52
                }, { u4.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
            end;

            return u4.createElement(Empty, {
                SizeConstraint = "RelativeXY",
                Size = UDim2.fromScale(1, 1 / #u2.keys(ArmorSlot)),
                LayoutOrder = v52
            });
        end;

        u23 = table.create(#v50);

        for i, v in v50 do
            u23[i] = v54(v, i - 1, v50);
        end;
    end;

    local v55 = {
        Size = UDim2.fromScale(0.07, 1.5),
        Position = UDim2.fromScale(-0.08, 1),
        AnchorPoint = Vector2.new(1, 1)
    };
    local v56 = { u4.createElement(
            "UIListLayout",
            {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center"
            }
        ) };
    local v57 = #v56;

    if u23 then
        for i, v in u23 do
            v56[v57 + i] = v;
        end;
    end;

    v38[v49 + 1] = u4.createElement(Empty, v55, v56);
    local hotbar = u11.store.Inventory.observedInventory.hotbar;

    local function v70(u58, u59) -- Line: 312
        -- upvalues: u33 (copy), u8 (ref), DeviceUtil (ref), u4 (ref), HotbarTile (ref), u11 (copy), u15 (copy), Flamework (ref), BedwarsAppIds (ref), Players (ref), default (ref), ClientStore (ref), getItemMeta (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
        local u60 = u33[u59 + 1];

        local function _(p61) -- Line: 316
            -- upvalues: u60 (copy)
            return p61 == u60;
        end;

        local v62 = nil;

        for i, v in u8 do
            local _ = i - 1;

            if v == u60 == true then
                v62 = v;
                break;
            end;
        end;

        local v63 = v62 and true or false;
        local v64 = tostring(u59 + 1);

        if not DeviceUtil.isHoarceKat() then
            if v63 then
                v64 = tostring(u33[u59 + 1].Value - 48);
            else
                v64 = u33[u59 + 1].Name;
            end;
        end;

        local createElement = u4.createElement;
        local v65 = {
            HotbarSlot = u58,
            SlotNumber = u59,
            Keybind = v64,
            LayoutOrder = u59,
            Selected = u59 == u11.store.Inventory.observedInventory.hotbarSlot
        };
        local v66;

        if u15 == nil then
            v66 = false;
        else
            v66 = u59 == u15;
        end;

        v65.HighlightedSlot = v66;
        v65.store = u11.store;

        function v65.OnClick() -- Line: 343
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u58 (copy), Players (ref), default (ref), ClientStore (ref), u59 (copy), getItemMeta (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            local v67 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");

            if v67:isAppOpen(BedwarsAppIds.CHEST_INVENTORY) then
                if u58.item and u58.item.tool then
                    local Character = Players.LocalPlayer.Character;

                    if Character ~= nil then
                        Character = Character:FindFirstChild("ObservedChestFolder");
                    end;

                    local v68;

                    if Character == nil then
                        v68 = Character;
                    else
                        v68 = Character.Value;
                    end;

                    if v68 then
                        default.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(Character.Value, u58.item.tool);
                        ClientStore:dispatch({
                            type = "InventoryRemoveFromHotbar",
                            slot = u59
                        });
                    end;
                end;
            else
                if v67:isAppOpen(BedwarsAppIds.INVENTORY) then
                    if u58.item then
                        local v69 = getItemMeta(u58.item.itemType);

                        if v69.armor and ClientStore:getState().Inventory.observedInventory.inventory.armor[v69.armor.slot + 1] == "empty" then
                            ClientStore:dispatch({
                                type = "InventorySetArmorItem",
                                item = u58.item,
                                armorSlot = v69.armor.slot
                            });
                            SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));

                            return nil;
                        end;

                        if v69.backpack and ClientStore:getState().Inventory.observedInventory.inventory.backpack == nil then
                            ClientStore:dispatch({
                                type = "InventorySetBackpack",
                                item = u58.item
                            });
                            SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));

                            return nil;
                        end;
                    end;

                    ClientStore:dispatch({
                        type = "InventoryRemoveFromHotbar",
                        slot = u59
                    });

                    return;
                end;

                ClientStore:dispatch({
                    type = "InventorySelectHotbarSlot",
                    slot = u59
                });
            end;
        end;

        return createElement(HotbarTile, v65);
    end;

    local v71 = table.create(#hotbar);

    for i, v in hotbar do
        v71[i] = v70(v, i - 1, hotbar);
    end;

    local v72 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 1),
        AnchorPoint = Vector2.new(0.5, 1)
    };
    local v73;

    if HEALTHBAR == u10.SPECTATOR then
        v73 = false;
    else
        v73 = HEALTHBAR ~= u10.POST_GAME;
    end;

    v72.Visible = v73;
    local v74 = {
        ItemsHotbarListLayout = u4.createElement(
            "UIListLayout",
            {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center"
            }
        )
    };
    local v75 = #v74;

    for i, v in v71 do
        v74[v75 + i] = v;
    end;

    local v76 = #v74;
    local v77 = not DeviceUtil.isHoarceKat() and u4.createElement(HotbarOpenInventory, {
        LayoutOrder = 20,
        store = u11.store
    });

    if v77 then
        v74[v76 + 1] = v77;
    end;

    v38.ItemsHotbar = u4.createElement("Frame", v72, v74);
    v38[v49 + 2] = u4.createElement(HotbarItemNameDisplay, {
        store = u11.store
    });

    if v13 then
        if HEALTHBAR == u10.SPECTATOR or HEALTHBAR == u10.POST_GAME then
            v13 = false;
        else
            v13 = u4.createElement(HotbarResourceDisplay, {
                ObservedInventory = u11.store.Inventory.observedInventory
            });
        end;
    end;

    if v13 then
        v38[v49 + 3] = v13;
    end;

    local v78 = #v38;

    if v34 then
        v34 = u4.createElement(HotbarTeamEventCollectableDisplay, {
            EventType = EventUtil.getActiveTeamEvents()[1]
        });
    end;

    if v34 then
        v38[v78 + 1] = v34;
    end;

    local v79 = #v38;
    local v80 = #UserInputService:GetConnectedGamepads() ~= 0 and u4.createElement(Empty, {
        Size = UDim2.fromScale(1, 1)
    }, { u4.createElement(GamepadAbilityUIContainer, {
            AbilitySectionType = "Secondary",
            Position = UDim2.new(-0.4, 0, -1, 0)
        }), u4.createElement(GamepadAbilityUIContainer, {
            AbilitySectionType = "Primary",
            Position = UDim2.new(1.2, 0, -1, 0)
        }) });

    if v80 then
        v38[v79 + 1] = v80;
    end;

    v36[#v36 + 1] = u4.createElement("Frame", v37, v38);

    return u4.createElement("ScreenGui", v35, v36);
end;

local v82 = v5.new(u4)(v81);

return {
    HotbarApp = v6.connect(function(p83, p84) -- Line: 475
        local v85 = {};

        for i, v in p84 do
            v85[i] = v;
        end;

        v85.store = p83;
        v85.QueueType = p83.Game.queueType;

        return v85;
    end)(v82)
};