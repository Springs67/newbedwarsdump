-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local GameUpdateCard = RuntimeLib.import(script, script.Parent, "game-update-card").GameUpdateCard;
local GameUpdatePromoCardsList = RuntimeLib.import(script, script.Parent, "promo-cards", "game-update-promo-cards-list").GameUpdatePromoCardsList;

return {
    GameUpdatesCore = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: ColorUtil (copy), Theme (copy), SoundManager (copy), GameSound (copy), DeviceUtil (copy), u2 (copy), Empty (copy), GameUpdateCard (copy), DividerComponent (copy), AutoCanvasScrollingFrame (copy), GameUpdatePromoCardsList (copy), WidgetComponent (copy)
        local useEffect = p5.useEffect;
        local _ = p5.useState;
        local u6 = nil;

        local function _() -- Line: 21
            -- upvalues: u6 (ref), ColorUtil (ref), Theme (ref)
            return (u6 == 0 or (u6 ~= u6 or not u6)) and "" or "<font size=\"16\" color=\"" .. ColorUtil.richTextColor(Theme.backgroundSuccess) .. "\">" .. tostring(u6) .. " new update" .. (u6 > 1 and "s" or "") .. "</font>";
        end;

        u6 = 0;
        local updates = u4.store.GameUpdates.updates;

        local function _(p7, p8) -- Line: 29
            -- upvalues: u6 (ref)
            if not p8.new then
                table.insert(p7.oldUpdates, p8);

                return p7;
            end;

            table.insert(p7.newUpdates, p8);
            u6 = u6 + 1;

            return p7;
        end;

        local v9 = {
            newUpdates = {},
            oldUpdates = {}
        };

        for i = 1, #updates do
            local v10 = updates[i];
            local _ = i - 1;

            if v10.new then
                table.insert(v9.newUpdates, v10);
                u6 = u6 + 1;
            else
                table.insert(v9.oldUpdates, v10);
            end;
        end;

        useEffect(function() -- Line: 53
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_OPEN_2);

            return function() -- Line: 55
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_CLOSE_2);
            end;
        end, {});
        local v11 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v12;

        if DeviceUtil.isSmallScreen() then
            v12 = UDim2.fromScale(0.95, 0.95);
        else
            v12 = UDim2.fromScale(0.95, 0.95);
        end;

        v11.Size = v12;
        local v13 = {};
        local createElement = u2.createElement;
        local v14 = {
            AspectType = "FitWithinMaxSize"
        };
        DeviceUtil.isSmallScreen();
        v14.AspectRatio = 1.5454545454545454;
        v13[1], v13[2] = createElement("UIAspectRatioConstraint", v14), u2.createElement("UISizeConstraint", {
    MaxSize = Vector2.new(1062.5, 687.5)
});
        local v15 = {
            ClipsDescendents = false,
            AppId = u4.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Title = "Patch Notes   " .. ((u6 == 0 or (u6 ~= u6 or not u6)) and "" or "<font size=\"16\" color=\"" .. ColorUtil.richTextColor(Theme.backgroundSuccess) .. "\">" .. tostring(u6) .. " new update" .. (u6 > 1 and "s" or "") .. "</font>")
        };
        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 14)
            }) };
        local v17 = {
            LayoutOrder = 1,
            Size = UDim2.new(0.7, -14, 1, 0)
        };
        local v18 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }) };
        local newUpdates = v9.newUpdates;

        local function v21(p19, p20) -- Line: 107
            -- upvalues: u2 (ref), Empty (ref), GameUpdateCard (ref), u4 (copy)
            return u2.createElement(Empty, {
                AutomaticSize = "Y",
                Size = UDim2.fromScale(1, 0),
                LayoutOrder = p20
            }, { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 6)
                }), u2.createElement(GameUpdateCard, {
                    LayoutOrder = 2,
                    store = u4.store,
                    GameUpdate = p19,
                    Size = UDim2.fromScale(0.97, 0)
                }) });
        end;

        local v22 = table.create(#newUpdates);

        for i, v in newUpdates do
            v22[i] = v21(v, i - 1, newUpdates);
        end;

        local v23 = {
            GameUpdateCardsListLayout = u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            })
        };
        local v24 = #v23;
        local v25 = {
            ScrollingFrameProps = {
                LayoutOrder = 2
            }
        };

        for i, v in v22 do
            v23[v24 + i] = v;
        end;

        local v26 = #v23;
        v23[v26 + 1] = u2.createElement(DividerComponent, {
            LengthScale = 0.97,
            Text = "YOU\'RE ALL CAUGHT UP!",
            BarColor = {
                Transparency = 0,
                Color = Color3.fromRGB(255, 59, 59)
            },
            TextLabel = {
                Transparency = 0,
                Color = Color3.fromRGB(255, 255, 255)
            },
            LayoutOrder = u6 + 1
        });
        local oldUpdates = v9.oldUpdates;

        local function v29(p27, p28) -- Line: 167
            -- upvalues: u2 (ref), Empty (ref), u6 (ref), GameUpdateCard (ref), u4 (copy)
            return u2.createElement(Empty, {
                AutomaticSize = "Y",
                Size = UDim2.fromScale(1, 0),
                LayoutOrder = u6 + 1 + p28
            }, { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 6)
                }), u2.createElement(GameUpdateCard, {
                    LayoutOrder = 2,
                    store = u4.store,
                    GameUpdate = p27,
                    Size = UDim2.fromScale(0.97, 0)
                }) });
        end;

        local v30 = table.create(#oldUpdates);

        for i, v in oldUpdates do
            v30[i] = v29(v, i - 1, oldUpdates);
        end;

        for i, v in v30 do
            v23[v26 + 1 + i] = v;
        end;

        v18[#v18 + 1] = u2.createElement(AutoCanvasScrollingFrame, v25, v23);
        v16.UpdateContents = u2.createElement(Empty, v17, v18);
        v16[#v16 + 1] = u2.createElement(GameUpdatePromoCardsList, {
            LayoutOrder = 2,
            store = u4.store,
            Size = UDim2.new(0.3, 0, 1, 0)
        });
        v13[#v13 + 1] = u2.createElement(WidgetComponent, v15, v16);

        return u2.createElement(Empty, v11, v13);
    end)
};