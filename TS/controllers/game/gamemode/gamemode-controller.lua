-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v3.ContextActionService;
local Players = v3.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "creative-id-billboard-component").default;
local GamemodeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-type").GamemodeType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CreativeInventory = RuntimeLib.import(script, script.Parent, "creative", "ui", "creative-inventory").CreativeInventory;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "GamemodeController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 34
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 38
    -- upvalues: KnitController (copy), default2 (copy), GamemodeType (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "GamemodeController";
    p6.gamemodeRemotes = default2.Client:GetNamespace("Gamemode");
    p6.currGamemode = GamemodeType.PVP;
    p6.creativeAbilityMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 45
    -- upvalues: KnitController (copy), GamemodeType (copy), ContextActionService (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ComponentUtil (copy), default (copy), ClientSyncEvents (copy), Players (copy), ClientBlockEngine (copy), BlockSelectorMode (copy), getItemMeta (copy)
    KnitController.KnitStart(u7);
    u7.gamemodeRemotes:OnEvent("GamemodeUpdate", function(p8) -- Line: 47
        -- upvalues: u7 (copy), GamemodeType (ref), ContextActionService (ref), Flamework (ref), AbilityId (ref), BedwarsImageId (ref), ComponentUtil (ref), default (ref)
        u7.currGamemode = p8.gamemode;

        if p8.gamemode ~= GamemodeType.CREATIVE then
            ContextActionService:UnbindAction("creative-inventory-toggle");
            u7.creativeAbilityMaid:DoCleaning();

            local function _(p9) -- Line: 80
                p9:removeBillboard();
            end;

            for i, v in ComponentUtil:getAllComponents(default) do
                local _ = i - 1;
                v:removeBillboard();
            end;

            return;
        end;

        ContextActionService:BindActionAtPriority("creative-inventory-toggle", function(p10, p11, p12) -- Line: 51
            -- upvalues: u7 (ref)
            if p11 == Enum.UserInputState.Begin then
                u7:toggleCreativeInventory();
            end;
        end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.C);
        local u13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BLOCK_PICKER, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.ORE_BLOCK
            }
        }):expect();
        u7.creativeAbilityMaid:GiveTask(function() -- Line: 63
            -- upvalues: u13 (copy)
            u13.Destroy();
        end);

        local function _(p14) -- Line: 69
            p14:displayBillboard();
        end;

        for i, v in ComponentUtil:getAllComponents(default) do
            local _ = i - 1;
            v:displayBillboard();
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p15) -- Line: 88
        -- upvalues: AbilityId (ref), Players (ref), ClientBlockEngine (ref), BlockSelectorMode (ref), getItemMeta (ref), u7 (copy), Flamework (ref)
        if p15.ability ~= AbilityId.BLOCK_PICKER then
            return nil;
        end;

        if p15.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local v16 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);

        if v16 ~= nil then
            v16 = v16.target;
        end;

        if not v16 then
            return nil;
        end;

        local Name = v16.blockInstance.Name;
        local v17 = getItemMeta(Name);

        if not (v17 and v17.block) then
            return nil;
        end;

        task.spawn(function() -- Line: 109
            -- upvalues: u7 (ref), Name (copy), Flamework (ref)
            if u7:requestCreativeItem(Name) then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Picked a block of <b>" .. Name .. "</b>."
                });
            end;
        end);
    end);
end;

function u4.toggleCreativeInventory(p18) -- Line: 119
    -- upvalues: GamemodeType (copy), Flamework (copy), BedwarsAppIds (copy), CreativeInventory (copy), UILayers (copy)
    if p18:getLocalPlayerGamemode() ~= GamemodeType.CREATIVE then
        return nil;
    end;

    local v19 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");

    if v19:isAppOpen("CreativeInventory") then
        v19:closeApp("CreativeInventory");

        return;
    end;

    v19:closeApp(BedwarsAppIds.INVENTORY);
    v19:openApp({
        appId = "CreativeInventory",
        app = CreativeInventory,
        layer = UILayers.MAIN
    }, {
        AppId = "CreativeInventory"
    });
end;

function u4.requestCreativeItem(p20, p21) -- Line: 137
    -- upvalues: GamemodeType (copy)
    if p20.currGamemode == GamemodeType.CREATIVE then
        return p20.gamemodeRemotes:Get("RequestCreativeItem"):CallServer(p21);
    end;

    return false;
end;

function u4.getLocalPlayerGamemode(p22) -- Line: 143
    return p22.currGamemode;
end;

function u4.isLocalPlayerInCreativeMode(p23) -- Line: 146
    -- upvalues: GamemodeType (copy)
    return p23.currGamemode == GamemodeType.CREATIVE;
end;

function u4.isLocalPlayerInPVPMode(p24) -- Line: 149
    -- upvalues: GamemodeType (copy)
    return p24.currGamemode == GamemodeType.PVP;
end;

KnitClient.CreateController(u4.new());

return nil;