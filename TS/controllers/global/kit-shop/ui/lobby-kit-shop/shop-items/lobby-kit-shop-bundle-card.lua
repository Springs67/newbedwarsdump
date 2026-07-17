-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v4.TweenService;
local UserInputService = v4.UserInputService;
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local EmoteAssets = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").EmoteAssets;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v5 = u3.Component:extend("KitShopBundleCard");

function v5.init(p6) -- Line: 28
    -- upvalues: u2 (copy), u3 (copy)
    p6.hoverMaid = u2.new();
    p6.ref = u3.createRef();
    p6.maid = u2.new();
end;

function v5.didMount(u7) -- Line: 33
    -- upvalues: UserInputService (copy), SoundManager (copy), GameSound (copy), UIUtil (copy)
    local v8 = UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and u7.ref:getValue());

    if v8 then
        u7.maid:GiveTask(v8.SelectionGained:Connect(function() -- Line: 37
            -- upvalues: SoundManager (ref), GameSound (ref), u7 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            u7.props.OnClick();
        end));

        if u7.props.Selected then
            UIUtil:selectGui(v8);
        end;
    end;
end;

function v5.willUnmount(p9) -- Line: 47
    p9.maid:DoCleaning();
end;

function v5.render(u10) -- Line: 50
    -- upvalues: BundleMeta (copy), BedwarsKit (copy), DeviceUtil (copy), KnitClient (copy), u3 (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), TweenService (copy), Empty (copy), ImageId (copy), EmoteType (copy), EmoteAssets (copy), TooltipContainer (copy), AutoSizedText (copy), BedwarsImageId (copy), getBattlePassMetadata (copy)
    local v11 = BundleMeta[u10.props.Bundle];

    local function _(p12) -- Line: 56
        if p12.kit then
            return p12.kit;
        end;

        return nil;
    end;

    local v13 = 0;
    local v14 = {};
    local u15 = {};
    local u16 = {};

    for i, v in v11.rewards do
        local _ = i - 1;
        local v17;

        if v.kit then
            v17 = v.kit;
        else
            v17 = nil;
        end;

        if v17 ~= nil then
            v13 = v13 + 1;
            v14[v13] = v17;
        end;
    end;

    local function v19(p18) -- Line: 71
        -- upvalues: BedwarsKit (ref), u15 (copy), u10 (copy), DeviceUtil (ref), KnitClient (ref), u16 (copy)
        if p18 == BedwarsKit.NONE then
            table.insert(u15, p18);

            return;
        end;

        if table.find(u10.props.store.Bedwars.ownedKits, p18) ~= nil then
            table.insert(u15, p18);

            return;
        end;

        if DeviceUtil.isHoarceKat() or not KnitClient.Controllers.UnlockController.allKitsUnlocked then
            table.insert(u16, p18);

            return;
        end;

        table.insert(u15, p18);
    end;

    for i, v in v14 do
        v19(v, i - 1, v14);
    end;

    local v20 = v11.limitedTimeEndTime ~= nil;
    local battlepass = v11.battlepass;

    if battlepass == nil then
        battlepass = false;
    end;

    local v25 = {
        [u3.Ref] = u10.ref,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = ColorUtil.BLACK,
        BackgroundTransparency = u10.props.Selected and 0.25 or 0.5,
        BorderSizePixel = 0,
        BorderMode = "Outline",
        BorderColor3 = ColorUtil.hexColor(16771973),
        LayoutOrder = u10.props.LayoutOrder,
        AutoButtonColor = false,
        Selectable = true,

        [u3.Event.MouseButton1Click] = function() -- Line: 117
            -- upvalues: SoundManager (ref), GameSound (ref), u10 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            u10.props.OnClick();
        end,

        [u3.Event.MouseEnter] = function(p21) -- Line: 121
            -- upvalues: u10 (copy), TweenService (ref)
            u10.hoverMaid:DoCleaning();

            if not u10.props.Selected then
                local u22 = TweenService:Create(p21, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.25
                });
                u10.hoverMaid:GiveTask(function() -- Line: 127
                    -- upvalues: u22 (copy)
                    u22:Cancel();
                end);
                u22:Play();
            end;
        end,

        [u3.Event.MouseLeave] = function(p23) -- Line: 133
            -- upvalues: u10 (copy), TweenService (ref)
            u10.hoverMaid:DoCleaning();

            if not u10.props.Selected then
                local u24 = TweenService:Create(p23, TweenInfo.new(0.12), {
                    BackgroundTransparency = u10.props.Selected and 0.25 or 0.5
                });
                u10.hoverMaid:GiveTask(function() -- Line: 139
                    -- upvalues: u24 (copy)
                    u24:Cancel();
                end);
                u24:Play();
            end;
        end
    };
    local v26 = { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.02, 0)
        }), u3.createElement("UIStroke", {
            Color = ColorUtil.darken(ColorUtil.WHITE, u10.props.Selected and 1 or 0.5),
            Thickness = u10.props.Selected and 2 or 1
        }) };
    local v27 = #v26;
    local v28 = {
        Size = UDim2.fromScale(0.92, 0.92),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v29 = {};
    local v30 = {};
    local kitShopBundle = v11.kitShopBundle;

    if kitShopBundle ~= nil then
        kitShopBundle = kitShopBundle.image;
    end;

    v30.Image = kitShopBundle;
    v30.ScaleType = "Crop";
    v30.Size = UDim2.fromScale(1, 1);
    v30.AnchorPoint = Vector2.new(0.5, 0.5);
    v30.Position = UDim2.fromScale(0.5, 0.5);
    v30.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    v30.BorderSizePixel = 0;
    v30.BackgroundTransparency = 1;
    v29[#v29 + 1] = u3.createElement("ImageLabel", v30);
    v26[v27 + 1] = u3.createElement(Empty, v28, v29);

    if v20 then
        v20 = u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.22),
            Image = ImageId.BANNER_HORIZONTAL,
            Position = UDim2.fromScale(0.5, -0.01),
            AnchorPoint = Vector2.new(0.5, 0),
            ImageColor3 = Color3.fromRGB(252, 122, 122)
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.8421052631578947
            }), u3.createElement("TextLabel", {
                Text = "LIMITED",
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                Size = UDim2.fromScale(0.75, 0.45),
                Position = UDim2.fromScale(0.5, 0.13),
                AnchorPoint = Vector2.new(0.5, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }) });
    end;

    if v20 then
        v26[v27 + 2] = v20;
    end;

    local v31 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.16),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(0.97, 0.03)
    };
    local v32 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.05, 0)
        }) };
    local v33 = #v32;
    local v34 = {
        SizeConstraint = "RelativeYY",
        Size = UDim2.fromScale(1, 1),
        Image = EmoteAssets[EmoteType.LUCKY_GIFT],
        ScaleType = "Fit",
        BackgroundTransparency = 1
    };
    v32[v33 + 1] = u3.createElement("ImageLabel", v34, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                Text = "Kit Bundle",
                TextSize = 16,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) }) });
    local v35;

    if u15 == v14 and true or false or battlepass then
        local battlepass2 = v11.battlepass;

        if battlepass2 ~= nil then
            battlepass2 = battlepass2.season;
        end;

        if battlepass2 then
            local v36 = {
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(1, 1)
            };
            local battlepass3 = v11.battlepass;

            if battlepass3 ~= nil then
                battlepass3 = battlepass3.season;
            end;

            v36.Image = getBattlePassMetadata(battlepass3).icon;
            v36.ScaleType = "Fit";
            v36.BackgroundTransparency = 1;
            local v37 = {};
            local v38 = {};
            local v39 = {};
            local battlepass4 = BundleMeta[u10.props.Bundle].battlepass;

            if battlepass4 ~= nil then
                battlepass4 = string.gsub(battlepass4.season, "season", "");
            end;

            v39.Text = "BP Season " .. tostring(battlepass4);
            v39.Font = Enum.Font.SourceSansBold;
            v39.TextSize = 16;
            v39.Limits = Vector2.new(300, 60);
            v38[#v38 + 1] = u3.createElement(AutoSizedText, v39);
            v37[#v37 + 1] = u3.createElement(TooltipContainer, {}, v38);
            v35 = u3.createElement("ImageLabel", v36, v37);
        else
            v35 = u3.createFragment();
        end;
    else
        v35 = u3.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = BedwarsImageId.BED_COIN_ICON
        }, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                    Text = "Unlockable",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }) });
    end;

    v32[v33 + 2] = v35;
    v26.KitCategoryIcons = u3.createElement("Frame", v31, v32);

    if v11 then
        local v40 = {
            BackgroundTransparency = 0.55,
            Size = UDim2.fromScale(1, 0.16),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v41 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }) };
        local v42 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8)
        };
        local kitShopBundle2 = v11.kitShopBundle;

        if kitShopBundle2 ~= nil then
            kitShopBundle2 = kitShopBundle2.name;
        end;

        v42.Text = tostring(kitShopBundle2);
        v42.TextScaled = true;
        v42.TextColor3 = ColorUtil.WHITE;
        v42.TextXAlignment = "Center";
        v42.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v42.BackgroundTransparency = 1;
        v41[#v41 + 1] = u3.createElement("TextLabel", v42);
        v11 = u3.createFragment({
            KitNameTag = u3.createElement("Frame", v40, v41)
        });
    end;

    v26[#v26 + 1] = v11;

    return u3.createElement("ImageButton", v25, v26);
end;

return {
    KitShopBundleCard = v5
};