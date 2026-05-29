local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u4 = v1.import(script, script.Parent, "status-effect-hud-list").StatusEffectHudListScreen
return function(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
    --]]
    local v6 = u2.mount
    local v7 = u2.createElement
    local v8 = u4
    local v9 = {
        ["StatusEffects"] = {
            {
                ["expireTime"] = 90,
                ["stacks"] = 2,
                ["statusEffect"] = u3.FORCEFIELD
            },
            {
                ["stacks"] = 0,
                ["statusEffect"] = u3.ENCHANT_FIRE
            },
            {
                ["expireTime"] = 15,
                ["stacks"] = 0,
                ["statusEffect"] = u3.GIANT
            }
        },
        ["Position"] = UDim2.fromScale(0.5, 0.1)
    }
    local u10 = v6(v7(v8, v9), p5)
    return function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        return u2.unmount(u10)
    end
end