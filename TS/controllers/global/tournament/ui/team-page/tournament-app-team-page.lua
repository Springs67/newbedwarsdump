-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local TournamentAppEmotePopup = RuntimeLib.import(script, script.Parent, "emote-popup", "tournament-app-emote-popup").TournamentAppEmotePopup;
local TournamentTeamHeader = RuntimeLib.import(script, script.Parent, "tournament-team-header").TournamentTeamHeader;
local TournamentTeamMembers = RuntimeLib.import(script, script.Parent, "tournament-team-members").TournamentTeamMembers;
local TournamentTeamSchedule = RuntimeLib.import(script, script.Parent, "tournament-team-schedule").TournamentTeamSchedule;

return {
    TournamentAppTeamPage = v2.new(u1)(function(p4, p5) -- Line: 15
        -- upvalues: RuntimeLib (copy), KnitClient (copy), u1 (copy), TournamentAppEmotePopup (copy), Empty (copy), TournamentTeamSchedule (copy), EmoteMeta (copy), TournamentTeamHeader (copy), RunService (copy), Players (copy), TournamentTeamMembers (copy)
        local v6, u7 = p5.useState(false);
        local v9 = RuntimeLib.async(function(p8) -- Line: 18
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.TournamentTeamController:updateTournamentTeamIcon(p8);
        end);
        local v10 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.9)
        };
        local v11 = {};
        local v12 = #v11;

        if v6 then
            v6 = u1.createElement(TournamentAppEmotePopup, {
                onClose = function() -- Line: 28, Name: onClose
                    -- upvalues: u7 (copy)
                    return u7(false);
                end,

                onSetIcon = v9
            });
        end;

        if v6 then
            v11[v12 + 1] = v6;
        end;

        local _ = #v11;
        v11.TeamContentHolder = u1.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 1)
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u1.createElement(TournamentTeamSchedule, {
                region = p4.Region
            }),
            ["Left Side - Team Info"] = u1.createElement("Frame", {
                LayoutOrder = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.6, 1),
                BackgroundColor3 = Color3.fromHex("403E74")
            }, {
                Gradient = u1.createElement("UIGradient", {
                    Rotation = 60,
                    Transparency = NumberSequence.new(0.6, 1),
                    Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
                }),
                TeamIconBackground = u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ImageTransparency = 0.96,
                    ZIndex = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = EmoteMeta[p4.TeamIcon].image,
                    ScaleType = Enum.ScaleType.Fit
                }),
                u1.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u1.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0.01, 0)
                    }),
                    u1.createElement(TournamentTeamHeader, {
                        TeamId = p4.TeamId,
                        TeamName = p4.TeamName,
                        TeamIcon = p4.TeamIcon,
                        Region = p4.Region,
                        Division = p4.Division,
                        IsLocalLeader = RunService:IsStudio() and true or Players.LocalPlayer.UserId == p4.TeamLeader,
                        Emotes = p4.Emotes,

                        SetOpenEmoteSelectionScreen = function() -- Line: 86, Name: SetOpenEmoteSelectionScreen
                            -- upvalues: u7 (copy)
                            u7(true);
                        end
                    }),
                    Line = u1.createElement("Frame", {
                        BackgroundTransparency = 0.75,
                        BorderSizePixel = 0,
                        LayoutOrder = 3,
                        ZIndex = 3,
                        Size = UDim2.fromScale(0.95, 0.003),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    }),
                    u1.createElement(TournamentTeamMembers, {
                        TeamId = p4.TeamId,
                        TeamLeader = p4.TeamLeader,
                        TeamMembers = p4.TeamMembers
                    })
                })
            })
        });

        return u1.createFragment({
            ["App Content - Team"] = u1.createElement(Empty, v10, v11)
        });
    end)
};