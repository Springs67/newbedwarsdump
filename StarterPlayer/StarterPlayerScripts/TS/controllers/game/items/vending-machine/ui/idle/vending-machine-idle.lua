local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta
local u8 = v1.import(script, script.Parent.Parent, "vending-machine-floater").VendingMachineFloater
local u9 = v1.import(script, script.Parent, "carousel-reward").CarouselReward
return {
    ["VendingMachineIdle"] = v5.new(u4)(function(_, p10) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u3
            [4] = u7
            [5] = u6
            [6] = u9
            [7] = u2
        --]]
        local _ = p10.useState
        local v11 = false
        local v12 = 0
        local v13 = {}
        while true do
            if v11 then
                v12 = v12 + 1
            else
                v11 = true
            end
            if v12 >= 4 then
                break
            end
            local v14 = u4.createElement(u8)
            table.insert(v13, v14)
        end
        local v15 = false
        local v16 = 0
        local v17 = {}
        while true do
            if v15 then
                v16 = v16 + 1
            else
                v15 = true
            end
            if v16 >= 10 then
                local v18 = {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0, 0)
                }
                local v19 = {}
                local v20 = #v19
                for v21, v22 in v13 do
                    v19[v20 + v21] = v22
                end
                local v23 = #v19
                local v24 = {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.45),
                    ["Position"] = UDim2.fromScale(0.5, 0.47),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v25 = { u4.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)),
                        ["Transparency"] = NumberSequence.new(0.6, 0.35)
                    }) }
                local v26 = #v25
                local v27 = {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v28 = {}
                local v29 = #v28
                for v30, v31 in v17 do
                    v28[v29 + v30] = v31
                end
                v25[v26 + 1] = u4.createElement(u2, v27, v28)
                v19[v23 + 1] = u4.createElement("Frame", v24, v25)
                return u4.createElement(u2, v18, v19)
            end
            local v32 = 0
            local v33 = {}
            for v34, v35 in u3.values(u7) do
                local _ = v34 - 1
                local v36
                if v35.id == u6.NONE then
                    v36 = false
                else
                    v36 = not v35.disabled
                end
                if v36 == true then
                    v32 = v32 + 1
                    v33[v32] = v35
                end
            end
            local v37 = v16 % #v33
            local v38 = u4.createElement(u9, {
                ["totalRewardCount"] = 10,
                ["rewardId"] = v33[v37 + 1].id,
                ["Position"] = UDim2.fromScale(v16 - 5, 0.5)
            })
            table.insert(v17, v38)
        end
    end)
}