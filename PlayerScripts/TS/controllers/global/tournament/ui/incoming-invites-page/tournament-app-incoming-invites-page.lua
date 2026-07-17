-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AutoCanvasScrollingFrame = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local TournamentAppIncomingInviteRow = RuntimeLib.import(script, script.Parent, "tournament-app-incoming-invite-row").TournamentAppIncomingInviteRow;

return {
    TournamentAppIncomingInvitesPage = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), BedwarsImageId (copy), TournamentAppIncomingInviteRow (copy), AutoCanvasScrollingFrame (copy)
        local _ = p4.useState;
        local v5 = {
            LayoutOrder = 2,
            BackgroundTransparency = 0,
            BorderSizePixel = 1,
            Size = UDim2.fromScale(1, 0.9),
            BackgroundColor3 = Color3.fromHex("403E74")
        };
        local v6 = {
            Gradient = u1.createElement("UIGradient", {
                Rotation = 60,
                Transparency = NumberSequence.new(0.6, 1),
                Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
            }),
            DecorativeBackgroundImage = u1.createElement("ImageLabel", {
                ImageTransparency = 0.8,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 2,
                Image = BedwarsImageId.TALIYAH_INVITE,
                Size = UDim2.fromScale(0.4, 0.7),
                ScaleType = Enum.ScaleType.Fit,
                Position = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(1, 1)
            })
        };
        local _ = #v6;
        local v7 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.95, 0.95),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v8 = {};
        local _ = #v8;
        local Invites = p3.Invites;

        local function _(p9, p10) -- Line: 47
            -- upvalues: u1 (ref), TournamentAppIncomingInviteRow (ref)
            return u1.createElement(TournamentAppIncomingInviteRow, {
                Invite = p9,
                Index = p10
            });
        end;

        local v11 = table.create(#Invites);

        for i, v in Invites do
            v11[i] = u1.createElement(TournamentAppIncomingInviteRow, {
                Invite = v,
                Index = i - 1
            });
        end;

        local v12 = {
            ScrollingFrameProps = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 0.9),
                CanvasSize = UDim2.fromScale(1, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y
            }
        };
        local v13 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.03, 0)
            }) };
        local v14 = #v13;

        for i, v in v11 do
            v13[v14 + i] = v;
        end;

        v8.InvitesList = u1.createElement(AutoCanvasScrollingFrame, v12, v13);
        v6.Background = u1.createElement("Frame", v7, v8);

        return u1.createFragment({
            ["App Content - Invites"] = u1.createElement("Frame", v5, v6)
        });
    end)
};