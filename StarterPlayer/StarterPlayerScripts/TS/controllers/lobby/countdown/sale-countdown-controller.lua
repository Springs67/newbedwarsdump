local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StringUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "SaleCountdownController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p10)
    p10.Name = "SaleCountdownController"
    p10.countdownTag = "sale-countdown"
    p10.endTime = 1767999600
end
function u7.KnitStart(u11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u6.KnitStart(u11)
    u4(u11.countdownTag, function(u12) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        task.spawn(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u11
            --]]
            repeat
                u12.Text = u11:getTime(u11.endTime, "LAST CHANCE!!")
                local v13 = task.wait(1)
            until v13 == 0 or (v13 ~= v13 or not v13)
        end)
    end)
end
function u7.getTime(_, p14, p15) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v16 = p14 - os.time()
    local v17 = math.max(0, v16)
    if v17 == 0 then
        return p15
    else
        return u3.formatCountdownTime(v17, {
            ["days"] = true,
            ["hours"] = true,
            ["seperator"] = " : "
        })
    end
end
v5.CreateController(u7.new())
return nil