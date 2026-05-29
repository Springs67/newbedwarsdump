local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v9 = v3.new(u2)(function(u5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v6 = u2.createElement
    local v8 = {
        ["CloseHitbox"] = u2.createElement("TextButton", {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = "",
            ["AutoButtonColor"] = false,
            ["Active"] = true,
            ["Selectable"] = false,
            [u2.Event.MouseButton1Click] = function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u5
                --]]
                local v7 = u5.OnClose
                if v7 ~= nil then
                    v7 = v7()
                end
                return v7
            end
        })
    }
    return v6("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["ClipToDeviceSafeArea"] = false,
        ["DisplayOrder"] = 101
    }, v8)
end)
return {
    ["LockerPreviewPlainBackground"] = v4.connect(function() --[[ Line: 32 ]]
        return {}
    end)(v9)
}