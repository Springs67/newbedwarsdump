-- Decompiled with Potassium's decompiler.

local Packages = require(script.Parent.Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);

return function(p1) -- Line: 9, Name: TopbarButton
    -- upvalues: Roact (copy)
    return Roact.createElement("TextButton", {
        AutoLocalize = false,
        TextColor3 = p1.Theme.Name == "Light" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1),
        Size = UDim2.fromOffset(0, 10),
        BackgroundColor3 = p1.Theme:GetColor("Item"),
        TextSize = 11,
        BorderSizePixel = 0,
        Font = Enum.Font.Code,
        Text = p1.Text,
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        LayoutOrder = p1.LayoutOrder,
        [Roact.Event.Activated] = p1.OnClick
    });
end;