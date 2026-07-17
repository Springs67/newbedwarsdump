-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local InventoryHeader = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local InventoryTile = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile;

return {
    InventoryChest = v3.new(u2)(function(p4, p5) -- Line: 18
        -- upvalues: Players (copy), u2 (copy), Empty (copy), InventoryTile (copy), RuntimeLib (copy), default (copy), InventoryHeader (copy), EmptyButton (copy)
        local _ = p5.useState;
        local v6 = {};
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("ObservedChestFolder");
        end;

        local v7 = nil;
        local v8;

        if Character == nil then
            v8 = Character;
        else
            v8 = Character.Value;
        end;

        if v8 then
            v7 = Character.Value;
        end;

        if v7 ~= nil then
            v7 = v7:GetAttribute("Smelter");
        end;

        local v9 = v7 ~= nil;
        local v10 = false;
        local v11 = 0;
        local v12 = v9 and "Smelter" or "Chest";

        while true do
            if v10 then
                v11 = v11 + 1;
            else
                v10 = true;
            end;

            if v11 >= 24 then
                local v13 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v14 = { u2.createElement("UIListLayout", {
                        FillDirection = "Vertical"
                    }), u2.createElement(InventoryHeader, {
                        Title = tostring(p4.Title or v12)
                    }), u2.createElement(Empty, {
                        Size = UDim2.fromScale(0, 0.01)
                    }) };
                local v15 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v16 = {};
                local v17 = {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1)
                };
                local v18;

                if v9 then
                    v18 = Color3.fromRGB(176, 97, 15);
                else
                    v18 = Color3.fromRGB(81, 50, 22);
                end;

                v17.BackgroundColor3 = v18;
                local v19 = { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.02, 0),
                        PaddingRight = UDim.new(0.02, 0),
                        PaddingTop = UDim.new(0.03, 0),
                        PaddingBottom = UDim.new(0.03, 0)
                    }), u2.createElement("UIGridLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        CellSize = UDim2.fromScale(0.14666666666666667, 0.23),
                        CellPadding = UDim2.fromScale(0.02, 0.02)
                    }) };
                local v20 = #v19;

                for i, v in v6 do
                    v19[v20 + i] = v;
                end;

                v16[#v16 + 1] = u2.createElement("Frame", v17, v19);
                v14[#v14 + 1] = u2.createElement(EmptyButton, v15, v16);

                return u2.createElement(Empty, v13, v14);
            end;

            local v21 = nil;
            local u22;

            if v11 < #p4.ObservedChest.items then
                u22 = p4.ObservedChest.items[v11 + 1];

                if u22 == "empty" then
                    u22 = v21;
                end;
            else
                u22 = v21;
            end;

            local createElement = u2.createElement;
            local v23 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v24 = {};
            local v25 = u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.025),
                PaddingBottom = UDim.new(0.025),
                PaddingLeft = UDim.new(0.025),
                PaddingRight = UDim.new(0.025)
            });
            local createElement2 = u2.createElement;
            local v29 = {
                ItemClickLoadingProgress = true,
                InvItem = u22,
                LayoutOrder = v11,
                AutoSelect = v11 == 0,
                OnClick = RuntimeLib.async(function() -- Line: 74
                    -- upvalues: u22 (ref), Players (ref), RuntimeLib (ref), default (ref)
                    if u22 then
                        local Character2 = Players.LocalPlayer.Character;

                        if Character2 ~= nil then
                            Character2 = Character2:FindFirstChild("ObservedChestFolder");
                        end;

                        local v26 = RuntimeLib.await(Character2);
                        local v27;

                        if v26 == nil then
                            v27 = v26;
                        else
                            v27 = v26.Value;
                        end;

                        if v27 then
                            return RuntimeLib.await(default.Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(v26.Value, u22.tool));
                        end;
                    end;
                end),

                SendToHotbarSlot = function(p28) -- Line: 91, Name: SendToHotbarSlot
                end
            };
            local v30;

            if v9 then
                v30 = Color3.fromRGB(214, 191, 20);
            else
                v30 = Color3.fromRGB(110, 69, 28);
            end;

            v29.TileColor = v30;
            v24[1], v24[2] = v25, createElement2(InventoryTile, v29);
            local v31 = createElement(Empty, v23, v24);
            table.insert(v6, v31);
        end;
    end)
};