local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u10 = v9.ConsumableCategory
local u11 = v9.ConsumableStatus
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitRentalBedCoinProductId
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "KitRentalController"
    end,
    ["__index"] = u6
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
    --]]
    u6.constructor(p17)
    p17.Name = "KitRentalController"
    p17.rentKitRemote = u12.Client:Get("RentKit")
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p18)
end
function u14.rentKit(p19, p20) --[[ Line: 37 ]]
    return p19.rentKitRemote:CallServer(p20)
end
function u14.getEligibleRentalPass(_, p21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u8
    --]]
    local v22 = 0
    local v23 = {}
    for v24, v25 in u4.Controllers.ConsumableController:getConsumablesOfCategoryFromInv(u10.KIT_RENTAL) do
        local _ = v24 - 1
        local _ = v25[1]
        local v26 = u8(v25[2].consumable)
        local v27
        if v26.category == u10.KIT_RENTAL then
            local v28 = v26.rentableKits
            v27 = table.find(v28, p21) ~= nil
        else
            v27 = nil
        end
        if v27 == true then
            v22 = v22 + 1
            v23[v22] = v25
        end
    end
    local function v35(p29, p30) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
        --]]
        local _ = p29[1]
        local v31 = p29[2]
        local _ = p30[1]
        local v32 = p30[2]
        local v33 = u8(v31.consumable)
        local v34 = u8(v32.consumable)
        if v33.category == u10.KIT_RENTAL and v34.category == u10.KIT_RENTAL then
            return #v33.rentableKits < #v34.rentableKits
        else
            return false
        end
    end
    table.sort(v23, v35)
    if #v23 ~= 0 then
        return v23[1][2]
    end
end
function u14.isKitRented(_, p36) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u11
    --]]
    local v37 = nil
    for v38, v39 in u5.entries(u7:getState().Consumable.record) do
        local _ = v38 - 1
        local _ = v39[1]
        local v40 = v39[2]
        local v41 = v40.status == u11.ACTIVE
        if v41 then
            local v42 = v40.extraData
            if v42 ~= nil then
                v42 = v42.rentedKit
            end
            v41 = v42 == p36
        end
        if v41 == true then
            v37 = v39
            break
        end
    end
    if v37 ~= nil then
        v37 = v37[2]
    end
    return v37 ~= nil
end
function u14.getRentedKit(_, p43) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u11
    --]]
    local v44 = nil
    for v45, v46 in u5.entries(u7:getState().Consumable.record) do
        local _ = v45 - 1
        local _ = v46[1]
        local v47 = v46[2]
        local v48 = v47.status == u11.ACTIVE
        if v48 then
            local v49 = v47.extraData
            if v49 ~= nil then
                v49 = v49.rentedKit
            end
            v48 = v49 == p43
        end
        if v48 == true then
            v44 = v46
            break
        end
    end
    if v44 ~= nil then
        v44 = v44[2]
    end
    return v44
end
function u14.promptBedCoinPurchaseKitRental(u50, u51) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
    --]]
    local v52 = u13(u51)
    if v52 == nil then
        return false
    end
    u4.Controllers.BedCoinProductPurchaseController:purchase({
        ["productId"] = v52,
        ["selectedKit"] = u51
    }, function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u51
        --]]
        u50:rentKit(u51)
    end)
    return true
end
v3.CreateController(u14.new())
return nil