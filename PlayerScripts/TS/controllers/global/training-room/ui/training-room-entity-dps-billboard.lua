-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local NametagConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig;

return {
    TrainingRoomEntityDpsBillboard = v2.new(u1)(function(u4, p5) -- Line: 11
        -- upvalues: KnitClient (copy), Players (copy), RunService (copy), u1 (copy), NametagConfig (copy), AfkPlaceUtils (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(nil);
        local u8 = nil;
        local initialPlayerDpsData = u4.initialPlayerDpsData;
        local _, u9 = useState("0.00");
        local v10, u11 = useState("0.00");
        local v12, u13 = useState("0.00");
        useEffect(function() -- Line: 20
            -- upvalues: u7 (copy), u4 (copy), u8 (ref), KnitClient (ref), Players (ref), initialPlayerDpsData (ref), u9 (copy), RunService (ref), u13 (copy), u11 (copy)
            u7(u4.initialTargetDpsData);
            u8 = u4.initialTargetDpsData;
            KnitClient.Controllers.TrainingRoomDpsCounterController.syncEvents.PlayerDpsUpdatedEvent:connect(function(p14) -- Line: 25
                -- upvalues: Players (ref), initialPlayerDpsData (ref), u4 (ref), u7 (ref), u8 (ref), u9 (ref)
                if p14.player == Players.LocalPlayer then
                    initialPlayerDpsData = p14.dpsData;
                    local v15 = p14.dpsData.targetDamageDataMap[u4.entityInstance];

                    if v15 then
                        u7(v15);
                        u8 = v15;
                        u9(string.format("%.2f", v15.totalDamage));
                    end;
                end;
            end);
            local u17 = RunService.Heartbeat:Connect(function() -- Line: 38
                -- upvalues: u8 (ref), initialPlayerDpsData (ref), u13 (ref), u11 (ref)
                if not u8 then
                    return nil;
                end;

                if not initialPlayerDpsData then
                    return nil;
                end;

                if not initialPlayerDpsData.isRecording then
                    return nil;
                end;

                local v16 = tick() - u8.damageRecordingStartTime;
                u13((string.format("%.2f", v16)));
                u11((string.format("%.2f", u8.totalDamage / v16)));
            end);

            return function() -- Line: 55
                -- upvalues: u17 (copy)
                u17:Disconnect();
            end;
        end, {});

        return u1.createFragment({
            ["TrainingRoomEntityDpsBillboard_" .. u4.entityInstance.Name] = u1.createElement("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(0, 6.5, 0),
                AlwaysOnTop = true,
                ResetOnSpawn = false,
                AutoLocalize = false,
                Adornee = u4.entityInstance,
                Size = UDim2.fromScale(10, 5),
                MaxDistance = NametagConfig.BillboardMaxDistanceGame
            }, { u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u1.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Bottom",
                        HorizontalAlignment = "Left",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 6)
                    }),
                    u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextStrokeTransparency = 1,
                        TextSize = 12,
                        LayoutOrder = 0,
                        Text = "Total Damage: " .. string.format("%.2f", not v6 and 0 or v6.totalDamage),
                        AnchorPoint = Vector2.new(0, 0),
                        Size = UDim2.new(1, 0, 0, 13),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Font = AfkPlaceUtils.Theme.font,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextColor3 = Color3.new(1, 0.23, 0.23)
                    }),
                    u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextStrokeTransparency = 1,
                        TextSize = 12,
                        LayoutOrder = 1,
                        Text = "Damage Per Second: " .. v10,
                        AnchorPoint = Vector2.new(0, 0),
                        Size = UDim2.new(1, 0, 0, 13),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Font = AfkPlaceUtils.Theme.font,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextColor3 = Color3.new(1, 0.23, 0.23)
                    }),
                    u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextStrokeTransparency = 1,
                        TextSize = 12,
                        LayoutOrder = 2,
                        Text = "Time: " .. v12,
                        AnchorPoint = Vector2.new(0, 0),
                        Size = UDim2.new(1, 0, 0, 13),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Font = AfkPlaceUtils.Theme.font,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextColor3 = Color3.new(1, 0.23, 0.23)
                    })
                }) })
        });
    end)
};