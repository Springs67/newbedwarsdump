-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u11 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
    -- upvalues: DeviceUtil (copy), u2 (copy), Empty (copy)
    local _ = p4.useState;
    local v5 = UDim2.fromScale(0.98, 0.03);
    local v6 = UDim2.fromScale(0.99, 0.01);
    local v7 = {
        Size = UDim2.fromScale(0.2, 1)
    };

    if not DeviceUtil.isMobileControls() then
        v5 = v6;
    end;

    v7.Position = v5;
    v7.AnchorPoint = Vector2.new(1, 0);
    local v8 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Right",
            Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 2 or 5)
        }) };
    local v9 = #v8;
    local v10 = p3[u2.Children];

    if v10 then
        for i, v in v10 do
            if type(i) == "number" then
                v8[v9 + i] = v;
            else
                v8[i] = v;
            end;
        end;
    end;

    return u2.createFragment({
        KillFeedContainer = u2.createElement(Empty, v7, v8)
    });
end);

return {
    KillFeedWrapper = function(p12) -- Line: 40, Name: KillFeedWrapper
        -- upvalues: u2 (copy), u11 (copy)
        return u2.createFragment({
            KillFeedGui = u2.createElement("ScreenGui", {
                ResetOnSpawn = false,
                DisplayOrder = 20
            }, { u2.createElement(u11) })
        });
    end,

    KillFeed = u11
};