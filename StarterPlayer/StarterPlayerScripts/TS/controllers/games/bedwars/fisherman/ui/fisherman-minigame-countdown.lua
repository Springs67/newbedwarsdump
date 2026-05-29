local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "fisherman", "fisherman-util").FishermanUtil
return {
    ["FishermanMinigameCountdown"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10 = u6.Duration
        if v10 == nil then
            v10 = u5.minigameDuration
        end
        local u11, u12 = v8(v10)
        v9(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u5
                [3] = u11
                [4] = u12
            --]]
            local u13 = true
            task.spawn(function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u13
                    [4] = u11
                    [5] = u12
                --]]
                local v14 = u6.Duration
                if v14 == nil then
                    v14 = u5.minigameDuration
                end
                while u13 and not u6.GameOver do
                    if v14 == 0 then
                        local v15 = u6
                        local v16 = u6.Duration
                        if v16 == nil then
                            v16 = u5.minigameDuration
                        end
                        v15.HandleRanOutOfTime(v16 - u11)
                        u13 = false
                    end
                    local v17
                    if u13 and not u6.GameOver then
                        v17 = v14 - 1
                        u12(v14)
                    else
                        v17 = v14
                    end
                    task.wait(1)
                    v14 = v17
                end
            end)
            return function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13 = false
            end
        end, { u6.GameOver })
        local v18 = u3.createFragment
        local v19 = {
            ["CountdownTimer"] = u3.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 1,
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(1, 0),
                ["Size"] = UDim2.fromScale(0, 1),
                ["BackgroundColor3"] = u2.BLACK,
                ["TextColor3"] = u2.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["Text"] = "\226\140\155 " .. tostring(u11)
            }, { u3.createElement("UIStroke", {
                    ["Transparency"] = 0.2,
                    ["Thickness"] = 1,
                    ["Color"] = u2.BLACK
                }) })
        }
        return v18(v19)
    end)
}