local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["QueueUiBoard"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        local _ = p4.useEffect
        local v5 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, -3, -6.5),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 200,
            ["Adornee"] = p3.Adornee,
            ["Size"] = UDim2.fromScale(6, 3)
        }
        local v6 = {}
        local _ = #v6
        local v7 = {
            ["BorderSizePixel"] = 1,
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(26, 26, 31)
        }
        local v8 = p3.config
        if v8 ~= nil then
            v8 = v8.noBackground
        end
        v7.BackgroundTransparency = v8 and 1 or 0.3
        v6.Container = u2.createElement("Frame", v7, { u2.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u2.createElement(p3.uiHook, p3.hookProps) })
        return u2.createFragment({
            ["QueueUiBoard"] = u2.createElement("BillboardGui", v5, v6)
        })
    end)
}