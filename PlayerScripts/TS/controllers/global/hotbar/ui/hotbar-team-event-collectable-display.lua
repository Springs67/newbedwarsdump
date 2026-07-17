-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local StudioQueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    HotbarTeamEventCollectableDisplay = v2.new(u1)(function(p3, p4) -- Line: 11
        -- upvalues: EventMeta (copy), KnitClient (copy), DeviceUtil (copy), StudioQueueType (copy), getQueueMeta (copy), default (copy), u1 (copy)
        local useEffect = p4.useEffect;
        local v5 = EventMeta[p3.EventType];
        local v6, u7 = p4.useState((KnitClient.Controllers.GlobalTeamsController:getCollectedPointsDuringMatch()));
        local v8;

        if DeviceUtil.isHoarceKat() then
            v8 = StudioQueueType;
        else
            v8 = KnitClient.Controllers.MatchController:getQueueType();
        end;

        local v9 = v8 and getQueueMeta(v8).disableTeamEventCollectable and true or false;
        useEffect(function() -- Line: 22
            -- upvalues: default (ref), u7 (copy)
            local u11 = default.Client:Get("TeamEventCollectableCollected"):Connect(function(p10) -- Line: 23
                -- upvalues: u7 (ref)
                u7(p10.amountAfterCollection);
            end);

            return function() -- Line: 26
                -- upvalues: u11 (copy)
                u11:Disconnect();
            end;
        end, {});
        local v12 = not v9;

        if v12 then
            local v13 = {
                Size = UDim2.fromScale(0.8, 0.8),
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            };
            local customPagesConfig = v5.customPagesConfig;

            if customPagesConfig ~= nil then
                customPagesConfig = customPagesConfig.setTeamPage;

                if customPagesConfig ~= nil then
                    customPagesConfig = customPagesConfig.eventContributionCurrency;
                end;
            end;

            v13.Image = customPagesConfig;
            v13.BackgroundTransparency = 1;
            v13.BorderSizePixel = 0;
            v12 = u1.createElement("ImageLabel", v13);
        end;

        local v14 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(1.16, 0.5),
            Size = UDim2.fromScale(0.15, 0.5)
        };
        local v15 = { u1.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }) };
        local v16 = #v15;

        if v12 then
            v15[v16 + 1] = v12;
        end;

        local v17 = #v15;
        local v18 = not v9 and u1.createElement("TextLabel", {
            TextScaled = true,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = tostring(v6),
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Roboto
        });

        if v18 then
            v15[v17 + 1] = v18;
        end;

        return u1.createFragment({
            HotbarTeamEventCollectableDisplay = u1.createElement("Frame", v14, v15)
        });
    end)
};