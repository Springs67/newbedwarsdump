local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ServerStorage
local u6 = v4.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "one-for-all", "one-for-all-util").OneForAllUtil
local u8 = v1.import(script, script.Parent, "one-for-all-board").OneForAllBoard
return function(_) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u7
        [5] = u3
        [6] = u8
    --]]
    local u9 = u5.Assets.Villagers.smoke:Clone()
    u9.PrimaryPart.Anchored = true
    u9.Name = "ONE_FOR_ALL_ADORNEE"
    u9.Parent = u6
    u9:PivotTo(CFrame.new(30.913, 306.437, 469.703))
    local v10 = u2.new(u7.getCurrTimestamp())
    local v11 = u7.pickRandomKit()
    local v12 = v10:getNextResetTime(u7.pickInterval)
    local u13 = u3.mount(u3.createElement(u8, {
        ["Adornee"] = u9.PrimaryPart,
        ["BedwarsKit"] = v11,
        ["EndTime"] = v12
    }), u9)
    return function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u13
        --]]
        u9:Destroy()
        u3.unmount(u13)
    end
end