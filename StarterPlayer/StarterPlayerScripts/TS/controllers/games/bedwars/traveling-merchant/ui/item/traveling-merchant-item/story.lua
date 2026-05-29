local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-util").TravelingMerchantUtil
local u7 = v1.import(script, script.Parent, "traveling-merchant-item").TravelingMerchantItemPopup
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u5
        [4] = u6
        [5] = u3
        [6] = u7
    --]]
    local u9 = u2("MeshPart", {
        ["Position"] = Vector3.new(0, 0, 0),
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["Parent"] = u4
    })
    local v10 = {
        ["merchantItemInstance"] = u9,
        ["merchantItem"] = u6:getShopItemByItemType(u5.APPLE)
    }
    local u11 = u3.mount(u3.createElement(u7, v10), p8)
    return function() --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
            [3] = u9
        --]]
        u3.unmount(u11)
        u9:Destroy()
    end
end