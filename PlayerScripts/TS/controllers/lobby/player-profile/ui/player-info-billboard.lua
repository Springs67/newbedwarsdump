-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;

return {
    PlayerInfoBillboard = v2.new(u1)(function(u3, p4) -- Line: 8
        -- upvalues: ColorUtil (copy), u1 (copy), Players (copy), KnitClient (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(u3.UserId) .. "&w=48&h=48";
        local v6 = {};
        local v8 = {
            Size = UDim2.fromOffset(210, 53),
            Position = UDim2.fromOffset(u3.ScreenPosition.X, u3.ScreenPosition.Y),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,

            [u1.Event.Activated] = function() -- Line: 22
                -- upvalues: Players (ref), u3 (copy), KnitClient (ref)
                local v7 = Players:GetPlayerByUserId(u3.UserId);

                if not v7 then
                    return nil;
                end;

                KnitClient.Controllers.PlayerProfileUIController:openPlayerProfile(v7);
            end
        };
        local v9 = {
            u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.9622641509433962
            }),
            u1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }),
            u1.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.04, 0.5),
                Image = v5
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            ActionName = u1.createElement("TextLabel", {
                Text = "VIEW PROFILE",
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.fromScale(0.7, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.SemiBold),
                TextXAlignment = Enum.TextXAlignment.Center
            })
        };
        local v10 = #v9;
        local v11;

        if u3.HelperText == nil then
            v11 = false;
        else
            v11 = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.fromScale(0.7, 0.4),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, -0.5),
                Text = u3.HelperText,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.SemiBold),
                TextXAlignment = Enum.TextXAlignment.Center
            }, { u1.createElement("UIStroke", {
                    Thickness = 1,
                    Color = Color3.fromRGB(0, 0, 0)
                }) });
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        v6[#v6 + 1] = u1.createElement("ImageButton", v8, v9);

        return u1.createFragment({
            PlayerInfo = u1.createElement("ScreenGui", {}, v6)
        });
    end)
};