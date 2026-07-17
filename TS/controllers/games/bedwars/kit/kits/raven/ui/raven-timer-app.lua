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
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;

return {
    RavenTimerApp = v4.new(u3)(function(p6, p7) -- Line: 16
        -- upvalues: Players (copy), u2 (copy), InventoryUtil (copy), ItemType (copy), Workspace (copy), u3 (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8 = Players.LocalPlayer:GetAttribute("NextRavenReceiveTime");
        local u9, u10 = useState(v8 == nil and 0 or v8);
        local v11, u12 = useState(0);
        local v13, u14 = useState(false);
        useEffect(function() -- Line: 27
            -- upvalues: u2 (ref), Players (ref), u10 (copy)
            local u15 = u2.new();
            u15:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("NextRavenReceiveTime"):Connect(function() -- Line: 29
                -- upvalues: Players (ref), u10 (ref)
                local v16 = Players.LocalPlayer:GetAttribute("NextRavenReceiveTime");

                if v16 ~= 0 and (v16 == v16 and v16) then
                    u10(v16);
                end;
            end));

            return function() -- Line: 35
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end);
        useEffect(function() -- Line: 39
            -- upvalues: InventoryUtil (ref), Players (ref), ItemType (ref), u14 (copy), u9 (copy), Workspace (ref), u12 (copy)
            local u17 = true;

            local function u20() -- Line: 42
                -- upvalues: u17 (ref), InventoryUtil (ref), Players (ref), ItemType (ref), u14 (ref), u9 (ref), Workspace (ref), u12 (ref), u20 (ref)
                task.delay(1, function() -- Line: 43
                    -- upvalues: u17 (ref), InventoryUtil (ref), Players (ref), ItemType (ref), u14 (ref), u9 (ref), Workspace (ref), u12 (ref), u20 (ref)
                    if not u17 then
                        return nil;
                    end;

                    if InventoryUtil.getAmount(Players.LocalPlayer, ItemType.RAVEN) >= 2 then
                        u14(true);
                    else
                        u14(false);
                    end;

                    local v18 = u9 - Workspace:GetServerTimeNow();
                    local v19 = 1 - math.round(v18) / 45;
                    u12((math.clamp(v19, 0, 1)));
                    u20();
                end);
            end;

            u20();

            return function() -- Line: 60
                -- upvalues: u17 (ref)
                u17 = false;
            end;
        end, { u9 });
        local v21 = {
            BackgroundTransparency = 0.6,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v22 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(2)
            }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                    Text = "Raven Item Timer",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    Text = "When the bar fills up you will receive another Raven",
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    Text = "Max Ravens: 1",
                    TextSize = 14,
                    RichText = true,
                    Font = Enum.Font.SourceSans,
                    TextColor3 = Color3.fromRGB(191, 191, 191),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Limits = Vector2.new(300, 60)
                }) }) };
        local _ = #v22;
        local v23 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v24 = { u3.createElement("UIListLayout", {
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
                    Size = UDim2.fromScale(1, (math.clamp(v11, 0, 1)))
                }, { u3.createElement("UIGradient", {
                        Rotation = 60,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(Color3.fromRGB(209, 135, 64), 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(Color3.fromRGB(209, 135, 64), 0.9)) })
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(4)
                    }) }) }), u3.createElement("ImageLabel", {
                LayoutOrder = 2,
                Image = "rbxassetid://7343272003",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 1)
            }) };
        local v25 = #v24;

        if v13 then
            v13 = u3.createElement(AutoSizedText, {
                Text = "MAX",
                TextSize = 14,
                Font = Enum.Font.SourceSansBold,
                TextColor3 = Color3.fromRGB(255, 89, 89),
                TextYAlignment = Enum.TextYAlignment.Center
            });
        end;

        if v13 then
            v24[v25 + 1] = v13;
        end;

        v22.Container = u3.createElement(Empty, v23, v24);

        return u3.createFragment({
            RavenTimer = u3.createElement("Frame", v21, v22)
        });
    end)
};