local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.StringUtil
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["MissionsListTimer"] = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(u6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u1
            [3] = u5
            [4] = u3
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10, u11 = v8("")
        local function u14() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u4
            --]]
            local v12 = u6.EndTime - os.time()
            local v13 = math.max(0, v12)
            return u4.formatCountdownTime(v13, {
                ["hours"] = true,
                ["days"] = true,
                ["seperator"] = " : "
            })
        end
        v9(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u11
                [3] = u14
            --]]
            local u15 = true
            u1.Promise.defer(function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u11
                    [3] = u14
                --]]
                while true do
                    local v16 = task.wait(0.2)
                    if v16 ~= 0 and (v16 == v16 and v16) then
                        v16 = u15
                    end
                    if v16 == 0 or (v16 ~= v16 or not v16) then
                        return
                    end
                    u11(u14())
                end
            end)
            return function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15 = false
                return u15
            end
        end, {})
        return u5.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.3,
            ["RichText"] = true,
            ["TextSize"] = 18,
            ["AnchorPoint"] = u6.AnchorPoint,
            ["Position"] = u6.Position,
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Text"] = "<b>Expires in " .. v10 .. "</b>",
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextColor3"] = u3.WHITE,
            ["Font"] = Enum.Font.Roboto
        })
    end)
}