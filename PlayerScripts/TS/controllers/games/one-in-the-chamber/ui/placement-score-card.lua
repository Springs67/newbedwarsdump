-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local PlayerRender = v1.PlayerRender;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function _(p4) -- Line: 12
    return p4 == 1 and "1st" or (p4 == 2 and "2nd" or (p4 == 3 and "3rd" or "" .. tostring(p4) .. "th"));
end;

return {
    PlacementScoreCard = v3.new(u2)(function(p5, p6) -- Line: 24
        -- upvalues: ColorUtil (copy), u2 (copy), DeviceUtil (copy), Theme (copy), BedwarsImageId (copy), PlayerRender (copy), Empty (copy)
        local _ = p6.useState;
        local v7 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.darken(p5.TeamColor, 0.8),
            LayoutOrder = p5.Placement
        };
        local v8 = {};
        local v9 = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 2.24
        });
        local v10 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.25, 0)
        });
        local createElement = u2.createElement;
        local v11 = {};
        local v12;

        if p5.IsLocalTeam then
            v12 = ColorUtil.WHITE;
        else
            v12 = ColorUtil.brighten(p5.TeamColor, 0.2);
        end;

        v11.Color = v12;
        v11.Thickness = DeviceUtil.isSmallScreen() and 1.5 or (p5.IsLocalTeam and 3 or 2);
        v8[1], v8[2], v8[3] = v9, v10, createElement("UIStroke", v11);
        local createElement2 = u2.createElement;
        local v13 = {
            AutomaticSize = "XY",
            BackgroundTransparency = 1,
            TextStrokeTransparency = 0,
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0.25, 0.7)
        };
        local v14;

        if DeviceUtil.isSmallScreen() then
            v14 = Enum.FontSize.Size12;
        else
            v14 = Enum.FontSize.Size18;
        end;

        v13.FontSize = v14;
        local v15;

        if p5.Placement == 1 then
            v15 = Theme.mcYellow;
        else
            v15 = Color3.fromRGB(255, 255, 255);
        end;

        v13.TextColor3 = v15;
        v13.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
        v13.Font = Enum.Font.GothamBlack;
        local Placement = p5.Placement;
        v13.Text = Placement == 1 and "1st" or (Placement == 2 and "2nd" or (Placement == 3 and "3rd" or "" .. tostring(Placement) .. "th"));
        v8.Placement = createElement2("TextLabel", v13);
        local v16 = #v8;
        local v17;

        if p5.Placement == 1 then
            v17 = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                ZIndex = -1,
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.45, 0.45),
                Image = BedwarsImageId.CROWN_SOLID,
                ImageColor3 = Theme.mcYellow
            });
        else
            v17 = false;
        end;

        if v17 then
            v8[v16 + 1] = v17;
        end;

        local v18 = #v8;
        local v19;

        if p5.MainPlayer == nil then
            v19 = false;
        else
            local createElement3 = u2.createElement;
            local v20 = {
                BackgroundTransparency = 1,
                Rotation = -5,
                Position = UDim2.fromScale(0, 0.8),
                AnchorPoint = Vector2.new(0.25, 0.5),
                PlayerUserId = p5.MainPlayer.UserId
            };
            local v21;

            if DeviceUtil.isSmallScreen() then
                v21 = UDim2.fromScale(0.6, 0.6);
            else
                v21 = UDim2.fromScale(0.5, 0.5);
            end;

            v20.Size = v21;
            v19 = createElement3(PlayerRender, v20, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v19 then
            v8[v18 + 1] = v19;
        end;

        local _ = #v8;
        local v22 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v23 = {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0)
            }),
            Name = u2.createElement("TextLabel", {
                TextSize = 10,
                TextYAlignment = "Center",
                TextTransparency = 0,
                BackgroundTransparency = 1,
                TextStrokeTransparency = 0,
                TextScaled = true,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.4),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                Text = p5.Name,
                Font = Enum.Font.GothamBlack
            })
        };
        local _ = #v23;
        local v24 = {
            Size = UDim2.fromScale(1, 0.6),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        };
        local ShowMaxScore = p5.ShowMaxScore;
        local v25;

        if ShowMaxScore == 0 or (ShowMaxScore ~= ShowMaxScore or not ShowMaxScore) then
            v25 = tostring(p5.Score);
        else
            v25 = tostring(p5.Score) .. "/" .. tostring(p5.ShowMaxScore);
        end;

        v24.Text = v25;
        v24.TextSize = 10;
        v24.TextYAlignment = "Center";
        v24.Font = Enum.Font.GothamBlack;
        v24.BackgroundTransparency = 1;
        v24.TextStrokeTransparency = 0;
        v24.TextScaled = true;
        v24.LayoutOrder = 2;
        v23.Score = u2.createElement("TextLabel", v24);
        v8.UserInfo = u2.createElement(Empty, v22, v23);

        return u2.createFragment({
            ["ScoreEntry_" .. p5.Name] = u2.createElement("Frame", v7, v8)
        });
    end)
};