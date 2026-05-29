local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ButtonComponent
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["MenuItem"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
        --]]
        local v8, u9 = p7.useState(false)
        local u10
        if u6.item.dangerous then
            u10 = u5.mcRed
        else
            u10 = u5.textPrimary
        end
        local u11
        if u6.item.dangerous then
            u11 = u5.mcRed
        else
            u11 = Color3.fromRGB(255, 255, 255)
        end
        local u12 = Color3.fromRGB(255, 255, 255)
        return u3.createElement(u2, {
            ["TextWrap"] = true,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 100,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, 30),
            ["Text"] = u6.item.text,
            ["OnClick"] = function() --[[ Name: OnClick, Line 16 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u9
                --]]
                u6.item.callback(u9)
                u6.closeMenu()
            end,
            ["TextColor3"] = u11,
            ["Loading"] = v8,
            ["CornerRadius"] = UDim.new(0, 3),
            ["OnEnter"] = function(p13) --[[ Name: OnEnter, Line 27 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u12
                --]]
                p13.BackgroundColor3 = u10
                p13.BackgroundTransparency = 0
                p13.TextColor3 = u12
            end,
            ["OnLeave"] = function(p14) --[[ Name: OnLeave, Line 32 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                p14.BackgroundColor3 = u11
                p14.BackgroundTransparency = 1
                p14.TextColor3 = u11
            end
        })
    end)
}