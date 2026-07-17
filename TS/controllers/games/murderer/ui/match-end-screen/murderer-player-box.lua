-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local PlayerRender = v1.PlayerRender;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MurderGameRole = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole;
local MurderGameConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    MurdererPlayerBox = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), BedwarsImageId (copy), MurderGameRole (copy), ColorUtil (copy), MurderGameConstants (copy), PlayerRender (copy)
        local _ = p5.useState;
        local v6 = {
            BorderSizePixel = 0,
            PlayerUserId = p4.UserId,
            BackgroundColor3 = Color3.fromRGB(51, 51, 51),
            ImageTransparency = p4.IsDead and 0.75 or 0
        };
        local v7 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v8 = #v7;
        local v9 = p4.IsDead and u2.createFragment({
            DeadIcon = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 11,
                Size = UDim2.fromScale(0.4, 0.4),
                Position = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = BedwarsImageId.PIRATE_SKULL_ICON
            })
        });

        if v9 then
            v7[v8 + 1] = v9;
        end;

        local v10 = #v7;
        local v11;

        if p4.Role == MurderGameRole.MURDERER then
            v11 = u2.createElement("TextLabel", {
                TextScaled = true,
                TextXAlignment = "Center",
                Font = "GothamBlack",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.8, 0.2),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.05),
                Text = tostring(p4.NumElims) .. " KILLS",
                TextColor3 = ColorUtil.WHITE
            });
        else
            v11 = false;
        end;

        if v11 then
            v7[v10 + 1] = v11;
        end;

        v7[#v7 + 1] = u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.1),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            BackgroundColor3 = MurderGameConstants:getRoleColor(p4.Role)
        });

        return u2.createElement(PlayerRender, v6, v7);
    end)
};