-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KitContractRewardsListCard = RuntimeLib.import(script, script.Parent, "kit-contract-rewards-list-card").KitContractRewardsListCard;

return {
    KitContractRewardsListContainer = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: KitContractRewards (copy), u2 (copy), KitContractRewardsListCard (copy), SoundManager (copy), GameSound (copy), Button (copy), BedwarsImageId (copy), Empty (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local HighestUnlockedTier = u4.HighestUnlockedTier;

        local function u10(u6) -- Line: 23
            -- upvalues: KitContractRewards (ref), u4 (copy)
            local v7 = KitContractRewards[u4.SelectedKit];

            if not v7 then
                return Vector2.new(0, 0);
            end;

            local function _(p8) -- Line: 29
                -- upvalues: u6 (copy)
                return p8.tier == u6;
            end;

            local v9 = -1;

            for i, v in v7.rewards do
                local _ = i - 1;

                if v.tier == u6 == true then
                    v9 = i - 1;
                    break;
                end;
            end;

            if v9 == -1 then
                return Vector2.new(0, 0);
            end;

            return Vector2.new(v9 * 201.5 - 427.8125 + 100, 0);
        end;

        local u11 = p5.useValue(u2.createRef());
        local u12, u13 = useState(HighestUnlockedTier == nil and 1 or HighestUnlockedTier);
        useEffect(function() -- Line: 57
            -- upvalues: u11 (copy), u10 (copy), u12 (copy)
            local u14 = u11.value:getValue();

            if not u14 then
                return nil;
            end;

            task.defer(function() -- Line: 62
                -- upvalues: u14 (copy), u10 (ref), u12 (ref)
                u14.CanvasPosition = u10(u12);
            end);
        end, { u12 });
        useEffect(function() -- Line: 66
            -- upvalues: KitContractRewards (ref), u4 (copy), u12 (copy)
            local v15 = KitContractRewards[u4.SelectedKit];

            if v15 ~= nil then
                local function _(p16) -- Line: 71
                    -- upvalues: u12 (ref)
                    return p16.tier == u12;
                end;

                v15 = nil;

                for i, v in v15.rewards do
                    local _ = i - 1;

                    if v.tier == u12 == true then
                        v15 = v;
                        break;
                    end;
                end;
            end;

            u4.SetReward(v15);
        end, { u12 });
        local v17 = {};

        for i, v in u4 do
            v17[i] = v;
        end;

        v17.store = nil;
        v17.SelectedKit = nil;
        v17.SetReward = nil;
        v17.UserKitStatProfile = nil;
        v17.KitContractProfile = nil;
        v17.HighestUnlockedTier = nil;
        v17.Reward = nil;
        local v18 = {};

        for i, v in v17 do
            v18[i] = v;
        end;

        local v19 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) };
        local v20 = KitContractRewards[u4.SelectedKit];

        if v20 ~= nil then
            local rewards = v20.rewards;

            local function v24(p21, p22) -- Line: 116
                -- upvalues: u2 (ref), KitContractRewardsListCard (ref), u4 (copy), u13 (copy), SoundManager (ref), GameSound (ref)
                return u2.createFragment({
                    ["KitContractRewardsListCard" .. tostring(p22)] = u2.createElement(KitContractRewardsListCard, {
                        store = u4.store,
                        LayoutOrder = p22,
                        Reward = p21,
                        SelectedKit = u4.SelectedKit,
                        KitStats = u4.UserKitStatProfile,
                        KitContractProfile = u4.KitContractProfile,
                        ActiveCard = u4.Reward,

                        OnSelectCard = function(p23) -- Line: 126, Name: OnSelectCard
                            -- upvalues: u13 (ref), SoundManager (ref), GameSound (ref)
                            u13(p23);
                            SoundManager:playSound(GameSound.UI_CLICK);
                        end
                    })
                });
            end;

            v20 = table.create(#rewards);

            for i, v in rewards do
                v20[i] = v24(v, i - 1, rewards);
            end;
        end;

        local v25 = {
            Size = UDim2.new(0.925, 0, 1, 0),
            CanvasSize = UDim2.new(1.85, 0, 1, -10),
            BackgroundTransparency = 1,
            ScrollBarThickness = 4,
            ScrollBarImageTransparency = 0.3,
            LayoutOrder = 1,
            [u2.Ref] = u11.value
        };
        local v26 = { u2.createElement("UIGridLayout", {
                FillDirectionMaxCells = 10,
                CellPadding = UDim2.new(0.0075, 0, 0, 0),
                CellSize = UDim2.new(0.092, 0, 1, -10),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v27 = #v26;

        if v20 then
            for i, v in v20 do
                v26[v27 + i] = v;
            end;
        end;

        v19[#v19 + 1] = u2.createElement("ScrollingFrame", v25, v26);
        v19.PreviousButton = u2.createElement(Button, {
            LayoutOrder = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.05, 1),

            OnClick = function() -- Line: 172, Name: OnClick
                -- upvalues: KitContractRewards (ref), u4 (copy), u12 (copy), u13 (copy), SoundManager (ref), GameSound (ref)
                if not KitContractRewards[u4.SelectedKit] then
                    return nil;
                end;

                local v28 = u12 - 1;
                u13(v28 < 1 and 1 or v28);
                SoundManager:playSound(GameSound.UI_CLICK);
            end
        }, { u2.createElement("ImageLabel", {
                Rotation = -90,
                ImageTransparency = 0.3,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 0.125),
                Image = BedwarsImageId.ROUNDED_TRIANGLE_UP,
                ScaleType = Enum.ScaleType.Fit
            }) });
        v19.NextButton = u2.createElement(Button, {
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.05, 1),

            OnClick = function() -- Line: 199, Name: OnClick
                -- upvalues: KitContractRewards (ref), u4 (copy), u12 (copy), u13 (copy), SoundManager (ref), GameSound (ref)
                local v29 = KitContractRewards[u4.SelectedKit];

                if not v29 then
                    return nil;
                end;

                local v30 = #v29.rewards;
                local v31 = u12 + 1;

                if v30 >= v31 then
                    v30 = v31;
                end;

                u13(v30);
                SoundManager:playSound(GameSound.UI_CLICK);
            end
        }, { u2.createElement("ImageLabel", {
                Rotation = 90,
                ImageTransparency = 0.3,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 0.125),
                Image = BedwarsImageId.ROUNDED_TRIANGLE_UP,
                ScaleType = Enum.ScaleType.Fit
            }) });

        return u2.createElement(Empty, v18, v19);
    end)
};