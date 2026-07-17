-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ShopTaxController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p4);
    p4.Name = "ShopTaxController";
    p4.taxStateUpdateEvent = default.Client:Get("UpdateShopTaxState");
    p4.hasTax = false;
    p4.taxedItems = {};
    p4.addedTaxMap = {};
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), u1 (copy), ClientStore (copy)
    KnitController.KnitStart(u5);
    u5.taxStateUpdateEvent:Connect(function(p6) -- Line: 32
        -- upvalues: u5 (copy), u1 (ref), ClientStore (ref)
        u5.hasTax = p6.taxState;
        u5.addedTaxMap = p6.addedTax;
        u5.taxedItems = u1.keys(p6.addedTax);
        ClientStore:dispatch({
            type = "IncrementTaxState"
        });
    end);
end;

function u2.getAddedTax(p7, p8) -- Line: 41
    local v9 = p7.addedTaxMap[p8];

    return v9 == nil and 0 or v9;
end;

function u2.getTaxedItems(p10) -- Line: 50
    return p10.taxedItems;
end;

function u2.isTaxed(p11) -- Line: 53
    return p11.hasTax;
end;

KnitClient.CreateController(u2.new());

return nil;