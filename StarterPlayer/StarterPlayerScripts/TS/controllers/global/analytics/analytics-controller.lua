local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "AnalyticsController"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9)
    p9.Name = "AnalyticsController"
end
function u6.KnitStart(_) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    local function u10() --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        task.wait(math.random(20, 60))
        u5.Client:Get("VapeDetectionRedundancy"):SendToServer()
    end
    task.defer(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
            [3] = u5
        --]]
        task.wait(20)
        local u11 = u3:FindFirstChild("AnalyticsReportEvent")
        if not u11 then
            return u10()
        end
        u3.ChildRemoved:Connect(function(p12) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u5
            --]]
            if p12 == u11 then
                task.wait(math.random(20, 60))
                u5.Client:Get("VapeDetectionRedundancy"):SendToServer()
            end
        end)
    end)
end
function u6.sendFunnelEvent(_, p13, p14, p15, p16, p17) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.Client:Get("ReportFunnelEvent"):SendToServer(p13, p14, p15, p16, p17)
end
v2.CreateController(u6.new())
return nil