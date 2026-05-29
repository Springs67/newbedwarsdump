local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.RunService
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent, "survival-ui").SurvivalUi
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u4
    --]]
    local u8 = u5:GetServerTimeNow() + 30
    local u9 = 100
    local u10 = 0
    local u11 = os.clock() + 12
    local v12 = {
        ["maxHealth"] = 100,
        ["waveCount"] = 10,
        ["state"] = 1,
        ["health"] = u9,
        ["endTime"] = u8
    }
    local u13 = u2.mount(u2.createElement(u6, v12), p7)
    local u15 = u4.Heartbeat:Connect(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u9
            [4] = u13
            [5] = u2
            [6] = u6
            [7] = u8
        --]]
        if os.clock() - u10 > 0.2 and os.clock() < u11 then
            u10 = os.clock()
            u9 = u9 - 2
            local v14 = {
                ["maxHealth"] = 100,
                ["waveCount"] = 10,
                ["state"] = 1,
                ["health"] = u9,
                ["endTime"] = u8
            }
            u13 = u2.update(u13, u2.createElement(u6, v14))
        end
    end)
    return function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u2
            [3] = u13
        --]]
        u15:Disconnect()
        u2.unmount(u13)
    end
end