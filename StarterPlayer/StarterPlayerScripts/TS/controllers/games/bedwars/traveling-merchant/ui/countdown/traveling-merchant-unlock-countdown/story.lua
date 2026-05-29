local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, script.Parent, "traveling-merchant-unlock-countdown").TravelingMerchantUnlockCountdown
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
        [4] = u5
    --]]
    local u7 = u2("MeshPart", {
        ["Position"] = Vector3.new(0, 0, 0),
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["Parent"] = u4
    })
    local u8 = u3.mount(u3.createElement(u5, {
        ["shopOpensIn"] = 20,
        ["wagonInstance"] = u7
    }), p6)
    return function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u7
        --]]
        u3.unmount(u8)
        u7:Destroy()
    end
end