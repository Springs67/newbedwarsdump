local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out")
local u3 = v2.default
local u4 = v2.Logger
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, script.Parent).pirateScene
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system")
local u8 = v7.SceneManager
local u9 = v7.TimeConfig
local u10 = v1.import(script, script.Parent.Parent, "pirate-buildup-scene").pirateBuildupScene
return function(_) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u5
        [4] = u8
        [5] = u10
        [6] = u9
        [7] = u6
    --]]
    u3.SetLogger(u4:configure():WriteTo(u3.RobloxOutput()):Create())
    task.spawn(function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        u5:Run()
    end)
    local v11 = DateTime.fromUnixTimestamp(DateTime.now().UnixTimestamp + 2)
    local u12 = u8.new()
    u10:overrideTimeConfig(u9.betweenDates({
        ["startDate"] = DateTime.now(),
        ["endDate"] = v11
    }))
    u6:overrideTimeConfig(u9.startDateAndLength({
        ["length"] = 145,
        ["startDate"] = v11
    }))
    u12:loadChainedScenes(u10, u6)
    local u13 = u12:begin()
    return function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u5
        --]]
        u12:cleanAllState()
        u13:DoCleaning()
        task.spawn(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            u5:Stop()
        end)
    end
end