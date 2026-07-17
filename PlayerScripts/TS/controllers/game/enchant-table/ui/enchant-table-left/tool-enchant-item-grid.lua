-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ToolEnchantMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").ToolEnchantMeta;
local ToolEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ToolEnchantType;
local ToolEnchantItemFrame = RuntimeLib.import(script, script.Parent, "tool-enchant-item-frame").ToolEnchantItemFrame;

return {
    ToolEnchantItemGrid = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: u1 (copy), ToolEnchantType (copy), ToolEnchantMeta (copy), u2 (copy), ToolEnchantItemFrame (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = math;

        local function _(p7) -- Line: 14
            -- upvalues: ToolEnchantMeta (ref)
            return not ToolEnchantMeta[p7].disabled;
        end;

        local v8 = 0;
        local v9 = {};

        for i, v in u1.values(ToolEnchantType) do
            local _ = i - 1;

            if not ToolEnchantMeta[v].disabled == true then
                v8 = v8 + 1;
                v9[v8] = v;
            end;
        end;

        local v10 = v6.max(#v9, 6);
        local v11 = {
            Size = u4.Size,
            LayoutOrder = u4.LayoutOrder
        };
        local v12 = {};

        local function _(p13) -- Line: 37
            -- upvalues: ToolEnchantMeta (ref), u2 (ref), ToolEnchantItemFrame (ref), u4 (copy)
            if not ToolEnchantMeta[p13].disabled then
                return u2.createElement(ToolEnchantItemFrame, {
                    EnchantTableType = u4.EnchantTableType,
                    ToolEnchant = p13
                });
            end;
        end;

        local v14 = 0;
        local v15 = {};

        for i, v in u1.values(ToolEnchantType) do
            local _ = i - 1;
            local v16;

            if ToolEnchantMeta[v].disabled then
                v16 = nil;
            else
                v16 = u2.createElement(ToolEnchantItemFrame, {
                    EnchantTableType = u4.EnchantTableType,
                    ToolEnchant = v
                });
            end;

            if v16 ~= nil then
                v14 = v14 + 1;
                v15[v14] = v16;
            end;
        end;

        local v17 = {
            Size = UDim2.fromScale(0.95, 0.95),
            Position = UDim2.fromScale(0, 0)
        };
        local v18 = { u2.createElement("UIGridLayout", {
                FillDirectionMaxCells = 2,
                VerticalAlignment = "Top",
                HorizontalAlignment = "Center",
                CellSize = UDim2.fromScale(0.5, 1 / math.ceil(v10 / 2)),
                CellPadding = UDim2.new(0, 0, 0.02, 0)
            }) };
        local v19 = #v18;

        for i, v in v15 do
            v18[v19 + i] = v;
        end;

        v12[#v12 + 1] = u2.createElement(Empty, v17, v18);

        return u2.createFragment({
            ToolEnchantsImageGrid = u2.createElement(Empty, v11, v12)
        });
    end)
};