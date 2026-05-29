local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent, "queue-card").QueueCard
local u5 = u3.Component:extend("QueueApp")
function u5.init(_) --[[ Line: 9 ]] end
function u5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
    --]]
    return u3.createFragment({ u3.createElement(u4, {
            ["QueueData"] = p6.props.store.Party.queueData,
            ["QueueState"] = p6.props.store.Party.queueState,
            ["OnLeaveQueue"] = function() --[[ Name: OnLeaveQueue, Line 16 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                u2.Controllers.QueueController:leaveQueue()
            end
        }) })
end
return {
    ["QueueAppWrapper"] = function(p7) --[[ Name: QueueAppWrapper, Line 23 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
        --]]
        local v8 = u3.createFragment
        local v9 = {
            ["QueueApp"] = u3.createElement("ScreenGui", {
                ["IgnoreGuiInset"] = true,
                ["DisplayOrder"] = 1000,
                ["ResetOnSpawn"] = false
            }, { u3.createElement(u5, {
                    ["store"] = p7.store
                }) })
        }
        return v8(v9)
    end,
    ["QueueApp"] = u5
}