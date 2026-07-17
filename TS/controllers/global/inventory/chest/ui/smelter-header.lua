-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local LuckyBlockSmelterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block-smelter", "lucky-block-smelter-util").LuckyBlockSmelterUtil;
local LuckyBlockRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v3 = u2.Component:extend("SmelterHeader");

function v3.init(p4, p5) -- Line: 16
end;

function v3.didMount(p6) -- Line: 18
end;

function v3.willUnmount(p7) -- Line: 20
end;

function v3.render(p8) -- Line: 22
    -- upvalues: LuckyBlockSmelterUtil (copy), LuckyBlockRarity (copy), u2 (copy), Empty (copy), ProgressBar (copy), Theme (copy), Button (copy), RuntimeLib (copy), Players (copy), default (copy)
    local v9 = math.min(p8.props.SmeltPoints / 0.8, 1);
    local u10 = p8.props.SmeltPoints >= 0.03;
    local v11 = LuckyBlockSmelterUtil.getGuaranteedLowestRarityFromSmeltPoints(p8.props.SmeltPoints);
    local v12;

    if v11 == 0 or (v11 ~= v11 or not v11) then
        v12 = LuckyBlockSmelterUtil.RarityEffectColors[LuckyBlockRarity.COMMON];
    else
        v12 = LuckyBlockSmelterUtil.RarityEffectColors[v11];
    end;

    local v13;

    if v11 == 0 or (v11 ~= v11 or not v11) then
        v13 = nil;
    else
        v13 = LuckyBlockSmelterUtil.guaranteedRarityToWeightedSelect[v11];
    end;

    local u14 = {};

    if v13 then
        local u15 = v13:getCumulativeWeight();
        local v16 = v13:getObjects();

        local function v25(p17) -- Line: 40
            -- upvalues: u15 (copy), LuckyBlockSmelterUtil (ref), LuckyBlockRarity (ref), u14 (copy), u2 (ref)
            local v18 = p17.weight / u15 * 100;
            local v19 = LuckyBlockSmelterUtil.RarityEffectColors[p17.luckyBlockRarity];
            local v20 = LuckyBlockRarity[p17.luckyBlockRarity];
            local v21 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X
            };
            local v22 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.04, 0)
                }) };
            local v23 = #v22;

            if v19 then
                v19 = u2.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = v19,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1)
                    }), u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
            end;

            if v19 then
                v22[v23 + 1] = v19;
            end;

            v22[#v22 + 1] = u2.createElement("TextLabel", {
                Font = "Roboto",
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                Text = v20 .. ": <b>" .. tostring(v18) .. "%</b>",
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            });
            local v24 = u2.createElement("Frame", v21, v22);
            table.insert(u14, v24);
        end;

        for i, v in v16 do
            v25(v, i - 1, v16);
        end;
    end;

    local v26 = {
        LayoutOrder = 0,
        Size = UDim2.fromScale(1, 0.4)
    };
    local v27 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }) };
    local v28 = #v27;
    local v29 = {
        Size = UDim2.fromScale(1, 0.1)
    };
    local v30 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.03, 0)
        }) };
    local v31 = #v30;

    for i, v in u14 do
        v30[v31 + i] = v;
    end;

    v27[v28 + 1] = u2.createElement(Empty, v29, v30);
    v27[v28 + 2] = u2.createElement(ProgressBar, {
        LayoutOrder = 0,
        Size = UDim2.fromScale(1, 0.35),
        Progress = v9,
        BarColor = v12,
        BarBackgroundColor = Theme.backgroundTertiary
    });
    local createElement = u2.createElement;
    local v32 = {
        Text = "<b>SMELT</b>",
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.3, 0.3)
    };
    local v33;

    if u10 then
        v33 = Theme.backgroundSuccess;
    else
        v33 = Theme.backgroundError;
    end;

    v32.BackgroundColor3 = v33;
    v32.OnClick = RuntimeLib.async(function() -- Line: 142
        -- upvalues: u10 (copy), Players (ref), RuntimeLib (ref), default (ref)
        if not u10 then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("ObservedChestFolder");
        end;

        local v34 = RuntimeLib.await(Character);
        local v35;

        if v34 == nil then
            v35 = v34;
        else
            v35 = v34.Value;
        end;

        if v35 then
            default.Client:Get("SmeltChestContentsRequested"):SendToServer({
                chestFolder = v34.Value
            });
        end;
    end);
    v27.SmeltButton = createElement(Button, v32);

    return u2.createElement(Empty, v26, v27);
end;

return {
    SmelterHeader = v3
};