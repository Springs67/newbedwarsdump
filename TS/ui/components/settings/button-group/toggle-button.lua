-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ToggleButton = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: Theme (copy), ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), Flamework (copy)
        local _ = p5.useState;
        local v6 = {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(0.5, 1)
        };
        local v7;

        if u4.Active then
            v7 = u4.ActiveColor or Theme.backgroundSuccess;
        else
            v7 = Theme.backgroundTertiary;
        end;

        v6.BackgroundColor3 = v7;
        local FrameProps = u4.FrameProps;

        if FrameProps ~= nil then
            FrameProps = FrameProps.BackgroundTransparency;
        end;

        v6.BackgroundTransparency = FrameProps;
        v6.TextColor3 = ColorUtil.WHITE;
        v6.Font = "Roboto";
        local v8;

        if u4.Active then
            v8 = "<b>" .. u4.Text .. "</b>";
        else
            v8 = u4.Text;
        end;

        v6.Text = v8;
        v6.TextXAlignment = "Center";
        v6.TextScaled = true;
        v6.RichText = true;

        v6[u2.Event.Activated] = function() -- Line: 31
            -- upvalues: u4 (copy), SoundManager (ref), GameSound (ref), Flamework (ref)
            if u4.disabled then
                SoundManager:playSound(GameSound.UI_ERROR);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "This setting is disabled. Check setting description for more info"
                });

                return nil;
            end;

            SoundManager:playSound(GameSound.UI_CLICK);
            local SetValue = u4.SetValue;

            if SetValue ~= nil then
                SetValue(u4.Value);
            end;
        end;

        local FrameProps2 = u4.FrameProps;

        if FrameProps2 then
            for i, v in FrameProps2 do
                v6[i] = v;
            end;
        end;

        return u2.createFragment({
            ["ToggleButton_" .. u4.Value] = u2.createElement("TextButton", v6, { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0),
                    PaddingLeft = UDim.new(0.1, 0),
                    PaddingRight = UDim.new(0.1, 0)
                }), u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        });
    end)
};