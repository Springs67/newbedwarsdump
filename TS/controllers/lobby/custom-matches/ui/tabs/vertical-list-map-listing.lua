-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TagPillList = RuntimeLib.import(script, script.Parent, "map-browser", "tag-pill-list").TagPillList;
local ServerHealthIcon = RuntimeLib.import(script, script.Parent, "server-browser", "server-health-icon").ServerHealthIcon;

return {
    VerticalListMapListing = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: GetTarmacAsset (copy), u2 (copy), Theme (copy), ColorUtil (copy), DeviceUtil (copy), ServerHealthIcon (copy), TagPillList (copy), Empty (copy), CircularSpinner (copy)
        local v6, u7 = p5.useState(false);
        local v8 = Color3.fromRGB(72, 168, 120);

        if u4.Disabled then
            v8 = Color3.fromRGB(66, 66, 66);
        end;

        if v6 then
            v8 = Color3.fromRGB(255, 196, 69);
        end;

        local ThumbnailAssetId = u4.ThumbnailAssetId;
        local v9;

        if ThumbnailAssetId == "" or not ThumbnailAssetId then
            v9 = GetTarmacAsset("NoImage").Image;
        else
            v9 = "rbxassetid://" .. string.gsub(u4.ThumbnailAssetId, "rbxassetid://", "");
        end;

        local v10 = {
            Size = UDim2.new(1, 0, 0, 60)
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v10[i] = v;
            end;
        end;

        local v11 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.02, 0)
            }) };
        local _ = #v11;
        local v12 = {
            LayoutOrder = 1,
            Size = UDim2.new(0.9, 0, 1, 0),
            BackgroundColor3 = Theme.backgroundTertiaryCard
        };
        local v13 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder"
            }),
            Thumbnail = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Crop",
                BackgroundTransparency = 0.75,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                Image = v9,
                BackgroundColor3 = ColorUtil.BLACK
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        };
        local _ = #v13;
        local v14 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v15 = {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.11, 0),
                PaddingBottom = UDim.new(0.11, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0)
            }),
            Title = u2.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                TextXAlignment = "Left",
                AutoLocalize = false,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.55),
                Text = u4.Title,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextTruncate = Enum.TextTruncate.AtEnd
            }, { u2.createElement("UITextSizeConstraint", {
                    MinTextSize = DeviceUtil.isSmallScreen() and 14 or 18
                }) })
        };
        local v16 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.4)
        };
        local v17 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }),
            Creator = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                TextScaled = true,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                TextXAlignment = "Left",
                AutoLocalize = false,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0, 1),
                Text = u4.Creator,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UITextSizeConstraint", {
                    MinTextSize = 8,
                    MaxTextSize = 14
                }) })
        };
        local v18 = #v17;
        local v19;

        if u4.ServerHealthState == nil then
            v19 = false;
        else
            v19 = u2.createElement(ServerHealthIcon, {
                layoutOrder = 2,
                serverHealthState = u4.ServerHealthState
            });
        end;

        if v19 then
            v17[v18 + 1] = v19;
        end;

        local v20 = #v17;
        local ExtraTextInfo = u4.ExtraTextInfo;
        local v21;

        if ExtraTextInfo == nil then
            v21 = ExtraTextInfo;
        else
            local function v24(p22, p23) -- Line: 150
                -- upvalues: u2 (ref), ColorUtil (ref)
                return u2.createFragment({
                    TextInfo = u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextScaled = true,
                        TextTransparency = 0.3,
                        BackgroundTransparency = 1,
                        TextXAlignment = "Left",
                        AutoLocalize = false,
                        Size = UDim2.fromScale(0, 1),
                        Text = p22,
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        LayoutOrder = 3 + p23
                    }, { u2.createElement("UITextSizeConstraint", {
                            MinTextSize = 8,
                            MaxTextSize = 12
                        }) })
                });
            end;

            v21 = table.create(#ExtraTextInfo);

            for i, v in ExtraTextInfo do
                v21[i] = v24(v, i - 1, ExtraTextInfo);
            end;
        end;

        if v21 then
            for i, v in v21 do
                v17[v20 + i] = v;
            end;
        end;

        local v25 = #v17;
        local v26 = #u4.Tags ~= 0 and u2.createElement(TagPillList, {
            Tags = u4.Tags,
            FrameProps = {
                Size = UDim2.fromScale(1, 1)
            }
        });

        if v26 then
            v17[v25 + 1] = v26;
        end;

        v15[#v15 + 1] = u2.createElement(Empty, v16, v17);
        v13.Info = u2.createElement(Empty, v14, v15);
        local v27 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.26, 1)
        };
        local v28 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.02, 0),
                PaddingRight = UDim.new(0.02, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 4)
            }) };
        local v29 = #v28;
        local v30;

        if u4.Stat.Icon == nil then
            v30 = false;
        else
            v30 = u2.createFragment({
                StatIcon = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.5, 0.4),
                    Image = u4.Stat.Icon,
                    ImageColor3 = Theme.textPrimary
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        end;

        if v30 then
            v28[v29 + 1] = v30;
        end;

        local _ = #v28;
        v28.StatValue = u2.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 0.6),
            Text = u4.Stat.Value,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        });
        v13.StatWrapper = u2.createElement(Empty, v27, v28);
        v11.MapCard = u2.createElement("Frame", v12, v13);
        local v31;

        if v6 then
            v31 = u2.createElement(Empty, {
                LayoutOrder = 3,
                ZIndex = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.5, 0.5)
            }, { u2.createElement(CircularSpinner, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) });
        else
            local v32 = {
                SizeConstraint = "RelativeXX",
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.5, 0.5)
            };
            local ActionButton = u4.ActionButton;

            if ActionButton ~= nil then
                ActionButton = ActionButton.Icon;
            end;

            v32.Image = ActionButton;
            local v33;

            if u4 == nil then
                v33 = u4;
            else
                v33 = u4.Disabled;
            end;

            local v34;

            if v33 then
                v34 = Color3.fromRGB(130, 130, 130);
            else
                v34 = Color3.fromRGB(99, 255, 143);
            end;

            v32.ImageColor3 = v34;
            v32.ScaleType = "Fit";
            v32.BackgroundTransparency = 1;
            v31 = u2.createElement("ImageLabel", v32);
        end;

        local v36 = {
            Size = UDim2.new(0.08, 0, 1, 0),
            BackgroundColor3 = v8,
            LayoutOrder = 2,
            AutoButtonColor = not u4.Disabled,

            [u2.Event.Activated] = function() -- Line: 288
                -- upvalues: u4 (copy), u7 (copy)
                local v35 = u4;

                if v35 ~= nil then
                    v35 = v35.Disabled;
                end;

                if v35 then
                    return nil;
                end;

                u7(true);
                local ActionButton = u4.ActionButton;

                if ActionButton ~= nil then
                    ActionButton.OnClick():andThen(function() -- Line: 300
                        -- upvalues: u7 (ref)
                        u7(false);
                    end);
                end;
            end
        };
        local v37 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            [#v37 + 1] = v31
        };
        v11.ActionButton = u2.createElement("ImageButton", v36, v37);

        return u2.createFragment({
            MapListing = u2.createElement(Empty, v10, v11)
        });
    end)
};