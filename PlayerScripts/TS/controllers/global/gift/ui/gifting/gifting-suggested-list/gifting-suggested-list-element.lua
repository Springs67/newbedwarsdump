-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local PlayerRender = v1.PlayerRender;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GiftingSuggestedListElement = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: Theme (copy), u2 (copy), SoundManager (copy), GameSound (copy), PlayerRender (copy), ColorUtil (copy)
        local v6 = {
            Size = UDim2.new(0.95, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Theme.backgroundSecondary,
            BorderSizePixel = 0,

            [u2.Event.Activated] = function() -- Line: 17
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                u4.SetSelectedUser(u4.OfflineDisplayPlayer);
            end
        };
        local v7 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }),
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }),
            u2.createElement(PlayerRender, {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromOffset(32, 32),
                PlayerUserId = u4.OfflineDisplayPlayer.userId
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) })
        };
        local _ = #v7;
        local v8 = {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.new(1, -42, 0, 32)
        };
        local v9 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }), u2.createElement("TextLabel", {
                TextScaled = true,
                LayoutOrder = 1,
                AutoLocalize = false,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0.6, 0),
                Text = "@" .. u4.OfflineDisplayPlayer.name,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }) };
        local v10 = #v9;
        local v11;

        if u4.OfflineDisplayPlayer.displayName == "" then
            v11 = false;
        else
            v11 = u2.createElement("TextLabel", {
                TextScaled = true,
                LayoutOrder = 1,
                AutoLocalize = false,
                BackgroundTransparency = 1,
                TextTransparency = 0.3,
                Size = UDim2.new(1, 0, 0.4, 0),
                Text = u4.OfflineDisplayPlayer.displayName,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 14
                }) });
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        v7.FriendNameInfo = u2.createElement("Frame", v8, v9);

        return u2.createElement("ImageButton", v6, v7);
    end)
};