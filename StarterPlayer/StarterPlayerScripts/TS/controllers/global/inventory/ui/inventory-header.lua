local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
return {
    ["InventoryHeader"] = v3.new(u2)(function(p5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
        --]]
        local _ = p6.useState
        local v7 = u4.CurrentCamera.ViewportSize.Y
        return u2.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextXAlignment"] = "Left",
            ["Text"] = p5.Title,
            ["Size"] = UDim2.new(1, 0, 0, 0.03 * v7),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
    end)
}