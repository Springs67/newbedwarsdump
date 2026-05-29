local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["ProtectorWandTarget"] = v3.new(u2)(function(p5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local _ = p6.useState
        local v7 = p6.useEffect
        local u8 = u2.createRef()
        v7(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
            --]]
            local v9 = u8:getValue()
            if not v9 then
                return nil
            end
            local u10 = u4:Create(v9, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                ["Rotation"] = 360
            })
            u10:Play()
            return function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10:Destroy()
            end
        end, {})
        return u2.createElement("BillboardGui", {
            ["AlwaysOnTop"] = true,
            ["Size"] = p5.iconSize
        }, { u2.createElement("ImageLabel", {
                [u2.Ref] = u8,
                ["Image"] = p5.icon,
                ["ImageColor3"] = p5.iconColor,
                ["ImageTransparency"] = p5.hideIconFirstPerson == true and 1 or 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Visible"] = true,
                ["ScaleType"] = Enum.ScaleType.Fit
            }) })
    end)
}