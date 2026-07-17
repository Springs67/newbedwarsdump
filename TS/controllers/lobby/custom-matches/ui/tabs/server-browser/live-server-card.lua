-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ServerHealthIcon = RuntimeLib.import(script, script.Parent, "server-health-icon").ServerHealthIcon;

return {
    LiveServerCard = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: KnitClient (copy), GetTarmacAsset (copy), u2 (copy), ColorUtil (copy), BedwarsImageId (copy), ServerHealthIcon (copy), Empty (copy)
        local _ = p5.useState;

        local function _() -- Line: 14
            -- upvalues: KnitClient (ref), u4 (copy)
            KnitClient.Controllers.LiveGamesBrowserController:joinServer(u4.serverInfo.blobData.joinCode);
        end;

        local thumbnailImage = u4.serverInfo.blobData.thumbnailImage;
        local v6;

        if thumbnailImage == "" or not thumbnailImage then
            v6 = GetTarmacAsset("NoImage").Image;
        else
            v6 = "rbxassetid://" .. string.gsub(u4.serverInfo.blobData.thumbnailImage, "rbxassetid://", "");
        end;

        local v7 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v10 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            Thumbnail = u2.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 0.72),
                Image = v6,
                ScaleType = "Crop",
                AutoButtonColor = false,
                BackgroundTransparency = 0.3,
                BackgroundColor3 = ColorUtil.BLACK,
                LayoutOrder = 1,
                ImageTransparency = 0.1,

                [u2.Event.Activated] = function() -- Line: 37
                    -- upvalues: KnitClient (ref), u4 (copy)
                    KnitClient.Controllers.LiveGamesBrowserController:joinServer(u4.serverInfo.blobData.joinCode);
                end,

                [u2.Event.MouseEnter] = function(p8) -- Line: 40
                    p8.ImageTransparency = 0;
                end,

                [u2.Event.MouseLeave] = function(p9) -- Line: 43
                    p9.ImageTransparency = 0.1;
                end
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                StatisticPill = u2.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.3,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.fromScale(0.02, 0.95),
                    Size = UDim2.fromScale(0.35, 0.2),
                    BackgroundColor3 = ColorUtil.BLACK
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }),
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 2.3333333333333335
                    }),
                    u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 6),
                        PaddingRight = UDim.new(0, 6)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        Padding = UDim.new(0, 2)
                    }),
                    u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 0.525),
                        Image = BedwarsImageId.USERS_SOLID
                    }),
                    PlayerCount = u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        TextScaled = true,
                        TextWrapped = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0, 0.7),
                        Text = tostring(u4.serverInfo.players),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                })
            })
        };
        local _ = #v10;
        local v11 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.25)
        };
        local v12 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            ServerTitle = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                TextScaled = true,
                TextWrapped = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.55),
                Text = u4.serverInfo.blobData.mapTitle,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        };
        local _ = #v12;
        local v13 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.42),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0)
        };
        local v14 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder"
            }),
            HostName = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                TextScaled = true,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0, 1),
                Text = u4.serverInfo.blobData.creator,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            }),
            MatchState = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                Text = " ",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                TextScaled = true,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 1),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        };
        local v15 = #v14;
        local v16;

        if u4.serverInfo.blobData.healthState == nil then
            v16 = false;
        else
            v16 = u2.createElement(ServerHealthIcon, {
                layoutOrder = 3,
                serverHealthState = u4.serverInfo.blobData.healthState
            });
        end;

        if v16 then
            v14[v15 + 1] = v16;
        end;

        v12.ServerInfo = u2.createElement(Empty, v13, v14);
        v10.InfoContainer = u2.createElement(Empty, v11, v12);

        return u2.createFragment({
            LiveServerCard = u2.createElement(Empty, v7, v10)
        });
    end)
};