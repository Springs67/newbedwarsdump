local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState
local u8 = v1.import(script, script.Parent, "ui", "vending-machine-app").VendingMachineApp
local u15 = v4.new(u3)(function(_, p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u3
        [4] = u8
        [5] = u5
    --]]
    local v10 = p9.useState
    local v11 = p9.useEffect
    local v12, _ = v10(u7.IDLE)
    local v13, _ = v10(u6.DODO_BIRD)
    v11(function() --[[ Line: 15 ]]
        local u14 = true
        return function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14 = false
        end
    end)
    return u3.createElement(u8, {
        ["vendingMachineState"] = v12,
        ["choosenReward"] = v13,
        ["dispenseTime"] = u5:GetServerTimeNow() + 4
    })
end)
return function(p16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u15
    --]]
    local u17 = u3.mount(u3.createElement(u2, {
        ["Size"] = UDim2.fromScale(0.8, 0.8)
    }, { u3.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 0.7727110794442466
        }), u3.createElement(u15) }), p16)
    return function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u17
        --]]
        u3.unmount(u17)
    end
end