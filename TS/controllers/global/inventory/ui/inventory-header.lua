-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;

return {
    InventoryHeader = v2.new(u1)(function(p3, p4) -- Line: 6
        -- upvalues: Workspace (copy), u1 (copy)
        local _ = p4.useState;

        return u1.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextXAlignment = "Left",
            Text = p3.Title,
            Size = UDim2.new(1, 0, 0, 0.03 * Workspace.CurrentCamera.ViewportSize.Y),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        });
    end)
};