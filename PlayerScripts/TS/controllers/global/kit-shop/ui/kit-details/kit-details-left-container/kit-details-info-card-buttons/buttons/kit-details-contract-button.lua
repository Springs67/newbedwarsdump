-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local KitDetailsButton = RuntimeLib.import(script, script.Parent.Parent, "kit-details-button").KitDetailsButton;

return {
    KitDetailsContractButton = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: KitContractRewards (copy), KitContractUtils (copy), DeviceUtil (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), KitDetailsButton (copy), ColorUtil (copy), BedwarsImageId (copy)
        local useEffect = p5.useEffect;
        local useMemo = p5.useMemo;
        local u6 = KitContractRewards[u4.SelectedKit];

        if u6 ~= nil then
            u6 = u6.rewards;
        end;

        local v7 = u4.store.Lobby.kitStatsProfiles[u4.SelectedKit];
        local u8, u9 = p5.useState(v7 == nil and {
            wins = 0,
            kills = 0
        } or v7);
        local v14 = useMemo(function() -- Line: 34
            -- upvalues: u6 (copy), KitContractUtils (ref), u4 (copy), u8 (copy)
            if not u6 then
                return nil;
            end;

            local v10 = false;
            local v11 = 0;
            local v12 = 1;

            while true do
                if v10 then
                    v11 = v11 + 1;
                else
                    v10 = true;
                end;

                if v11 >= #u6 then
                    break;
                end;

                local v13 = KitContractUtils.getProgressBarPercentage(u6[v11 + 1].tier, u4.SelectedKit, u8);
                v12 = u6[v11 + 1].tier;

                if v13 < 1 then
                    break;
                end;
            end;

            return v12;
        end, {});
        useEffect(function() -- Line: 60
            -- upvalues: u4 (copy), DeviceUtil (ref), KnitClient (ref), u9 (copy)
            local v15 = u4.store.Lobby.kitStatsProfiles[u4.SelectedKit];

            if v15 == nil then
                local v16;

                if DeviceUtil.isHoarceKat() then
                    v16 = nil;
                else
                    v16 = KnitClient.Controllers.KitContractController:getKitStats(u4.SelectedKit):expect();
                end;

                v15 = v16 or {
                    wins = 0,
                    kills = 0
                };
            end;

            u9(v15);
        end, {});
        local v17 = {};

        for i, v in u4 do
            v17[i] = v;
        end;

        v17.SelectedKit = nil;
        v17.store = nil;
        local v18 = {};

        for i, v in v17 do
            v18[i] = v;
        end;

        v18.Title = "CONTRACT";
        v18.Subtitle = "VIEW";

        function v18.OnClick() -- Line: 85
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_CONTRACT_APP, {
                SelectedKit = u4.SelectedKit
            });
        end;

        v18.Progress = KitContractUtils.getProgressBarPercentage(v14 == nil and 1 or v14, u4.SelectedKit, u8);

        return u2.createElement(KitDetailsButton, v18, { u2.createElement("Frame", {
                Size = UDim2.fromScale(1, 0.7),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(87, 87, 87)
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }),
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    TextStrokeTransparency = 0,
                    TextTransparency = 0.25,
                    ZIndex = 100,
                    Size = UDim2.fromScale(1, 0.35),
                    Position = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0.5, 0.8),
                    Text = "LV." .. tostring(v14),
                    TextColor3 = ColorUtil.WHITE,
                    TextStrokeColor3 = ColorUtil.BLACK,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.75, 0.75),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = BedwarsImageId.SCROLL_SOLID,
                    ScaleType = Enum.ScaleType.Fit
                })
            }) });
    end)
};