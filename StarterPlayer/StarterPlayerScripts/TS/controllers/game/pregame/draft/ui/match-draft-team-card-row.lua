local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u7 = v1.import(script, script.Parent, "match-draft-team-card").MatchDraftTeamCard
return {
    ["MatchDraftTeamCardRow"] = v5.new(u4)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u6
            [4] = u7
            [5] = u2
        --]]
        local _ = p9.useState
        local v10 = p9.useEffect
        local u11 = u4.createRef()
        local function v17() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u11
                [3] = u3
                [4] = u6
            --]]
            local v12 = u8.HighlightConfig
            if v12 ~= nil then
                v12 = v12.DisableAnimation
            end
            if v12 then
                return nil
            end
            local u13 = u11:getValue()
            if not u13 then
                return nil
            end
            local u14 = u3.new()
            local u15 = u6:Create(u13, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0
            })
            local u16 = u6:Create(u13, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0.75
            })
            u14:GiveTask(u15.Completed:Connect(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u16
                --]]
                u14:GiveTask(task.delay(0.5, function() --[[ Line: 33 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    u16:Play()
                end))
            end))
            u14:GiveTask(function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:Cancel()
                u15:Destroy()
            end)
            u14:GiveTask(u16.Completed:Connect(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u15
                --]]
                u14:GiveTask(task.delay(0.5, function() --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                    --]]
                    u15:Play()
                end))
            end))
            u14:GiveTask(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:Cancel()
                u16:Destroy()
            end)
            u15:Play()
            return function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u13
                --]]
                u14:Destroy()
                u13.Transparency = 0
            end
        end
        local v18 = u8.HighlightConfig
        if v18 ~= nil then
            v18 = v18.DisableAnimation
        end
        local v19 = u8.HighlightConfig
        if v19 ~= nil then
            v19 = v19.Color
        end
        local v20 = u8.HighlightConfig
        if v20 ~= nil then
            v20 = v20.Hide
        end
        v10(v17, { v18, v19, v20 })
        local v21 = {
            ["Size"] = u8.Size or UDim2.fromScale(1, 0.18),
            ["LayoutOrder"] = u8.LayoutOrder
        }
        local v22 = {}
        local v23 = #v22
        local v24 = u8.HighlightConfig
        if v24 ~= nil then
            v24 = v24.Hide
        end
        local v25 = not v24
        if v25 then
            local v26 = {
                ["Size"] = UDim2.fromScale(1.75, 1),
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0, 0)
            }
            local v27 = u8.HighlightConfig
            if v27 ~= nil then
                v27 = v27.Color
            end
            if v27 == nil then
                v27 = Color3.fromRGB(255, 255, 255)
            end
            v26.BackgroundColor3 = v27
            v26[u4.Ref] = u11
            v25 = u4.createElement("Frame", v26, { u4.createElement("UIGradient", {
                    ["Transparency"] = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.5),
                        NumberSequenceKeypoint.new(0.5, 0.5),
                        NumberSequenceKeypoint.new(0.6, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }) })
        end
        local v28 = {
            ["Size"] = UDim2.fromScale(0.825, 1)
        }
        local v29 = {}
        local v30 = #v29
        if v25 then
            v29[v30 + 1] = v25
        end
        local v31 = #v29
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        for v33, v34 in u8.CardData do
            v32[v33] = v34
        end
        v29[v31 + 1] = u4.createElement(u7, v32)
        v22[v23 + 1] = u4.createElement(u2, v28, v29)
        return u4.createFragment({
            ["MatchDraftTeamCardRow"] = u4.createElement(u2, v21, v22)
        })
    end)
}