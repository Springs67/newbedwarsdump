-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    QueueUiBoard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local _ = p3.useState;
        local _ = p3.useEffect;
        local v4 = {
            StudsOffsetWorldSpace = Vector3.new(0, -3, -6.5),
            ResetOnSpawn = false,
            MaxDistance = 200,
            Adornee = p2.Adornee,
            Size = UDim2.fromScale(6, 3)
        };
        local v5 = {};
        local _ = #v5;
        local v6 = {
            BorderSizePixel = 1,
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(26, 26, 31)
        };
        local config = p2.config;

        if config ~= nil then
            config = config.noBackground;
        end;

        v6.BackgroundTransparency = config and 1 or 0.3;
        v5.Container = u1.createElement("Frame", v6, { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u1.createElement(p2.uiHook, p2.hookProps) });

        return u1.createFragment({
            QueueUiBoard = u1.createElement("BillboardGui", v4, v5)
        });
    end)
};