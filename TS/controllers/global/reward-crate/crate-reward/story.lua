-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CrateItemRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity;
local CrateRewardTitle = RuntimeLib.import(script, script.Parent, "crate-reward-title").CrateRewardTitle;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), CrateRewardTitle (copy), CrateItemRarity (copy)
    local u3 = u1.mount(u1.createElement(CrateRewardTitle, {
        itemDisplayName = "Wood Sword",
        itemRarity = CrateItemRarity.THREE_STAR
    }), p2);

    return function() -- Line: 11
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;