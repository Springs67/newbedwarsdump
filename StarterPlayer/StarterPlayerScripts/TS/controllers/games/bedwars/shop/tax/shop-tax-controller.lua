local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ShopTaxController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4.constructor(p10)
    p10.Name = "ShopTaxController"
    p10.taxStateUpdateEvent = u6.Client:Get("UpdateShopTaxState")
    p10.hasTax = false
    p10.taxedItems = {}
    p10.addedTaxMap = {}
end
function u7.KnitStart(u11) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
    --]]
    u4.KnitStart(u11)
    u11.taxStateUpdateEvent:Connect(function(p12) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
            [3] = u5
        --]]
        u11.hasTax = p12.taxState
        u11.addedTaxMap = p12.addedTax
        u11.taxedItems = u3.keys(p12.addedTax)
        u5:dispatch({
            ["type"] = "IncrementTaxState"
        })
    end)
end
function u7.getAddedTax(p13, p14) --[[ Line: 41 ]]
    local v15 = p13.addedTaxMap[p14]
    return v15 == nil and 0 or v15
end
function u7.getTaxedItems(p16) --[[ Line: 50 ]]
    return p16.taxedItems
end
function u7.isTaxed(p17) --[[ Line: 53 ]]
    return p17.hasTax
end
v2.CreateController(u7.new())
return nil