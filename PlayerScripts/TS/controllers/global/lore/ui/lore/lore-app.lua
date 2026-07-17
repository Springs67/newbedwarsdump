-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local LoreReader = RuntimeLib.import(script, script.Parent, "reader", "lore-reader").LoreReader;
local LoreReaderToolbar = RuntimeLib.import(script, script.Parent, "toolbar", "lore-toolbar").LoreReaderToolbar;
local v8 = v3.new(u2)(function(u5, p6) -- Line: 16
    -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), DeviceUtil (copy), DarkBackground (copy), SlideIn (copy), LoreReaderToolbar (copy), LoreReader (copy)
    local _ = p6.useState;
    p6.useEffect(function() -- Line: 19
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 21
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});

    local function v7() -- Line: 25
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
            SelectedKit = u5.SelectedKit
        });
    end;

    return u2.createElement("ScreenGui", {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    }, { u2.createElement(DarkBackground, {
            AppId = u5.AppId,
            ImageButtonProps = {
                ZIndex = -99
            },

            OnClick = function() -- Line: 39, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                    SelectedKit = u5.SelectedKit
                });

                return false;
            end
        }), u2.createElement(SlideIn, {}, { u2.createElement("ImageButton", {
                BackgroundTransparency = 1,
                Modal = true,
                Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.85 or 0.75, DeviceUtil.isSmallScreen() and 0.85 or 0.75),
                Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.02 or 0.1),
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.6386036960985626
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical
                }),
                u2.createElement(LoreReaderToolbar, {
                    Size = UDim2.fromScale(1, 0.09),
                    OnBack = v7
                }),
                u2.createElement(LoreReader, {
                    SelectedKit = u5.SelectedKit,
                    Size = UDim2.fromScale(1, 0.91)
                })
            }) }) });
end);

return {
    LoreApp = v4.connect(function(p9, p10) -- Line: 71
        local v11 = {
            store = p9
        };

        for i, v in p10 do
            v11[i] = v;
        end;

        return v11;
    end)(v8)
};