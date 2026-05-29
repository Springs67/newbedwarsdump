local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.StringUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
return {
    ["NumberCounter"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u5
            [4] = u4
            [5] = u3
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local u13, u14 = v11(0)
        local u15 = u6.createRef()
        v12(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u9
                [3] = u8
                [4] = u5
                [5] = u4
                [6] = u13
                [7] = u14
            --]]
            local u16 = u15:getValue()
            if not u16 then
                return nil
            end
            local v17 = u9.AnimationSpeed
            u8(v17 == nil and 0.5 or v17, u5, function(p18) --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u4
                --]]
                local v19 = u16
                local v20 = u4.formatNumberWithCommas
                local v21 = u4.roundNumber
                v19.Text = v20((tonumber(v21(p18, 0))))
            end, u13, u9.Value)
            u14(u9.Value)
        end, { u9.Value })
        local v22 = {
            ["Text"] = "0",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.7, 1),
            ["TextColor3"] = u3.WHITE,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        }
        local v23 = u9.TextLabelProps
        if v23 then
            for v24, v25 in v23 do
                v22[v24] = v25
            end
        end
        v22[u6.Ref] = u15
        return u6.createElement("TextLabel", v22)
    end)
}