local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "RankController"
    end,
    ["__index"] = u3
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
        [1] = u3
    --]]
    u3.constructor(p8)
    p8.Name = "RankController"
    p8.rankCache = {}
end
function u5.KnitStart(p9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p9)
end
function u5.getRanks(u10, p11, p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
    --]]
    local u13 = {}
    if not p12 and next(u10.rankCache) ~= nil then
        local v14 = 0
        p11 = {}
        for v15, v18 in p11 do
            local _ = v15 - 1
            local v17 = u10.rankCache[v18]
            if v17 ~= 0 and (v17 == v17 and v17) then
                table.insert(u13, {
                    ["userId"] = v18,
                    ["rankDivision"] = v17
                })
                local v18 = nil
            end
            if v18 ~= nil then
                v14 = v14 + 1
                p11[v14] = v18
            end
        end
    end
    local v19
    if #p11 == 0 then
        v19 = u1.Promise.new(function(p20) --[[ Line: 64 ]]
            return p20({})
        end)
    else
        v19 = u4.Client:Get("FetchRanks"):CallServerAsync(p11)
    end
    return u1.Promise.all({ v19, u1.Promise.new(function(p21) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            return p21(u13)
        end) }):andThen(function(p22) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        local v23 = p22[1]
        local v24 = p22[2]
        for v25, v26 in v23 do
            local _ = v25 - 1
            u10.rankCache[v26.userId] = v26.rankDivision
        end
        local v27 = {}
        local v28 = #v27
        local v29 = #v23
        table.move(v23, 1, v29, v28 + 1, v27)
        local v30 = v28 + v29
        table.move(v24, 1, #v24, v30 + 1, v27)
        return v27
    end)
end
v2.CreateController(u5.new())
return nil