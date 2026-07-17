-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SpiritAssassinMasterEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SpiritAssassinMasterEmoteController";
end;

function u2.KnitStart(p5) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), Players (copy), EntityUtil (copy), BedwarsKitSkin (copy), BedwarsKitSkinMeta (copy), GameAnimationUtil (copy), AnimationType (copy), InventoryUtil (copy), ItemUtil (copy), ItemType (copy), KnitClient2 (copy), WeldUtil (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local SPIRIT_ASSASSIN_TOP_ASSASSIN = EmoteType.SPIRIT_ASSASSIN_TOP_ASSASSIN;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 45, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 51
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 55
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, p12, p13, u14) -- Line: 58
        -- upvalues: Players (ref), EntityUtil (ref), BedwarsKitSkin (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), GameAnimationUtil (ref), AnimationType (ref), InventoryUtil (ref), ItemUtil (ref), ItemType (ref), KnitClient2 (ref), WeldUtil (ref)
        local u15 = Players:GetPlayerByUserId(p11);

        if not u15 then
            return nil;
        end;

        local Animator = p12.Humanoid.Animator;
        local u16 = EntityUtil:getEntity(u15);
        local v17;

        if u16 == nil then
            v17 = u16;
        else
            v17 = u16:getInstance();
        end;

        local DEFAULT = BedwarsKitSkin.DEFAULT;

        if v17 then
            DEFAULT = KnitClient.Controllers.KitController:getKitSkin(v17);
        end;

        local spiritAssassin = BedwarsKitSkinMeta[DEFAULT].spiritAssassin;
        u14:GiveTask((Animator.AnimationPlayed:Connect(function(p18) -- Line: 75
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), InventoryUtil (ref), u15 (copy), ItemUtil (ref), ItemType (ref), spiritAssassin (copy), u16 (copy), Players (ref), KnitClient2 (ref), WeldUtil (ref), u14 (copy)
            local Animation = p18.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            if Animation == GameAnimationUtil:getAssetId(AnimationType.SPIRIT_ASSASSIN_SPIN_EMOTE) then
                local hand = InventoryUtil.getInventory(u15).hand;

                if hand ~= nil then
                    hand = hand.itemType;
                end;

                local v19 = spiritAssassin;

                if v19 ~= nil then
                    v19 = v19.dagger;
                end;

                local u20 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER, 1, v19);
                local v21 = spiritAssassin;

                if v21 ~= nil then
                    v21 = v21.daggerLeft;
                end;

                local u22 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER_LEFT, 1, v21);
                local v23 = spiritAssassin;

                if v23 ~= nil then
                    v23 = v23.dagger;
                end;

                local v24 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER, 1, v23);
                local v25 = u16;

                if v25 ~= nil then
                    local v26 = v25:getHandItemInstanceFromCharacter();

                    if v26 ~= nil then
                        v26:Destroy();
                    end;
                end;

                if u15 == Players.LocalPlayer then
                    KnitClient2.Controllers.ViewmodelController:setHeldItem(v24);
                end;

                local v27 = u16;

                if v27 ~= nil then
                    local v28 = v27:getHumanoid();

                    if v28 ~= nil then
                        v28:AddAccessory(u22);
                    end;
                end;

                local v29 = u16;

                if v29 ~= nil then
                    local v30 = v29:getHumanoid();

                    if v30 ~= nil then
                        v30:AddAccessory(u20);
                    end;
                end;

                u20.Destroying:Connect(function() -- Line: 131
                    -- upvalues: u22 (copy)
                    local v31 = u22;

                    if v31 ~= nil then
                        v31:Destroy();
                    end;
                end);
                u22.Destroying:Connect(function() -- Line: 137
                    -- upvalues: u20 (copy)
                    local v32 = u20;

                    if v32 ~= nil then
                        v32:Destroy();
                    end;
                end);
                WeldUtil:weldCharacterAccessories(u15.Character);
                u14:GiveTask(function() -- Line: 144
                    -- upvalues: u15 (ref), Players (ref), InventoryUtil (ref), u20 (copy), u22 (copy), ItemUtil (ref), KnitClient2 (ref), WeldUtil (ref)
                    if u15 == Players.LocalPlayer then
                        local hand2 = InventoryUtil.getInventory(u15).hand;

                        if hand2 ~= nil then
                            hand2 = hand2.itemType;
                        end;

                        local v33 = u20;

                        if v33 ~= nil then
                            v33:Destroy();
                        end;

                        local v34 = u22;

                        if v34 ~= nil then
                            v34:Destroy();
                        end;

                        if not hand2 then
                            return nil;
                        end;

                        local v35 = ItemUtil.createItemInstance(hand2);
                        KnitClient2.Controllers.ViewmodelController:setHeldItem(v35);
                        WeldUtil:weldCharacterAccessories(u15.Character);
                    end;
                end);
            end;
        end)));
    end;

    function u7.onDisable(p36, p37, p38, p39) -- Line: 171
    end;

    EmoteHandlerController:registerHandler(SPIRIT_ASSASSIN_TOP_ASSASSIN, u7);
end;

KnitClient.CreateController(u2.new());

return nil;