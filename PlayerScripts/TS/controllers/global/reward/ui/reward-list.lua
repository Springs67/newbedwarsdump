-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;

return {
    RewardList = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), RewardTile (copy), Empty (copy)
        local _ = p4.useState;
        u1.createRef();
        local v5 = {
            AutomaticSize = "Y",
            Size = UDim2.fromScale(1, 0)
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local v6 = {};
        local v7 = #v6;
        local v8 = {
            FillDirection = "Horizontal"
        };
        local MaxCellsInList = p3.MaxCellsInList;
        v8.FillDirectionMaxCells = MaxCellsInList == nil and 6 or MaxCellsInList;
        v8.CellSize = p3.CellSize or UDim2.new(0, 48, 0, 48);
        v8.CellPadding = p3.CellPadding or UDim2.new(0, 8, 0, 8);
        v8.HorizontalAlignment = "Center";
        v8.VerticalAlignment = "Center";
        local UIGridlayoutProps = p3.UIGridlayoutProps;

        if UIGridlayoutProps then
            for i, v in UIGridlayoutProps do
                v8[i] = v;
            end;
        end;

        v6[v7 + 1] = u1.createElement("UIGridLayout", v8);
        local Rewards = p3.Rewards;
        local v9;

        if Rewards == nil then
            v9 = Rewards;
        else
            local function _(p10) -- Line: 43
                -- upvalues: u1 (ref), RewardTile (ref)
                return u1.createElement(RewardTile, {
                    Reward = p10
                });
            end;

            v9 = table.create(#Rewards);

            for i, v in Rewards do
                local _ = i - 1;
                v9[i] = u1.createElement(RewardTile, {
                    Reward = v
                });
            end;
        end;

        if v9 then
            for i, v in v9 do
                v6[v7 + 1 + i] = v;
            end;
        end;

        local v11 = #v6;
        local v12 = p3[u1.Children];

        if v12 then
            for i, v in v12 do
                if type(i) == "number" then
                    v6[v11 + i] = v;
                else
                    v6[i] = v;
                end;
            end;
        end;

        return u1.createElement(Empty, v5, v6);
    end)
};