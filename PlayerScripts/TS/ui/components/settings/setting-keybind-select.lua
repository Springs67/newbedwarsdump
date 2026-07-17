-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local KeyboardKeycodes = v1.KeyboardKeycodes;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SettingKeybindSelect = v3.new(u2)(function(u5, p6) -- Line: 13
        -- upvalues: UserInputService (copy), KeyboardKeycodes (copy), Theme (copy), ColorUtil (copy), u2 (copy), Workspace (copy), ButtonComponent (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local useValue = p6.useValue;
        local v7, u8 = useState(u5.Keybind);
        local u9, u10 = useState(false);
        local u11 = useValue(-1);
        useEffect(function() -- Line: 20
            -- upvalues: u8 (copy), u5 (copy), u10 (copy)
            u8(u5.Keybind);
            u10(false);
        end, { u5.Keybind });

        local function _(p12) -- Line: 24
            -- upvalues: u5 (copy), u8 (copy)
            u5.UpdateProfileDataKeybind(p12);
            u8(p12);
        end;

        local function _(u13) -- Line: 28
            -- upvalues: UserInputService (ref), KeyboardKeycodes (ref), u5 (copy), u8 (copy), u10 (copy)
            UserInputService.InputEnded:Once(function(p14) -- Line: 29
                -- upvalues: KeyboardKeycodes (ref), u5 (ref), u8 (ref), u13 (copy), u10 (ref)
                local v15 = p14.UserInputType == Enum.UserInputType.Keyboard and table.find(KeyboardKeycodes, p14.KeyCode) ~= nil;

                if v15 then
                    local KeyCode = p14.KeyCode;
                    u5.UpdateProfileDataKeybind(KeyCode);
                    u8(KeyCode);
                    local v16 = u13;

                    if v16 ~= nil then
                        v16();
                    end;
                end;

                u10(false);
            end);
        end;

        local v17 = {};
        local v18 = #v17;
        local v19 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 1),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v19[i] = v;
            end;
        end;

        local v20 = {};
        local v21 = #v20;
        local v22 = {
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v23;

        if u9 then
            v23 = "Choose your key";
        else
            if v7 ~= nil then
                v7 = v7.Name;
            end;

            v23 = tostring(v7);
        end;

        v22.Text = v23;
        v22.TextScaled = true;
        v22.RichText = true;
        v22.Font = "ArialBold";
        v22.TextColor3 = ColorUtil.WHITE;
        v22.BackgroundColor3 = Theme.backgroundTertiary;
        v22.BorderSizePixel = u5.IsInvalid and 3 or 0;
        local v24;

        if u5.IsInvalid then
            v24 = Theme.backgroundError;
        else
            v24 = nil;
        end;

        v22.BorderColor3 = v24;
        v22.AutoLocalize = false;

        v22[u2.Event.MouseButton1Up] = function(p25) -- Line: 82
            -- upvalues: u9 (copy), u10 (copy), u11 (copy), Workspace (ref), UserInputService (ref), KeyboardKeycodes (ref), u5 (copy), u8 (copy)
            if u9 then
                return nil;
            end;

            u10(true);
            u11.value = Workspace:GetServerTimeNow();
            task.delay(0.001, function() -- Line: 89
                -- upvalues: UserInputService (ref), KeyboardKeycodes (ref), u5 (ref), u8 (ref), u10 (ref)
                local u26 = nil;
                UserInputService.InputEnded:Once(function(p27) -- Line: 29
                    -- upvalues: KeyboardKeycodes (ref), u5 (ref), u8 (ref), u26 (copy), u10 (ref)
                    local v28 = p27.UserInputType == Enum.UserInputType.Keyboard and table.find(KeyboardKeycodes, p27.KeyCode) ~= nil;

                    if v28 then
                        local KeyCode = p27.KeyCode;
                        u5.UpdateProfileDataKeybind(KeyCode);
                        u8(KeyCode);
                        local v29 = u26;

                        if v29 ~= nil then
                            v29();
                        end;
                    end;

                    u10(false);
                end);
            end);
        end;

        v22[u2.Event.InputEnded] = function(p30, p31) -- Line: 93
            -- upvalues: u9 (copy), Workspace (ref), u11 (copy), u5 (copy), u8 (copy)
            if not u9 then
                return nil;
            end;

            if p31.UserInputType ~= Enum.UserInputType.MouseButton1 and (p31.UserInputType ~= Enum.UserInputType.MouseButton2 and p31.UserInputType ~= Enum.UserInputType.MouseButton3) then
                return nil;
            end;

            if Workspace:GetServerTimeNow() - u11.value < 0.001 then
                return nil;
            end;

            local UserInputType = p31.UserInputType;
            u5.UpdateProfileDataKeybind(UserInputType);
            u8(UserInputType);
        end;

        v20[v21 + 1] = u2.createElement("TextButton", v22, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0)
            }), u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        local IsInvalid = u5.IsInvalid;

        if IsInvalid then
            local v32 = {
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.fromScale(1, 0.27)
            };
            local v33;

            if u5.IsInvalid.overlappedActions then
                local overlappedActions = u5.IsInvalid.overlappedActions;

                if overlappedActions ~= nil then
                    overlappedActions = table.concat(overlappedActions, ", ");
                end;

                v33 = "Overlapping with " .. overlappedActions;
            else
                v33 = "Invalid";
            end;

            v32.Text = v33;
            v32.TextColor3 = ColorUtil.WHITE;
            v32.BackgroundColor3 = ColorUtil.BLACK;
            v32.BackgroundTransparency = 0.4;
            v32.BorderSizePixel = 0;
            v32.TextScaled = true;
            IsInvalid = u2.createFragment({
                InvalidMessage = u2.createElement("TextLabel", v32, { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0),
                        PaddingLeft = UDim.new(0.1, 0),
                        PaddingRight = UDim.new(0.1, 0)
                    }) })
            });
        end;

        if IsInvalid then
            v20[v21 + 2] = IsInvalid;
        end;

        v17[v18 + 1] = u2.createElement("Frame", v19, v20);
        v17[v18 + 2] = u2.createElement(ButtonComponent, {
            Text = "Reset",
            Size = UDim2.fromScale(0.3, 0.6),
            OnClick = u5.ResetKeybind,
            BackgroundColor3 = Color3.fromRGB(47, 48, 77)
        });

        return u2.createFragment(v17);
    end)
};