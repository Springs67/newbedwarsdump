local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.RunService
local u9 = v7.Workspace
return {
    ["SkeletonKitReviveCooldownBarGUI"] = v6.new(u5)(function(u10, p11) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u5
            [4] = u3
            [5] = u4
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14, u15 = v12(0)
        v13(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u15
                [3] = u9
                [4] = u10
            --]]
            local u18 = u8.Heartbeat:Connect(function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u9
                    [3] = u10
                --]]
                local v16 = u15
                local v17 = (u9:GetServerTimeNow() - u10.StartServerTime) / (u10.EndServerTime - u10.StartServerTime)
                v16((math.clamp(v17, 0, 1)))
            end)
            return function() --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:Disconnect()
            end
        end)
        return u5.createElement(u3, {
            ["Size"] = UDim2.fromScale(1, 0.05)
        }, { u5.createElement(u4, {
                ["LayoutOrder"] = 1,
                ["Flip"] = true,
                ["GradientRotation"] = 0,
                ["Progress"] = v14,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BarGradient"] = ColorSequence.new(Color3.fromRGB(199, 166, 18), Color3.fromRGB(130, 128, 28)),
                ["Title"] = {
                    ["text"] = "Revive cooldown"
                }
            }) })
    end)
}