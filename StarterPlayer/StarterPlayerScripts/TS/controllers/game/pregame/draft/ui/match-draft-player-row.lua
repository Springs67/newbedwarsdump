local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u7 = v1.import(script, script.Parent, "match-draft-ban-box").MatchDraftBanBox
local u8 = v1.import(script, script.Parent, "match-draft-player-card").MatchDraftPlayerCard
return {
    ["MatchDraftPlayerRow"] = v5.new(u4)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u6
            [4] = u8
            [5] = u2
            [6] = u7
        --]]
        local v11 = p10.useEffect
        local v12 = u9.HighlightConfig
        if v12 ~= nil then
            v12 = v12.Mode
        end
        local v13 = (v12 == nil and "LEFT" or v12) == "LEFT"
        local v14 = v13 and 1 or 0
        local u15 = u4.createRef()
        local function v21() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u15
                [3] = u3
                [4] = u6
            --]]
            local v16 = u9.HighlightConfig
            if v16 ~= nil then
                v16 = v16.DisableAnimation
            end
            if v16 then
                return nil
            end
            local u17 = u15:getValue()
            if not u17 then
                return nil
            end
            local u18 = u3.new()
            local u19 = u6:Create(u17, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0
            })
            local u20 = u6:Create(u17, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0.75
            })
            u18:GiveTask(u19.Completed:Connect(function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u20
                --]]
                u18:GiveTask(task.delay(0.5, function() --[[ Line: 43 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    u20:Play()
                end))
            end))
            u18:GiveTask(function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19:Cancel()
                u19:Destroy()
            end)
            u18:GiveTask(u20.Completed:Connect(function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u19
                --]]
                u18:GiveTask(task.delay(0.5, function() --[[ Line: 52 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    u19:Play()
                end))
            end))
            u18:GiveTask(function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:Cancel()
                u20:Destroy()
            end)
            u19:Play()
            return function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u17
                --]]
                u18:Destroy()
                u17.Transparency = 0
            end
        end
        local v22 = u9.HighlightConfig
        if v22 ~= nil then
            v22 = v22.DisableAnimation
        end
        local v23 = u9.HighlightConfig
        if v23 ~= nil then
            v23 = v23.Color
        end
        local v24 = u9.HighlightConfig
        if v24 ~= nil then
            v24 = v24.Hide
        end
        local v25 = u9.HighlightConfig
        if v25 ~= nil then
            v25 = v25.Mode
        end
        v11(v21, {
            v22,
            v23,
            v24,
            v25
        })
        local v26 = {
            ["Size"] = u9.Size or UDim2.fromScale(1, 0.18),
            ["LayoutOrder"] = u9.LayoutOrder
        }
        local v27 = {}
        local v28 = #v27
        local v29 = u9.HighlightConfig
        if v29 ~= nil then
            v29 = v29.Hide
        end
        local v30 = not v29
        if v30 then
            local v31 = {
                ["Size"] = UDim2.fromScale(2, 1),
                ["AnchorPoint"] = Vector2.new(v14, 0),
                ["Position"] = UDim2.fromScale(v14, 0)
            }
            local v32 = u9.HighlightConfig
            if v32 ~= nil then
                v32 = v32.Color
            end
            if v32 == nil then
                v32 = Color3.fromRGB(255, 255, 255)
            end
            v31.BackgroundColor3 = v32
            v31[u4.Ref] = u15
            v30 = u4.createElement("Frame", v31, { u4.createElement("UIGradient", {
                    ["Rotation"] = v13 and 180 or 0,
                    ["Transparency"] = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.5),
                        NumberSequenceKeypoint.new(0.5, 0.5),
                        NumberSequenceKeypoint.new(0.6, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }) })
        end
        local v33 = {
            ["Size"] = UDim2.fromScale(0.825, 1)
        }
        local v34 = {}
        local v35 = #v34
        if v30 then
            v34[v35 + 1] = v30
        end
        v34[#v34 + 1] = u4.createElement(u8, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["CardData"] = u9.CardData
        })
        v27[v28 + 1] = u4.createElement(u2, v33, v34)
        local v36 = not u9.HideBanBox
        if v36 then
            v36 = u4.createElement(u7, {
                ["Size"] = UDim2.fromScale(0.175, 0.85),
                ["Position"] = UDim2.fromScale(0.87, 0.45),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["BanData"] = u9.BanData
            })
        end
        if v36 then
            v27[v28 + 2] = v36
        end
        return u4.createFragment({
            ["MatchDraftPlayerRow"] = u4.createElement(u2, v26, v27)
        })
    end)
}