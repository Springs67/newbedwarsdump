-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render");
local BWPlayerRender = v4.BWPlayerRender;
local PlayerRenderFallbackMode = v4.PlayerRenderFallbackMode;

return {
    KillFeedCardEntity = v3.new(u2)(function(p5, p6) -- Line: 14
        -- upvalues: KnitClient (copy), DeviceUtil (copy), Players (copy), ColorUtil (copy), u2 (copy), BWPlayerRender (copy), PlayerRenderFallbackMode (copy), Empty (copy)
        local _ = p6.useState;
        local teamId = p5.Entity.teamId;
        local v7;

        if teamId == "" or not teamId then
            v7 = nil;
        else
            v7 = KnitClient.Controllers.TeamController:getTeamById(p5.Entity.teamId);
        end;

        local v8;

        if DeviceUtil.isHoarceKat() then
            v8 = false;
        else
            v8 = Players.LocalPlayer.UserId == p5.Entity.userId;
        end;

        local v9 = { Color3.fromRGB(62, 174, 255), Color3.fromRGB(42, 113, 165) };
        local v10;

        if v8 then
            v10 = { Color3.fromRGB(255, 213, 62), Color3.fromRGB(165, 131, 42) };
        else
            local teamId2 = p5.Entity.teamId;
            local v11 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

            if v11 ~= nil then
                v11 = v11.id;
            end;

            v10 = teamId2 ~= v11 and { Color3.fromRGB(255, 62, 62), Color3.fromRGB(164, 39, 39) } or v9;
        end;

        local v12 = {
            AutomaticSize = "X",
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            LayoutOrder = p5.Position == "left" and 1 or 3
        };
        local v13 = { u2.createElement("UIGradient", {
                Rotation = p5.Position == "left" and 180 or 0,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v10[1]), ColorSequenceKeypoint.new(1, v10[2]) })
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 0)
            }) };
        local v14 = #v13;

        if v7 then
            v7 = u2.createFragment({
                TeamIndicator = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.new(0, 4, 1, 0),
                    BackgroundColor3 = v7.color,
                    LayoutOrder = p5.Position == "left" and 1 or 5
                })
            });
        end;

        if v7 then
            v13[v14 + 1] = v7;
        end;

        local v15 = #v13;
        local v16;

        if p5.Entity.userId == nil then
            v16 = false;
        else
            v16 = u2.createFragment({
                EntityImage = u2.createElement(BWPlayerRender, {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    FallbackMode = PlayerRenderFallbackMode.KIT,
                    PlayerUserId = p5.Entity.userId,
                    Size = UDim2.fromScale(1, 1),
                    LayoutOrder = p5.Position == "left" and 2 or 4
                })
            });
        end;

        if v16 then
            v13[v15 + 1] = v16;
        end;

        local v17 = #v13;
        local v18;

        if p5.Entity.icon == nil then
            v18 = false;
        else
            v18 = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = p5.Entity.icon,
                LayoutOrder = p5.Position == "left" and 2 or 4
            });
        end;

        if v18 then
            v13[v17 + 1] = v18;
        end;

        local createElement = u2.createElement;
        local v19 = {
            AutomaticSize = "X",
            BorderSizePixel = 0,
            LayoutOrder = 3,
            Size = UDim2.fromScale(0, 0.9)
        };
        local v20 = { (u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 2 or 6),
                PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 2 or 6),
                PaddingLeft = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 8),
                PaddingRight = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 8)
            })) };
        local createElement2 = u2.createElement;
        local v21 = {
            TextScaled = true,
            AutomaticSize = "X",
            AutoLocalize = false,
            SizeConstraint = "RelativeYY",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            TextTransparency = 1,
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0, 1),
            Text = p5.Entity.name,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.GothamBold
        };
        local v22;

        if p5.Position == "left" then
            v22 = Enum.TextXAlignment.Left;
        else
            v22 = Enum.TextXAlignment.Right;
        end;

        v21.TextXAlignment = v22;
        v20.EntityName = createElement2("TextLabel", v21);
        v13[#v13 + 1] = createElement(Empty, v19, v20);

        return u2.createFragment({
            KillerSection = u2.createElement("Frame", v12, v13)
        });
    end)
};