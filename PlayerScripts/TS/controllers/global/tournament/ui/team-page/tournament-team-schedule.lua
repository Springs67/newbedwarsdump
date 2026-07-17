-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local RandomUtil = v1.RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getMapMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local TournamentQueueUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil;

return {
    TournamentTeamSchedule = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: TournamentQueueUtil (copy), KnitClient (copy), getQueueMeta (copy), getMapMeta (copy), u2 (copy), RandomUtil (copy), Empty (copy), Countdown (copy), ColorUtil (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local v6 = TournamentQueueUtil.isTournamentQueueOpen(p4.region);

        local function _() -- Line: 18
            -- upvalues: KnitClient (ref), TournamentQueueUtil (ref)
            KnitClient.Controllers.QueueController:joinQueue(TournamentQueueUtil.ActiveQueue);
        end;

        local maps = getQueueMeta(TournamentQueueUtil.ActiveQueue).maps;

        local function _(p7) -- Line: 23
            return p7.mapName;
        end;

        local v8 = table.create(#maps);

        for i, v in maps do
            local _ = i - 1;
            v8[i] = v.mapName;
        end;

        table.sort(v8);

        local function _(p9) -- Line: 35
            -- upvalues: getMapMeta (ref)
            local v10 = string.split(p9, "_")[1];
            local v11 = getMapMeta(p9);

            if v11 ~= nil then
                v11 = v11.mapImage;
            end;

            local v12;

            if v10 == "" then
                v12 = v10;
            elseif v10 then
                v12 = v11;
            else
                v12 = v10;
            end;

            if v12 == "" or not v12 then
                return nil;
            end;

            local v13 = v11[v10];

            if v13 ~= nil then
                v13 = v13.Image;
            end;

            return v13;
        end;

        local v14 = 0;
        local v15 = {};

        for i, v in v8 do
            local _ = i - 1;
            local v16 = string.split(v, "_")[1];
            local v17 = getMapMeta(v);

            if v17 ~= nil then
                v17 = v17.mapImage;
            end;

            local v18;

            if v16 == "" then
                v18 = v16;
            elseif v16 then
                v18 = v17;
            else
                v18 = v16;
            end;

            local v19;

            if v18 == "" or not v18 then
                v19 = nil;
            else
                v19 = v17[v16];

                if v19 ~= nil then
                    v19 = v19.Image;
                end;
            end;

            if v19 ~= nil then
                v14 = v14 + 1;
                v15[v14] = v19;
            end;
        end;

        local v20 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.4, 1)
        };
        local v21 = {};
        local _ = #v21;
        local v22 = {
            LayoutOrder = 2,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromHex("6467A7")
        };
        local v23 = {};
        local _ = #v23;
        local v24 = {
            Size = UDim2.fromScale(0.9, 0.95),
            Position = UDim2.fromScale(0.05, 0.025)
        };
        local v25 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0.01, 0)
            }),
            MapImage = u2.createElement("ImageLabel", {
                AutomaticSize = "Y",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Image = RandomUtil.fromList(unpack(v15)),
                Size = UDim2.fromScale(1, 0.3),
                ScaleType = Enum.ScaleType.Fit
            }),
            Title = u2.createElement("TextLabel", {
                Text = "<b>Tournament BETA</b>",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.07),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            ["Schedule Title"] = u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 0.05),
                Text = "<b>Next Tournament (" .. TournamentQueueUtil.convertRegionToText(p4.region) .. ")</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            ["Schedule Content"] = u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(1, 0.07),
                Text = TournamentQueueUtil.getTournamentTimeRangesFormatted(p4.region),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            QueueMatchesText = u2.createElement(Empty, {
                LayoutOrder = 5,
                Size = UDim2.fromScale(1, 0.09)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.1, 0)
                }),
                ["Queue Text"] = u2.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.5, 1)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder"
                    }),
                    ["Queue Title"] = u2.createElement("TextLabel", {
                        Text = "<b>Queue</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.5),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }),
                    ["Queue Content"] = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.5),
                        Text = getQueueMeta(TournamentQueueUtil.ActiveQueue).title,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                }),
                ["Matches Text"] = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.4, 1)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder"
                    }),
                    ["Matches Title"] = u2.createElement("TextLabel", {
                        Text = "<b>Matches</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.5),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }),
                    ["Matches Content"] = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.5),
                        Text = tostring(TournamentQueueUtil.TotalMatchesForBracket),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                })
            }),
            Spacer1 = u2.createElement(Empty, {
                LayoutOrder = 6,
                Size = UDim2.fromScale(1, 0.05)
            }),
            u2.createElement("Frame", {
                BackgroundTransparency = 0.75,
                BorderSizePixel = 0,
                LayoutOrder = 7,
                Size = UDim2.fromScale(1, 0.004),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }),
            Spacer2 = u2.createElement(Empty, {
                LayoutOrder = 8,
                Size = UDim2.fromScale(1, 0.03)
            })
        };
        local _ = #v25;
        local v26 = {
            LayoutOrder = 9,
            Size = UDim2.fromScale(1, 0.25)
        };
        local v27 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }) };
        local v28 = #v27;
        local v29 = not v6 and u2.createElement(Countdown, {
            PreText = "Next Tournament In: ",
            EndTime = TournamentQueueUtil.getNextQueueOpenTime(p4.region),
            TextLabel = {
                TextTransparency = 0.3,
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                ZIndex = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.2),
                Position = UDim2.fromScale(0.1, 0),
                AnchorPoint = Vector2.new(0, 0)
            }
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });

        if v29 then
            v27[v28 + 1] = v29;
        end;

        local createElement = u2.createElement;
        local v30 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.65, 0.6),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0,

            [u2.Event.Activated] = function() -- Line: 270
                -- upvalues: KnitClient (ref), TournamentQueueUtil (ref)
                KnitClient.Controllers.QueueController:joinQueue(TournamentQueueUtil.ActiveQueue);
            end,

            ZIndex = 2
        };
        local v31 = {};
        local createElement2 = u2.createElement;
        local v32 = {
            Rotation = 45
        };
        local v33;

        if v6 then
            v33 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#48a878")), ColorSequenceKeypoint.new(1, Color3.fromHex("#6AC4A4")) });
        else
            v33 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#8D8D8D")), ColorSequenceKeypoint.new(1, Color3.fromHex("#333333")) });
        end;

        v32.Color = v33;
        local v34 = createElement2("UIGradient", v32);
        local v35 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.04, 0)
        });
        local createElement3 = u2.createElement;
        local v36 = {};
        local v37;

        if v6 then
            v37 = Color3.fromHex("#63FF8F");
        else
            v37 = Color3.fromHex("#717171");
        end;

        v36.Color = v37;
        v31[1], v31[2], v31[3], v31[4], v31[5] = v34, v35, createElement3("UIStroke", v36), u2.createElement(Empty, {
    ZIndex = 2,
    Position = UDim2.fromScale(0, 0.5),
    AnchorPoint = Vector2.new(0, 0.5),
    Size = UDim2.fromScale(1, 0.75)
}, { u2.createElement("UIListLayout", {
        FillDirection = "Vertical",
        VerticalAlignment = "Center"
    }), u2.createElement("TextLabel", {
        Text = "QUEUE",
        TextScaled = true,
        TextXAlignment = "Center",
        TextYAlignment = "Center",
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        ZIndex = 3,
        Size = UDim2.fromScale(1, 0.6),
        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
        TextColor3 = ColorUtil.WHITE
    }, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 36
        }) }) }), u2.createElement("ImageLabel", {
    SizeConstraint = "RelativeYY",
    ImageTransparency = 0.7,
    BackgroundTransparency = 1,
    ZIndex = 2,
    Position = UDim2.fromScale(0.925, 0.5),
    AnchorPoint = Vector2.new(1, 0.5),
    Size = UDim2.fromScale(1, 1),
    Image = BedwarsImageId.TOURNAMENT_QUEUE_ICON,
    ScaleType = Enum.ScaleType.Crop
});
        v27[#v27 + 1] = createElement("ImageButton", v30, v31);
        v25["Tournament Queue Button"] = u2.createElement(Empty, v26, v27);
        v23.Content = u2.createElement(Empty, v24, v25);
        v21.TournamentScheduleBG = u2.createElement("Frame", v22, v23);

        return u2.createFragment({
            ["Right Side - Tournament Schedule"] = u2.createElement(Empty, v20, v21)
        });
    end)
};