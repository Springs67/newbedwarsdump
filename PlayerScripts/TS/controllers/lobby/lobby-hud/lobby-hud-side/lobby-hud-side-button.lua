-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.FULL = "full";
v4.full = "FULL";
u5.SHORT = "short";
v4.short = "SHORT";
u5.ICON = "icon";
v4.icon = "ICON";

local function v40(u6, p7) -- Line: 33
    -- upvalues: DeviceUtil (copy), KnitClient (copy), Theme (copy), u5 (ref), ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), UILayers (copy), BedwarsImageId (copy), AutoSizedText (copy), TooltipContainer (copy), Empty (copy), Padding (copy)
    local _ = p7.useState;
    local PlayerLevel = u6.PlayerLevel;

    if PlayerLevel == nil then
        if DeviceUtil.isHoarceKat() then
            PlayerLevel = 0;
        else
            local v8 = KnitClient.Controllers.PlayerLevelController:getPlayerLevel();
            PlayerLevel = v8 == nil and 0 or v8;
        end;
    end;

    local u9;

    if u6.LevelLocked == nil then
        u9 = false;
    else
        u9 = PlayerLevel < u6.LevelLocked;
    end;

    local FrameProps = u6.FrameProps;

    if FrameProps ~= nil then
        FrameProps = FrameProps.BackgroundColor3;
    end;

    if FrameProps == nil then
        FrameProps = Theme.backgroundPrimary;
    end;

    local v10;

    if DeviceUtil.isSmallScreen() then
        v10 = UDim2.fromOffset(70, 70);
    else
        v10 = UDim2.fromOffset(80, 80);
    end;

    local v11 = 4;
    local _ = Enum.FillDirection.Vertical;
    UDim.new(0.1, 0);
    local _ = Enum.HorizontalAlignment.Center;
    local v12 = UDim2.fromScale(0.9, 0.9);
    local v13 = UDim2.fromScale(1, 0.4);

    if u6.Variant == u5.ICON then
        if DeviceUtil.isSmallScreen() then
            v10 = UDim2.new(1, 0, 0, 30);
        else
            v10 = UDim2.new(1, 0, 0, 40);
        end;

        v12 = UDim2.fromScale(0.95, 0.95);
        v11 = 3;
    elseif u6.Variant == u5.SHORT then
        if DeviceUtil.isSmallScreen() then
            v10 = UDim2.new(1, 0, 0, 30);
        else
            v10 = UDim2.new(1, 0, 0, 40);
        end;

        local _ = Enum.FillDirection.Horizontal;
        local _ = Enum.HorizontalAlignment.Center;
        UDim.new(0.075, 0);
        v12 = UDim2.fromScale(0.95, 0.75);
        v11 = 4;
        v13 = UDim2.fromScale(0.9, 0.6);
        local TextLabelProps = u6.TextLabelProps;

        if TextLabelProps ~= nil then
            TextLabelProps = TextLabelProps.TextXAlignment;
        end;

        if not TextLabelProps then
            local v14 = {};
            local TextLabelProps2 = u6.TextLabelProps;

            if type(TextLabelProps2) == "table" then
                for i, v in TextLabelProps2 do
                    v14[i] = v;
                end;
            end;

            v14.TextXAlignment = Enum.TextXAlignment.Center;
            u6.TextLabelProps = v14;
        end;
    end;

    local v15 = {
        BorderSizePixel = 0,
        Size = v10,
        BackgroundColor3 = ColorUtil.WHITE,
        Image = u6.BackgroundImage,
        ScaleType = Enum.ScaleType.Crop,
        BackgroundTransparency = u6.RemoveBackgroundColoring and 1 or 0
    };
    local FrameProps2 = u6.FrameProps;

    if FrameProps2 then
        for i, v in FrameProps2 do
            v15[i] = v;
        end;
    end;

    v15[u2.Event.Activated] = function() -- Line: 109
        -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u6 (copy), UILayers (ref)
        if u9 then
            SoundManager:playSound(GameSound.UI_ERROR);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                HideSecondaryBtn = true,
                Title = u6.Text .. " Unavailable",
                Body = "\nMust be Level <b>" .. tostring(u6.LevelLocked) .. "</b> to access <b>" .. u6.Text .. "</b>.\n\nPlay a game to level up!",

                OnPrimaryBtnClick = function() -- Line: 115, Name: OnPrimaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end,

                PrimaryBtnProps = {
                    Text = "OK"
                }
            });

            return nil;
        end;

        SoundManager:playSound(GameSound.UI_CLICK_2);
        u6.OnClick();
    end;

    local v16;

    if u9 then
        local v17 = {
            BorderSizePixel = 0,
            ZIndex = 10,
            BackgroundTransparency = 0.3,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local FrameProps3 = u6.FrameProps;

        if FrameProps3 then
            for i, v in FrameProps3 do
                v17[i] = v;
            end;
        end;

        v16 = u2.createFragment({
            LockedOverlay = u2.createElement("ImageLabel", v17, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 11,
                    Size = UDim2.fromScale(0.7, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = BedwarsImageId.LOCK_ART
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) })
        });
    else
        v16 = u9;
    end;

    local v18 = {};
    local v19 = #v18;

    if v16 then
        v18[v19 + 1] = v16;
    end;

    local v20 = #v18;
    local v21 = { u2.createElement(AutoSizedText, {
            RichText = true,
            TextSize = 16,
            Text = u6.Text,
            Font = Enum.Font.SourceSansBold,
            Limits = Vector2.new(300, 60)
        }) };
    local v22 = #v21;

    if u9 then
        u9 = u2.createElement(AutoSizedText, {
            RichText = true,
            TextSize = 14,
            Text = "Requires Level <b>" .. tostring(u6.LevelLocked) .. "</b>",
            Font = Enum.Font.SourceSansBold,
            TextColor3 = Color3.fromRGB(255, 64, 64),
            Limits = Vector2.new(300, 60)
        });
    end;

    if u9 then
        v21[v22 + 1] = u9;
    end;

    v18[v20 + 1] = u2.createElement(TooltipContainer, {}, v21);
    v18[v20 + 2] = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0.1, 0)
    });
    local v23 = not u6.RemoveBackgroundColoring and u2.createElement("UIGradient", {
        Rotation = 90,
        Color = u6.BackgroundGradient or ColorSequence.new(FrameProps, Color3.fromRGB(76, 78, 132))
    });

    if v23 then
        v18[v20 + 3] = v23;
    end;

    local v24 = #v18;
    local v25 = u6.Variant == u5.SHORT;

    if v25 then
        local v26 = {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1)
        };
        local v27 = {};
        local v28 = {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            ImageTransparency = 0.75,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = u6.Icon,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1.5, 1.5)
        };
        local IconProps = u6.IconProps;

        if IconProps then
            for i, v in IconProps do
                v28[i] = v;
            end;
        end;

        v27[#v27 + 1] = u2.createElement("ImageLabel", v28);
        v25 = u2.createFragment({
            BackgroundImage = u2.createElement(Empty, v26, v27)
        });
    end;

    if v25 then
        v18[v24 + 1] = v25;
    end;

    local v29 = #v18;
    local v30 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v31 = {};
    local v32 = #v31;
    local v33 = {};
    local ButtonPadding = u6.ButtonPadding;

    if ButtonPadding ~= nil then
        v11 = ButtonPadding;
    end;

    v33.Padding = UDim.new(0, v11);
    v31[v32 + 1] = u2.createElement(Padding, v33);
    local v34 = u6.Variant ~= u5.SHORT;

    if v34 then
        local v35 = {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            Image = u6.Icon,
            Size = v12,
            Position = UDim2.fromScale(0.5, 0.475),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(120, 123, 188)
        };
        local IconBackgroundTransparency = u6.IconBackgroundTransparency;
        v35.BackgroundTransparency = IconBackgroundTransparency == nil and 1 or IconBackgroundTransparency;
        v35.BorderSizePixel = 0;
        local IconProps = u6.IconProps;

        if IconProps then
            for i, v in IconProps do
                v35[i] = v;
            end;
        end;

        v34 = u2.createElement("ImageLabel", v35, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end;

    if v34 then
        v31[v32 + 2] = v34;
    end;

    local v36 = #v31;
    local v37 = u6.Variant ~= u5.ICON;

    if v37 then
        local v38 = {
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = string.upper(u6.Text),
            Size = v13,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextSize = DeviceUtil.isSmallScreen() and 12 or 14
        };
        local TextLabelProps = u6.TextLabelProps;

        if TextLabelProps then
            for i, v in TextLabelProps do
                v38[i] = v;
            end;
        end;

        v37 = u2.createElement("TextLabel", v38, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 15
            }), u2.createElement("UIStroke", {
                Transparency = 0.3,
                Color = Color3.fromRGB(28, 28, 28)
            }) });
    end;

    if v37 then
        v31[v36 + 1] = v37;
    end;

    v18.Container = u2.createElement(Empty, v30, v31);
    local v39 = u6[u2.Children];

    if v39 then
        for i, v in v39 do
            if type(i) == "number" then
                v18[v29 + i] = v;
            else
                v18[i] = v;
            end;
        end;
    end;

    return u2.createFragment({
        ["LobbyHudSideButton_" .. u6.Text] = u2.createElement("ImageButton", v15, v18)
    });
end;

return {
    LobbyHudSideButtonVariant = u5,
    LobbyHudSideButton = v3.new(u2)(v40)
};