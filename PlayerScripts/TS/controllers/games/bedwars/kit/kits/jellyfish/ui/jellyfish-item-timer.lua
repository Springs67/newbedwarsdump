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
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local JellyfishBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").JellyfishBalance;

return {
    JellyfishItemTimerApp = v4.new(u3)(function(p6, p7) -- Line: 19
        -- upvalues: Players (copy), u2 (copy), CollectionService (copy), InventoryUtil (copy), ItemType (copy), JellyfishBalance (copy), Workspace (copy), ClientSyncEvents (copy), u3 (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8 = Players.LocalPlayer:GetAttribute("NextJellyfishReceiveTime");
        local u9, u10 = useState(v8 == nil and 0 or v8);
        local v11, u12 = useState(0);
        local v13, u14 = useState(false);
        useEffect(function() -- Line: 30
            -- upvalues: u2 (ref), Players (ref), u10 (copy)
            local u15 = u2.new();
            u15:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("NextJellyfishReceiveTime"):Connect(function() -- Line: 32
                -- upvalues: Players (ref), u10 (ref)
                local v16 = Players.LocalPlayer:GetAttribute("NextJellyfishReceiveTime");

                if v16 ~= 0 and (v16 == v16 and v16) then
                    u10(v16);
                end;
            end));

            return function() -- Line: 38
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end);
        useEffect(function() -- Line: 42
            -- upvalues: CollectionService (ref), Players (ref), InventoryUtil (ref), ItemType (ref), JellyfishBalance (ref), u14 (copy), u9 (copy), Workspace (ref), ClientSyncEvents (ref), u12 (copy)
            local u17 = true;

            local function u23() -- Line: 45
                -- upvalues: u17 (ref), CollectionService (ref), Players (ref), InventoryUtil (ref), ItemType (ref), JellyfishBalance (ref), u14 (ref), u9 (ref), Workspace (ref), ClientSyncEvents (ref), u12 (ref), u23 (ref)
                task.delay(1, function() -- Line: 46
                    -- upvalues: u17 (ref), CollectionService (ref), Players (ref), InventoryUtil (ref), ItemType (ref), JellyfishBalance (ref), u14 (ref), u9 (ref), Workspace (ref), ClientSyncEvents (ref), u12 (ref), u23 (ref)
                    if not u17 then
                        return nil;
                    end;

                    local function _(p18) -- Line: 51
                        -- upvalues: Players (ref)
                        return p18:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
                    end;

                    local v19 = 0;
                    local v20 = {};

                    for i, v in CollectionService:GetTagged("jellyfish") do
                        local _ = i - 1;

                        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId == true then
                            v19 = v19 + 1;
                            v20[v19] = v;
                        end;
                    end;

                    if #v20 + InventoryUtil.getAmount(Players.LocalPlayer, ItemType.JELLYFISH) >= JellyfishBalance.MaxJellyfishOwned then
                        u14(true);
                    else
                        u14(false);
                    end;

                    local v21 = u9 - Workspace:GetServerTimeNow();
                    local v22 = 1 - math.round(v21) / ClientSyncEvents.AbilityCooldownModifierCheck:fire(JellyfishBalance.GetJellyfishTime).cooldown;
                    u12((math.clamp(v22, 0, 1)));
                    u23();
                end);
            end;

            u23();

            return function() -- Line: 79
                -- upvalues: u17 (ref)
                u17 = false;
            end;
        end, { u9 });
        local v24 = {
            BackgroundTransparency = 0.6,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v25 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(2)
            }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                    Text = "Jellyfish Spawn Timer",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    Text = "When the bar fills up you will receive another jellyfish",
                    TextSize = 14,
                    Font = Enum.Font.SourceSans,
                    TextColor3 = Color3.fromRGB(191, 191, 191),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    TextSize = 14,
                    RichText = true,
                    Text = "Max Jellyfish: <b><font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 74, 74)) .. "\">" .. tostring(JellyfishBalance.MaxJellyfishOwned) .. "</font></b> jellyfishes placed and/or in inventory",
                    Font = Enum.Font.SourceSans,
                    TextColor3 = Color3.fromRGB(191, 191, 191),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Limits = Vector2.new(300, 60)
                }) }) };
        local _ = #v25;
        local v26 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v27 = { u3.createElement("UIListLayout", {
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
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(Color3.fromRGB(80, 150, 200), 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(Color3.fromRGB(80, 150, 200), 0.9)) })
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(4)
                    }) }) }), u3.createElement("ImageLabel", {
                LayoutOrder = 2,
                Image = "rbxassetid://18129975091",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 1)
            }) };
        local v28 = #v27;

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
            v27[v28 + 1] = v13;
        end;

        v25.Container = u3.createElement(Empty, v26, v27);

        return u3.createFragment({
            JellyfishTimer = u3.createElement("Frame", v24, v25)
        });
    end)
};