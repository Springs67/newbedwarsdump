-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanWarActiveBanner = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), ClanWarUtils (copy), Empty (copy), Theme (copy), ColorUtil (copy), Countdown (copy)
        local _ = p5.useState;
        local v6 = {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.22),
            BackgroundColor3 = Color3.fromRGB(51, 53, 94)
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        return u2.createFragment({
            Header = u2.createElement("Frame", v6, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.175, 0),
                    PaddingBottom = UDim.new(0.175, 0),
                    PaddingLeft = UDim.new(0.04, 0),
                    PaddingRight = UDim.new(0.04, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.05, 0)
                }),
                u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = ClanWarUtils.CLAN_WAR_LOGO,
                    ScaleType = Enum.ScaleType.Fit
                }),
                u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.7, 1)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.03, 0)
                    }),
                    Title = u2.createElement("TextLabel", {
                        Text = "<b>CLAN WAR</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.45),
                        TextColor3 = Theme.textPrimary
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24
                        }) }),
                    WarDates = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        TextTransparency = 0.3,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.25),
                        Text = os.date("%x %I:%M %p", ClanWarUtils.clanWarResetTime:getNextWeeklyResetTime() - 604800) .. " - " .. os.date("%x %I:%M %p", ClanWarUtils.clanWarResetTime:getNextWeeklyResetTime()),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }),
                    WarCountdown = u2.createElement(Countdown, {
                        PreText = "<font transparency=\".3\">Ends In:</font> ",
                        EndTime = ClanWarUtils.clanWarResetTime:getNextWeeklyResetTime(),
                        TextLabel = {
                            TextScaled = true,
                            RichText = true,
                            TextXAlignment = "Left",
                            TextYAlignment = "Center",
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.3),
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            TextColor3 = ColorUtil.WHITE
                        }
                    })
                })
            })
        });
    end)
};