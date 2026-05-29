local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = v1.import(script, script.Parent, "battle-pass-reward-info-card").BattlePassRewardInfoCard
local u10 = v1.import(script, script.Parent, "battle-pass-reward-showcase").BattlePassRewardShowcase
return {
    ["BattlePassRewardShowcaseContainer"] = v5.new(u4)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u6
            [4] = u7
            [5] = u8
            [6] = u2
            [7] = u10
            [8] = u9
        --]]
        local _ = p12.useState
        local v13 = p12.useEffect
        local u14 = u4.createRef()
        v13(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u14
                [3] = u6
            --]]
            local u15 = u3.new()
            local u16 = u14:getValue()
            if u16 then
                u15:GiveTask(u6.Heartbeat:Connect(function(p17) --[[ Line: 21 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    u16.Rotation = (u16.Rotation + 45 * p17) % 360
                end))
            end
            return function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:DoCleaning()
            end
        end, {})
        local v18 = u7.getRewardThemeColor(p11.Reward) or u8.backgroundPrimary
        local v19
        if v18 == u8.backgroundPrimary or v18 == u8.backgroundTertiary then
            v19 = ColorSequence.new({ ColorSequenceKeypoint.new(0, v18), ColorSequenceKeypoint.new(1, u2.brighten(v18, 0.2)) })
        else
            v19 = ColorSequence.new({ ColorSequenceKeypoint.new(0, u2.darken(v18, 0.6)), ColorSequenceKeypoint.new(1, u2.brighten(v18, 0.1)) })
        end
        return u4.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = p11.Size or UDim2.new(0.32, -10, 1, 0),
            ["BackgroundColor3"] = u2.WHITE
        }, {
            u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            u4.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u2.brighten(v18, 0.25)
            }, { u4.createElement("UIGradient", {
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 0), NumberSequenceKeypoint.new(1, 1) }),
                    [u4.Ref] = u14
                }) }),
            u4.createElement("UIGradient", {
                ["Rotation"] = 45,
                ["Color"] = v19
            }),
            u4.createElement(u10, {
                ["LayoutOrder"] = 2,
                ["Reward"] = p11.Reward,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.4),
                ["Size"] = UDim2.new(0.8, 0, 0.8, 0)
            }),
            u4.createElement(u9, {
                ["LayoutOrder"] = 3,
                ["Reward"] = p11.Reward,
                ["BattlePass"] = p11.BattlePass,
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Size"] = UDim2.new(1, 0, 0.3, 0)
            })
        })
    end)
}