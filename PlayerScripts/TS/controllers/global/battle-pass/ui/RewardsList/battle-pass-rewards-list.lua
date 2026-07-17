-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local BattlePassRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
local BattlePassLevelRewardsListLevelCard = RuntimeLib.import(script, script.Parent, "battle-pass-level-rewards-list-level-card").BattlePassLevelRewardsListLevelCard;
local BattlePassRewardsListPassTitles = RuntimeLib.import(script, script.Parent, "battle-pass-rewards-list-pass-titles").BattlePassRewardsListPassTitles;

return {
    BattlePassRewardsList = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: BattlePassRewards (copy), getBattlePassMetadata (copy), u2 (copy), BattlePassRewardsListPassTitles (copy), Empty (copy), BattlePassLevelRewardsListLevelCard (copy), AutoCanvasScrollingFrame (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local useMemo = p5.useMemo;

        local function _(p6) -- Line: 17
            return p6.level == 1;
        end;

        local v7 = nil;

        for i, v in BattlePassRewards[u4.battlepass] do
            local _ = i - 1;

            if v.level == 1 == true then
                v7 = v;
                break;
            end;
        end;

        local u8, u9 = useState(v7);
        local u10, u11 = useState(nil);
        useEffect(function() -- Line: 31
            -- upvalues: u11 (copy), getBattlePassMetadata (ref), u4 (copy)
            u11(getBattlePassMetadata(u4.battlepass));
        end, { u4.battlepass });
        local v27 = useMemo(function() -- Line: 34
            -- upvalues: u10 (copy), BattlePassRewards (ref), u4 (copy)
            if not u10 then
                return {};
            end;

            local v12 = false;
            local v13 = 1;
            local u14 = {};

            while true do
                if v12 then
                    v13 = v13 + 1;
                else
                    v12 = true;
                end;

                local v15 = u10;

                if v15 ~= nil then
                    v15 = v15.maxLevel;
                end;

                if v13 > v15 then
                    break;
                end;

                u14[v13] = {};
            end;

            local v16 = false;
            local v17 = 1;

            while true do
                if v16 then
                    v17 = v17 + 1;
                else
                    v16 = true;
                end;

                local v18 = u10;

                if v18 ~= nil then
                    v18 = v18.epilogueLevels;
                end;

                if v17 > (v18 == nil and 0 or v18) then
                    local v19 = BattlePassRewards[u4.battlepass];

                    local function v25(p20) -- Line: 92
                        -- upvalues: u14 (copy)
                        if u14[p20.level] == nil then
                            u14[p20.level] = { p20 };

                            return;
                        end;

                        local level = p20.level;
                        local v21 = {};
                        local v22 = #v21;
                        local v23 = u14[p20.level];
                        local v24 = #v23;
                        table.move(v23, 1, v24, v22 + 1, v21);
                        v21[v22 + v24 + 1] = p20;
                        u14[level] = v21;
                    end;

                    for i, v in v19 do
                        v25(v, i - 1, v19);
                    end;

                    return u14;
                end;

                local v26 = u10;

                if v26 ~= nil then
                    v26 = v26.maxLevel;
                end;

                u14[v26 + v17] = {};
            end;
        end, { u10 });
        local v28 = useMemo(function() -- Line: 121
            -- upvalues: u2 (ref), BattlePassRewardsListPassTitles (ref)
            return u2.createElement(BattlePassRewardsListPassTitles, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1)
            });
        end, {});
        local v29 = {
            BackgroundTransparency = 1,
            Size = u4.Size,
            LayoutOrder = u4.LayoutOrder
        };
        local v30 = { u2.createElement(Empty, {
                Size = UDim2.new(1, 0, 0.95, 0)
            }, { v28 }) };
        local _ = #v30;
        local v31 = {};
        local v32 = #v31;

        for i, v in v27 do
            v32 = v32 + 1;
            v31[v32] = { i, v };
        end;

        local function v36(p33) -- Line: 146
            -- upvalues: u2 (ref), BattlePassLevelRewardsListLevelCard (ref), u4 (copy), u9 (copy), u8 (copy)
            local v34 = p33[1];
            local v35 = p33[2];

            return u2.createElement(BattlePassLevelRewardsListLevelCard, {
                Level = v34,
                BattlePass = u4.store.BattlePass,
                Size = UDim2.new(0, 90, 0.95, 0),
                SetReward = u4.SetReward,
                LevelRewards = v35,
                LayoutOrder = v34,
                SetActive = u9,
                Active = u8
            });
        end;

        local v37 = table.create(#v31);

        for i, v in v31 do
            v37[i] = v36(v, i - 1, v31);
        end;

        local v38 = {
            AdditionalSpace = 50,
            ScrollingFrameProps = {
                ScrollBarThickness = 8,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Position = UDim2.new(0, 24, 0, 0),
                Size = UDim2.new(1, -24, 1, 0),
                ScrollingDirection = Enum.ScrollingDirection.X
            }
        };
        local v39 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2),
                PaddingRight = UDim.new(0, 2)
            }) };
        local v40 = #v39;

        for i, v in v37 do
            v39[v40 + i] = v;
        end;

        v30.BattlePassRewardsList = u2.createElement(AutoCanvasScrollingFrame, v38, v39);

        return u2.createFragment({
            BattlePassRewardsListContainer = u2.createElement("Frame", v29, v30)
        });
    end)
};