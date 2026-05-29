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
    ["SkeletonKitReviveBarGUI"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
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
        v13(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u15
                [3] = u9
                [4] = u10
            --]]
            local u18 = u8.Heartbeat:Connect(function() --[[ Line: 16 ]]
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
            return function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:Disconnect()
            end
        end)
        if u10.IsOnActionBar then
            return u5.createElement(u3, {
                ["Size"] = UDim2.fromScale(1, 0.05)
            }, { u5.createElement(u4, {
                    ["LayoutOrder"] = 1,
                    ["Flip"] = false,
                    ["GradientRotation"] = 0,
                    ["Progress"] = v14,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(214, 59, 71), Color3.fromRGB(199, 64, 255)),
                    ["Title"] = {
                        ["text"] = "Reviving..."
                    }
                }) })
        end
        local v19 = u5.createFragment
        local v20 = {
            ["SkeletonKitReviveBar"] = u5.createElement("BillboardGui", {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 2, 0),
                ["ResetOnSpawn"] = false,
                ["MaxDistance"] = 100,
                ["Adornee"] = u10.Target,
                ["Size"] = UDim2.fromScale(6, 0.5)
            }, { u5.createElement(u4, {
                    ["LayoutOrder"] = 1,
                    ["Flip"] = false,
                    ["GradientRotation"] = 0,
                    ["Progress"] = v14,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(28, 84, 10), Color3.fromRGB(5, 33, 10)),
                    ["Title"] = {
                        ["text"] = "Reviving..."
                    }
                }) })
        }
        return v19(v20)
    end)
}