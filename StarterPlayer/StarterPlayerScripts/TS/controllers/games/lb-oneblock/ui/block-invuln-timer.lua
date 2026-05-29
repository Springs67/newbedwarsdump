local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Countdown
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["BlockInvulnTimer"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = u3.createFragment
        local v7 = {
            ["BlockInvuln"] = u3.createElement("BillboardGui", {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 3, 0),
                ["ResetOnSpawn"] = false,
                ["MaxDistance"] = 150,
                ["Adornee"] = p4.Adornee,
                ["Size"] = UDim2.fromScale(8, 2)
            }, { u3.createElement(u2, {
                    ["EndTime"] = p4.EndTime,
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = false,
                        ["minutes"] = false,
                        ["seconds"] = true
                    }
                }, { u3.createElement("UIStroke", {
                        ["Thickness"] = 2
                    }) }) })
        }
        return v6(v7)
    end)
}