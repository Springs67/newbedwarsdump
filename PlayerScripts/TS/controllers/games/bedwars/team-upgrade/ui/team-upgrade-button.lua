-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local isAtMaxTeamUpgradeTier = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta").isAtMaxTeamUpgradeTier;
local TeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TeamUpgradeTheme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-theme").TeamUpgradeTheme;

return {
    TeamUpgradeButton = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: isAtMaxTeamUpgradeTier (copy), TeamUpgradeUtil (copy), u2 (copy), Button (copy), TeamUpgradeTheme (copy), SoundManager (copy), GameSound (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = false;
        local IsHomeBase = u4.IsHomeBase;
        local v7;

        if isAtMaxTeamUpgradeTier(u4.CurrentTier, u4.TeamUpgrade) then
            v6 = true;
            v7 = false;
        else
            v7 = TeamUpgradeUtil.hasEnoughForTeamUpgrade(u4.ObservedInventory, u4.TeamUpgrade, u4.CurrentTier + 1, IsHomeBase);
        end;

        local v8 = {
            ZIndex = 60
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v8[i] = v;
            end;
        end;

        local createElement = u2.createElement;
        local v9 = {};
        local v10 = u2.createElement("UIListLayout", {
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Center",
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0.05, 0)
        });
        local v11;

        if v6 then
            v11 = u2.createElement(Button, {
                LayoutOrder = 1,
                BackgroundTransparency = 0.7,
                Text = "<b>MAX</b>",
                Selectable = true,
                ZIndex = 60,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = TeamUpgradeTheme.disabled,
                TextLabel = {
                    ZIndex = 61,
                    TextTransparency = 0.7,
                    Size = UDim2.fromScale(0.8, 0.55)
                },

                OnClick = function() -- Line: 90, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref)
                    SoundManager:playSound(GameSound.UI_CLICK);
                end,

                CornerRadius = UDim.new(0.1, 0),
                GamepadShouldAutoSelect = u4.GamepadShouldAutoSelect
            });
        elseif v7 then
            v11 = u2.createElement(Button, {
                LayoutOrder = 1,
                Text = "<b>UPGRADE</b>",
                Selectable = true,
                ZIndex = 60,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = TeamUpgradeTheme.success,

                OnClick = function() -- Line: 48, Name: OnClick
                    -- upvalues: u4 (copy)
                    u4.Purchased();
                end,

                TextLabel = {
                    ZIndex = 61,
                    Size = UDim2.fromScale(0.8, 0.55)
                },
                CornerRadius = UDim.new(0.1, 0),
                GamepadShouldAutoSelect = u4.GamepadShouldAutoSelect
            });
        else
            v11 = u2.createElement(Button, {
                LayoutOrder = 1,
                Text = "<b>NOT ENOUGH</b>",
                Selectable = true,
                ZIndex = 60,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = TeamUpgradeTheme.error,

                OnClick = function() -- Line: 66, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref)
                    SoundManager:playSound(GameSound.UI_CLICK);
                end,

                TextLabel = {
                    ZIndex = 61,
                    Size = UDim2.fromScale(0.8, 0.55)
                },
                CornerRadius = UDim.new(0.1, 0),
                GamepadShouldAutoSelect = u4.GamepadShouldAutoSelect
            });
        end;

        v9[1], v9[2] = v10, v11;

        return createElement("Frame", v8, v9);
    end)
};