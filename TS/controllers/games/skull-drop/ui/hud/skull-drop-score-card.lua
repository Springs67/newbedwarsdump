-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local PlayerRender = v1.PlayerRender;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function _(p4) -- Line: 13
    return p4 == 1 and "1st" or (p4 == 2 and "2nd" or (p4 == 3 and "3rd" or "" .. tostring(p4) .. "th"));
end;

return {
    SkullDropScoreCard = v3.new(u2)(function(p5, p6) -- Line: 25
        -- upvalues: ColorUtil (copy), u2 (copy), DeviceUtil (copy), Theme (copy), BedwarsImageId (copy), PlayerRender (copy), BalanceFile (copy), Empty (copy)
        local _ = p6.useState;
        local _ = p6.useEffect;
        local v7 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.darken(p5.TeamColor, 0.8),
            BackgroundTransparency = p5.Eliminated and 0.6 or 0
        };
        local LayoutOrder = p5.LayoutOrder;

        if LayoutOrder == nil then
            LayoutOrder = p5.Placement;
        end;

        v7.LayoutOrder = LayoutOrder;
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
        v11.Transparency = p5.Eliminated and 0.6 or 0;
        v8[1], v8[2], v8[3] = v9, v10, createElement("UIStroke", v11);
        local createElement2 = u2.createElement;
        local v13 = {
            AutomaticSize = "XY",
            BackgroundTransparency = 1,
            TextStrokeTransparency = 0,
            Position = UDim2.fromScale(p5.Eliminated and 0.5 or 0, 0),
            AnchorPoint = Vector2.new(p5.Eliminated and 0.5 or 0.25, 0.7)
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
        v13.TextTransparency = p5.Eliminated and 0.6 or 0;
        v13.Font = Enum.Font.GothamBlack;
        local v16;

        if p5.Eliminated then
            v16 = "Eliminated";
        else
            local Placement = p5.Placement;
            v16 = Placement == 1 and "1st" or (Placement == 2 and "2nd" or (Placement == 3 and "3rd" or "" .. tostring(Placement) .. "th"));
        end;

        v13.Text = v16;
        v8.Placement = createElement2("TextLabel", v13);
        local v17 = #v8;
        local v18;

        if p5.Placement == 1 then
            v18 = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                ZIndex = -1,
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.45, 0.45),
                Image = BedwarsImageId.CROWN_SOLID,
                ImageColor3 = Theme.mcYellow,
                ImageTransparency = p5.Eliminated and 0.6 or 0
            });
        else
            v18 = false;
        end;

        if v18 then
            v8[v17 + 1] = v18;
        end;

        local v19 = #v8;
        local v20;

        if p5.MainPlayer == nil then
            v20 = false;
        else
            local createElement3 = u2.createElement;
            local v21 = {
                BackgroundTransparency = 1,
                Rotation = -5,
                Position = UDim2.fromScale(0, 0.8),
                AnchorPoint = Vector2.new(0.25, 0.5),
                PlayerUserId = p5.MainPlayer.UserId
            };
            local v22;

            if DeviceUtil.isSmallScreen() then
                v22 = UDim2.fromScale(0.6, 0.6);
            else
                v22 = UDim2.fromScale(0.5, 0.5);
            end;

            v21.Size = v22;
            v21.ImageTransparency = p5.Eliminated and 0.6 or 0;
            v20 = createElement3(PlayerRender, v21, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v20 then
            v8[v19 + 1] = v20;
        end;

        local _ = #v8;
        local v23 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v24 = {
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
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                RichText = true,
                TextScaled = true,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.3),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Text = "<b>" .. p5.Name .. "</b>",
                TextTransparency = p5.Eliminated and 0.6 or 0.3,
                Font = Enum.Font.GothamBold
            })
        };
        local _ = #v24;
        local v25 = {
            Size = UDim2.fromScale(1, 0.65),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        };
        local MaxScore = p5.MaxScore;

        if MaxScore == nil then
            MaxScore = BalanceFile.HUNTER_WIN_SKULL_COUNT;
        end;

        v25.Text = "<b>" .. tostring(p5.Score) .. "<font size=\"16\" transparency=\".3\">/" .. tostring(MaxScore) .. "</font></b>";
        v25.TextSize = 24;
        v25.TextYAlignment = "Center";
        v25.Font = Enum.Font.Roboto;
        v25.BackgroundTransparency = 1;
        v25.TextTransparency = p5.Eliminated and 0.6 or 0;
        v25.RichText = true;
        v25.TextScaled = true;
        v25.LayoutOrder = 2;
        v24.Score = u2.createElement("TextLabel", v25);
        v8.UserInfo = u2.createElement(Empty, v23, v24);

        return u2.createFragment({
            ["ScoreEntry_" .. p5.Name] = u2.createElement("Frame", v7, v8)
        });
    end)
};