-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    AchievementsSidebarTop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: ColorUtil (copy), u1 (copy)
        local _ = p3.useState;
        local v4 = {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.02)
        };
        local FrameProps = p2.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v4[i] = v;
            end;
        end;

        local v5 = {};
        local _ = #v5;
        local v6 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v7;

        if p2.DateAchieved == nil or not p2.Achieved then
            v7 = "Not yet achieved";
        else
            local DateAchieved = p2.DateAchieved;
            v7 = "Achieved " .. ((DateAchieved == "" or not DateAchieved) and "" or p2.DateAchieved);
        end;

        v6.Text = v7;
        v6.TextScaled = true;
        v6.Font = Enum.Font.Roboto;
        v6.TextColor3 = ColorUtil.WHITE;
        v6.BackgroundTransparency = 1;
        v6.TextXAlignment = Enum.TextXAlignment.Right;
        v6.LayoutOrder = 0;
        v6.ZIndex = 10;
        v5.AchievementDate = u1.createElement("TextLabel", v6);

        return u1.createFragment({
            SidebarTop = u1.createElement("Frame", v4, v5)
        });
    end)
};