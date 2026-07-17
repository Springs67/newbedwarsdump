-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfileInviteEntry = RuntimeLib.import(script, script.Parent, "clan-profile-invite-entry").ClanProfileInviteEntry;

return {
    ClanProfileInvitePlayersInServer = v3.new(u2)(function(p4, p5) -- Line: 13
        -- upvalues: DeviceUtil (copy), OfflinePlayerUtil (copy), Players (copy), u2 (copy), ClanProfileInviteEntry (copy), AutoCanvasScrollingFrame (copy), Empty (copy), Theme (copy)
        local _ = p5.useState;
        local v6;

        if DeviceUtil.isHoarceKat() then
            v6 = {
                OfflinePlayerUtil.Dummy.SnickTrix,
                OfflinePlayerUtil.Dummy.spleenhook,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99,
                OfflinePlayerUtil.Dummy.grilme99
            };
            table.sort(v6, function(p7, p8) -- Line: 18
                return p7.displayName < p8.displayName;
            end);
        else
            local function _(p9) -- Line: 25
                -- upvalues: Players (ref)
                return p9 ~= Players.LocalPlayer;
            end;

            local v10 = 0;
            local v11 = {};

            for i, v in Players:GetPlayers() do
                local _ = i - 1;

                if v ~= Players.LocalPlayer == true then
                    v10 = v10 + 1;
                    v11[v10] = v;
                end;
            end;

            local function _(p12) -- Line: 38
                -- upvalues: OfflinePlayerUtil (ref)
                return OfflinePlayerUtil.getOfflinePlayer(p12);
            end;

            v6 = table.create(#v11);

            for i, v in v11 do
                local _ = i - 1;
                v6[i] = OfflinePlayerUtil.getOfflinePlayer(v);
            end;

            table.sort(v6, function(p13, p14) -- Line: 47
                return p13.displayName < p14.displayName;
            end);
        end;

        local v15;

        if #v6 == 0 then
            v15 = u2.createElement("TextLabel", {
                Text = "<b>No players in your current server to invite.</b>",
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                TextTransparency = 0,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.8),
                TextColor3 = Theme.textPrimary
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) });
        else
            local v16 = {
                Size = UDim2.new(1, 0, 1, 0)
            };
            local v17 = {};

            local function _(p18) -- Line: 61
                -- upvalues: u2 (ref), ClanProfileInviteEntry (ref)
                return u2.createElement(ClanProfileInviteEntry, {
                    Player = p18
                });
            end;

            local v19 = table.create(#v6);

            for i, v in v6 do
                local _ = i - 1;
                v19[i] = u2.createElement(ClanProfileInviteEntry, {
                    Player = v
                });
            end;

            local v20 = {
                AdditionalSpace = 80,
                ScrollingFrameProps = {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 1, -6)
                }
            };
            local v21 = { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 10)
                }) };
            local v22 = #v21;

            for i, v in v19 do
                v21[v22 + i] = v;
            end;

            v17[#v17 + 1] = u2.createElement(AutoCanvasScrollingFrame, v20, v21);
            v15 = u2.createElement(Empty, v16, v17);
        end;

        local v23 = {
            [#v23 + 1] = v15
        };

        return u2.createFragment(v23);
    end)
};