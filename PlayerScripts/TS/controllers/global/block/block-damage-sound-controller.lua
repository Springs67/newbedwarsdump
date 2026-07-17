-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BreakBlockDamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType;
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "BlockDamageSoundController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BlockDamageSoundController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: KnitController (copy), BlockEngineClientEvents (copy), InventoryUtil (copy), Players (copy), getItemSkinMeta (copy), getItemMeta (copy), BreakBlockDamageType (copy), SoundManager (copy), RandomUtil (copy)
    KnitController.KnitStart(p5);
    BlockEngineClientEvents.DamageBlockEffect:connect(function(p6) -- Line: 35
        -- upvalues: InventoryUtil (ref), Players (ref), getItemSkinMeta (ref), getItemMeta (ref), BreakBlockDamageType (ref), SoundManager (ref), RandomUtil (ref)
        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemSkin;
        end;

        if hand == "" or not hand then
            return nil;
        end;

        local v7 = getItemSkinMeta(hand);

        if not v7.blockHitSoundOverride then
            return nil;
        end;

        local v8 = getItemMeta(p6.blockType);

        if v8 ~= nil then
            v8 = v8.block;

            if v8 ~= nil then
                v8 = v8.breakType;
            end;
        end;

        if not v8 then
            return nil;
        end;

        if v8 == BreakBlockDamageType.STONE then
            local v9 = v7.blockHitSoundOverride[v8];

            if v9 then
                p6.sound = SoundManager:createSound(RandomUtil.fromList(unpack(v9)));
            end;
        elseif v8 == BreakBlockDamageType.WOOD then
            local v10 = v7.blockHitSoundOverride[v8];

            if v10 then
                p6.sound = SoundManager:createSound(RandomUtil.fromList(unpack(v10)));
            end;
        else
            local v11 = v8 == BreakBlockDamageType.WOOL and v7.blockHitSoundOverride[v8];

            if v11 then
                p6.sound = SoundManager:createSound(RandomUtil.fromList(unpack(v11)));
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;