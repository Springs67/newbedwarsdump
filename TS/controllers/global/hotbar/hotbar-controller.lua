-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GamepadAction = v1.GamepadAction;
local WatchPlayer = v1.WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AppConfiguration = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local HotbarApp = RuntimeLib.import(script, script.Parent, "ui", "hotbar-app").HotbarApp;
local u6 = { "HotbarSlot1", "HotbarSlot2", "HotbarSlot3", "HotbarSlot4", "HotbarSlot5", "HotbarSlot6", "HotbarSlot7", "HotbarSlot8", "HotbarSlot9" };
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "HotbarController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 34
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 38
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p9);
    p9.Name = "HotbarController";
    p9.maid = u3.new();
    p9.hotbarHiddenIds = {};
end;

function u7.KnitStart(u10) -- Line: 44
    -- upvalues: WatchPlayer (copy), Players (copy), Flamework (copy), AppConfiguration (copy), ClientStore (copy), u6 (copy), ContextActionService (copy), GamepadAction (copy), EntityUtil (copy), RuntimeLib (copy), u2 (copy), ArmorSlot (copy), ClientSyncEvents (copy)
    WatchPlayer(function(p11) -- Line: 46
        -- upvalues: Players (ref), u10 (copy)
        if p11.UserId == Players.LocalPlayer.UserId then
            u10:mountHotbar();
        end;
    end);
    Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 52
        -- upvalues: u10 (copy)
        u10:mountHotbar();
    end);

    local function v19(p12) -- Line: 56
        -- upvalues: Flamework (ref), AppConfiguration (ref), ClientStore (ref), u10 (copy)
        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            action = p12,
            actionId = "keyboard-" .. p12,

            boundFunction = function(p13, p14, p15) -- Line: 60, Name: boundFunction
                -- upvalues: Flamework (ref), AppConfiguration (ref), ClientStore (ref)
                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(AppConfiguration.INVENTORY) then
                    return Enum.ContextActionResult.Pass;
                end;

                if p14 == Enum.UserInputState.Begin then
                    local v16 = string.split(p13, "HotbarSlot")[2];
                    local v17 = tonumber(v16);
                    ClientStore:dispatch({
                        type = "InventorySelectHotbarSlot",
                        slot = (v17 == nil and 1 or v17) - 1
                    });

                    return Enum.ContextActionResult.Sink;
                end;
            end,

            priority = Enum.ContextActionPriority.High.Value
        });
        u10.maid:GiveTask(v18);
    end;

    for i, v in u6 do
        v19(v, i - 1, u6);
    end;

    ContextActionService:BindAction("hotbar-gamepad", function(p20, p21, p22) -- Line: 84
        -- upvalues: ClientStore (ref), GamepadAction (ref)
        if p21 == Enum.UserInputState.Begin then
            local hotbarSlot = ClientStore:getState().Inventory.observedInventory.hotbarSlot;

            if p22.KeyCode == GamepadAction.HotbarRight then
                hotbarSlot = math.clamp(hotbarSlot + 1, 0, 8);
            elseif p22.KeyCode == GamepadAction.HotbarLeft then
                hotbarSlot = math.clamp(hotbarSlot - 1, 0, 8);
            end;

            ClientStore:dispatch({
                type = "InventorySelectHotbarSlot",
                slot = hotbarSlot
            });
        end;
    end, false, GamepadAction.HotbarRight, GamepadAction.HotbarLeft);
    u10.maid:GiveTask(function() -- Line: 98
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("hotbar-gamepad");
    end);

    local function u26(p23) -- Line: 102
        -- upvalues: Players (ref), EntityUtil (ref)
        if p23.Inventory.observedPlayer == Players.LocalPlayer and p23.Inventory.observedPlayer.Character then
            local v24 = EntityUtil:getEntity(p23.Inventory.observedPlayer);

            if v24 and v24:isAlive() then
                local v25 = p23.Inventory.observedInventory.hotbar[p23.Inventory.observedInventory.hotbarSlot + 1];

                if v25.item then
                    v24:equipItem(v25.item.tool);

                    return;
                end;

                v24:unequipItemInHand();
            end;
        end;
    end;

    local function u34(p27, u28) -- Line: 117
        -- upvalues: Players (ref), EntityUtil (ref), RuntimeLib (ref)
        if p27.Inventory.observedPlayer == Players.LocalPlayer and p27.Inventory.observedPlayer.Character then
            local u29 = EntityUtil:getEntity(p27.Inventory.observedPlayer);

            if u29 and u29:isAlive() then
                local u30 = p27.Inventory.observedInventory.inventory.armor[u28 + 1];

                if u30 ~= "empty" then
                    RuntimeLib.Promise.defer(function() -- Line: 124
                        -- upvalues: u29 (copy), u30 (copy), u28 (copy)
                        local v31 = u29:getPlayer();

                        if v31 ~= nil then
                            v31 = v31:GetAttribute("ArmorTrimType");
                        end;

                        local v32 = u29:getPlayer();

                        if v32 ~= nil then
                            v32 = v32:GetAttribute("ArmorTrimColor");
                        end;

                        local v33 = u29:getPlayer();

                        if v33 ~= nil then
                            v33 = v33:GetAttribute("ArmorTrimEffectRank");
                        end;

                        u29:equipArmorItem(u30.tool, u28, v31 and (v32 ~= nil and v33 ~= nil) and {
                            type = v31,
                            color = v32,
                            effectRank = v33
                        } or nil);
                    end);

                    return;
                end;

                RuntimeLib.Promise.defer(function() -- Line: 148
                    -- upvalues: u29 (copy), u28 (copy)
                    u29:unequipArmorSlot(u28);
                end);
            end;
        end;
    end;

    local function u37(p35) -- Line: 156
        -- upvalues: Players (ref), EntityUtil (ref), RuntimeLib (ref)
        if p35.Inventory.observedPlayer == Players.LocalPlayer and p35.Inventory.observedPlayer.Character then
            local u36 = EntityUtil:getEntity(p35.Inventory.observedPlayer);

            if u36 and u36:isAlive() then
                local backpack = p35.Inventory.observedInventory.inventory.backpack;

                if backpack then
                    RuntimeLib.Promise.defer(function() -- Line: 163
                        -- upvalues: u36 (copy), backpack (copy)
                        u36:equipBackpack(backpack.tool);
                    end);

                    return;
                end;

                RuntimeLib.Promise.defer(function() -- Line: 167
                    -- upvalues: u36 (copy)
                    u36:unequipBackpackSlot();
                end);
            end;
        end;
    end;

    ClientStore.changed:connect(function(p38, p39) -- Line: 175
        -- upvalues: u26 (copy), u2 (ref), ArmorSlot (ref), u34 (copy), u37 (copy), ClientSyncEvents (ref), Players (ref)
        local v40, v41;

        if p38.Inventory.observedInventory.inventory.hand == p39.Inventory.observedInventory.inventory.hand then
            v40 = false;
            v41 = 0;
        else
            u26(p38);
            v40 = false;
            v41 = 0;
        end;

        while true do
            if v40 then
                v41 = v41 + 1;
            else
                v40 = true;
            end;

            if v41 >= #u2.values(ArmorSlot) then
                if p38.Inventory.observedInventory.inventory.backpack ~= p39.Inventory.observedInventory.inventory.backpack then
                    u37(p38);
                    local backpack = p38.Inventory.observedInventory.inventory.backpack;

                    if backpack ~= nil then
                        backpack = backpack.itemType;
                    end;

                    ClientSyncEvents.BackpackEquipEvent:fire(backpack, Players.LocalPlayer, p38.Inventory.observedInventory.inventory.backpack);
                end;

                return;
            end;

            if p38.Inventory.observedInventory.inventory.armor[v41 + 1] ~= p39.Inventory.observedInventory.inventory.armor[v41 + 1] then
                u34(p38, v41);
            end;
        end;
    end);
    Players.LocalPlayer.CharacterAdded:Connect(function(p42) -- Line: 206
        -- upvalues: u26 (copy), ClientStore (ref), u2 (ref), ArmorSlot (ref), u34 (copy)
        p42:WaitForChild("HandInvItem", 1);
        u26(ClientStore:getState());
        local v43 = false;
        local v44 = 0;

        while true do
            if v43 then
                v44 = v44 + 1;
            else
                v43 = true;
            end;

            if v44 >= #u2.values(ArmorSlot) then
                return;
            end;

            u34(ClientStore:getState(), v44);
        end;
    end);

    if Players.LocalPlayer.Character then
        task.wait(0.2);
        u26(ClientStore:getState());
        local v45 = false;
        local v46 = 0;

        while true do
            if true then
                if v45 then
                    v46 = v46 + 1;
                else
                    v45 = true;
                end;
            end;

            if v46 >= #u2.values(ArmorSlot) then
                break;
            end;

            u34(ClientStore:getState(), v46);
        end;
    end;
end;

function u7.mountHotbar(p47) -- Line: 245
    -- upvalues: CreateRoduxApp (copy), HotbarApp (copy)
    p47:unmountHotbar();
    p47.hotbar = CreateRoduxApp("hotbar", HotbarApp);
end;

function u7.unmountHotbar(p48) -- Line: 249
    -- upvalues: u4 (copy)
    if p48.hotbar then
        u4.unmount(p48.hotbar);
        p48.hotbar = nil;
    end;
end;

function u7.selectHotbarItemGroup(p49, p50) -- Line: 255
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "InventorySelectHotbarItemGroup",
        itemGroup = p50
    });
end;

function u7.hideHotbar(p51, p52) -- Line: 261
    table.insert(p51.hotbarHiddenIds, p52);
    p51:unmountHotbar();
end;

function u7.unhideHotbar(p53, p54) -- Line: 267
    local v55 = (table.find(p53.hotbarHiddenIds, p54) or 0) - 1;

    if v55 ~= -1 then
        table.remove(p53.hotbarHiddenIds, v55 + 1);
    end;

    if #p53.hotbarHiddenIds == 0 then
        p53:mountHotbar();
    end;
end;

return {
    HotbarController = KnitClient.CreateController(u7.new())
};