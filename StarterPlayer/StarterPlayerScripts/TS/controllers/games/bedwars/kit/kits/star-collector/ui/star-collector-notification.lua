local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.UIUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["StarCollectorNotification"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u9
            [4] = u4
            [5] = u3
            [6] = u6
        --]]
        local v12 = p11.useEffect
        local v13, u14 = p11.useBinding(1)
        local v16 = v13:map(function(p15) --[[ Line: 15 ]]
            return 0.4 * p15 + 0.6
        end)
        v12(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u8
                [3] = u5
                [4] = u14
            --]]
            local u24 = task.spawn(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u8
                    [3] = u5
                    [4] = u14
                --]]
                local v17 = u10.fadeTime
                u8(v17 == nil and 0.5 or v17, u5, function(p18) --[[ Line: 24 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    u14(p18)
                end, 1, 0):Wait()
                local v19 = task
                local v20 = u10.duration
                local v21 = v20 == nil and 2 or v20
                v19.wait(v21)
                local v22 = u10.fadeTime
                u8(v22 == nil and 0.5 or v22, u5, function(p23) --[[ Line: 37 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    u14(p23)
                end, 0, 1)
            end)
            return function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                task.cancel(u24)
            end
        end)
        local v25 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["LayoutOrder"] = u9.abilityActionBarPriority,
            ["Position"] = u4:getActionBarPosition(),
            ["Text"] = u10.text,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.ExtraBold),
            ["TextColor3"] = u10.textColor3 or u3.WHITE,
            ["TextStrokeColor3"] = u10.textStrokeColor3 or Color3.fromRGB(0, 0, 0),
            ["TextTransparency"] = v13,
            ["Size"] = u10.size or u9.actionBarButtonSize
        }
        local v26 = { u6.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Transparency"] = v16
            }) }
        local v27 = #v26
        local v28 = u10.textColorGradient
        if v28 then
            v28 = u6.createElement("UIGradient", {
                ["Rotation"] = -87,
                ["Color"] = u10.textColorGradient
            })
        end
        if v28 then
            v26[v27 + 1] = v28
        end
        return u6.createElement("TextLabel", v25, v26)
    end)
}