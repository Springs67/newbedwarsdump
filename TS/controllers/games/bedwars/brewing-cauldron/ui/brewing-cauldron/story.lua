-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CraftingStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BrewingCauldron = RuntimeLib.import(script, script.Parent, "brewing-cauldron").BrewingCauldron;

return function(p2) -- Line: 7
    -- upvalues: ItemType (copy), u1 (copy), BrewingCauldron (copy), CraftingStatus (copy)
    local u3 = u1.mount(u1.createElement(BrewingCauldron, {
        Text = "Ingredients",
        timeToCraft = 3,
        Inventory = { ItemType.WOOL_PINK, ItemType.WOOL_PINK },
        CraftingStatus = CraftingStatus.crafting
    }), p2);

    return function() -- Line: 15
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;