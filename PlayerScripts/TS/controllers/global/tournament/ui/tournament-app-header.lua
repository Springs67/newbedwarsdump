-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TournamentAppTab = RuntimeLib.import(script, script.Parent, "tournament-app-types").TournamentAppTab;

return {
    TournamentAppHeader = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: u2 (copy), TournamentAppTab (copy), DeviceUtil (copy), ClientStore (copy), Players (copy), Empty (copy), Flamework (copy), SoundManager (copy), GameSound (copy)
        local function _(p6) -- Line: 15
            -- upvalues: u4 (copy)
            return p6 == u4.SelectedTab;
        end;

        local v7 = {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.1),
            BackgroundColor3 = Color3.fromHex("403E74")
        };
        local v8 = {};
        local v9 = {
            Size = UDim2.fromScale(0.95, 1),
            Position = UDim2.fromScale(0.025, 0)
        };
        local v10 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.03, 0)
            }),
            ["Header Title"] = u2.createElement("TextLabel", {
                Text = "<b>TOURNAMENTS</b>",
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.25, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local createElement = u2.createElement;
        local v11 = {
            Text = "<b>INFO</b>",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.1, 0.5)
        };
        local v12;

        if TournamentAppTab.INFO == u4.SelectedTab then
            v12 = Color3.fromHex("7975CF");
        else
            v12 = Color3.fromHex("000000");
        end;

        v11.BackgroundColor3 = v12;
        v11.BackgroundTransparency = TournamentAppTab.INFO == u4.SelectedTab and 0 or 0.6;
        v11.BorderSizePixel = 0;
        v11.LayoutOrder = 1;
        v11.RichText = true;

        v11[u2.Event.Activated] = function() -- Line: 56
            -- upvalues: u4 (copy), TournamentAppTab (ref)
            u4.SelectTabButton(TournamentAppTab.INFO);
        end;

        v10.TournamentInfoPage = createElement("TextButton", v11, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) });
        local createElement2 = u2.createElement;
        local v13 = {
            Text = "<b>TEAM</b>",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.1, 0.5)
        };
        local v14;

        if TournamentAppTab.TEAM == u4.SelectedTab then
            v14 = Color3.fromHex("7975CF");
        else
            v14 = Color3.fromHex("000000");
        end;

        v13.BackgroundColor3 = v14;
        v13.BackgroundTransparency = TournamentAppTab.TEAM == u4.SelectedTab and 0 or 0.6;
        v13.BorderSizePixel = 0;
        v13.LayoutOrder = 2;
        v13.RichText = true;

        v13[u2.Event.Activated] = function() -- Line: 73
            -- upvalues: u4 (copy), TournamentAppTab (ref)
            u4.SelectTabButton(TournamentAppTab.TEAM);
        end;

        v10.TournamentTeamButton = createElement2("TextButton", v13, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) });
        local createElement3 = u2.createElement;
        local v15 = {
            Text = "<b>MATCHES</b>",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.1, 0.5)
        };
        local v16;

        if TournamentAppTab.BRACKET == u4.SelectedTab then
            v16 = Color3.fromHex("7975CF");
        else
            v16 = Color3.fromHex("000000");
        end;

        v15.BackgroundColor3 = v16;
        v15.BackgroundTransparency = TournamentAppTab.BRACKET == u4.SelectedTab and 0 or 0.6;
        v15.BorderSizePixel = 0;
        v15.LayoutOrder = 3;
        v15.RichText = true;

        v15[u2.Event.Activated] = function() -- Line: 90
            -- upvalues: u4 (copy), TournamentAppTab (ref)
            u4.SelectTabButton(TournamentAppTab.BRACKET);
        end;

        v10.TournamentBracketButton = createElement3("TextButton", v15, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) });
        local createElement4 = u2.createElement;
        local v17 = {
            Text = "<b>INVITES</b>",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.1, 0.5)
        };
        local v18;

        if TournamentAppTab.INVITES == u4.SelectedTab then
            v18 = Color3.fromHex("7975CF");
        else
            v18 = Color3.fromHex("000000");
        end;

        v17.BackgroundColor3 = v18;
        v17.BackgroundTransparency = TournamentAppTab.INVITES == u4.SelectedTab and 0 or 0.6;
        v17.BorderSizePixel = 0;
        v17.LayoutOrder = 4;
        v17.RichText = true;

        v17[u2.Event.Activated] = function() -- Line: 107
            -- upvalues: u4 (copy), TournamentAppTab (ref)
            u4.SelectTabButton(TournamentAppTab.INVITES);
        end;

        v10.TournamentInvitesButton = createElement4("TextButton", v17, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) });
        local v19 = #v10;
        local v20;

        if DeviceUtil.isHoarceKat() then
            v20 = true;
        elseif ClientStore:getState().Tournament.myTeamLeader == Players.LocalPlayer.UserId then
            local createFragment = u2.createFragment;
            local v21 = {};
            local createElement5 = u2.createElement;
            local v22 = {
                Text = "<b>SEND</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0.1, 0.5)
            };
            local v23;

            if TournamentAppTab.OUTBOUND_INVITES == u4.SelectedTab then
                v23 = Color3.fromHex("7975CF");
            else
                v23 = Color3.fromHex("000000");
            end;

            v22.BackgroundColor3 = v23;
            v22.BackgroundTransparency = TournamentAppTab.OUTBOUND_INVITES == u4.SelectedTab and 0 or 0.6;
            v22.BorderSizePixel = 0;
            v22.LayoutOrder = 5;
            v22.RichText = true;

            v22[u2.Event.Activated] = function() -- Line: 127
                -- upvalues: u4 (copy), TournamentAppTab (ref)
                u4.SelectTabButton(TournamentAppTab.OUTBOUND_INVITES);
            end;

            v21.TournamentOutboundInvitesButton = createElement5("TextButton", v22, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }) });
            v20 = createFragment(v21);
        else
            v20 = false;
        end;

        if type(v20) == "table" then
            v10[v19 + 1] = v20;
        end;

        v10[#v10 + 1] = u2.createElement(Empty, {
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.11, 1)
        });
        v10.CloseButton = u2.createElement("TextButton", {
            Text = "<b>X</b>",
            Font = "Arial",
            RichText = true,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.1, 0.5),
            BackgroundTransparency = 1,
            TextScaled = true,
            BorderSizePixel = 0,
            LayoutOrder = 6,

            [u2.Event.Activated] = function() -- Line: 154
                -- upvalues: Flamework (ref), u4 (copy), SoundManager (ref), GameSound (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u4.AppId);
                SoundManager:playSound(GameSound.UI_CLOSE_2);
            end
        });
        v8[#v8 + 1] = u2.createElement(Empty, v9, v10);

        return u2.createFragment({
            ["Tournament App Header"] = u2.createElement("Frame", v7, v8)
        });
    end)
};