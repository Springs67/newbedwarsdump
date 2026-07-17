-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LoreReader = v4.new(u3)(function(p5, p6) -- Line: 13
        -- upvalues: u3 (copy), DeviceUtil (copy), getBedwarsKitMeta (copy), u2 (copy), Theme (copy), Empty (copy), BedwarsImageId (copy), AutoCanvasScrollingFrame (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u3.createRef();
        local u8 = u3.createRef();
        local u9 = u3.createRef();
        local _, u10 = useState(0);
        local v11, u12 = useState(0);
        local v13, u14 = useState(0);
        local v15, u16 = useState(0);
        local v17 = DeviceUtil.isSmallScreen() and 0.8 or 1;
        local v18 = getBedwarsKitMeta(p5.SelectedKit);

        if not v18.lore then
            return u3.createFragment();
        end;

        local subtitle = v18.lore.subtitle;
        local v19 = subtitle ~= "" and subtitle and true or false;
        useEffect(function() -- Line: 33
            -- upvalues: u7 (copy), u8 (copy), u9 (copy), u2 (ref), u10 (copy), u12 (copy), u14 (copy), u16 (copy)
            local u20 = u7:getValue();
            local u21 = u8:getValue();

            if not (u20 and (u21 and u9:getValue())) then
                return nil;
            end;

            local u22 = u2.new();
            u22:GiveTask(u20:GetPropertyChangedSignal("CanvasPosition"):Connect(function() -- Line: 41
                -- upvalues: u10 (ref), u20 (copy), u12 (ref)
                u10(math.ceil(u20.CanvasPosition.Y) / math.ceil(u20.CanvasSize.Y.Offset - u20.AbsoluteSize.Y));
                u12((math.clamp(u20.CanvasPosition.Y / u20.AbsoluteSize.Y, 0, 1)));
            end));
            u22:GiveTask(u20:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 45
                -- upvalues: u14 (ref), u20 (copy)
                u14(u20.AbsoluteSize.Y);
            end));
            u22:GiveTask(u21:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 48
                -- upvalues: u16 (ref), u21 (copy)
                u16(u21.AbsoluteSize.Y);
            end));

            return function() -- Line: 51
                -- upvalues: u22 (copy)
                u22:DoCleaning();
            end;
        end, {});
        local v23 = {
            BorderSizePixel = 0,
            ZIndex = -10,
            Size = p5.Size,
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v24 = {};
        local _ = #v24;
        local v25 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v26 = {};
        local v27 = #v26;
        local v28 = {
            Size = UDim2.fromScale(1, 1)
        };
        local backgroundImage = v18.lore.backgroundImage;
        v28.Image = backgroundImage == nil and "rbxassetid://10983634478" or backgroundImage;
        v28.ScaleType = Enum.ScaleType.Crop;
        v28.ZIndex = -4;
        v26.BackgroundImage = u3.createElement("ImageLabel", v28, {
            BackgroundImageTint = u3.createElement("Frame", {
                BackgroundTransparency = 0.5,
                ZIndex = -3,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            })
        });
        local v29;

        if v18.lore.disableKitImage == true then
            v29 = false;
        else
            v29 = u3.createFragment({
                KitRender = u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = -2,
                    Size = UDim2.fromScale(1, 1),
                    Image = v18.renderImage,
                    ScaleType = Enum.ScaleType.Fit
                })
            });
        end;

        if v29 then
            v26[v27 + 1] = v29;
        end;

        local _ = #v26;
        v26.AlphaGradient = u3.createElement("ImageLabel", {
            Image = "rbxassetid://13882686635",
            BackgroundTransparency = 1,
            ZIndex = -1,
            Size = UDim2.fromScale(1, 1),
            ImageTransparency = 0.5 + v11,
            ScaleType = Enum.ScaleType.Stretch
        });
        v26.Fade = u3.createElement("Frame", {
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = math.clamp(1 - v11, 0.4, 1),
            Size = UDim2.fromScale(1, 1)
        });
        v24.Background = u3.createElement(Empty, v25, v26);
        local v30 = {
            WaitForAbsoluteSize = true,
            ScrollingFrameRef = u7
        };
        local v31 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }),
            u3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 30)
            }),
            Box = u3.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, v13 - v15)
            })
        };
        local v32 = #v31;
        local v33 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            [u3.Ref] = u8
        };
        local v34 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 30),
                PaddingBottom = UDim.new(0, 30)
            }),
            Title = u3.createElement("TextLabel", {
                LayoutOrder = 1,
                Font = "GothamBold",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                Text = v18.name,
                TextColor3 = Color3.fromRGB(227, 212, 191),
                TextSize = v17 * 40,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        };
        local v35 = #v34;

        if v19 then
            v19 = u3.createFragment({
                Subtitle = u3.createElement("TextLabel", {
                    LayoutOrder = 2,
                    Font = "GothamBold",
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Text = v18.lore.subtitle,
                    TextColor3 = Color3.fromRGB(222, 204, 176),
                    TextSize = v17 * 15,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            });
        end;

        if v19 then
            v34[v35 + 1] = v19;
        end;

        local _ = #v34;
        v34.StoryTitle = u3.createElement("TextLabel", {
            LayoutOrder = 2,
            Font = "GothamBold",
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Text = v18.lore.storyTitle,
            TextColor3 = Color3.fromRGB(205, 164, 103),
            TextSize = v17 * 23,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        });
        v34.Scroll = u3.createElement(Empty, {
            LayoutOrder = 3,
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, -20)
            }),
            ScrollText = u3.createElement("TextLabel", {
                LayoutOrder = 1,
                Text = "SCROLL TO BEGIN",
                Font = "GothamBold",
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextColor3 = Color3.fromRGB(224, 212, 196),
                TextSize = v17 * 12.5,
                TextTransparency = v11 * 2,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }),
            ScrollArrow = u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromOffset(35, 35),
                Image = BedwarsImageId.ARROW_DOWN_1,
                ImageColor3 = Color3.fromRGB(224, 212, 196),
                ImageTransparency = v11 * 2,
                ScaleType = Enum.ScaleType.Fit
            })
        });
        v31.Header = u3.createElement(Empty, v33, v34);
        v31.Body = u3.createElement("TextLabel", {
            LayoutOrder = 3,
            [u3.Ref] = u9,
            Size = UDim2.new(0.75, 0, 1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            TextColor3 = Color3.fromRGB(245, 229, 206),
            Font = "Gotham",
            TextSize = v17 * 25,
            RichText = true,
            TextWrapped = true,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            Text = v18.lore.story,
            LineHeight = 1.1
        });
        local v36;

        if v18.lore.author == nil then
            v36 = false;
        else
            v36 = u3.createFragment({
                Credits = u3.createElement("TextLabel", {
                    LayoutOrder = 4,
                    Font = "Gotham",
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Text = "by " .. v18.lore.author,
                    TextColor3 = Color3.fromRGB(222, 204, 176),
                    TextSize = v17 * 15,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            });
        end;

        if v36 then
            v31[v32 + 1] = v36;
        end;

        v31[#v31 + 1] = u3.createElement("Frame", {
            BackgroundTransparency = 0.25,
            LayoutOrder = 4,
            Size = UDim2.new(0.6, 0, 0, 5),
            BackgroundColor3 = Color3.fromRGB(205, 164, 103)
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) });
        v24.Reader = u3.createElement(AutoCanvasScrollingFrame, v30, v31);

        return u3.createFragment({
            LoreReader = u3.createElement("Frame", v23, v24)
        });
    end)
};