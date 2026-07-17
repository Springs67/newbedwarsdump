-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    StatsBoardHeader = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: Players (copy), u1 (copy), Theme (copy)
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.DisplayName;
        end;

        return u1.createElement("ImageLabel", {
            Image = "rbxassetid://7106394844",
            BorderSizePixel = 0,
            Size = p3.Size
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }),
            u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.075, 0),
                PaddingRight = UDim.new(0.075, 0)
            }),
            u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AutoLocalize = false,
                Text = (LocalPlayer == nil and "ology" or LocalPlayer) .. "\'s Stats",
                Size = UDim2.fromScale(1, 0.5),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            u1.createElement("TextLabel", {
                Text = "All-Time",
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.fromScale(1, 0.35),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Theme.textPrimary
            })
        });
    end)
};