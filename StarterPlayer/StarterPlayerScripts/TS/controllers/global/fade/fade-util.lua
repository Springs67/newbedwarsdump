local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.TweenService
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "FadeUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 21 ]] end
function u6.fade(_, u9, u10, u11, u12, u13) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u4
        [4] = u5
    --]]
    return u1.Promise.new(function(u14) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u13
            [4] = u4
            [5] = u5
            [6] = u9
            [7] = u10
            [8] = u11
        --]]
        local u15 = u2("Frame", {
            ["BorderSizePixel"] = 0,
            ["Transparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u12 or Color3.fromRGB(0, 0, 0)
        })
        if u13 then
            u2("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["Text"] = u13.text,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["TextColor3"] = u13.color,
                ["Font"] = u13.font
            }).Parent = u15
        end
        local u16 = u2("ScreenGui", {
            ["Name"] = "FadeScreenGui",
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true,
            ["Parent"] = u4.LocalPlayer:WaitForChild("PlayerGui"),
            ["Children"] = { u15 }
        })
        local v17 = u5:Create(u15, TweenInfo.new(u9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["Transparency"] = 0
        })
        v17:Play()
        local u18 = nil
        u18 = v17.Completed:Connect(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u10
                [3] = u5
                [4] = u15
                [5] = u11
                [6] = u16
                [7] = u14
            --]]
            u18:Disconnect()
            task.delay(u10, function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u15
                    [3] = u11
                    [4] = u16
                    [5] = u14
                --]]
                local v19 = u5:Create(u15, TweenInfo.new(u11, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    ["Transparency"] = 1
                })
                v19:Play()
                local u20 = nil
                u20 = v19.Completed:Connect(function() --[[ Line: 68 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u16
                        [3] = u14
                    --]]
                    u20:Disconnect()
                    u16:Destroy()
                    u14()
                end)
            end)
        end)
    end)
end
return {
    ["FadeUtil"] = u6
}