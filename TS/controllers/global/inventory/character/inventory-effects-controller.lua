-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "InventoryEffectsController";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
end;

function u2.onStart(u5) -- Line: 31
    -- upvalues: WatchCharacter (copy), EntityUtil (copy), ClientSyncEvents (copy), WatchPlayerCharacter (copy), Players (copy), GameSound (copy), AnimationType (copy), getItemMeta (copy), SoundManager (copy), GameAnimationUtil (copy), KnitClient (copy)
    WatchCharacter(function(p6, p7) -- Line: 32
        -- upvalues: EntityUtil (ref), ClientSyncEvents (ref)
        local u8 = EntityUtil:getEntity(p7);

        if not u8 then
            return;
        end;

        task.spawn(function() -- Line: 35
            -- upvalues: u8 (copy), ClientSyncEvents (ref)
            u8:getInstance():WaitForChild("HandInvItem");
            u8:getInstance().HandInvItem.Changed:Connect(function(p9) -- Line: 37
                -- upvalues: ClientSyncEvents (ref), u8 (ref)
                ClientSyncEvents.EntityChangeHeldItem:fire(u8, p9);
            end);
        end);
        local u10 = 0;
        local v11 = false;
        local v12 = { "ArmorInvItem_0", "ArmorInvItem_1", "ArmorInvItem_2" };

        while true do
            if v11 then
                u10 = u10 + 1;
            else
                v11 = true;
            end;

            if u10 >= #v12 then
                return;
            end;

            local u13 = v12[u10 + 1];
            task.spawn(function() -- Line: 56
                -- upvalues: u8 (copy), u13 (copy), ClientSyncEvents (ref), u10 (ref)
                u8:getInstance():WaitForChild(u13).Changed:Connect(function(p14) -- Line: 58
                    -- upvalues: ClientSyncEvents (ref), u8 (ref), u10 (ref)
                    ClientSyncEvents.EntityChangeArmorSlotItem:fire(u8, p14, u10);
                end);
            end);
            u10 = u10;
        end;
    end);
    WatchPlayerCharacter(Players.LocalPlayer, function(p15) -- Line: 67
        -- upvalues: EntityUtil (ref), GameSound (ref), AnimationType (ref), getItemMeta (ref), u5 (copy), SoundManager (ref), GameAnimationUtil (ref), Players (ref), KnitClient (ref)
        local u16 = EntityUtil:getLocalPlayerEntity();

        if not u16 then
            return nil;
        end;

        local u17 = nil;
        u16:getInstance():WaitForChild("HandInvItem");
        u16:getInstance().HandInvItem.Changed:Connect(function() -- Line: 74
            -- upvalues: u16 (copy), u17 (ref), GameSound (ref), AnimationType (ref), getItemMeta (ref), u5 (ref), SoundManager (ref), GameAnimationUtil (ref), Players (ref), KnitClient (ref)
            local Value = u16:getInstance().HandInvItem.Value;

            if Value == nil then
                u17 = nil;

                return nil;
            end;

            if Value == u17 then
                return nil;
            end;

            u17 = Value;
            local EQUIP_DEFAULT = GameSound.EQUIP_DEFAULT;
            local EQUIP_1 = AnimationType.EQUIP_1;
            local v18 = getItemMeta(Value.Name);

            if v18.sword then
                EQUIP_DEFAULT = GameSound.EQUIP_SWORD;
            elseif not v18.breakBlock and (not v18.block and v18.projectileSource) then
                EQUIP_DEFAULT = GameSound.EQUIP_BOW;
            end;

            if u5.activeSound then
                u5.activeSound:Stop();
            end;

            u5.activeSound = SoundManager:playSound(EQUIP_DEFAULT);
            GameAnimationUtil:playAnimation(Players.LocalPlayer, EQUIP_1, {
                fadeInTime = 0
            });

            if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                u5:setHandItemEffectsVisible(false);
            end;
        end);
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p19) -- Line: 111
        -- upvalues: u5 (copy)
        if p19 == 0 then
            u5:setHandItemEffectsVisible(false);

            return;
        end;

        u5:setHandItemEffectsVisible(true);
    end);
end;

function u2.setHandItemEffectsVisible(p20, p21) -- Line: 120
    -- upvalues: EntityUtil (copy), Players (copy)
    local v22 = EntityUtil:getEntity(Players.LocalPlayer);

    if v22 ~= nil then
        v22 = v22:getHandItemInstanceFromCharacter();
    end;

    if not v22 then
        return nil;
    end;

    if p21 then
        local v23 = v22:GetDescendants();

        local function v26(p24) -- Line: 133
            if p24:IsA("Beam") or (p24:IsA("ParticleEmitter") or p24:IsA("Trail")) then
                local v25 = p24:GetAttribute("CustomizedVisualMode");

                if v25 ~= 0 and (v25 == v25 and (v25 ~= "" and v25)) then
                    return nil;
                end;

                p24.Enabled = true;
            end;
        end;

        for i, v in v23 do
            v26(v, i - 1, v23);
        end;

        return;
    end;

    local v27 = v22:GetDescendants();

    local function v30(p28) -- Line: 147
        if p28:IsA("Beam") or (p28:IsA("ParticleEmitter") or p28:IsA("Trail")) then
            local v29 = p28:GetAttribute("CustomizedVisualMode");

            if v29 ~= 0 and (v29 == v29 and (v29 ~= "" and v29)) then
                return nil;
            end;

            p28.Enabled = false;
        end;
    end;

    for i, v in v27 do
        v30(v, i - 1, v27);
    end;
end;

Reflect.defineMetadata(u2, "identifier", "client/controllers/global/inventory/character/inventory-effects-controller@InventoryEffectsController");
Reflect.defineMetadata(u2, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u2, "$:flamework@Controller", Controller, { {} });

return {
    InventoryEffectsController = u2
};