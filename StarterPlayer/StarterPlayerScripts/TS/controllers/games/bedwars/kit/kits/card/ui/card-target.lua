local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["CardTarget"] = v3.new(u2)(function(_, p5) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local _ = p5.useState
        local v6 = p5.useEffect
        local u7 = u2.createRef()
        v6(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
            --]]
            local v8 = u7:getValue()
            if not v8 then
                return nil
            end
            local u9 = u4:Create(v8, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                ["Rotation"] = 360
            })
            u9:Play()
            return function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                u9:Destroy()
            end
        end, {})
        return u2.createElement("BillboardGui", {
            ["AlwaysOnTop"] = true,
            ["Size"] = UDim2.new(10, 10, 10, 10)
        }, { u2.createElement("ImageLabel", {
                [u2.Ref] = u7,
                ["Image"] = "rbxassetid://13805903317",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Visible"] = true,
                ["ScaleType"] = Enum.ScaleType.Fit
            }) })
    end)
}