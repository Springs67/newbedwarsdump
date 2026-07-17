-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    ClanAuctionSubTabButton = v3.new(u2)(function(u4) -- Line: 9
        -- upvalues: ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy)
        local v5 = u4.Tab == u4.ActiveTab;
        local v6 = {
            Size = u4.Size,
            Text = u4.Text
        };
        local v7;

        if v5 then
            v7 = ColorUtil.darken(u4.BackgroundColor3, 0.75);
        else
            v7 = u4.BackgroundColor3;
        end;

        v6.BackgroundColor3 = v7;
        v6.BorderSizePixel = 0;
        v6.TextColor3 = u4.TextColor3;
        v6.TextTransparency = v5 and 0 or 0.3;
        v6.ClipsDescendants = true;

        v6[u2.Event.Activated] = function() -- Line: 19
            -- upvalues: u4 (copy), SoundManager (ref), GameSound (ref)
            u4.SetTab(u4.Tab);
            SoundManager:playSound(GameSound.UI_CLICK);
        end;

        v6.LayoutOrder = u4.LayoutOrder;
        local v8 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) };
        local v9 = #v8;

        if v5 then
            v5 = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 2),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = ColorUtil.WHITE
            });
        end;

        if v5 then
            v8[v9 + 1] = v5;
        end;

        return u2.createFragment({
            ClanAuctionSubTabButton = u2.createElement("TextButton", v6, v8)
        });
    end)
};