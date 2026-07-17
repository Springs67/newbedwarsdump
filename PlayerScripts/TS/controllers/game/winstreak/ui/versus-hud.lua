-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render");
local BWPlayerRender = v4.BWPlayerRender;
local PlayerRenderFallbackMode = v4.PlayerRenderFallbackMode;

return {
    VersusHud = v3.new(u2)(function(p5, p6) -- Line: 12
        -- upvalues: DeviceUtil (copy), u2 (copy), Empty (copy), ColorUtil (copy), BWPlayerRender (copy), PlayerRenderFallbackMode (copy)
        local _ = p6.useState;
        local _ = p6.useEffect;
        local v7 = DeviceUtil.isMobileControls();

        local function v17(p8) -- Line: 16
            -- upvalues: u2 (ref), Empty (ref), ColorUtil (ref), BWPlayerRender (ref), PlayerRenderFallbackMode (ref)
            local v9 = {
                Size = UDim2.fromScale(0.3, 1)
            };
            local FrameProps = p8.TeamInfo.FrameProps;

            if FrameProps then
                for i, v in FrameProps do
                    v9[i] = v;
                end;
            end;

            local v10 = { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 2.4074074074074074
                }), u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0.1, 0)
                }) };
            local v11 = #v10;
            local v12 = p8.TeamInfo.stat and u2.createFragment({
                StatWrapper = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.25)
                }, {
                    u2.createElement(
                        "UIListLayout",
                        {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder"
                        }
                    ),
                    Icon = u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1),
                        Image = p8.TeamInfo.stat.icon
                    }),
                    Value = u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0, 1),
                        Text = tostring(p8.TeamInfo.stat.value),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UIStroke") })
                })
            });

            if v12 then
                v10[v11 + 1] = v12;
            end;

            local _ = #v10;
            local v13 = {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.65),
                BackgroundColor3 = p8.TeamInfo.teamColor
            };
            local v14 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }) };
            local v15 = #v14;
            local v16;

            if p8.TeamInfo.offlinePlayer == nil then
                v16 = false;
            else
                v16 = u2.createElement(BWPlayerRender, {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(p8.RightIcon and 1 or -0, 0.5),
                    AnchorPoint = Vector2.new(p8.RightIcon and 0 or 1, 0.5),
                    Size = UDim2.fromScale(2, 2),
                    PlayerUserId = p8.TeamInfo.offlinePlayer.userId,
                    FallbackMode = PlayerRenderFallbackMode.KIT,
                    PlayerThumbnail = {
                        Type = Enum.ThumbnailType.AvatarThumbnail,
                        Size = Enum.ThumbnailSize.Size420x420
                    }
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
            end;

            if v16 then
                v14[v15 + 1] = v16;
            end;

            local _ = #v14;
            v14.TeamName = u2.createElement("TextLabel", {
                TextXAlignment = "Center",
                TextScaled = true,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.9, 0.7),
                Text = p8.TeamInfo.Name,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UIStroke") });
            v10.TeamInfoWrapper = u2.createElement("Frame", v13, v14);

            return u2.createElement(Empty, v9, v10);
        end;

        local v18 = {
            ResetOnSpawn = false,
            IgnoreGuiInset = DeviceUtil.isSmallScreen()
        };
        local v19 = {};
        local _ = #v19;
        local v20 = p5.TeamA ~= nil;

        if v20 then
            local v21 = {};
            local v22 = {};

            for i, v in p5.TeamA do
                v21[i] = v;
            end;

            v21.FrameProps = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.3, 1)
            };
            v22.TeamInfo = v21;
            v20 = u2.createElement(v17, v22);
        end;

        local v23 = {
            Size = UDim2.fromScale(0.5, 0.125)
        };
        local v24;

        if v7 then
            v24 = UDim2.fromScale(0.5, 0.2);
        else
            v24 = UDim2.fromScale(0.5, 0.1);
        end;

        v23.Position = v24;
        v23.AnchorPoint = Vector2.new(0.5, 0);
        local v25 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v26 = #v25;

        if v20 then
            v25[v26 + 1] = v20;
        end;

        local v27 = #v25;
        v25[v27 + 1] = u2.createElement(Empty, {
            AutomaticSize = "X",
            LayoutOrder = 2,
            Size = UDim2.fromScale(0, 1)
        }, {
            VS = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                Text = "VS",
                TextYAlignment = "Center",
                TextScaled = true,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(0.5, 2, 0.25, 2),
                Size = UDim2.fromScale(0, 0.7),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 189, 89)
            }),
            VS_Background = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                Text = "VS",
                TextYAlignment = "Center",
                TextScaled = true,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(0.5, 6, 0.25, 6),
                Size = UDim2.fromScale(0, 0.7),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 149, 89)
            })
        });
        local v28 = p5.TeamB ~= nil;

        if v28 then
            local v29 = {};
            local v30 = {};

            for i, v in p5.TeamB do
                v29[i] = v;
            end;

            v29.FrameProps = {
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.3, 1)
            };
            v30.TeamInfo = v29;
            v30.RightIcon = true;
            v28 = u2.createElement(v17, v30);
        end;

        if v28 then
            v25[v27 + 2] = v28;
        end;

        v19.VersusHud = u2.createElement(Empty, v23, v25);

        return u2.createFragment({
            VersusHudScreenGui = u2.createElement("ScreenGui", v18, v19)
        });
    end)
};