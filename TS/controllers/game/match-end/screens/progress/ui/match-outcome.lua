-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;

return {
    MatchOutcome = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: OfflinePlayerUtil (copy), DeviceUtil (copy), GamePlayerUtil (copy), Players (copy), ClientStore (copy), u2 (copy), BedwarsImageId (copy), ColorUtil (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = {
            id = "4",
            name = "Orange",
            members = {
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal
            },
            color = Color3.fromRGB(255, 166, 71)
        };
        local v7 = DeviceUtil.isHoarceKat() and "3" or GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();

        if not DeviceUtil.isHoarceKat() then
            local function _(p8) -- Line: 32
                -- upvalues: u4 (copy)
                return p8.id == u4.WinningTeamId;
            end;

            v6 = nil;

            for i, v in ClientStore:getState().Game.teams do
                local _ = i - 1;

                if v.id == u4.WinningTeamId == true then
                    v6 = v;
                    break;
                end;
            end;
        end;

        local v9;

        if v6 == nil then
            v9 = v6;
        else
            v9 = v6.id;
        end;

        local v10 = v7 == v9;
        local v11 = {
            BackgroundTransparency = 1,
            Size = u4.Size or UDim2.fromScale(0.5, 0.5),
            AnchorPoint = u4.AnchorPoint or Vector2.new(0.5, 0.5),
            Position = u4.Position or UDim2.fromScale(0.5, 0.5),
            LayoutOrder = u4.LayoutOrder
        };
        local v12 = {};
        local createElement = u2.createElement;
        local v13 = {
            ImageTransparency = 0.8,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v14;

        if v10 then
            v14 = BedwarsImageId.TROPHY_SOLID;
        else
            v14 = BedwarsImageId.BURST_ICON;
        end;

        v13.Image = v14;
        local v15;

        if v10 then
            v15 = Color3.fromHex("FFBD54");
        else
            v15 = ColorUtil.WHITE;
        end;

        v13.ImageColor3 = v15;
        v13.ScaleType = Enum.ScaleType.Fit;
        v13.Visible = not DeviceUtil.isSmallScreen();
        v12.MatchOutcomeImage = createElement("ImageLabel", v13);
        local _ = #v12;
        local v16 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v17 = { (u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })) };
        local createElement2 = u2.createElement;
        local v18 = {
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.6 or 0.5),
            Text = v10 and "VICTORY" or "DEFEAT",
            Font = Enum.Font.LuckiestGuy
        };
        local v19;

        if v10 then
            v19 = ColorUtil.hexColor(8585079);
        else
            v19 = ColorUtil.WHITE;
        end;

        v18.TextColor3 = v19;
        v17.MatchOutcome = createElement2("TextLabel", v18);
        local _ = #v17;
        local v20 = {
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.3 or 0.2),
            Text = not v6 and "" or string.upper(v6.name) .. " TEAM WINS",
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        };

        if v6 ~= nil then
            v6 = v6.color;
        end;

        v20.TextColor3 = v6;
        v20.TextScaled = true;
        v20.BackgroundTransparency = 1;
        v20.LayoutOrder = 1;
        v17.WinningTeam = u2.createElement("TextLabel", v20);
        v12.MatchOutcomeText = u2.createElement("Frame", v16, v17);

        return u2.createFragment({
            MatchOutcomeWrapper = u2.createElement("Frame", v11, v12)
        });
    end)
};