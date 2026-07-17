-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractKitStatsCard = RuntimeLib.import(script, script.Parent, "KitStats", "kit-contract-kit-stats-card").KitContractKitStatsCard;
local KitContractKitMasteryEmoteStatsCard = RuntimeLib.import(script, script.Parent, "MasteryInfo", "kit-contract-kit-mastery-emote-stats-card").KitContractKitMasteryEmoteStatsCard;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.KIT_STATS = 0;
v4[0] = "KIT_STATS";
u5.MASTERY_STATS = 1;
v4[1] = "MASTERY_STATS";

local function v18(p6, p7) -- Line: 22
    -- upvalues: u5 (ref), u2 (copy), Empty (copy), ColorUtil (copy), BedwarsImageId (copy), KitContractKitStatsCard (copy), KitContractKitMasteryEmoteStatsCard (copy)
    local v8, u9 = p7.useState(u5.KIT_STATS);
    local v10 = {};

    for i, v in p6 do
        v10[i] = v;
    end;

    v10.SelectedKit = nil;
    v10.UserKitStatProfile = nil;
    v10.HighestUnlockedTier = nil;
    local v11 = {};

    for i, v in v10 do
        v11[i] = v;
    end;

    local createFragment = u2.createFragment;
    local v12 = {};
    local createElement = u2.createElement;
    local v13 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01, 0)
        }),
        KitContractStatPanelTabSelector = u2.createElement(Empty, {
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.85, 0.1)
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }), u2.createElement("ImageButton", {
                Size = UDim2.fromScale(0.3, 1),
                BackgroundColor3 = ColorUtil.BLACK,
                BackgroundTransparency = v8 == u5.KIT_STATS and 0.5 or 0.75,
                BorderSizePixel = 0,

                [u2.Event.MouseButton1Click] = function() -- Line: 62
                    -- upvalues: u9 (copy), u5 (ref)
                    return u9(u5.KIT_STATS);
                end
            }, { u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0),
                    PaddingTop = UDim.new(0.02, 0),
                    PaddingBottom = UDim.new(0.02, 0)
                }), u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.7, 0.7),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Image = BedwarsImageId.SCROLL_SOLID,
                    ImageColor3 = ColorUtil.WHITE
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) }), u2.createElement("ImageButton", {
                Size = UDim2.fromScale(0.3, 1),
                BackgroundColor3 = ColorUtil.BLACK,
                BackgroundTransparency = v8 == u5.MASTERY_STATS and 0.6 or 0.75,
                BorderSizePixel = 0,

                [u2.Event.MouseButton1Click] = function() -- Line: 93
                    -- upvalues: u9 (copy), u5 (ref)
                    return u9(u5.MASTERY_STATS);
                end
            }, { u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0),
                    PaddingTop = UDim.new(0.02, 0),
                    PaddingBottom = UDim.new(0.02, 0)
                }), u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.8),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Image = BedwarsImageId.STAR_SOLID,
                    ImageColor3 = ColorUtil.WHITE
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) }) })
    };
    local createElement2 = u2.createElement;
    local v14 = {
        BackgroundTransparency = 0.6,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.85, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local v15 = {};
    local v16 = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0.03, 0)
    });
    local v17;

    if v8 == u5.KIT_STATS then
        v17 = u2.createElement(KitContractKitStatsCard, {
            Size = UDim2.fromScale(1, 1),
            SelectedKit = p6.SelectedKit,
            UserKitStatProfile = p6.UserKitStatProfile,
            HighestUnlockedTier = p6.HighestUnlockedTier
        });
    else
        v17 = u2.createElement(KitContractKitMasteryEmoteStatsCard, {
            Size = UDim2.fromScale(1, 1),
            SelectedKit = p6.SelectedKit,
            UserKitStatProfile = p6.UserKitStatProfile
        });
    end;

    v15[1], v15[2] = v16, v17;
    v13[2] = createElement2("Frame", v14, v15);
    v12.KitContractStatPanel = createElement(Empty, v11, v13);

    return createFragment(v12);
end;

return {
    KitContractStatPanelTab = u5,
    KitContractStatPanel = v3.new(u2)(v18)
};