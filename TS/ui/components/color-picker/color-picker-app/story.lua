-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "controllers", "global", "armor-trim", "ui", "armor-trim-player-viewport").DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION;
local ArmorTrimPlayerViewportBase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "controllers", "global", "armor-trim", "ui", "armor-trim-player-viewport-base").ArmorTrimPlayerViewportBase;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent, "rodux", "create-rodux-app").CreateRoduxApp;
local ArmorTrimEffectRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ColorPickerApp = RuntimeLib.import(script, script.Parent, "color-picker-app").ColorPickerApp;

return function(p4) -- Line: 14
    -- upvalues: u1 (copy), u3 (copy), CreateRoduxApp (copy), ColorPickerApp (copy), u2 (copy), ArmorTrimPlayerViewportBase (copy), BedwarsKit (copy), ArmorTrimType (copy), ArmorTrimEffectRank (copy), DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION (copy), Theme (copy)
    local u5 = u1.new();
    local u6 = u3.new();
    u5:GiveTask(u6);
    local u9 = CreateRoduxApp("ColorPickerApp", ColorPickerApp, {
        AppId = "ColorPickerApp"
    }, {
        Children = u2.createFragment({
            ViewportCard = u2.createElement(ArmorTrimPlayerViewportBase, {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ButtonMode = "ALWAYS_VISIBLE",
                ColorSignal = u6,
                SelectedKit = BedwarsKit.BARBARIAN,
                ArmorTrimType = ArmorTrimType.TRIM_2,
                ArmorTrimEffectRank = ArmorTrimEffectRank.T2,
                StartingSelection = {
                    armorSet = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.armorSet,
                    displayMode = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.displayMode
                },
                ViewportProps = {
                    BackgroundTransparency = 0.5,
                    BackgroundColor3 = Theme.backgroundPrimary
                }
            })
        }),

        OnSelect = function(p7) -- Line: 40, Name: OnSelect
            print("Close");
        end,

        OnUpdateColor = function(p8) -- Line: 43, Name: OnUpdateColor
            -- upvalues: u6 (copy)
            u6:Fire(p8);
        end,

        OnClose = function() -- Line: 46, Name: OnClose
            -- upvalues: u5 (copy)
            u5:DoCleaning();
        end
    }, {
        Parent = p4
    });

    return function() -- Line: 52
        -- upvalues: u2 (ref), u9 (copy)
        return u2.unmount(u9);
    end;
end;