-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local EnchantPopUp = RuntimeLib.import(script, script.Parent, "enchant-pop-up").EnchantPopUp;

return function(p2) -- Line: 7
    -- upvalues: u1 (copy), EnchantPopUp (copy), BedwarsImageId (copy), ItemType (copy)
    local u3 = u1.mount(u1.createElement(EnchantPopUp, {
        EnchantName = "Static",
        EnchantImage = BedwarsImageId.STATIC_ENCHANT,
        EnchantTableType = ItemType.ENCHANT_TABLE
    }), p2);

    return function() -- Line: 13
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;