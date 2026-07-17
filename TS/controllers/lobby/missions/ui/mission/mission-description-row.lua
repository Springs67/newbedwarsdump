-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    MissionDescriptionRow = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 10
        -- upvalues: u2 (copy), ColorUtil (copy), ImageId (copy), DeviceUtil (copy), StringUtil (copy)
        local function v5() -- Line: 12
            -- upvalues: u2 (ref), u3 (copy), ColorUtil (ref)
            return u2.createFragment({
                MissionDescription = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextSize = 20,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.6, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Text = "<b>" .. u3.Mission.description .. "</b>",
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.Roboto
                })
            });
        end;

        local function v9() -- Line: 28
            -- upvalues: u2 (ref), u3 (copy), ImageId (ref), DeviceUtil (ref), StringUtil (ref), ColorUtil (ref)
            local v6 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.4, 0),
                AutomaticSize = Enum.AutomaticSize.Y
            };
            local v7 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v8 = {};
            local reward = u3.Mission.reward;

            if reward ~= nil then
                reward = reward.icon;
            end;

            if reward == nil then
                reward = ImageId.TICKET;
            end;

            v8.Image = reward;
            v8.Size = UDim2.fromOffset(20, 20);
            v8.ScaleType = "Fit";
            v8.BackgroundTransparency = 1;
            v7[#v7 + 1] = u2.createElement("ImageLabel", v8);
            v7.MissionReward = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = 20,
                Size = UDim2.new(0, DeviceUtil.isSmallScreen() and 38 or 0, 0, 20),
                AutomaticSize = Enum.AutomaticSize.XY,
                Text = "<b>" .. StringUtil.formatNumberWithCommas(u3.Mission.rewardAmount) .. "</b>",
                TextXAlignment = Enum.TextXAlignment.Center,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            });

            return u2.createFragment({
                MissionRewardWrapper = u2.createElement("Frame", v6, v7)
            });
        end;

        return u2.createFragment({
            MissionDescriptionWrapper = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = Enum.AutomaticSize.Y
            }, { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u2.createElement(v5), u2.createElement(v9) })
        });
    end)
};