-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local TournamentTeamUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil;

return {
    TournamentAppMatchPanel = v2.new(u1)(function(u3, p4) -- Line: 10
        -- upvalues: EmoteType (copy), RuntimeLib (copy), KnitClient (copy), TournamentTeamUtil (copy), ColorUtil (copy), u1 (copy), EmoteMeta (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(EmoteType.AGNI_ANGRY);
        local v7, u8 = useState("");
        useEffect(function() -- Line: 15
            -- upvalues: RuntimeLib (ref), u3 (copy), KnitClient (ref), u6 (copy), u8 (copy), TournamentTeamUtil (ref)
            RuntimeLib.async(function() -- Line: 16
                -- upvalues: u3 (ref), KnitClient (ref), u6 (ref), u8 (ref), TournamentTeamUtil (ref)
                local v9 = u3.tournamentMatch.opponentTeamIds[1];

                if v9 == "" or not v9 then
                    return nil;
                end;

                local v10 = { KnitClient.Controllers.TournamentTeamController:requestTournamentTeamData(v9):await() };

                if v10[1] and v10[2] then
                    u6(v10[2].icon);
                    u8(TournamentTeamUtil.convertNameToTag(v10[2].name));
                end;
            end)();
        end, {});
        local v11 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.3),
            LayoutOrder = u3.LayoutOrder,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v12 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 2)
            }) };
        local v13 = #v12;
        local v14 = u3.WonMatch and u1.createElement("UIGradient", {
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 0.2) }),
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#59B98B")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#5BA79C")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5E95AD")) })
        });

        if v14 then
            v12[v13 + 1] = v14;
        end;

        local v15 = #v12;
        local v16 = not u3.WonMatch and u1.createElement("UIGradient", {
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 0.2) }),
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#A54F63")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8B6282")), ColorSequenceKeypoint.new(1, Color3.fromHex("#7175A1")) })
        });

        if v16 then
            v12[v15 + 1] = v16;
        end;

        local _ = #v12;
        local createElement = u1.createElement;
        local v17 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            Position = UDim2.fromScale(0, 0)
        };
        local v18 = {
            Team1Icon = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.1, 0.5),
                Size = UDim2.fromScale(0.3, 0.7),
                Image = EmoteMeta[u3.team1Icon].image
            })
        };
        local createElement2 = u1.createElement;
        local v19 = {
            RichText = true,
            TextScaled = true,
            Font = "Roboto",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.4, 0.5),
            Size = UDim2.fromScale(0.25, 0.25),
            Text = "<b>" .. u3.team1Tag .. "</b>"
        };
        local v20;

        if u3.WonMatch then
            v20 = Color3.fromHex("#FFF48E");
        else
            v20 = Color3.fromRGB(255, 255, 255);
        end;

        v19.TextColor3 = v20;
        v18.Team1Tag = createElement2("TextLabel", v19);
        v12.Team1 = createElement("Frame", v17, v18);
        local createElement3 = u1.createElement;
        local v21 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            Position = UDim2.fromScale(0.5, 0)
        };
        local v22 = {
            Team2Icon = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 1,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(0.9, 0.5),
                Size = UDim2.fromScale(0.3, 0.7),
                Image = EmoteMeta[v5].image
            })
        };
        local createElement4 = u1.createElement;
        local v23 = {
            RichText = true,
            TextScaled = true,
            Font = "Roboto",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.6, 0.5),
            Size = UDim2.fromScale(0.25, 0.25),
            Text = "<b>" .. v7 .. "</b>"
        };
        local v24;

        if u3.WonMatch then
            v24 = Color3.fromRGB(255, 255, 255);
        else
            v24 = Color3.fromHex("#FFF48E");
        end;

        v23.TextColor3 = v24;
        v22.Team2Tag = createElement4("TextLabel", v23);
        v12.Team2 = createElement3("Frame", v21, v22);
        local createElement5 = u1.createElement;
        local v25 = {
            RichText = true,
            TextScaled = true,
            Font = "Roboto",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.2),
            Size = UDim2.fromScale(0.25, 0.25),
            Text = u3.WonMatch and "<b>VICTORY</b>" or "<b>DEFEAT</b>"
        };
        local v26;

        if u3.WonMatch then
            v26 = Color3.fromHex("#3ADF7C");
        else
            v26 = Color3.fromHex("#E26583");
        end;

        v25.TextColor3 = v26;
        v12.Outcome = createElement5("TextLabel", v25);
        v12.VSTag = u1.createElement("TextLabel", {
            RichText = true,
            TextScaled = true,
            Text = "<b>vs</b>",
            Font = "Roboto",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.1, 0.15),
            TextColor3 = ColorUtil.WHITE
        });

        return u1.createFragment({
            MatchPanel = u1.createElement("Frame", v11, v12)
        });
    end)
};