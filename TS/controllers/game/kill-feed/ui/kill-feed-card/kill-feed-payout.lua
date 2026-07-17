-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    KillFeedPayout = v4.new(u3)(function(p5, p6) -- Line: 10
        -- upvalues: u3 (copy), u2 (copy), getItemMeta (copy), Empty (copy), DeviceUtil (copy)
        local _ = p6.useState;
        local v7 = u3.createRef();
        local v8 = u2.entries(p5.killPayout);

        local function v13(p9, p10) -- Line: 14
            -- upvalues: getItemMeta (ref), u3 (ref), Empty (ref), DeviceUtil (ref)
            local v11 = p9[2];
            local v12 = getItemMeta(p9[1]);

            return u3.createElement(Empty, {
                AutomaticSize = "X",
                Size = UDim2.fromScale(0, 1)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 3)
                }), u3.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1.6),
                    Image = v12.image,
                    ScaleType = Enum.ScaleType.Crop
                }), u3.createElement("TextLabel", {
                    Font = "GothamBold",
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    AutomaticSize = "X",
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0, 0.95),
                    Text = "+" .. tostring(v11.amount),
                    TextColor3 = v12.displayNameColor or Color3.fromRGB(255, 255, 255),
                    TextYAlignment = DeviceUtil.isSmallScreen() and "Bottom" or "Center"
                }) });
        end;

        local v14 = table.create(#v8);

        for i, v in v8 do
            v14[i] = v13(v, i - 1, v8);
        end;

        local v15 = {
            AnchorPoint = p5.AnchorPoint,
            Position = p5.Position,
            Size = p5.Size,
            LayoutOrder = 1,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.3,
            [u3.Ref] = v7,
            AutomaticSize = "X"
        };
        local v16 = { u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 0),
                PaddingRight = UDim.new(0, 0)
            }), u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, -3)
            }) };
        local v17 = #v16;

        for i, v in v14 do
            v16[v17 + i] = v;
        end;

        return u3.createFragment({
            KillFeedPayoutContainer = u3.createElement("Frame", v15, v16)
        });
    end)
};