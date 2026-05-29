local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["RPSResult"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u7
            [4] = u3
            [5] = u2
        --]]
        local _ = p9.useState
        local v10 = p9.useEffect
        local u11 = u5.createRef()
        v10(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u4
                [3] = u7
                [4] = u3
                [5] = u5
            --]]
            local v12 = u11:getValue()
            if not v12 then
                return nil
            end
            local u13 = u4.new()
            u7:Create(v12, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 3, 0)
            }):Play()
            u7:Create(v12, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                ["Size"] = UDim2.fromScale(1.5, 1.5)
            }):Play()
            local u14 = u7:Create(v12, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 2.5, 0)
            })
            local u15 = u7:Create(v12, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                ["Size"] = UDim2.fromScale(0, 0)
            })
            task.delay(3, function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u14
                    [3] = u15
                    [4] = u13
                    [5] = u5
                --]]
                local u16 = u3.Controllers.RockPaperScissorsHandlerController.rpsTree
                if u16 then
                    u14:Play()
                    u15:Play()
                    u13:GiveTask(u15.Completed:Connect(function() --[[ Line: 39 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u16
                        --]]
                        u5.unmount(u16)
                    end))
                end
            end)
            return function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13:DoCleaning()
            end
        end, {})
        local v17 = u5.createFragment
        local v18 = {}
        local v19 = u5.createElement
        local v20 = {
            ["Size"] = UDim2.fromScale(0, 0),
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 2.5, 0),
            ["Adornee"] = p8.Character.Head,
            [u5.Ref] = u11
        }
        local v21 = {}
        local v22 = u5.createElement
        local v23 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u2.WHITE
        }
        local v24 = {
            u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["Result"] = u5.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = p8.ResultImage,
                ["ImageColor3"] = Color3.fromRGB(51, 51, 51)
            })
        }
        v21.RockPaperScissorsEmoteResult = v22("Frame", v23, v24)
        v18.RockPaperScissorsEmoteGui = v19("BillboardGui", v20, v21)
        return v17(v18)
    end)
}