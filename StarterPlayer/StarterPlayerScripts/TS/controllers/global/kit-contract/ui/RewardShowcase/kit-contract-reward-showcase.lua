local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["KitContractRewardShowcase"] = v5.new(u4)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u6
            [4] = u2
            [5] = u8
            [6] = u7
        --]]
        local _ = p10.useState
        local v11 = p10.useEffect
        local u12 = u4.createRef()
        local u13 = u4.createRef()
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u13
                [3] = u3
                [4] = u6
            --]]
            local u14 = u12:getValue()
            local u15 = u13:getValue()
            if not (u14 and u15) then
                return nil
            end
            local u16 = u3.new()
            u16:GiveTask(u6.Heartbeat:Connect(function(p17) --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u15
                --]]
                local v18 = u14
                v18.Rotation = v18.Rotation + 10 * p17
                local v19 = u15
                v19.Rotation = v19.Rotation - 5 * p17
            end))
            return function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end
        end, {})
        local v20 = {}
        for v21, v22 in p9 do
            v20[v21] = v22
        end
        v20.Reward = nil
        local v23 = {}
        for v24, v25 in v20 do
            v23[v24] = v25
        end
        local v26 = u4.createFragment
        local v27 = {}
        local v28 = u4.createElement
        local v29 = u2
        local v30 = {
            ["BackgroundEffectsContainer"] = u4.createElement(u2, {
                ["Size"] = UDim2.fromScale(1.3, 1.3),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u4.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.5,
                    ["ZIndex"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.6666666666666666, 0.6666666666666666),
                    ["Image"] = u8.SOLID_BLURRED_CIRCLE
                }), u4.createElement("ImageLabel", {
                    [u4.Ref] = u12,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u8.SOLID_BLURRED_12_POINT_STAR,
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.5,
                    ["ZIndex"] = 0
                }), u4.createElement("ImageLabel", {
                    [u4.Ref] = u13,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u8.SOLID_BLURRED_7_POINT_STAR,
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.5,
                    ["ZIndex"] = 0
                }) }),
            ["KitContractBodyCenterRewardShowcase"] = u4.createElement(u7, {
                ["Reward"] = p9.Reward,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            })
        }
        v27.KitContractRewardShowcase = v28(v29, v23, v30)
        return v26(v27)
    end)
}