-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local TravelingMerchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-util").TravelingMerchantUtil;
local TravelingMerchantItemPopup = RuntimeLib.import(script, script.Parent, "traveling-merchant-item").TravelingMerchantItemPopup;

return function(p3) -- Line: 9
    -- upvalues: u1 (copy), Workspace (copy), ItemType (copy), TravelingMerchantUtil (copy), u2 (copy), TravelingMerchantItemPopup (copy)
    local u4 = u1("MeshPart", {
        Position = Vector3.new(0, 0, 0),
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        Parent = Workspace
    });
    local v5 = TravelingMerchantUtil:getShopItemByItemType(ItemType.APPLE);
    local u6 = u2.mount(u2.createElement(TravelingMerchantItemPopup, {
        merchantItemInstance = u4,
        merchantItem = v5
    }), p3);

    return function() -- Line: 27
        -- upvalues: u2 (ref), u6 (copy), u4 (copy)
        u2.unmount(u6);
        u4:Destroy();
    end;
end;