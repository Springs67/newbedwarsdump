-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");

return {
    PingGuiObject = function(p2, p3, p4) -- Line: 5
        -- upvalues: ColorUtil (copy), u1 (copy)
        local v5 = {};
        local v6;

        if p4 == nil then
            v6 = p4;
        else
            v6 = p4.disableDistanceTracker;
        end;

        if not v6 then
            local v7 = {
                Name = "DistanceTracker",
                Text = ""
            };
            local v8;

            if p4 == nil then
                v8 = p4;
            else
                v8 = p4.disablePlayerAvatar;
            end;

            local v9;

            if p4 == nil then
                v9 = p4;
            else
                v9 = p4.disablePlayerAvatar;
            end;

            v7.Size = UDim2.fromScale(v8 and 0.7 or 0.6, v9 and 0.6 or 0.35);
            v7.AnchorPoint = Vector2.new(0, 0.5);
            local v10;

            if p4 == nil then
                v10 = p4;
            else
                v10 = p4.disablePlayerAvatar;
            end;

            v7.Position = UDim2.fromScale(0.9, v10 and 0.5 or 0.9);
            v7.TextScaled = true;
            v7.RichText = true;
            v7.Font = Enum.Font.Roboto;
            v7.TextColor3 = ColorUtil.WHITE;
            v7.BackgroundTransparency = 1;
            v7.Children = { u1("UIStroke", {
                    Color = ColorUtil.BLACK
                }) };
            local v11 = u1("TextLabel", v7);
            table.insert(v5, v11);
        end;

        if p4 ~= nil then
            p4 = p4.disablePlayerAvatar;
        end;

        if not p4 then
            local v12 = u1("ImageLabel", {
                Name = "PingCreatorAvatar",
                BackgroundTransparency = 1,
                Image = "",
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.9, 0.4),
                Size = UDim2.fromScale(0.5, 0.5),
                Children = { u1("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), u1("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }
            });
            table.insert(v5, v12);
        end;

        local v13 = {
            Name = "Container",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1)
        };
        local v14 = { u1("ImageLabel", {
                Name = "PingIcon",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 0.85),
                Size = UDim2.fromScale(0.6, 0.6),
                ImageColor3 = p3 or ColorUtil.WHITE,
                Image = p2
            }) };
        table.move(v5, 1, #v5, #v14 + 1, v14);
        v13.Children = v14;

        return u1("Frame", v13);
    end
};