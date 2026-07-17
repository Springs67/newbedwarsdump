-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = v2.new(u1)(function(u4) -- Line: 6
    -- upvalues: u1 (copy)
    return u1.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ClipToDeviceSafeArea = false,
        DisplayOrder = 101
    }, {
        CloseHitbox = u1.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Active = true,
            Selectable = false,

            [u1.Event.MouseButton1Click] = function() -- Line: 21
                -- upvalues: u4 (copy)
                local OnClose = u4.OnClose;

                if OnClose ~= nil then
                    OnClose = OnClose();
                end;

                return OnClose;
            end
        })
    });
end);

return {
    LockerPreviewPlainBackground = v3.connect(function() -- Line: 32
        return {};
    end)(v5)
};