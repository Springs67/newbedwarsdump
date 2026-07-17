-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types");
local ConsumableCategory = v3.ConsumableCategory;
local ConsumableStatus = v3.ConsumableStatus;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local getKitRentalBedCoinProductId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitRentalBedCoinProductId;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "KitRentalController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 29
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p6);
    p6.Name = "KitRentalController";
    p6.rentKitRemote = default.Client:Get("RentKit");
end;

function u4.KnitStart(p7) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.rentKit(p8, p9) -- Line: 37
    return p8.rentKitRemote:CallServer(p9);
end;

function u4.getEligibleRentalPass(p10, u11) -- Line: 40
    -- upvalues: KnitClient2 (copy), ConsumableCategory (copy), getConsumableMeta (copy)
    local function _(p12) -- Line: 42
        -- upvalues: getConsumableMeta (ref), ConsumableCategory (ref), u11 (copy)
        local _ = p12[1];
        local v13 = getConsumableMeta(p12[2].consumable);

        if v13.category == ConsumableCategory.KIT_RENTAL then
            return table.find(v13.rentableKits, u11) ~= nil;
        end;
    end;

    local v14 = 0;
    local v15 = {};

    for i, v in KnitClient2.Controllers.ConsumableController:getConsumablesOfCategoryFromInv(ConsumableCategory.KIT_RENTAL) do
        local _ = i - 1;
        local _ = v[1];
        local v16 = getConsumableMeta(v[2].consumable);
        local v17;

        if v16.category == ConsumableCategory.KIT_RENTAL then
            v17 = table.find(v16.rentableKits, u11) ~= nil;
        else
            v17 = nil;
        end;

        if v17 == true then
            v14 = v14 + 1;
            v15[v14] = v;
        end;
    end;

    table.sort(v15, function(p18, p19) -- Line: 62
        -- upvalues: getConsumableMeta (ref), ConsumableCategory (ref)
        local _ = p18[1];
        local _ = p19[1];
        local v20 = p19[2];
        local v21 = getConsumableMeta(p18[2].consumable);
        local v22 = getConsumableMeta(v20.consumable);

        if v21.category == ConsumableCategory.KIT_RENTAL and v22.category == ConsumableCategory.KIT_RENTAL then
            return #v21.rentableKits < #v22.rentableKits;
        end;

        return false;
    end);

    if #v15 ~= 0 then
        return v15[1][2];
    end;
end;

function u4.isKitRented(p23, u24) -- Line: 80
    -- upvalues: u2 (copy), ClientStore (copy), ConsumableStatus (copy)
    local function _(p25) -- Line: 82
        -- upvalues: ConsumableStatus (ref), u24 (copy)
        local _ = p25[1];
        local v26 = p25[2];
        local v27 = v26.status == ConsumableStatus.ACTIVE;

        if v27 then
            local extraData = v26.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v27 = extraData == u24;
        end;

        return v27;
    end;

    local v28 = nil;

    for i, v in u2.entries(ClientStore:getState().Consumable.record) do
        local _ = i - 1;
        local _ = v[1];
        local v29 = v[2];
        local v30 = v29.status == ConsumableStatus.ACTIVE;

        if v30 then
            local extraData = v29.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v30 = extraData == u24;
        end;

        if v30 == true then
            v28 = v;
            break;
        end;
    end;

    if v28 ~= nil then
        v28 = v28[2];
    end;

    return v28 ~= nil;
end;

function u4.getRentedKit(p31, u32) -- Line: 110
    -- upvalues: u2 (copy), ClientStore (copy), ConsumableStatus (copy)
    local function _(p33) -- Line: 112
        -- upvalues: ConsumableStatus (ref), u32 (copy)
        local _ = p33[1];
        local v34 = p33[2];
        local v35 = v34.status == ConsumableStatus.ACTIVE;

        if v35 then
            local extraData = v34.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v35 = extraData == u32;
        end;

        return v35;
    end;

    local v36 = nil;

    for i, v in u2.entries(ClientStore:getState().Consumable.record) do
        local _ = i - 1;
        local _ = v[1];
        local v37 = v[2];
        local v38 = v37.status == ConsumableStatus.ACTIVE;

        if v38 then
            local extraData = v37.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v38 = extraData == u32;
        end;

        if v38 == true then
            v36 = v;
            break;
        end;
    end;

    if v36 ~= nil then
        v36 = v36[2];
    end;

    return v36;
end;

function u4.promptBedCoinPurchaseKitRental(u39, u40) -- Line: 140
    -- upvalues: getKitRentalBedCoinProductId (copy), KnitClient2 (copy)
    local v41 = getKitRentalBedCoinProductId(u40);

    if v41 == nil then
        return false;
    end;

    KnitClient2.Controllers.BedCoinProductPurchaseController:purchase({
        productId = v41,
        selectedKit = u40
    }, function() -- Line: 150
        -- upvalues: u39 (copy), u40 (copy)
        u39:rentKit(u40);
    end);

    return true;
end;

KnitClient.CreateController(u4.new());

return nil;