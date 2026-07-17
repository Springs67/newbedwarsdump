-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local RandomUtil = v1.RandomUtil;
local RegionValues = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getMapMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local TournamentQueueUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil;

return {
    TournamentFullSchedule = v4.new(u3)(function(p5, p6) -- Line: 13
        -- upvalues: TournamentQueueUtil (copy), RegionValues (copy), getQueueMeta (copy), getMapMeta (copy), u2 (copy), u3 (copy), Empty (copy), RandomUtil (copy)
        local _ = p6.useState;
        TournamentQueueUtil.isTournamentQueueOpen(RegionValues.NA);
        local maps = getQueueMeta(TournamentQueueUtil.ActiveQueue).maps;

        local function _(p7) -- Line: 18
            return p7.mapName;
        end;

        local v8 = table.create(#maps);

        for i, v in maps do
            local _ = i - 1;
            v8[i] = v.mapName;
        end;

        table.sort(v8);

        local function _(p9) -- Line: 30
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
        local v24 = u2.values(RegionValues);

        local function v27(p25, p26) -- Line: 78
            -- upvalues: u3 (ref), Empty (ref), TournamentQueueUtil (ref)
            return u3.createFragment({
                [tostring(p25) .. " Schedule"] = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.12),
                    LayoutOrder = 3 + p26
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder"
                    }),
                    [tostring(p25) .. " Schedule Title"] = u3.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.4),
                        Text = "<b>Next Tournament (" .. TournamentQueueUtil.convertRegionToText(p25) .. ")</b>",
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }),
                    [tostring(p25) .. " Schedule Content"] = u3.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.6),
                        Text = TournamentQueueUtil.getTournamentTimeRangesFormatted(p25),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                })
            });
        end;

        local v28 = table.create(#v24);

        for i, v in v24 do
            v28[i] = v27(v, i - 1, v24);
        end;

        local v29 = {
            Size = UDim2.fromScale(0.9, 0.95),
            Position = UDim2.fromScale(0.05, 0.025)
        };
        local v30 = {
            u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0.02, 0)
            }),
            MapImage = u3.createElement("ImageLabel", {
                AutomaticSize = "Y",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Image = RandomUtil.fromList(unpack(v15)),
                Size = UDim2.fromScale(1, 0.3),
                ScaleType = Enum.ScaleType.Fit
            }),
            Title = u3.createElement("TextLabel", {
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
            })
        };
        local v31 = #v30;

        for i, v in v28 do
            v30[v31 + i] = v;
        end;

        local _ = #v30;
        v30.Spacer1 = u3.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.03),
            LayoutOrder = #u2.values(RegionValues) + 3
        });
        v30.QueueMatchesText = u3.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.09),
            LayoutOrder = #u2.values(RegionValues) + 4
        }, {
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }),
            ["Queue Text"] = u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.5, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder"
                }),
                ["Queue Title"] = u3.createElement("TextLabel", {
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
                ["Queue Content"] = u3.createElement("TextLabel", {
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
            ["Matches Text"] = u3.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.4, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder"
                }),
                ["Matches Title"] = u3.createElement("TextLabel", {
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
                ["Matches Content"] = u3.createElement("TextLabel", {
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
        });
        v23.Content = u3.createElement(Empty, v29, v30);
        v21.TournamentScheduleBG = u3.createElement("Frame", v22, v23);

        return u3.createFragment({
            ["Right Side - Tournament Schedule"] = u3.createElement(Empty, v20, v21)
        });
    end)
};