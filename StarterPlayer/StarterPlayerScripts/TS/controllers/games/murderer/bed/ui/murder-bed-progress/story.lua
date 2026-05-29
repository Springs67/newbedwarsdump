local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderBedState
local u8 = v1.import(script, script.Parent, "murder-bed-progress").MurderBed
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u6
        [4] = u3
        [5] = u8
        [6] = u7
    --]]
    local u10 = u2.new()
    local u11 = u5.Assets.Misc.Bed_Red:Clone()
    u11.Parent = u6
    u10:GiveTask(function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:Destroy()
    end)
    local u12 = u3.mount(u3.createElement(u8, {
        ["BedStage"] = 1,
        ["Progress"] = 1,
        ["Adornee"] = u11,
        ["BedState"] = u7.IDLE
    }), p9)
    return function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u12
            [3] = u10
        --]]
        u3.unmount(u12)
        u10:DoCleaning()
    end
end