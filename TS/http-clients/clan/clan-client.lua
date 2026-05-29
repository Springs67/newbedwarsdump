local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.HttpService
local u4 = v2.RunService
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "requests", "search-clans-request").SearchClansField
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "responses", "batch-update-response").BatchUpdateResponse
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "responses", "delete-clan-response").DeleteClanResponse
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "responses", "get-clan-audit-logs-response").GetClanAuditLogsResponse
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "responses", "get-random-clans-response").GetRandomClansResponse
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "responses", "get-recommended-clans-response").GetRecommendedClansResponse
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "responses", "search-clans-response").SearchClansResponse
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ClanClient"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
    --]]
    p16.apiToken = p17
    p16.serviceUrl = (u12.isStaging() or u4:IsStudio()) and "https://clans-service-2qiyqmzqea-uc.a.run.app" or "https://clans-service-o6h4tsr73a-uc.a.run.app/"
    p16.batchUpdateUrl = p16.serviceUrl .. "/clans"
    p16.searchClansUrl = p16.serviceUrl .. "/clans/search"
    p16.recommendedClansUrl = p16.serviceUrl .. "/clans/recommended"
    p16.deleteClanUrl = p16.serviceUrl .. "/clans/clan-id"
    p16.getRandomClansUrl = p16.serviceUrl .. "/clans/random"
end
u13.batchCreate = u1.async(function(p18, p19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return p18:putRequest(u3:JSONEncode({
        ["clans"] = p19.creates
    }))
end)
u13.batchUpdate = u1.async(function(p20, p21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return p20:putRequest(u3:JSONEncode({
        ["clans"] = p21.updates
    }))
end)
function u13.getRandomClans(p22) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
    --]]
    return p22:getRequest(p22.getRandomClansUrl, function(p23) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
        --]]
        local v24 = u3:JSONDecode(p23)
        return u9.new(v24)
    end)
end
u13.searchClans = u1.async(function(p25, p26) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
    --]]
    return p25:getRequest(p25:getSearchUrl(p26), function(p27) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
        --]]
        local v28 = u3:JSONDecode(p27)
        return u11.new(v28.documents)
    end)
end)
u13.getRecommendedClans = u1.async(function(p29, p30) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u10
        [3] = u3
    --]]
    local v31 = p29.recommendedClansUrl
    if #p30.friends == 0 then
        return u1.Promise.new(function(p32) --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            return p32(u10.new({}))
        end)
    end
    local v33 = p30.friends
    local v34 = ""
    for v35 = 1, #v33 do
        local v36 = v33[v35]
        local _ = v35 - 1
        v34 = v34 .. (#v34 == 0 and "" or "&") .. "friends[]=" .. tostring(v36)
    end
    return p29:getRequest(v31 .. "?" .. v34, function(p37) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
        --]]
        return u10.new(u3:JSONDecode(p37))
    end)
end)
u13.getClanAuditLogs = u1.async(function(p38, p39) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
    --]]
    return p38:getRequest(p38:getAuditLogsUrl(p39), function(p40) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
        --]]
        local v41 = u3:JSONDecode(p40)
        return u8.new(v41.results, v41.cursor)
    end)
end)
u13.deleteClan = u1.async(function(p42, p43) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
    --]]
    return p42:deleteRequest(p42.deleteClanUrl .. "/" .. u3:UrlEncode(p43), function(p44) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
        --]]
        return u7.new(u3:JSONDecode(p44))
    end)
end)
function u13.getRequest(u45, u46, u47) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    return u1.Promise.new(function(p48, p49) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u46
            [3] = u45
            [4] = u47
        --]]
        local v50 = u3
        local v51 = {
            ["Method"] = "GET",
            ["Url"] = u46,
            ["Headers"] = {
                ["Authorization"] = u45.apiToken
            }
        }
        local v52 = v50:RequestAsync(v51)
        if v52.StatusCode < 300 and v52.StatusCode >= 200 then
            p48(u47(v52.Body))
        else
            p49(u3:JSONDecode(v52.Body))
        end
    end)
end
function u13.putRequest(u53, u54) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u6
    --]]
    return u1.Promise.new(function(p55, p56) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u53
            [3] = u54
            [4] = u6
        --]]
        local v57 = u3
        local v58 = {
            ["Method"] = "PUT",
            ["Url"] = u53.batchUpdateUrl,
            ["Body"] = u54,
            ["Headers"] = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = u53.apiToken
            }
        }
        local v59 = u3:JSONDecode(v57:RequestAsync(v58).Body)
        local v60 = u6.new(v59)
        if #v60.errors == 0 then
            p55(v60)
        else
            p56(v60)
        end
    end)
end
function u13.deleteRequest(u61, u62, u63) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    return u1.Promise.new(function(p64, p65) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u62
            [3] = u61
            [4] = u63
        --]]
        local v66 = u3
        local v67 = {
            ["Method"] = "DELETE",
            ["Url"] = u62,
            ["Headers"] = {
                ["Authorization"] = u61.apiToken
            }
        }
        local v68 = v66:RequestAsync(v67)
        if v68.StatusCode < 300 and v68.StatusCode >= 200 then
            p64(u63(v68.Body))
        else
            p65(u3:JSONDecode(v68.Body))
        end
    end)
end
function u13.getSearchUrl(p69, p70) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v71 = p69.searchClansUrl
    local v72 = p70.searchField or u5.Name
    local v73 = p70.keyword
    local v74 = p70.page
    local v75 = v74 == nil and 0 or v74
    local v76 = p70.minMembers
    local v77 = v76 == nil and 0 or v76
    local v78 = p70.maxMembers
    local v79 = v78 == nil and 100 or v78
    return v71 .. "?searchField=" .. v72 .. "&query=" .. v73 .. "&page=" .. tostring(v75) .. "&minMembers=" .. tostring(v77) .. "&maxMembers=" .. tostring(v79)
end
function u13.getAuditLogsUrl(p80, p81) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v82 = p80.serviceUrl .. "/clans/clan-id/" .. u3:UrlEncode(p81.clanId) .. "/audit-logs"
    local v83 = p81.cursor
    if v83 ~= "" and v83 then
        v82 = v82 .. "?cursor=" .. p81.cursor
    end
    return v82
end
return {
    ["ClanClient"] = u13
}