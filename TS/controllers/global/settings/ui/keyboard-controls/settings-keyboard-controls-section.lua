-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local SettingKeybindSelect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-keybind-select").SettingKeybindSelect;
local SettingRow = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SettingsSection = RuntimeLib.import(script, script.Parent.Parent, "settings-section").SettingsSection;

return {
    SettingsKeyboardControlsSection = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u1 (copy), u2 (copy), SettingRow (copy), Theme (copy), SettingKeybindSelect (copy), SettingsSection (copy)
        local _ = p5.useState;
        local useMemo = p5.useMemo;
        local v6 = u1.entries(u4.Keybinds);
        table.sort(v6, function(p7, p8) -- Line: 15
            return tostring(p7[1]) < tostring(p8[1]);
        end);

        local function v15(p9) -- Line: 19
            -- upvalues: u4 (copy), useMemo (copy), u2 (ref), SettingRow (ref), Theme (ref), SettingKeybindSelect (ref)
            local u10 = p9[1];
            local u11 = p9[2];

            local function _(p12) -- Line: 23
                -- upvalues: u10 (copy)
                return p12.inputAction == u10;
            end;

            local u13 = nil;

            for i, v in u4.InvalidActions do
                local _ = i - 1;

                if v.inputAction == u10 == true then
                    u13 = v;
                    break;
                end;
            end;

            return useMemo(function() -- Line: 36
                -- upvalues: u2 (ref), u10 (copy), SettingRow (ref), Theme (ref), SettingKeybindSelect (ref), u11 (copy), u13 (copy), u4 (ref)
                return u2.createFragment({
                    ["SettingRow_" .. tostring(u10)] = u2.createElement(SettingRow, {
                        Name = tostring(u10),
                        ThemeColor = Theme.backgroundPrimary,
                        FrameProps = {
                            Size = UDim2.new(0.98, 0, 0, 51)
                        },
                        ListLayoutPadding = UDim.new(0.1, 0)
                    }, {
                        ["SettingKeybindSelect_" .. tostring(u10)] = u2.createElement(SettingKeybindSelect, {
                            Keybind = u11,
                            IsInvalid = u13 and {
                                overlappedActions = u13.overlappingActions
                            } or nil,

                            UpdateProfileDataKeybind = function(p14) -- Line: 51, Name: UpdateProfileDataKeybind
                                -- upvalues: u4 (ref), u10 (ref)
                                u4.UpdateProfileDataKeybind(u10, p14);
                            end,

                            ResetKeybind = function() -- Line: 54, Name: ResetKeybind
                                -- upvalues: u4 (ref), u10 (ref)
                                return u4.ResetKeybind(u10);
                            end
                        })
                    })
                });
            end, { u11 });
        end;

        local v16 = table.create(#v6);

        for i, v in v6 do
            v16[i] = v15(v, i - 1, v6);
        end;

        local v17 = {
            Title = u4.Title,
            FrameProps = u4.FrameProps
        };
        local v18 = {};
        local v19 = #v18;

        for i, v in v16 do
            v18[v19 + i] = v;
        end;

        return u2.createElement(SettingsSection, v17, v18);
    end)
};