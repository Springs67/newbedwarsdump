local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["LanternFlicker"] = v4.new(u3)(function(_, p6) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
        --]]
        local _ = p6.useState
        local v7 = p6.useEffect
        local u8 = u3.createRef()
        v7(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u2
            --]]
            local u9 = u8:getValue()
            if not u9 then
                return nil
            end
            local u10 = u2.new()
            local u11 = 0.5
            u10:GiveTask(task.spawn(function() --[[ Line: 18 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u9
                --]]
                while true do
                    local v12 = task.wait(0.05)
                    if v12 == 0 or (v12 ~= v12 or not v12) then
                        break
                    end
                    u11 = u11 + (math.random() - 0.5 < 0 and 0.05 or -0.05)
                    local v13 = u11
                    u11 = math.clamp(v13, 0.4, 0.6)
                    u9.ImageTransparency = u11
                end
            end))
            return function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10:Destroy()
            end
        end, {})
        return u3.createElement("BillboardGui", {
            ["Size"] = UDim2.fromScale(10, 10)
        }, { u3.createElement("ImageLabel", {
                [u3.Ref] = u8,
                ["ImageColor3"] = Color3.fromRGB(255, 204, 153),
                ["ImageTransparency"] = 1,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u5.SOLID_BLURRED_CIRCLE,
                ["BackgroundTransparency"] = 1
            }) })
    end)
}