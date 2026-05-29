local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "ShopkeeperController"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p8)
    p8.Name = "ShopkeeperController"
end
function u5.KnitStart(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p9)
end
function u5.getShopkeeperModel(_, p10, p11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p10 == "item_shop" then
        local v12 = nil
        for v13, v14 in u3:GetTagged("BedwarsItemShop") do
            local _ = v13 - 1
            if v14:GetAttribute("TeamId") == p11 == true then
                v12 = v14
                break
            end
        end
        if v12 ~= nil then
            v12 = v12:FindFirstChildWhichIsA("Model")
        end
        return v12
    end
    if p10 ~= "upgrade_shop" then
        return
    end
    local v15 = nil
    for v16, v17 in u3:GetTagged("TeamUpgradeShopkeeper") do
        local _ = v16 - 1
        if v17:GetAttribute("GeneratorTeam") == p11 == true then
            v15 = v17
            break
        end
    end
    if v15 ~= nil then
        v15 = v15:FindFirstChildWhichIsA("Model")
    end
    return v15
end
v2.CreateController(u5.new())
return nil