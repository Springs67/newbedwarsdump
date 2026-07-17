-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchHistoryEntryCard = RuntimeLib.import(script, script.Parent, "match-history-entry-card").MatchHistoryEntryCard;
local MatchHistoryEntryInfo = RuntimeLib.import(script, script.Parent, "match-history-entry-info").MatchHistoryEntryInfo;

return {
    MatchHistoryCore = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: u2 (copy), MatchHistoryEntryCard (copy), AutoCanvasScrollingFrame (copy), Empty (copy), IconButton (copy), BedwarsImageId (copy), MatchHistoryEntryInfo (copy)
        local v6, u7 = p5.useState(nil);
        local v8;

        if v6 == nil then
            local matchHistory = u4.matchHistory;
            table.sort(matchHistory, function(p9, p10) -- Line: 18
                return p9.matchStartTime > p10.matchStartTime;
            end);

            local function v12(u11) -- Line: 22
                -- upvalues: u2 (ref), MatchHistoryEntryCard (ref), u4 (copy), u7 (copy)
                return u2.createElement(MatchHistoryEntryCard, {
                    userId = u4.userId,
                    match = u11,

                    onClick = function() -- Line: 26, Name: onClick
                        -- upvalues: u7 (ref), u11 (copy)
                        u7(u11);
                    end
                });
            end;

            local v13 = table.create(#matchHistory);

            for i, v in matchHistory do
                v13[i] = v12(v, i - 1, matchHistory);
            end;

            local v14 = {
                ScrollingFrameProps = {
                    LayoutOrder = 3,
                    Size = UDim2.new(1, 0, 0.92, 0)
                }
            };
            local v15 = { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 10)
                }) };
            local v16 = #v15;

            for i, v in v13 do
                v15[v16 + i] = v;
            end;

            v8 = u2.createElement(AutoCanvasScrollingFrame, v14, v15);
        else
            v8 = u2.createFragment({
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder"
                }),
                HeaderActions = u2.createFragment({
                    HeaderActions = u2.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.05)
                    }, {
                        BackButton = u2.createElement(IconButton, {
                            Size = UDim2.fromScale(1, 1),
                            SizeConstraint = "RelativeYY",
                            Position = UDim2.fromScale(1, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Image = BedwarsImageId.ARROW_LEFT,

                            [u2.Event.Activated] = function() -- Line: 71
                                -- upvalues: u7 (copy)
                                u7(nil);
                            end
                        })
                    })
                }),
                u2.createElement(MatchHistoryEntryCard, {
                    LayoutOrder = 2,
                    userId = u4.userId,
                    match = v6,

                    onClick = function() -- Line: 80, Name: onClick
                        -- upvalues: u7 (copy)
                        u7(nil);
                    end
                }),
                u2.createElement(MatchHistoryEntryInfo, {
                    userId = u4.userId,
                    match = v6
                })
            });
        end;

        local v17 = {
            Size = u4.Size or UDim2.fromScale(1, 1),
            LayoutOrder = u4.LayoutOrder
        };
        local v18 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            [#v18 + 1] = v8
        };

        return u2.createElement(Empty, v17, v18);
    end)
};