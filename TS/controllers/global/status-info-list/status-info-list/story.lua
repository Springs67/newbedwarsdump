-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local StarCollectorDisplay = RuntimeLib.import(script, script.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "star-collector", "ui", "star-collector-display").StarCollectorDisplay;
local StatusInfoList = RuntimeLib.import(script, script.Parent, "status-info-list").StatusInfoList;

return function(p3) -- Line: 8
    -- upvalues: u2 (copy), u1 (copy), StatusInfoList (copy), StarCollectorDisplay (copy), ColorUtil (copy)
    local u4 = nil;
    local u5 = u2.new();
    local u7 = u1.mount(u1.createElement(StatusInfoList, {
        SetupRef = function(p6) -- Line: 12, Name: SetupRef
            -- upvalues: u4 (ref), u5 (copy)
            u4 = p6;
            u5:Fire(p6);
        end
    }), p3);
    local u8 = {};
    local u12 = u5:Connect(function(p9) -- Line: 19
        -- upvalues: u8 (copy), u1 (ref), StarCollectorDisplay (ref), ColorUtil (ref)
        local v10 = u1.mount(u1.createElement(StarCollectorDisplay, {
            greenStars = 0,
            yellowStars = 11
        }), p9);
        table.insert(u8, v10);
        local v11 = u1.mount(u1.createElement("TextLabel", {
            Text = "TEST",
            BackgroundColor3 = ColorUtil.BLACK,
            Size = UDim2.fromScale(1, 1),
            TextColor3 = ColorUtil.WHITE
        }), p9);
        table.insert(u8, v11);
    end);

    return function() -- Line: 35
        -- upvalues: u1 (ref), u7 (copy), u8 (copy), u12 (copy)
        u1.unmount(u7);

        local function _(p13) -- Line: 38
            -- upvalues: u1 (ref)
            u1.unmount(p13);
        end;

        for i, v in u8 do
            local _ = i - 1;
            u1.unmount(v);
        end;

        u12:Disconnect();
    end;
end;