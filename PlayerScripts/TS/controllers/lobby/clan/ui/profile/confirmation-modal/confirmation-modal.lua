-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local GuiService = v4.GuiService;
local UserInputService = v4.UserInputService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ConfirmationModal = v3.new(u2)(function(u5, p6) -- Line: 19
        -- upvalues: u2 (copy), SoundManager (copy), GameSound (copy), UserInputService (copy), UIUtil (copy), GuiService (copy), DeviceUtil (copy), Theme (copy), ColorUtil (copy), Empty (copy), Flamework (copy), BedwarsAppIds (copy), ButtonComponent (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(false);
        local u9 = u2.createRef();
        local u10 = u2.createRef();
        local u11 = "ConfirmationModalGroup_" .. u5.Title;
        useEffect(function() -- Line: 27
            -- upvalues: SoundManager (ref), GameSound (ref), UserInputService (ref), UIUtil (ref), u10 (copy), GuiService (ref), u11 (copy), u9 (copy), u5 (copy)
            SoundManager:playSound(GameSound.UI_OPEN_2);

            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u10:getValue());
                GuiService:AddSelectionParent(u11, u9:getValue());
            end;

            return function() -- Line: 33
                -- upvalues: SoundManager (ref), GameSound (ref), GuiService (ref), u11 (ref), u5 (ref), UIUtil (ref)
                SoundManager:playSound(GameSound.UI_CLOSE_2);
                GuiService:RemoveSelectionGroup(u11);

                if u5.PreviouslySelected then
                    UIUtil:selectGui(u5.PreviouslySelected);
                end;
            end;
        end, {});
        local v12 = {
            Size = UDim2.new(DeviceUtil.isSmallScreen() and 0.5 or 0.3, 0, 0, 300),
            AutomaticSize = "Y",
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 0,
            Selectable = false,
            AutoButtonColor = false,
            Active = true,
            Modal = true,
            [u2.Ref] = u9
        };
        local v13 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.08, 0),
                PaddingBottom = UDim.new(0.08, 0),
                PaddingLeft = UDim.new(DeviceUtil.isSmallScreen() and 0.08 or 0.05, 0),
                PaddingRight = UDim.new(DeviceUtil.isSmallScreen() and 0.08 or 0.05, 0)
            }) };
        local v14 = u5.Body ~= nil;

        if v14 then
            local v15 = {
                AutomaticSize = "Y",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                BackgroundTransparency = 1,
                TextXAlignment = "Center",
                TextTransparency = 0.3,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 36),
                Text = u5.Body,
                TextColor3 = ColorUtil.WHITE
            };
            local TextBodyProps = u5.TextBodyProps;

            if TextBodyProps then
                for i, v in TextBodyProps do
                    v15[i] = v;
                end;
            end;

            v14 = u2.createElement("TextLabel", v15, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) });
        end;

        local v16 = {
            AutomaticSize = "Y",
            Size = UDim2.new(1, 0, 0, 50)
        };
        local v17 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0.1, 0)
            }), u2.createElement("TextLabel", {
                AutomaticSize = "XY",
                SizeConstraint = "RelativeXY",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 24),
                Text = "<b>" .. u5.Title .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) }) };
        local v18 = #v17;

        if v14 then
            v17[v18 + 1] = v14;
        end;

        v13[#v13 + 1] = u2.createElement(Empty, v16, v17);
        local v19 = not u5.HideSecondaryBtn;

        if v19 then
            local v20 = {
                TextSize = 18,
                Size = UDim2.new(0.3, 0, 0, 40),
                Text = "Cancel",
                BackgroundColor3 = Theme.backgroundPrimary,

                OnClick = function() -- Line: 133, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), u5 (copy), Flamework (ref), BedwarsAppIds (ref)
                    SoundManager:playSound(GameSound.UI_CLICK);
                    local OnSecondaryBtnClick = u5.OnSecondaryBtnClick;

                    if OnSecondaryBtnClick ~= nil then
                        OnSecondaryBtnClick();
                    end;

                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CONFIRMATION_MODAL);
                end,

                Selectable = true,
                LayoutOrder = 1,
                [u2.Ref] = u10
            };
            local SecondaryBtnProps = u5.SecondaryBtnProps;

            if SecondaryBtnProps then
                for i, v in SecondaryBtnProps do
                    v20[i] = v;
                end;
            end;

            v19 = u2.createFragment({
                SecondaryButton = u2.createElement(ButtonComponent, v20)
            });
        end;

        local v21 = {
            LayoutOrder = 4,
            Position = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.new(1, 0, 0, 40)
        };
        local v22 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v23 = #v22;

        if v19 then
            v22[v23 + 1] = v19;
        end;

        local v24 = #v22;
        local v25 = {
            TextSize = 18,
            Text = "Accept",
            Selectable = true,
            LayoutOrder = 2,
            Size = UDim2.new(0.3, 0, 0, 40),
            BackgroundColor3 = Theme.backgroundSuccess,

            OnClick = function() -- Line: 180, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), u5 (copy), u8 (copy), Flamework (ref), BedwarsAppIds (ref)
                SoundManager:playSound(GameSound.UI_CLICK);
                u5.OnPrimaryBtnClick(u8);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CONFIRMATION_MODAL);
            end,

            Loading = v7
        };
        local PrimaryBtnProps = u5.PrimaryBtnProps;

        if PrimaryBtnProps then
            for i, v in PrimaryBtnProps do
                v25[i] = v;
            end;
        end;

        v22.PrimaryButton = u2.createElement(ButtonComponent, v25);
        local AdditionalButtons = u5.AdditionalButtons;
        local v26;

        if AdditionalButtons == nil then
            v26 = AdditionalButtons;
        else
            local function v32(u27, p28) -- Line: 198
                -- upvalues: Theme (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u2 (ref), ButtonComponent (ref)
                local v29 = {
                    TextSize = 18,
                    Text = "",
                    Selectable = true,
                    Size = UDim2.new(0.3, 0, 0, 40),
                    BackgroundColor3 = Theme.backgroundPrimary,

                    OnClick = function() -- Line: 204, Name: OnClick
                        -- upvalues: SoundManager (ref), GameSound (ref), u27 (copy), Flamework (ref), BedwarsAppIds (ref)
                        SoundManager:playSound(GameSound.UI_CLICK);

                        if u27.onClick() then
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CONFIRMATION_MODAL);
                        end;
                    end,

                    LayoutOrder = p28 + 3
                };

                for i, v in u27.buttonProps do
                    v29[i] = v;
                end;

                local v30 = {};
                local v31 = #v30;

                for i, v in u27.childElements do
                    v30[v31 + i] = v;
                end;

                return u2.createElement(ButtonComponent, v29, v30);
            end;

            v26 = table.create(#AdditionalButtons);

            for i, v in AdditionalButtons do
                v26[i] = v32(v, i - 1, AdditionalButtons);
            end;
        end;

        if v26 then
            for i, v in v26 do
                v22[v24 + i] = v;
            end;
        end;

        v13.ActionButtons = u2.createElement(Empty, v21, v22);

        return u2.createElement("ImageButton", v12, v13);
    end)
};