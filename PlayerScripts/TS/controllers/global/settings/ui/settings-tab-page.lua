-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local SettingRow = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow;
local SettingSlider = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-slider").SettingSlider;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getSettingMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-meta").getSettingMeta;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types");
local Setting = v4.Setting;
local SettingInputType = v4.SettingInputType;
local SettingsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-util").SettingsUtil;
local StreamerModeConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "streamer-mode-config").StreamerModeConfig;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SettingsSection = RuntimeLib.import(script, script.Parent, "settings-section").SettingsSection;

return {
    SettingsTabPage = v3.new(u2)(function(u5, p6) -- Line: 22
        -- upvalues: u1 (copy), getSettingMeta (copy), RunService (copy), DeviceUtil (copy), u2 (copy), ToggleButton (copy), Theme (copy), Setting (copy), ClientStore (copy), StreamerModeConfig (copy), SettingInputType (copy), SettingsUtil (copy), KnitClient (copy), ToggleButtonGroup (copy), SettingRow (copy), SettingSlider (copy), SettingsSection (copy)
        local _ = p6.useState;
        local v7 = u1.values(u5.Settings);

        local function _(p8, p9) -- Line: 25
            -- upvalues: getSettingMeta (ref)
            local v10 = getSettingMeta(p9);
            local v11 = p8[v10.section];

            if v11 then
                table.insert(v11, p9);

                return p8;
            end;

            p8[v10.section] = { p9 };

            return p8;
        end;

        local v12 = {};

        for i = 1, #v7 do
            local v13 = v7[i];
            local _ = i - 1;
            local v14 = getSettingMeta(v13);
            local v15 = v12[v14.section];

            if v15 then
                table.insert(v15, v13);
            else
                v12[v14.section] = { v13 };
            end;
        end;

        local u16 = RunService:IsStudio() and true or DeviceUtil.isMobileControls();

        local function u21(p17, p18) -- Line: 51
            -- upvalues: u2 (ref), ToggleButton (ref), Theme (ref)
            if not p17.toggleOptionsOverride then
                return { u2.createElement(ToggleButton, {
                        Value = "true",
                        Text = "On",
                        FrameProps = {
                            LayoutOrder = 1
                        },
                        disabled = p18
                    }), u2.createElement(ToggleButton, {
                        Value = "false",
                        Text = "Off",
                        ActiveColor = Theme.mcRed,
                        FrameProps = {
                            LayoutOrder = 1
                        },
                        disabled = p18
                    }) };
            end;

            local toggleOptionsOverride = p17.toggleOptionsOverride;

            local function _(p19) -- Line: 55
                -- upvalues: u2 (ref), ToggleButton (ref)
                return u2.createElement(ToggleButton, {
                    Value = p19.value,
                    Text = p19.text,
                    ActiveColor = p19.activeColor
                });
            end;

            local v20 = table.create(#toggleOptionsOverride);

            for i, v in toggleOptionsOverride do
                local _ = i - 1;
                v20[i] = u2.createElement(ToggleButton, {
                    Value = v.value,
                    Text = v.text,
                    ActiveColor = v.activeColor
                });
            end;

            return v20;
        end;

        local v22 = u1.entries(v12);
        table.sort(v22, function(p23, p24) -- Line: 90
            return p23[1] < p24[1];
        end);

        local function v51(p25) -- Line: 94
            -- upvalues: getSettingMeta (ref), u16 (copy), Setting (ref), ClientStore (ref), StreamerModeConfig (ref), SettingInputType (ref), Theme (ref), u5 (copy), DeviceUtil (ref), SettingsUtil (ref), KnitClient (ref), u21 (copy), u2 (ref), ToggleButtonGroup (ref), SettingRow (ref), SettingSlider (ref), SettingsSection (ref)
            local v26 = p25[1];
            local v27 = p25[2];

            local function v43(u28) -- Line: 97
                -- upvalues: getSettingMeta (ref), u16 (ref), Setting (ref), ClientStore (ref), StreamerModeConfig (ref), SettingInputType (ref), Theme (ref), u5 (ref), DeviceUtil (ref), SettingsUtil (ref), KnitClient (ref), u21 (ref), u2 (ref), ToggleButtonGroup (ref), SettingRow (ref), SettingSlider (ref)
                local v29 = getSettingMeta(u28);

                if v29.mobileOnly and not u16 then
                    return nil;
                end;

                local v30 = false;

                if u28 == Setting.STREAMER_MODE then
                    local profileData = ClientStore:getState().Lobby.profileData;

                    if profileData ~= nil then
                        profileData = profileData.level;
                    end;

                    v30 = (profileData == nil and 1 or profileData) < StreamerModeConfig.StreamerModePlayerLevelReq and true or v30;
                end;

                local inputType = v29.inputType;

                if inputType == SettingInputType.TOGGLE then
                    local v31 = {
                        Name = v29.name,
                        Hint = v29.description,
                        ThemeColor = Theme.backgroundPrimary,
                        FrameProps = {
                            Size = UDim2.new(0.98, 0, 0, 51)
                        }
                    };
                    local v32 = {};
                    local v35 = {
                        Value = tostring(u5.PlayerSettings[u28]),

                        OnChange = function(p33) -- Line: 133, Name: OnChange
                            -- upvalues: DeviceUtil (ref), SettingsUtil (ref), KnitClient (ref), u28 (copy)
                            if DeviceUtil.isHoarceKat() then
                                return nil;
                            end;

                            local v34 = SettingsUtil.getBoolean(p33);

                            if v34 ~= nil then
                                p33 = v34;
                            end;

                            KnitClient.Controllers.SettingsController:setSetting(u28, p33);
                        end
                    };
                    local v36 = {};
                    local v37 = #v36;

                    for i, v in u21(v29, v30) do
                        v36[v37 + i] = v;
                    end;

                    v32[#v32 + 1] = u2.createElement(ToggleButtonGroup, v35, v36);

                    return u2.createElement(SettingRow, v31, v32);
                end;

                if inputType == SettingInputType.SLIDER then
                    local v38 = {
                        Name = v29.name,
                        Hint = v29.description,
                        ThemeColor = Theme.backgroundPrimary,
                        FrameProps = {
                            Size = UDim2.new(0.98, 0, 0, 51)
                        }
                    };
                    local v39 = {};
                    local v40 = {};
                    local v41 = tonumber(u5.PlayerSettings[u28]);
                    v40.Value = v41 == nil and 0 or v41;

                    function v40.SetValue(p42) -- Line: 167
                        -- upvalues: DeviceUtil (ref), KnitClient (ref), u28 (copy)
                        if DeviceUtil.isHoarceKat() then
                            return nil;
                        end;

                        KnitClient.Controllers.SettingsController:setSetting(u28, p42);
                    end;

                    v40.Min = v29.min;
                    v40.Max = v29.max;
                    v40.StepSize = v29.stepSize;
                    v39[#v39 + 1] = u2.createElement(SettingSlider, v40);

                    return u2.createElement(SettingRow, v38, v39);
                end;
            end;

            local v44 = 0;
            local v45 = {};

            for i, v in v27 do
                local v46 = v43(v, i - 1, v27);

                if v46 ~= nil then
                    v44 = v44 + 1;
                    v45[v44] = v46;
                end;
            end;

            local v47 = {
                Title = string.upper(v26),
                FrameProps = {
                    LayoutOrder = 2
                }
            };
            local v48 = {};
            local v49 = #v48;

            for i, v in v45 do
                v48[v49 + i] = v;
            end;

            local v50 = #v48;
            local ExtraSettings = u5.ExtraSettings;

            if ExtraSettings ~= nil then
                ExtraSettings = ExtraSettings(v26);
            end;

            if ExtraSettings then
                v48[v50 + 1] = ExtraSettings;
            end;

            return u2.createElement(SettingsSection, v47, v48);
        end;

        local v52 = table.create(#v22);

        for i, v in v22 do
            v52[i] = v51(v, i - 1, v22);
        end;

        local v53 = {};
        local v54 = #v53;

        for i, v in v52 do
            v53[v54 + i] = v;
        end;

        return u2.createFragment(v53);
    end)
};