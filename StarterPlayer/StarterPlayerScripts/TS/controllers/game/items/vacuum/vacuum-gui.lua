local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vacuum", "vacuum-constants").VacuumConstants
return {
    ["VacuumGUI"] = v6.new(u5)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u5
            [4] = u3
            [5] = u4
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local v13, u14 = v11(p9.InitialGhostCount / u8.MAX_GHOST_COUNT)
        local v15 = p9.InitialGhostCount
        local v16 = tostring(v15)
        local v17 = u8.MAX_GHOST_COUNT
        local v18, u19 = v11(v16 .. " / " .. tostring(v17) .. " Ghosts")
        v12(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u14
                [3] = u8
                [4] = u19
            --]]
            local u25 = u7.LocalPlayer:GetAttributeChangedSignal("Vacuum_GhostCount"):Connect(function() --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u14
                    [3] = u8
                    [4] = u19
                --]]
                local v20 = u7.LocalPlayer:GetAttribute("Vacuum_GhostCount")
                local v21 = v20 == nil and 0 or v20
                u14(v21 / u8.MAX_GHOST_COUNT)
                local v22 = u19
                local v23 = tostring(v21)
                local v24 = u8.MAX_GHOST_COUNT
                v22(v23 .. " / " .. tostring(v24) .. " Ghosts")
            end)
            return function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:Disconnect()
            end
        end, {})
        local v26 = u5.createElement
        local v27 = u3
        local v28 = {
            ["Size"] = UDim2.fromScale(1, 0.05)
        }
        local v29 = {}
        local v30 = u5.createElement
        local v31 = u4
        local v32 = {
            ["LayoutOrder"] = 1,
            ["Flip"] = false,
            ["GradientRotation"] = 0,
            ["AcceptZero"] = true,
            ["Progress"] = v13,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BarGradient"] = ColorSequence.new(Color3.fromRGB(173, 207, 250), Color3.fromRGB(128, 235, 255)),
            ["Title"] = {
                ["text"] = v18
            }
        }
        __set_list(v29, 1, {v30(v31, v32)})
        return v26(v27, v28, v29)
    end)
}