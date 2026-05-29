local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "glicko-rating-tables").GlickoRatings
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "RankDistribution"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 20 ]] end
function u7.migrateGlicko(p10, p11, p12) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v13 = u3.entries(p12)
    local v14 = p10.glickoRating
    table.sort(v13, function(p15, p16) --[[ Line: 25 ]]
        return p15[2] < p16[2]
    end)
    local v17 = false
    local v18 = 0
    while true do
        if v17 then
            v18 = v18 + 1
        else
            v17 = true
        end
        if v18 >= #v13 - 1 then
            local v19 = v13[#v13 - 1 + 1][1]
            if p12[v19] <= p11 then
                return p10.glickoRating[v19]
            end
            local v20 = v13[1][1]
            return p10.glickoRating[v20]
        end
        local v21 = v13[v18 + 1]
        local v22 = v21[1]
        local v23 = v21[2]
        local v24 = v13[v18 + 1 + 1]
        local v25 = v24[1]
        local v26 = v24[2]
        if v23 <= p11 and p11 < v26 then
            local v27 = (p11 - v23) / (v26 - v23)
            return u2:lerp(v14[v22], v14[v25], v27)
        end
    end
end
function u7.estimateGlickoFromRankPoints(p28, p29) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v30 = p28:getDivisionFromRankPoints(p29, 0)
    if v30 == u6.NIGHTMARE_1 then
        local v31 = p29 - v30 * 100
        return p28.glickoRating[v30] + v31
    end
    local v32 = v30 + 1
    local v33 = p28.glickoRating[v30]
    local v34 = p28.glickoRating[v32]
    local v35 = (p29 - v30 * 100) / 100
    local v36 = math.clamp(v35, 0, 1)
    return v33 + (v34 - v33) * v36
end
function u7.getDivisionFromGlickoRating(p37, p38) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    local v39 = false
    local v40 = 0
    while true do
        if v39 then
            v40 = v40 + 1
        else
            v39 = true
        end
        if v40 >= #u3.values(u6) then
            return u6.NIGHTMARE_1
        end
        if p38 <= p37.glickoRating[v40] then
            if v40 == 0 then
                return v40
            else
                return v40 - 1
            end
        end
    end
end
function u7.getDivisionFromRankPoints(_, p41, p42) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u3
    --]]
    if p42 == -1 or (p42 >= u7.NIGHTMARE_USER_LIMIT or u6.NIGHTMARE_1 * 100 >= p41) then
        local v43 = p41 / 100
        local v44 = math.floor(v43)
        local v45 = math.max(0, v44)
        if v45 < #u3.values(u6) - 1 then
            return v45
        else
            return u6.NIGHTMARE_1 - 1
        end
    else
        return u6.NIGHTMARE_1
    end
end
function u7.getDisplayedRank(p46, p47, p48) --[[ Line: 116 ]]
    local v49 = p46:getDivisionFromRankPoints(p47, p48)
    return {
        ["division"] = v49,
        ["rankPoints"] = p47 - v49 * 100
    }
end
function u7.getLegacyDivisionFromRankPoints(_, p50, _) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    local v51 = p50 / 100
    local v52 = math.floor(v51)
    if v52 < #u3.values(u6) then
        return v52
    else
        return u6.NIGHTMARE_1
    end
end
function u7.getRankPointsFromDivision(_, p53) --[[ Line: 132 ]]
    return p53 * 100
end
function u7.getExpectedGlickoRatingForDivision(p54, p55) --[[ Line: 135 ]]
    return p54.glickoRating[p55]
end
u7.NIGHTMARE_USER_LIMIT = 200
u7.glickoRating = v4.getRatingTable(v5.RANKED_S16)
return {
    ["RankDistribution"] = u7
}