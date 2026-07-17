-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local Workspace = v5.Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    GiveItemOnCooldownApp = v4.new(u3)(function(u6, p7) -- Line: 17
        -- upvalues: Players (copy), u2 (copy), InventoryUtil (copy), Workspace (copy), getItemMeta (copy), u3 (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy), BedwarsImageId (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = "Next" .. u6.itemType .. "ReceiveTime";
        local v9 = Players.LocalPlayer:GetAttribute(u8);
        local u10, u11 = useState(v9 == nil and 0 or v9);
        local v12, u13 = useState(0);
        local v14, u15 = useState(false);
        useEffect(function() -- Line: 29
            -- upvalues: u2 (ref), Players (ref), u8 (copy), u11 (copy)
            local u16 = u2.new();
            u16:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(u8):Connect(function() -- Line: 31
                -- upvalues: Players (ref), u8 (ref), u11 (ref)
                local v17 = Players.LocalPlayer:GetAttribute(u8);

                if v17 ~= 0 and (v17 == v17 and v17) then
                    u11(v17);
                end;
            end));

            return function() -- Line: 37
                -- upvalues: u16 (copy)
                u16:DoCleaning();
            end;
        end);
        useEffect(function() -- Line: 41
            -- upvalues: InventoryUtil (ref), Players (ref), u6 (copy), u15 (copy), u10 (copy), Workspace (ref), u13 (copy)
            local u18 = true;

            local function u21() -- Line: 44
                -- upvalues: u18 (ref), InventoryUtil (ref), Players (ref), u6 (ref), u15 (ref), u10 (ref), Workspace (ref), u13 (ref), u21 (ref)
                task.delay(1, function() -- Line: 45
                    -- upvalues: u18 (ref), InventoryUtil (ref), Players (ref), u6 (ref), u15 (ref), u10 (ref), Workspace (ref), u13 (ref), u21 (ref)
                    if not u18 then
                        return nil;
                    end;

                    if InventoryUtil.getAmount(Players.LocalPlayer, u6.itemType) >= u6.maxAmount then
                        u15(true);
                    else
                        u15(false);
                    end;

                    local v19 = u10 - Workspace:GetServerTimeNow();
                    local v20 = 1 - math.round(v19) / u6.interval;
                    u13((math.clamp(v20, 0, 1)));
                    u21();
                end);
            end;

            u21();

            return function() -- Line: 62
                -- upvalues: u18 (ref)
                u18 = false;
            end;
        end, { u10 });
        local displayName = getItemMeta(u6.itemType).displayName;
        local v22 = {
            BackgroundTransparency = 0.6,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v23 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(2)
            }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                    TextSize = 16,
                    Text = displayName .. " Item Timer",
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = "When the bar fills up you will receive another " .. displayName,
                    Font = Enum.Font.SourceSans,
                    TextColor3 = Color3.fromRGB(191, 191, 191),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    TextSize = 14,
                    RichText = true,
                    Text = "Max " .. displayName .. "s: " .. tostring(u6.maxAmount),
                    Font = Enum.Font.SourceSans,
                    TextColor3 = Color3.fromRGB(191, 191, 191),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Limits = Vector2.new(300, 60)
                }) }) };
        local _ = #v23;
        local v24 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v25 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u3.createElement("Frame", {
                LayoutOrder = 1,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.1, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(4)
                }), u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(80, 150, 200),
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.fromScale(0, 1),
                    Size = UDim2.fromScale(1, (math.clamp(v12, 0, 1)))
                }, { u3.createElement("UIGradient", {
                        Rotation = 60,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(Color3.fromRGB(209, 135, 64), 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(Color3.fromRGB(209, 135, 64), 0.9)) })
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(4)
                    }) }) }) };
        local v26 = #v25;
        local v27 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.5, 1)
        };
        local image = getItemMeta(u6.itemType).image;

        if image == nil then
            image = BedwarsImageId.WORLD_EDIT_ROTATE;
        end;

        v27.Image = image;
        v27.BackgroundTransparency = 1;
        v25[v26 + 1] = u3.createElement("ImageLabel", v27);

        if v14 then
            v14 = u3.createElement(AutoSizedText, {
                Text = "MAX",
                TextSize = 14,
                Font = Enum.Font.SourceSansBold,
                TextColor3 = Color3.fromRGB(255, 89, 89),
                TextYAlignment = Enum.TextYAlignment.Center
            });
        end;

        if v14 then
            v25[v26 + 2] = v14;
        end;

        v23.Container = u3.createElement(Empty, v24, v25);

        return u3.createFragment({
            [u6.itemType .. "Timer"] = u3.createElement("Frame", v22, v23)
        });
    end)
};