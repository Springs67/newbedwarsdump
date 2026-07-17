-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ServerBrowserConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local ServerHealthState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "server-health", "server-health-state").ServerHealthState;
local Pagination = RuntimeLib.import(script, script.Parent.Parent, "map-browser", "pagination", "pagination").Pagination;
local LiveServerCard = RuntimeLib.import(script, script.Parent, "live-server-card").LiveServerCard;
local ServerBrowserSearch = RuntimeLib.import(script, script.Parent, "server-browser-search").ServerBrowserSearch;

return {
    ServerBrowser = v3.new(u2)(function(p4, p5) -- Line: 18
        -- upvalues: DeviceUtil (copy), ServerHealthState (copy), MatchState (copy), u2 (copy), Empty (copy), CircularSpinner (copy), ColorUtil (copy), LiveServerCard (copy), AutoCanvasScrollingFrame (copy), ServerBrowserConstants (copy), Pagination (copy), Padding (copy), ServerBrowserSearch (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, v7 = useState(false);
        local v8, u9 = useState(nil);
        local v10, u11 = useState(1);
        useEffect(function() -- Line: 24
            -- upvalues: DeviceUtil (ref), ServerHealthState (ref), MatchState (ref), u9 (copy)
            if DeviceUtil.isHoarceKat() then
                local v12 = {
                    players = 699,
                    blobData = {
                        joinCode = "1234567",
                        mapTitle = "5v5 Castlegrounds",
                        mapDescription = "In the Blox Fruits hide-and-seek map, players explore a lush tropical paradise, blending in as pirates.",
                        creator = "Sprux",
                        thumbnailImage = "rbxassetid://13915009106",
                        healthState = ServerHealthState.LAGGING,
                        matchState = MatchState.RUNNING
                    }
                };
                u9({
                    sizeHint = 1,
                    documents = {
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12,
                        v12
                    }
                });
            end;
        end, {});
        local v13;

        if v6 then
            v13 = u2.createElement(Empty, {
                LayoutOrder = 3,
                ZIndex = 1,
                Size = UDim2.new(1, 0, 1, 0)
            }, { u2.createElement(CircularSpinner, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.15, 0.15),
                    Position = UDim2.new(0.5, 0, 0.375, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) });
        else
            local v14;

            if v8 == nil then
                v14 = v8;
            else
                v14 = #v8.documents == 0;
            end;

            if v14 then
                v13 = u2.createFragment({
                    NoResultsFoundContainer = u2.createElement(Empty, {
                        LayoutOrder = 3,
                        ZIndex = 1,
                        Size = UDim2.new(1, 0, 1, 0)
                    }, { u2.createElement("TextLabel", {
                            Text = "No results found",
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.75, 0.1),
                            Position = UDim2.new(0.5, 0, 0.375, 0),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                        }) })
                });
            else
                local v15 = {};
                local v16 = #v15;
                local v17;

                if v8 == nil then
                    v17 = v8;
                else
                    local documents = v8.documents;

                    local function _(p18, p19) -- Line: 93
                        -- upvalues: u2 (ref), LiveServerCard (ref)
                        return u2.createElement(LiveServerCard, {
                            serverInfo = p18
                        });
                    end;

                    v17 = table.create(#documents);

                    for i, v in documents do
                        local _ = i - 1;
                        v17[i] = u2.createElement(LiveServerCard, {
                            serverInfo = v
                        });
                    end;
                end;

                local v20 = {
                    ScrollingFrameProps = {
                        LayoutOrder = 3,
                        ZIndex = 1,
                        Size = UDim2.new(1, 0, 0.91, 0)
                    }
                };
                local v21 = { u2.createElement("UIGridLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Left",
                        VerticalAlignment = "Top",
                        SortOrder = "LayoutOrder",
                        CellPadding = UDim2.new(0, 14, 0, 8),
                        CellSize = UDim2.new(0, 136, 0, 114)
                    }) };
                local v22 = #v21;

                if v17 then
                    for i, v in v17 do
                        v21[v22 + i] = v;
                    end;
                end;

                v15[v16 + 1] = u2.createElement(AutoCanvasScrollingFrame, v20, v21);

                if v8 then
                    local v23 = {
                        Page = v10
                    };

                    if v8 ~= nil then
                        v8 = v8.sizeHint;
                    end;

                    v23.TotalPages = math.ceil(v8 / ServerBrowserConstants.GAMES_PER_PAGE);
                    v23.FrameProps = {
                        LayoutOrder = 5,
                        Size = UDim2.fromScale(1, 0.07)
                    };

                    function v23.OnPageChage(p24) -- Line: 145
                        -- upvalues: u11 (copy)
                        u11(p24);
                    end;

                    v8 = u2.createElement(Pagination, v23);
                end;

                if v8 then
                    v15[v16 + 2] = v8;
                end;

                v13 = u2.createFragment(v15);
            end;
        end;

        local v25 = {
            LayoutOrder = 4,
            BackgroundTransparency = 0.65,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v28 = {
            u2.createElement(Padding, {
                Padding = {
                    Horizontal = 18,
                    Vertical = 18
                }
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }),
            u2.createElement(ServerBrowserSearch, {
                Size = UDim2.fromScale(1, 0),
                SetLoading = v7,

                onSearchComplete = function(p26, p27) -- Line: 180, Name: onSearchComplete
                    -- upvalues: u9 (copy)
                    u9(p27);
                end,

                Page = v10
            }),
            [#v28 + 1] = v13
        };

        return u2.createFragment({
            CustomMapsBrowser = u2.createElement("Frame", v25, v28)
        });
    end)
};