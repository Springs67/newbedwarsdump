local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ClanShopController"
    end,
    ["__index"] = u4
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4.constructor(p11)
    p11.Name = "ClanShopController"
    p11.clansRemotes = u6.Client:GetNamespace("Clans")
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.KnitStart(p12)
    p12.clansRemotes:Get("ShopDataUpdate"):Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        u5:dispatch({
            ["type"] = "ClanSetShopData",
            ["clanContributionCoins"] = p13.clanContributionCoins,
            ["weekPurchaseHistory"] = p13.weekPurchaseHistory
        })
    end)
end
function u8.purchaseItem(p14, u15) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u5
    --]]
    local v16 = p14.clansRemotes:Get("ShopPurchase"):CallServerAsync(u15)
    v16:andThen(function(p17) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
            [3] = u5
            [4] = u15
        --]]
        if p17.success then
            u2:playSound(u7.BEDWARS_UPGRADE_SUCCESS)
            local v18 = {}
            local v19 = u5:getState().Clans.clanContributionShop
            local v20
            if v19 == nil then
                v20 = v19
            else
                v20 = v19.weekPurchaseHistory
            end
            if v20 then
                v18 = {}
                local v21 = #v18
                local v22 = v19.weekPurchaseHistory
                table.move(v22, 1, #v22, v21 + 1, v18)
            end
            local v23 = {
                ["itemType"] = u15
            }
            table.insert(v18, v23)
            u5:dispatch({
                ["type"] = "ClanSetShopData",
                ["clanContributionCoins"] = p17.newBalance,
                ["weekPurchaseHistory"] = v18
            })
        end
    end)
    return v16
end
function u8.requestClanShopData(p24) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v25 = p24.clansRemotes:Get("RequestShopData"):CallServerAsync():expect()
    u5:dispatch({
        ["type"] = "ClanSetShopData",
        ["clanContributionCoins"] = v25.clanContributionCoins,
        ["weekPurchaseHistory"] = v25.weekPurchaseHistory
    })
    return v25
end
v3.CreateController(u8.new())
return nil