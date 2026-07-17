-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockPlacer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "placement", "block-placer").BlockPlacer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BlockPlacementController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p3);
    p3.Name = "BlockPlacementController";
    p3.disabled = false;
end;

function u1.KnitStart(p4) -- Line: 31
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p4);
end;

function u1.isRelevantItem(p5, p6) -- Line: 34
    return p5:getPlacedItemType(p6.itemType) ~= nil;
end;

function u1.onEnable(p7, p8) -- Line: 37
    -- upvalues: BlockPlacer (copy), ClientBlockEngine (copy), KnitClient (copy), AnimationType (copy)
    if p7.disabled then
        return nil;
    end;

    if p7.blockPlacer then
        p7.blockPlacer:disable();
    end;

    p7.blockPlacer = BlockPlacer.new(ClientBlockEngine, p7:getPlacedItemType(p8.itemType));
    p7.blockPlacer:enable();
    p7.blockPlacer.onPlace:Connect(function() -- Line: 46
        -- upvalues: KnitClient (ref), AnimationType (ref)
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    end);
end;

function u1.onDisable(p9) -- Line: 74
    if p9.blockPlacer then
        p9.blockPlacer:disable();
        p9.blockPlacer = nil;
    end;
end;

function u1.getBlockPlacer(p10) -- Line: 80
    return p10.blockPlacer;
end;

function u1.getPlacedItemType(p11, p12) -- Line: 83
    -- upvalues: getItemMeta (copy)
    local v13 = getItemMeta(p12);

    if v13 then
        if v13.block then
            return p12;
        end;

        if v13.placesBlock then
            return v13.placesBlock.blockType;
        end;
    end;

    return nil;
end;

function u1.disableBlockPlacer(p14) -- Line: 95
    p14.disabled = true;
    p14:onDisable();
end;

function u1.enableBlockPlacer(p15) -- Line: 99
    -- upvalues: InventoryUtil (copy), Players (copy)
    p15.disabled = false;
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand and p15:isRelevantItem(hand) then
        p15:onEnable(hand);
    end;
end;

return {
    BlockPlacementController = KnitClient.CreateController(u1.new())
};