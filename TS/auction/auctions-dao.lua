local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "mockdatastoreservice", "out")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").HttpService
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "AuctionsDao"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    p9.auctionsDataStore = u3:GetDataStore("Auctions")
    p9.logger = u5.getLogger("AuctionsDao")
end
function u6.getAllLiveAuctions(u10) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.Promise.new(function(p11) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        local v12 = u10.auctionsDataStore:GetAsync("ActiveAuctions")
        if v12 ~= nil then
            local v13 = 0
            v12 = {}
            for v14, v15 in v12.auctions do
                local _ = v14 - 1
                if v15.endEpochTime > os.time() == true then
                    v13 = v13 + 1
                    v12[v13] = v15
                end
            end
        end
        return p11(v12 == nil and {} or v12)
    end)
end
function u6.createAuction(u16, p17, p18, p19) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u1
    --]]
    local v20 = u2.new(p19.startEpochTime):getCurrentStartTime(p19.resetInterval)
    local u21 = {
        ["id"] = u4:GenerateGUID(false),
        ["startEpochTime"] = v20,
        ["activeItemsIds"] = p17,
        ["auctionType"] = p18,
        ["endEpochTime"] = v20 + p19.resetInterval
    }
    return u1.Promise.new(function(p22) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u21
        --]]
        u16.auctionsDataStore:UpdateAsync("ActiveAuctions", function(p23) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            if p23 == nil then
                return {
                    ["auctions"] = { u21 }
                }, nil, nil
            end
            local v24 = p23.auctions
            local v25 = u21
            table.insert(v24, v25)
            return p23, nil, nil
        end)
        return p22(u21)
    end)
end
function u6.updateActiveAuctions(u26, u27) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.Promise.new(function(p28) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u27
        --]]
        return p28((u26.auctionsDataStore:UpdateAsync("ActiveAuctions", function(p29) --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            return u27(p29 or {
                ["auctions"] = {}
            }), nil, nil
        end)))
    end)
end
function u6.createExpiredAuction(u30, u31) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.Promise.new(function(p32) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
        --]]
        u30.auctionsDataStore:UpdateAsync("ExpiredAuctions", function(p33) --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            local v34 = p33 or {
                ["auctions"] = {}
            }
            local v35 = v34.auctions
            local v36 = u31
            table.insert(v35, v36)
            return v34, nil, nil
        end)
        return p32()
    end)
end
function u6.createAuctionItem(u37, p38, p39) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
    --]]
    local u40 = u4:GenerateGUID(false)
    local u41 = "auction-item-" .. u40
    local u42 = {
        ["currentBid"] = p39.startingBid,
        ["definition"] = p39,
        ["auctionType"] = p38,
        ["id"] = u40,
        ["winningBids"] = {},
        ["maxWinningBids"] = p39.maxWinningBids
    }
    return u1.Promise.new(function(p43) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u41
            [3] = u42
            [4] = u40
        --]]
        u37.auctionsDataStore:SetAsync(u41, u42)
        return p43(u40)
    end)
end
function u6.getAuctionItems(u44, p45, p46) --[[ Line: 130 ]]
    local u47 = p46 == nil and 5 or p46
    local u48 = {}
    local v49 = p45.activeItemsIds
    local function v56(p50) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u48
            [3] = u47
        --]]
        local v51 = os.clock()
        local v52, v53 = u44:getAuctionItem(p50):await()
        if v52 and v53 then
            local v54 = u48
            table.insert(v54, v53)
        end
        local v55 = os.clock() - v51
        if v55 < u47 then
            task.wait(u47 - v55)
        end
    end
    for v57, v58 in v49 do
        v56(v58, v57 - 1, v49)
    end
    return u48
end
function u6.getAuctionItem(u59, p60) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local u61 = "auction-item-" .. p60
    return u1.Promise.new(function(p62) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u61
        --]]
        return p62((u59.auctionsDataStore:GetAsync(u61)))
    end)
end
function u6.updateAuctionItem(u63, p64, u65) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local u66 = "auction-item-" .. p64
    return u1.Promise.new(function(p67) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u66
            [3] = u65
        --]]
        return p67((u63.auctionsDataStore:UpdateAsync(u66, function(p68) --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u65
            --]]
            return u65(p68), nil, nil
        end)))
    end)
end
return {
    ["AuctionsDao"] = u6
}