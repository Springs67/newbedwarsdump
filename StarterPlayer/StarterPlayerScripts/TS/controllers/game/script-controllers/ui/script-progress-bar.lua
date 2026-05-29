local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["ScriptProgressBar"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v6 = p5.useState
        local v7 = p5.useEffect
        local v8, u9 = v6(u4.data.current)
        local v10, u11 = v6(u4.data.text)
        local v12, u13 = v6(u4.data.max)
        local v14, u15 = v6(u4.data.color)
        v7(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u4
                [3] = u13
                [4] = u15
                [5] = u11
            --]]
            u9(u4.data.current)
            u13(u4.data.max)
            u15(u4.data.color)
            u11(u4.data.text)
        end, {})
        local v16 = u3.createFragment
        local v17 = {}
        local v18 = u3.createElement
        local v19 = u2
        local v20 = {
            ["AcceptZero"] = true,
            ["Flip"] = false,
            ["AutoLocalize"] = false
        }
        local v21
        if u4.centered then
            v21 = Vector2.new(0.5, 0)
        else
            v21 = Vector2.new(0, 0)
        end
        v20.AnchorPoint = v21
        local v22
        if u4.centered then
            v22 = UDim2.fromScale(0.5, u4.row * 0.25)
        elseif u4.alignment == "R" then
            v22 = UDim2.fromScale(0.5, (u4.row - 1) * 0.25)
        else
            v22 = UDim2.fromScale(0, (u4.row - 1) * 0.25)
        end
        v20.Position = v22
        v20.Size = UDim2.fromScale(0.5, 0.25)
        local v23 = v8 / v12
        v20.Progress = math.clamp(v23, 0, 1)
        v20.BarColor = v14
        v20.BarBackgroundColor = Color3.fromRGB(0, 0, 0)
        local v24 = {}
        local v25 = v8 / v12 * 100
        local v26 = math.round(v25)
        local v27 = math.clamp(v26, 0, 100)
        v24.text = v10 .. " " .. tostring(v27) .. "%"
        v24.color = Color3.fromRGB(255, 255, 255)
        v20.Title = v24
        v17.ScriptProgressBar = v18(v19, v20)
        return v16(v17)
    end)
}