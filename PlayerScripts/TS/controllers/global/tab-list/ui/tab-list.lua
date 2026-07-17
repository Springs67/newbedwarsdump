-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local MatchEventList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "match", "ui", "match-event", "match-event-list").MatchEventList;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config");
local calcCardsDimensions = v4.calcCardsDimensions;
local tabListLayout = v4.tabListLayout;
local TabListTeamCards = RuntimeLib.import(script, script.Parent, "tab-list-team-cards").TabListTeamCards;
local v8 = v2.new(u1)(function(p5, p6) -- Line: 11
    -- upvalues: calcCardsDimensions (copy), u1 (copy), tabListLayout (copy), MatchEventList (copy), TabListTeamCards (copy)
    local _ = p6.useState;
    local v7 = calcCardsDimensions();

    return u1.createFragment({
        TabListScreenGui = u1.createElement("ScreenGui", {
            DisplayOrder = 1002,
            IgnoreGuiInset = true,
            ResetOnSpawn = false
        }, {
            TabListFrame = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(tabListLayout.heightScale, tabListLayout.widthScale),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(tabListLayout.openedPositionX, 0, tabListLayout.openedPositionY, 0)
            }, {
                u1.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(960, 540),
                    MinSize = Vector2.new(16, 9)
                }),
                u1.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 6)
                }),
                u1.createElement(MatchEventList, {
                    AppId = "MatchEventList",
                    Size = UDim2.new(1, 0, 0, 40)
                }),
                u1.createElement(TabListTeamCards, {
                    CardDimensions = v7
                })
            })
        })
    });
end);

return {
    TabList = v3.connect(function(p9, p10) -- Line: 47
        local v11 = {};

        for i, v in p10 do
            v11[i] = v;
        end;

        return v11;
    end)(v8)
};