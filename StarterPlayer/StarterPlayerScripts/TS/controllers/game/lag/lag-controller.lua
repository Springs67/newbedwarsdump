local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v5 = {}
local u6 = setmetatable({}, {
    ["__index"] = v5
})
u6.HEALTHY = 60
v5[60] = "HEALTHY"
u6.LAGGING = 50
v5[50] = "LAGGING"
u6.CRITICAL = 30
v5[30] = "CRITICAL"
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "LagController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    u4.constructor(p10)
    p10.Name = "LagController"
    p10.elapsedTime = 0
    p10.frameList1 = u2.new(10)
    p10.frameList2 = u2.new(30)
    p10.frameList3 = u2.new(60)
    p10.frameList4 = u2.new(180)
    p10.frameList5 = u2.new(600)
end
function u7.KnitStart(_) --[[ Line: 49 ]] end
function u7.snapshotFPSAverages(p11) --[[ Line: 51 ]]
    local v12 = {
        #p11.frameList1:getValues(),
        #p11.frameList2:getValues(),
        #p11.frameList3:getValues(),
        #p11.frameList4:getValues(),
        #p11.frameList5:getValues()
    }
    local v13 = false
    local v14 = 0
    local v15 = {
        10,
        30,
        60,
        180,
        600
    }
    local v16 = {}
    while true do
        if v13 then
            v14 = v14 + 1
        else
            v13 = true
        end
        if v14 >= #v15 then
            return v16
        end
        local v17 = v12[v14 + 1] / v15[v14 + 1]
        if p11.elapsedTime > v15[v14 + 1] then
            local v18 = { v15[v14 + 1], v17 }
            table.insert(v16, v18)
        else
            local v19 = { v15[v14 + 1], -1 }
            table.insert(v16, v19)
        end
    end
end
function u7.getFPSHealth(p20) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v21 = u6.HEALTHY
    local v22 = v21
    for v23, v24 in p20:snapshotFPSAverages() do
        local _ = v23 - 1
        local v25 = v24[1]
        local v26 = v24[2]
        if v26 ~= -1 then
            if v26 < u6.LAGGING and v25 > 10 then
                v21 = u6.LAGGING
                v22 = v21
            end
            if v26 < u6.CRITICAL and v25 > 30 then
                v21 = u6.CRITICAL
                v22 = v21
            end
        end
    end
    return v22
end
v3.CreateController(u7.new())
return {
    ["RenderHealth"] = u6
}