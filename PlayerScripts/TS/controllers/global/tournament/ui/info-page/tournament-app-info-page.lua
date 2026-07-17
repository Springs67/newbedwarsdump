-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local TournamentFullSchedule = RuntimeLib.import(script, script.Parent, "tournament-full-schedule").TournamentFullSchedule;

return {
    TournamentAppInfoPage = v2.new(u1)(function(p3, p4) -- Line: 9
        -- upvalues: u1 (copy), EmoteMeta (copy), EmoteType (copy), Empty (copy), TournamentFullSchedule (copy)
        local _ = p4.useState;

        return u1.createFragment({
            ["App Content - Info"] = u1.createElement("Frame", {
                LayoutOrder = 2,
                BackgroundTransparency = 0,
                BorderSizePixel = 1,
                Size = UDim2.fromScale(1, 0.9),
                BackgroundColor3 = Color3.fromHex("403E74")
            }, {
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
                    Image = EmoteMeta[EmoteType.CYBER_DEFENSE].image,
                    Size = UDim2.fromScale(0.4, 0.7),
                    ScaleType = Enum.ScaleType.Fit,
                    Position = UDim2.fromScale(0, 1),
                    AnchorPoint = Vector2.new(0, 1)
                }),
                Container = u1.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u1.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    u1.createElement(TournamentFullSchedule),
                    Info = u1.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.6, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }, {
                        InfoHeader = u1.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            TextScaled = true,
                            Text = "Welcome to the BedWars Weekly Tournament!",
                            ZIndex = 4,
                            Size = UDim2.fromScale(0.8, 0.1),
                            AnchorPoint = Vector2.new(0.5, 0),
                            Position = UDim2.fromScale(0.5, 0.05),
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.LuckiestGuy
                        }, { u1.createElement("UIStroke", {
                                Thickness = 1,
                                Color = Color3.fromRGB(0, 0, 0)
                            }) }),
                        InfoBody = u1.createElement("TextLabel", {
                            BackgroundTransparency = 0.7,
                            BorderSizePixel = 0,
                            TextScaled = true,
                            RichText = true,
                            TextXAlignment = "Left",
                            ZIndex = 4,
                            Text = "<b>Tournaments are still in BETA, and we are looking for feedback to improve the experience.</b> \n\nTournaments will be held every other week on Saturday. Please check the schedule on the right for the next tournament date. \n\nTournament queues are split up into divisions, based on the average skill level of your team members, so you will play against teams of similar skill.\nThe averaged Division is based on each team member\'s rating across both Ranked and Un-Ranked queues.\n\nThe divisions, from highest to lowest, are: \n- Division I \n- Division II \n- Division III \n\nThere are 3 regions, NA, SEA, and EU, each with their own weekly tournament timeslot. \nYou can view the full tournament schedule on the right. \nWe have selected these divisions and tournament times to aim for balanced games with low queue times. \n\nGood luck and have fun!",
                            Size = UDim2.fromScale(0.8, 0.7),
                            AnchorPoint = Vector2.new(0.5, 0),
                            Position = UDim2.fromScale(0.5, 0.17),
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }, { u1.createElement("UICorner", {
                                CornerRadius = UDim.new(0.05, 0)
                            }), u1.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0.01, 0),
                                PaddingRight = UDim.new(0.01, 0),
                                PaddingTop = UDim.new(0.01, 0),
                                PaddingBottom = UDim.new(0.01, 0)
                            }) })
                    })
                })
            })
        });
    end)
};