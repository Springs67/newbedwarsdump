-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KeybindDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults;
local KeybindValidator = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-validator").KeybindValidator;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SettingsKeyboardControlsSection = RuntimeLib.import(script, script.Parent, "settings-keyboard-controls-section").SettingsKeyboardControlsSection;

return {
    SettingsKeyboardControlPage = v4.new(u3)(function(p5, p6) -- Line: 16
        -- upvalues: u2 (copy), KeybindDefaults (copy), default (copy), KnitClient (copy), KeybindValidator (copy), DeviceUtil (copy), RuntimeLib (copy), u3 (copy), Theme (copy), ButtonComponent (copy), Empty (copy), SettingsKeyboardControlsSection (copy)
        local useValue = p6.useValue;
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(u2.deepCopy(KeybindDefaults.KEYBOARD_KEYBINDS));
        local u9 = useValue({});

        local function _() -- Line: 23
            -- upvalues: u9 (copy)
            return not u9 and "" or tostring(#u9.value) .. " invalid actions";
        end;

        local u10 = nil;

        local function v11() -- Line: 31
            -- upvalues: u10 (ref), u2 (ref), KeybindDefaults (ref)
            u10(u2.deepCopy(KeybindDefaults.KEYBOARD_KEYBINDS), true);
        end;

        u10 = function(p12, p13) -- Line: 34
            -- upvalues: default (ref), KnitClient (ref), u9 (copy), KeybindValidator (ref), u8 (copy)
            default.Client:Get("UpdateProfileDataKeybinds"):SendToServer({
                keyboardKeybindDefinition = p12
            });
            KnitClient.Controllers.KeybindLoadController:registerKeybinds({
                keyboard = p12,
                gamepad = KnitClient.Controllers.KeybindLoadController:waitForKeybinds().gamepad
            });
            u9.value = KeybindValidator.getInvalidActions(p12);

            if p13 then
                u8(p12);
            end;
        end;

        useEffect(function() -- Line: 47
            -- upvalues: DeviceUtil (ref), RuntimeLib (ref), KnitClient (ref), u9 (copy), KeybindValidator (ref), u8 (copy), u2 (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 52
                -- upvalues: KnitClient (ref), u9 (ref), KeybindValidator (ref), u8 (ref), u2 (ref)
                local keyboard = KnitClient.Controllers.KeybindLoadController:waitForKeybinds().keyboard;

                if keyboard then
                    u9.value = KeybindValidator.getInvalidActions(keyboard);
                    u8(u2.deepCopy(keyboard));
                end;
            end):catch(function(p14) -- Line: 58
                return warn(p14);
            end);
        end, {});
        local v15 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.98, 1)
        };
        local v16 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }) };
        local v17 = #v16;
        local v18 = {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 20)
        };
        local v19 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Right",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }) };
        local v20 = #v19;
        local v21 = #u9.value ~= 0 and u3.createFragment({
            ErrorText = u3.createElement("TextLabel", {
                TextXAlignment = "Right",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.3, 1),
                Text = not u9 and "" or tostring(#u9.value) .. " invalid actions",
                TextColor3 = Theme.backgroundError
            })
        });

        if v21 then
            v19[v20 + 1] = v21;
        end;

        v19[#v19 + 1] = u3.createElement(ButtonComponent, {
            Text = "Reset All To Default",
            LayoutOrder = 2,
            OnClick = v11,
            BackgroundColor3 = Color3.fromRGB(47, 48, 77),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.98, 0)
        });
        v16.HelpSection = u3.createElement(Empty, v18, v19);
        v16[v17 + 1] = u3.createElement(SettingsKeyboardControlsSection, {
            Title = "Controls",
            Keybinds = u7.controlActions,

            UpdateProfileDataKeybind = function(p22, p23) -- Line: 114, Name: UpdateProfileDataKeybind
                -- upvalues: u7 (copy), u10 (ref)
                u7.controlActions[p22] = p23;
                u10(u7, true);
            end,

            ResetKeybind = function(p24) -- Line: 118, Name: ResetKeybind
                -- upvalues: u7 (copy), KeybindDefaults (ref), u10 (ref)
                u7.controlActions[p24] = KeybindDefaults.KEYBOARD_KEYBINDS.controlActions[p24];
                u10(u7, true);
            end,

            InvalidActions = u9.value,
            FrameProps = {
                LayoutOrder = 2
            }
        });
        v16[v17 + 2] = u3.createElement(SettingsKeyboardControlsSection, {
            Title = "Abilities",
            Keybinds = u7.abilityActions,

            UpdateProfileDataKeybind = function(p25, p26) -- Line: 131, Name: UpdateProfileDataKeybind
                -- upvalues: u7 (copy), u10 (ref)
                u7.abilityActions[p25] = p26;
                u10(u7, true);
            end,

            ResetKeybind = function(p27) -- Line: 135, Name: ResetKeybind
                -- upvalues: u7 (copy), KeybindDefaults (ref), u10 (ref)
                u7.abilityActions[p27] = KeybindDefaults.KEYBOARD_KEYBINDS.abilityActions[p27];
                u10(u7, true);
            end,

            InvalidActions = u9.value,
            FrameProps = {
                LayoutOrder = 3
            }
        });

        return u3.createFragment({
            ControlsPageContainer = u3.createElement(Empty, v15, v16)
        });
    end)
};