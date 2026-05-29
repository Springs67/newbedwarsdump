local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent, "goose-world-indicator-component").GooseWorldIndicatorComponent
return function(_) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u6
        [4] = u3
        [5] = u7
    --]]
    local u8 = u2.new()
    local v9 = u5.Assets.Misc.GoldenGoose:Clone()
    u8:GiveTask(v9)
    v9.Parent = u6
    local v10 = u6.CurrentCamera.CFrame
    v9:PivotTo(CFrame.new(v10 * Vector3.new(0, 0, -10)))
    local u11 = u3.mount(u3.createElement(u7, {
        ["gooseHolderTeamId"] = nil,
        ["despawnTime"] = u6:GetServerTimeNow() + 60,
        ["billboardAdornee"] = v9.PrimaryPart
    }), v9.PrimaryPart)
    u8:GiveTask(function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
        --]]
        return u3.unmount(u11)
    end)
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        return u8:DoCleaning()
    end
end