local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
return {
    ["ScarabUIDisplay"] = v5.new(u4)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u4
            [4] = u2
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local u11, _ = v9(u3.new())
        local v12, u13 = v9("")
        v10(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u13
                [3] = u6
                [4] = u11
            --]]
            if u7.timer == nil then
                return nil
            end
            local u14 = true
            local function u19() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u7
                    [3] = u13
                    [4] = u6
                    [5] = u19
                --]]
                task.delay(1, function() --[[ Line: 20 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u7
                        [3] = u13
                        [4] = u6
                        [5] = u19
                    --]]
                    if u14 then
                        if u7.timer == nil or u7.timer == -1 then
                            u13("")
                            return nil
                        elseif u7.timer == (1 / 0) then
                            u13("Maxed")
                            return nil
                        else
                            local v15 = u7.timer - u6:GetServerTimeNow()
                            local v16 = v15 / 60
                            local v17 = math.floor(v16)
                            local v18 = v15 - v17 * 60
                            u19()
                            if v18 == 0 and v17 == 0 then
                                u13("")
                            else
                                u13(string.format("%02i", v17) .. ":" .. string.format("%02i", v18))
                            end
                        end
                    else
                        return nil
                    end
                end)
            end
            u19()
            u11:GiveTask(function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14 = false
            end)
            return function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14 = false
            end
        end)
        local v20 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v21 = { u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.667
            }), u4.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 2)
            }) }
        local v22 = #v21
        local v23 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v24 = u7.icon
        v23.Image = v24 == nil and "rbxassetid://15186577197" or v24
        v23.BackgroundTransparency = 1
        v21[v22 + 1] = u4.createElement("ImageLabel", v23, { u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v21[v22 + 2] = u4.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Font"] = "LuckiestGuy",
            ["TextYAlignment"] = "Center",
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = v12,
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u2.WHITE
        })
        return u4.createElement("Frame", v20, v21)
    end)
}