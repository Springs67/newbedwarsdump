-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local PlayerRender = v1.PlayerRender;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MurderGameConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    MurdererEliminationHighlight = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), BedwarsImageId (copy), PlayerRender (copy), ColorUtil (copy), MurderGameConstants (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = {
            Size = UDim2.fromScale(0.3, 1)
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local v7 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.04, 0)
            }) };
        local v8 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.5),
            PlayerUserId = p4.UserId,
            ImageTransparency = p4.IsVictim and 0.3 or 0
        };
        local v9 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local v10 = #v9;
        local v11 = p4.IsVictim and u2.createFragment({
            DeadIcon = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.6, 0.6),
                Position = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = BedwarsImageId.PIRATE_SKULL_ICON
            })
        });

        if v11 then
            v9[v10 + 1] = v11;
        end;

        v7[#v7 + 1] = u2.createElement(PlayerRender, v8, v9);
        v7.DisplayName = u2.createElement("TextLabel", {
            TextScaled = true,
            Font = "GothamBlack",
            TextXAlignment = "Center",
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.24),
            Text = p4.DisplayName,
            TextColor3 = ColorUtil.WHITE
        });
        v7.Role = u2.createElement("TextLabel", {
            TextScaled = true,
            Font = "GothamBlack",
            TextXAlignment = "Center",
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.14),
            Text = string.upper(p4.Role),
            TextColor3 = MurderGameConstants:getRoleColor(p4.Role)
        });

        return u2.createFragment({
            PlayerElimCard = u2.createElement(Empty, v6, v7)
        });
    end)
};