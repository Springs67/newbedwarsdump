-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local getPvpArenaAugmentCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-category-meta").getPvpArenaAugmentCategoryMeta;
local PvPArenaAugmentClass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-class").PvPArenaAugmentClass;
local getPvpArenaAugmentClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-class-meta").getPvpArenaAugmentClassMeta;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta");
local getPvPArenaAugmentDescription = v5.getPvPArenaAugmentDescription;
local getPvPArenaAugmentMeta = v5.getPvPArenaAugmentMeta;

return {
    PvPArenaAugmentIcon = v4.new(u3)(function(p6, p7) -- Line: 17
        -- upvalues: getPvPArenaAugmentMeta (copy), getPvpArenaAugmentCategoryMeta (copy), PvPArenaAugmentClass (copy), getPvpArenaAugmentClassMeta (copy), u2 (copy), RunService (copy), u3 (copy), AutoSizedText (copy), getPvPArenaAugmentDescription (copy), TooltipContainer (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8 = getPvPArenaAugmentMeta(p6.Augment);
        local v9 = getPvpArenaAugmentCategoryMeta(v8.augmentCategory);
        local augmentClass = v8.augmentClass;

        if augmentClass == nil then
            augmentClass = PvPArenaAugmentClass.STAT;
        end;

        local v10 = getPvpArenaAugmentClassMeta(augmentClass);
        local v11, u12 = useState(0);
        useEffect(function() -- Line: 28
            -- upvalues: u2 (ref), RunService (ref), u12 (copy)
            local u13 = u2.new();
            local u14 = math.random() * 30;
            local u15 = math.random() * 0.2 + 0.9;
            u13:GiveTask(RunService.Heartbeat:Connect(function(p16) -- Line: 32
                -- upvalues: u14 (ref), u15 (copy), u12 (ref)
                u14 = u14 + p16 * u15;
                u12(u14);
            end));

            return function() -- Line: 36
                -- upvalues: u13 (copy)
                u13:DoCleaning();
            end;
        end, {});
        local v17 = {};
        local FrameProps = p6.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v17[i] = v;
            end;
        end;

        local v18 = {};
        local v19 = #v18;
        local v20 = {
            BackgroundTransparency = 1,
            Image = "rbxassetid://10899316316",
            Size = UDim2.fromScale(0.915, 0.915),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local FrameProps2 = p6.FrameProps;

        if FrameProps2 ~= nil then
            FrameProps2 = FrameProps2.ZIndex;
        end;

        v20.ZIndex = FrameProps2 == nil and 2 or FrameProps2;
        v20.Rotation = 90;
        v18.OuterHexagon = u3.createElement("ImageLabel", v20, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.1504424778761062
            }), u3.createElement("UIGradient", {
                Color = v9.hexagonOutlineGradient,
                Rotation = 45 + v11 * 150
            }) });
        local v21 = {
            BackgroundTransparency = 1,
            Image = "rbxassetid://10899316316",
            Size = UDim2.fromScale(0.815, 0.815),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local FrameProps3 = p6.FrameProps;

        if FrameProps3 ~= nil then
            FrameProps3 = FrameProps3.ZIndex;
        end;

        v21.ZIndex = (FrameProps3 == nil and 3 or FrameProps3) + 1;
        v21.Rotation = 90;
        v18.InnerHexagon = u3.createElement("ImageLabel", v21, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.1497584541062802
            }), u3.createElement("UIGradient", {
                Rotation = -45,
                Color = ColorSequence.new(Color3.fromRGB(23, 23, 23), Color3.fromRGB(97, 97, 97)),
                Offset = Vector2.new(0.5, 0)
            }) });
        local v22 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.4, 0.4),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = v10.image
        };
        local FrameProps4 = p6.FrameProps;

        if FrameProps4 ~= nil then
            FrameProps4 = FrameProps4.ZIndex;
        end;

        v22.ZIndex = (FrameProps4 == nil and 4 or FrameProps4) + 2;
        v18.CutoutImageIcon = u3.createElement("ImageLabel", v22, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.1497584541062802
            }) });
        local v23 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.3233333333333333, 0.3233333333333333),
            Position = UDim2.new(0.85, 0, 0.85, 0),
            AnchorPoint = Vector2.new(1, 1),
            Image = v8.image
        };
        local FrameProps5 = p6.FrameProps;

        if FrameProps5 ~= nil then
            FrameProps5 = FrameProps5.ZIndex;
        end;

        v23.ZIndex = (FrameProps5 == nil and 5 or FrameProps5) + 3;
        v18.CutoutImageSubIcon = u3.createElement("ImageLabel", v23, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.1497584541062802
            }) });
        local EnableTooltip = p6.EnableTooltip;

        if EnableTooltip then
            local v24 = { u3.createElement(AutoSizedText, {
                    TextSize = 16,
                    Text = v8.displayName,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) };
            local v25 = #v24;
            local v26;

            if v9.title == nil then
                v26 = false;
            else
                v26 = u3.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = v9.title.displayName .. " Relic",
                    Font = Enum.Font.SourceSans,
                    TextColor3 = v9.title.color,
                    Limits = Vector2.new(300, 60)
                });
            end;

            if v26 then
                v24[v25 + 1] = v26;
            end;

            v24[#v24 + 1] = u3.createElement(AutoSizedText, {
                TextSize = 14,
                Text = getPvPArenaAugmentDescription(p6.Augment, true),
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(191, 191, 191),
                Limits = Vector2.new(300, 60)
            });
            EnableTooltip = u3.createElement(TooltipContainer, {}, v24);
        end;

        if EnableTooltip then
            v18[v19 + 1] = EnableTooltip;
        end;

        return u3.createFragment({
            AugmentIcon = u3.createElement(Empty, v17, v18)
        });
    end)
};