-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local NewsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    NewsReader = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: NewsMeta (copy), SoundManager (copy), GameSound (copy), u3 (copy), Empty (copy), BedwarsImageId (copy), u2 (copy), AutoCanvasScrollingFrame (copy)
        local _ = p6.useState;
        local v7 = NewsMeta[u5.SelectedNews];

        local function v8() -- Line: 17
            -- upvalues: SoundManager (ref), GameSound (ref), u5 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u5.SetSelectedNews(nil);
        end;

        local v9 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        };
        local v10 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.05)
            }, {
                Title = u3.createElement("TextLabel", {
                    Font = "GothamBold",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.7, 1),
                    Text = v7.title,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }),
                GoBackIcon = u3.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    Image = BedwarsImageId.ARROW_LEFT,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    ScaleType = Enum.ScaleType.Fit,
                    ImageTransparency = 0.2,
                    BackgroundTransparency = 1,
                    [u3.Event.Activated] = v8
                })
            }) };
        local _ = #v10;
        local v11 = u2.values(v7.pageAssetIds);

        local function v14(p12, p13) -- Line: 63
            -- upvalues: u3 (ref)
            return u3.createFragment({
                ["Page:" .. tostring(p13)] = u3.createElement("ImageLabel", {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    SizeConstraint = Enum.SizeConstraint.RelativeXX,
                    Image = p12,
                    ScaleType = Enum.ScaleType.Fit
                })
            });
        end;

        local v15 = table.create(#v11);

        for i, v in v11 do
            v15[i] = v14(v, i - 1, v11);
        end;

        local v16 = {
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.9)
            }
        };
        local v17 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }) };
        local v18 = #v17;

        for i, v in v15 do
            v17[v18 + i] = v;
        end;

        v10.PagesList = u3.createElement(AutoCanvasScrollingFrame, v16, v17);

        return u3.createFragment({
            NewsReader = u3.createElement(Empty, v9, v10)
        });
    end)
};