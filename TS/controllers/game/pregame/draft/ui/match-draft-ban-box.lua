-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local TooltipContainer = v1.TooltipContainer;
local OutCubic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    MatchDraftBanBox = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: u2 (copy), default (copy), OutCubic (copy), StringUtil (copy), TooltipContainer (copy), AutoSizedText (copy), BedwarsKitMeta (copy), BedwarsImageId (copy), Empty (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();

        local function v9() -- Line: 18
            -- upvalues: u6 (copy), default (ref), OutCubic (ref)
            local u7 = u6:getValue();

            if u7 then
                default(0.2, OutCubic, function(p8) -- Line: 21
                    -- upvalues: u7 (copy)
                    u7.Position = p8;
                end, UDim2.fromScale(1, -0.4), UDim2.fromScale(1, 0));
            end;
        end;

        local BanData = p4.BanData;

        if BanData ~= nil then
            BanData = BanData.Kit;
        end;

        useEffect(v9, { BanData });
        local BanData2 = p4.BanData;

        if BanData2 ~= nil then
            BanData2 = BanData2.Probability;
        end;

        local v10 = BanData2 ~= nil;

        if v10 then
            local v11 = {
                Size = UDim2.fromScale(1, 0.25)
            };
            local BanData3 = p4.BanData;

            if BanData3 ~= nil then
                BanData3 = BanData3.Probability;
            end;

            v11.Text = StringUtil.roundNumber((BanData3 == nil and 0 or BanData3) * 100, 1) .. "%";
            v11.TextColor3 = Color3.fromRGB(255, 255, 255);
            v11.TextXAlignment = "Center";
            v11.TextScaled = true;
            v11.Font = Enum.Font.SourceSansBold;
            v11.AutoLocalize = false;
            v11.BorderSizePixel = 0;
            v11.BackgroundTransparency = 1;
            v11.LayoutOrder = 1;
            v10 = u2.createFragment({
                Probability = u2.createElement("TextLabel", v11)
            });
        end;

        local v12 = {
            Size = p4.Size or UDim2.fromScale(1, 1),
            Position = p4.Position,
            AnchorPoint = p4.AnchorPoint
        };
        local v13 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.9
            }) };
        local v14 = #v13;

        if v10 then
            v13[v14 + 1] = v10;
        end;

        local _ = #v13;
        local v15 = {};
        local BanData3 = p4.BanData;

        if BanData3 ~= nil then
            BanData3 = BanData3.Probability;
        end;

        v15.Size = UDim2.fromScale(1, BanData3 == nil and 1 or 0.7);
        v15.SizeConstraint = "RelativeYY";
        v15.BackgroundColor3 = Color3.fromRGB(159, 49, 49);
        v15.BorderColor3 = p4.TeamColor or Color3.fromRGB(28, 28, 28);
        v15.LayoutOrder = 2;
        local BanData4 = p4.BanData;

        if BanData4 ~= nil then
            BanData4 = BanData4.Kit;
        end;

        if BanData4 then
            BanData4 = u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    TextSize = 16,
                    Text = BedwarsKitMeta[p4.BanData.Kit].name,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) });
        end;

        local v16 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local v17 = #v16;

        if BanData4 then
            v16[v17 + 1] = BanData4;
        end;

        local v18 = #v16;
        local BanData5 = p4.BanData;

        if BanData5 ~= nil then
            BanData5 = BanData5.Kit;
        end;

        if BanData5 then
            BanData5 = u2.createFragment({
                KitImage = u2.createElement("ImageLabel", {
                    Image = BedwarsKitMeta[p4.BanData.Kit].renderImage,
                    BorderSizePixel = 0,
                    ScaleType = "Crop",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = "RelativeYY",
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0),
                    [u2.Ref] = u6
                })
            });
        end;

        if BanData5 then
            v16[v18 + 1] = BanData5;
        end;

        local v19 = #v16;
        local BanData6 = p4.BanData;

        if BanData6 ~= nil then
            BanData6 = BanData6.LockedIn;
        end;

        if BanData6 then
            BanData6 = u2.createFragment({
                BanIcon = u2.createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    ScaleType = "Crop",
                    BackgroundTransparency = 1,
                    SizeConstraint = "RelativeYY",
                    Image = BedwarsImageId.BLOCK_ICON,
                    Size = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.fromScale(1, 1)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        end;

        if BanData6 then
            v16[v19 + 1] = BanData6;
        end;

        local v20 = #v16;
        local v21 = p4[u2.Children];

        if v21 then
            for i, v in v21 do
                if type(i) == "number" then
                    v16[v20 + i] = v;
                else
                    v16[i] = v;
                end;
            end;
        end;

        v13.Box = u2.createElement("Frame", v15, v16);

        return u2.createFragment({
            MatchDraftBanBox = u2.createElement(Empty, v12, v13)
        });
    end)
};