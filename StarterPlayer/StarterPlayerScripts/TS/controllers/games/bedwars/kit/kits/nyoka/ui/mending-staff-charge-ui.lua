local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["MendingStaffChargeApp"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local v6 = p5.useState
        local v7 = p5.useEffect
        local v8 = u4.staff:GetAttribute("StaffCharge")
        local v9, u10 = v6(v8 == nil and 0 or v8)
        v7(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u4
                [3] = u10
            --]]
            local u11 = u2.new()
            u11:GiveTask(u4.staff:GetAttributeChangedSignal("StaffCharge"):Connect(function() --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u10
                --]]
                local v12 = u4.staff:GetAttribute("StaffCharge")
                u10(v12 == nil and 0 or v12)
            end))
            return function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11:DoCleaning()
            end
        end, {})
        local v13 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v14 = { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.667
            }), u3.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 2)
            }) }
        local v15 = #v14
        local v16 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v17 = u4.icon
        v16.Image = v17 == nil and "rbxassetid://15186577197" or v17
        v16.BackgroundTransparency = 1
        v14[v15 + 1] = u3.createElement("ImageLabel", v16, { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v14[v15 + 2] = u3.createElement("TextLabel", {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = tostring(v9) .. "%",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.3
            }) })
        return u3.createElement("Frame", v13, v14)
    end)
}