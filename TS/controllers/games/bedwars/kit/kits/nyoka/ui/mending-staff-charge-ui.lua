-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    MendingStaffChargeApp = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 6
        -- upvalues: u1 (copy), u2 (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5 = u3.staff:GetAttribute("StaffCharge");
        local v6, u7 = useState(v5 == nil and 0 or v5);
        useEffect(function() -- Line: 14
            -- upvalues: u1 (ref), u3 (copy), u7 (copy)
            local u8 = u1.new();
            u8:GiveTask(u3.staff:GetAttributeChangedSignal("StaffCharge"):Connect(function() -- Line: 16
                -- upvalues: u3 (ref), u7 (ref)
                local v9 = u3.staff:GetAttribute("StaffCharge");
                u7(v9 == nil and 0 or v9);
            end));

            return function() -- Line: 24
                -- upvalues: u8 (copy)
                u8:DoCleaning();
            end;
        end, {});
        local v10 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2, 1)
        };
        local v11 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.667
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 2)
            }) };
        local v12 = #v11;
        local v13 = {
            Size = UDim2.fromScale(1, 1)
        };
        local icon = u3.icon;
        v13.Image = icon == nil and "rbxassetid://15186577197" or icon;
        v13.BackgroundTransparency = 1;
        v11[v12 + 1] = u2.createElement("ImageLabel", v13, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v11[v12 + 2] = u2.createElement("TextLabel", {
            Font = "LuckiestGuy",
            TextScaled = true,
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            Text = tostring(v6) .. "%",
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.3
            }) });

        return u2.createElement("Frame", v10, v11);
    end)
};